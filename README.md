# claude-skills

Mes skills Claude Code globaux, versionnés.

| Dossier | Contenu |
|---|---|
| `skills/` | **Mes skills** (`wnr-*`, `lean-development`, `ton`). Liés par symlink dans `~/.claude/skills/` : on les modifie ici. |
| `vendor/` | Skills tiers dont la source est introuvable, copiés tels quels. |
| `manifests/skill-lock.json` | Skills tiers installés via `npx skills` (source de chacun). |
| `manifests/manual-skills.json` | Skills tiers copiés à la main (Anthropic, Vercel), source présumée. |
| `manifests/plugins.json` | Plugins activés + marketplaces (extrait de `~/.claude/settings.json`). |

## Nouvelle machine

```bash
git clone git@github.com:adrienvidal/claude-skills.git ~/Workspace/claude-skills
~/Workspace/claude-skills/install.sh
```

## Au quotidien

- **Modifier un de mes skills** : éditer dans `skills/`, puis commit.
- **Créer un skill** : le créer dans `skills/<nom>/`, puis `./install.sh --own-only` pour le lier.
- **Installer/retirer un skill tiers ou un plugin** : `./sync-manifests.sh`, puis commit.

Non versionné : `~/.claude/skills/synced/` (géré par claude.ai) et le cache des plugins.
