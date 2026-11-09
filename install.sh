#!/usr/bin/env bash
# Reconstruit l'environnement de skills Claude Code sur une nouvelle machine.
# Usage : ./install.sh            (tout)
#         ./install.sh --own-only (seulement tes skills + vendor)
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"

echo "== 1. Mes skills (liens symboliques)"
for d in "$REPO"/skills/*/; do
  name="$(basename "$d")"
  if [ -e "$DEST/$name" ] && [ ! -L "$DEST/$name" ]; then
    echo "  ! $name existe déjà en dossier réel, ignoré"; continue
  fi
  ln -sfn "$REPO/skills/$name" "$DEST/$name"; echo "  ✓ $name"
done

echo "== 2. Skills tiers sans source connue (copie)"
for d in "$REPO"/vendor/*/; do
  name="$(basename "$d")"
  [ -e "$DEST/$name" ] || { cp -R "$d" "$DEST/$name"; echo "  ✓ $name"; }
done

[ "${1:-}" = "--own-only" ] && exit 0

echo "== 3. Skills tiers (npx skills, depuis les manifestes)"
python3 - "$REPO" <<'PY' | while read -r src skills; do
import json,sys,collections
r=sys.argv[1]; g=collections.defaultdict(list)
for k,v in json.load(open(f"{r}/manifests/skill-lock.json"))["skills"].items(): g[v["source"]].append(k)
for src,lst in json.load(open(f"{r}/manifests/manual-skills.json")).items():
    if not src.startswith("_"): g[src]+=lst
for src,lst in g.items(): print(src, ",".join(lst))
PY
  echo "  → $src"
  npx --yes skills add "$src" -g -a claude-code -y --skill "$skills" || echo "  ! échec : $src"
done

echo "== 4. Plugins"
python3 - "$REPO" <<'PY' > /tmp/claude-plugins-cmds.$$
import json,sys,os
p=json.load(open(f"{sys.argv[1]}/manifests/plugins.json"))
for name,m in p["extraKnownMarketplaces"].items():
    s=m["source"]
    if s["source"]=="github": print("mk", s["repo"])
    elif s["source"]=="directory" and os.path.isdir(os.path.expanduser(s["path"].replace("/Users/adrienvidal","~"))):
        print("mk", os.path.expanduser(s["path"].replace("/Users/adrienvidal","~")))
for plug,on in p["enabledPlugins"].items():
    if on: print("pl", plug)
PY
while read -r kind arg; do
  if [ "$kind" = mk ]; then claude plugin marketplace add "$arg" || true
  else claude plugin install "$arg" || echo "  ! échec : $arg"; fi
done < /tmp/claude-plugins-cmds.$$
rm -f /tmp/claude-plugins-cmds.$$
echo "Terminé. Relance Claude Code."
