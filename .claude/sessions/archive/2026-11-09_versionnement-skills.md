# 2026-11-09 : versionnement des skills globaux

## Réalisé

- Repo privé `adrienvidal/claude-skills` créé dans `~/Workspace/claude-skills`.
- Skills perso (`wnr-*`, `lean-development`) déplacés dans `skills/`, liés par symlink dans `~/.claude/skills/`.
- `senior-frontend` et `ui-ux-pro-max` copiés dans `vendor/` (source introuvable).
- Manifestes : `skill-lock.json` (skills tiers via `npx skills`), `manual-skills.json` (Anthropic, Vercel, source présumée), `plugins.json`.
- Scripts `install.sh` (reconstruction complète, ou `--own-only`) et `sync-manifests.sh`.
- Plugin `fullstack-app-builder` retiré de Claude Code ; marketplace `ia-library` supprimée et dossier mis à la Corbeille.
- `lean-development-workspace` (logs d'eval) mis à la Corbeille.
- `CLAUDE.md` créé via `wnr-init-claude` (projet simple), puis workflow git simplifié.

## Reste à faire

Rien.

## Blockers

Aucun.

## Décisions

- Skills tiers et plugins : on versionne leur source, jamais leur contenu.
- Une seule branche `main`, commits directs, pas de PR : les symlinks rendent toute modif active immédiatement, une branche `dev` ne protégerait rien. Worktree pour les refontes profondes.
- `install.sh` non testé de bout en bout (il réinstallerait tout) ; sources présumées non vérifiées, par choix.
- Suppression de `fullstack-app-builder` sur claude.ai : laissée de côté, par choix.
