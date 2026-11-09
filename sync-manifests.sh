#!/usr/bin/env bash
# Met à jour les manifestes après avoir installé/retiré un skill tiers ou un plugin.
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"
cp "$HOME/.agents/.skill-lock.json" "$REPO/manifests/skill-lock.json"
python3 - "$REPO" <<'PY'
import json,sys,os
s=json.load(open(os.path.expanduser("~/.claude/settings.json")))
json.dump({"enabledPlugins":s.get("enabledPlugins",{}),"extraKnownMarketplaces":s.get("extraKnownMarketplaces",{})},
  open(f"{sys.argv[1]}/manifests/plugins.json","w"),indent=2,ensure_ascii=False)
PY
cd "$REPO" && git status --short manifests
