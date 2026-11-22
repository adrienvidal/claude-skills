# 22/11/2026 : Claude Skills, rapatriement de wnr-repasse-utilisateur

## Reprise

```
✅ Fait      wnr-repasse-utilisateur rapatrié dans le dépôt, lié et poussé
⛔ Bloqué    Rien
🎯 Priorité  Confirmer le premier usage réel de wnr-steps
```

## Réalisé

- `wnr-repasse-utilisateur` avait été créé directement dans `~/.claude/skills/` (vrai dossier, pas de lien). Déplacé dans `skills/`, relié via `install.sh --own-only`, committé et poussé (`59431ec`).
- Constat : cinq commits faits du 16 au 20/11 sans fichier de session. Deux retouches de `wnr-steps` (trois lignes par étape, paragraphes espacés au lieu de puces) et trois ajouts à la base `wnr-init-claude` (suppression des branches Neon de preview, lien avec le dossier Brain du client, déploiements Vercel limités aux branches durables).
- Session archivée : `2026-11-09_versionnement-skills.md` (close, sans reste à faire).

## Reste à faire

- [ ] Premier usage réel de `wnr-steps` : les retouches des 17 et 20/11 laissent penser qu'il a servi, à confirmer avec Adrien puis cocher.

## Blockers

Aucun.

## Décisions

- Un skill créé hors du dépôt se rapatrie dans `skills/`, puis on refait le lien. Pas de copie.
