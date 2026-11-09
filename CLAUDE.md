# CLAUDE.md : claude-skills

Versionne les skills Claude Code globaux d'Adrien et reconstruit son environnement (skills tiers, plugins) sur une nouvelle machine.

## Session Continuity

En début de session :

- Lire le fichier de la dernière session dans `.claude/sessions/`
- Identifier où on s'est arrêté et les blockers en cours
- Résumer en 3 lignes avant de commencer

En fin de session :

- Sauvegarder un résumé dans `.claude/sessions/[date]_[sujet].md`
- Inclure : Réalisé, Reste à faire, Blockers, Décisions
- Si un fichier existe déjà pour aujourd'hui, le compléter plutôt que le remplacer

Format du nom de fichier : `YYYY-MM-DD_sujet-en-kebab-case.md`
Exemple : `2026-03-10_audit-cabinet-merlin.md`

Règles :

- Toujours lire AVANT d'agir – ne pas redemander ce qui est déjà documenté
- Les blockers non résolus de la session précédente deviennent la priorité
- Quand un blocker est levé, le noter explicitement dans "Réalisé"

### Archivage des sessions

Le dossier `.claude/sessions/` ne garde visibles à la racine que les sessions utiles à la reprise. Les autres vont dans `.claude/sessions/archive/`.

- **Garder actives** : les 3 sessions les plus récentes, plus toute session rattachée à un chantier encore ouvert.
- **Archiver, ne pas supprimer** : déplacer via `git mv` vers `archive/` (réversible, tracé dans git). Une session est archivable quand elle est close et que son contenu vit déjà ailleurs (code, CLAUDE.md, Trello, git).
- **Filet anti-oubli, impératif** : avant d'archiver une session, reporter chacun de ses « Reste à faire » encore ouverts dans `.claude/sessions/reste-a-faire.md` (le backlog vivant, jamais archivé). Ne jamais archiver une session tant qu'un item ouvert n'a pas été soit fait, soit reporté dans ce backlog. Cocher puis retirer un item du backlog quand il est fait.
- **Quand** : en fin de session, après avoir sauvegardé le résumé du jour, vérifier si d'anciennes sessions sont devenues archivables et les déplacer.
- **Ne jamais toucher** au « Reste à faire » de la session active la plus récente : c'est la liste de priorités vivante.
- **Hygiène de fond** au passage : corriger une contradiction à sa source (pas seulement dans le dernier fichier), refermer un « Reste à faire » qu'une session ultérieure a accompli, signaler une info devenue fausse (par exemple un agent supprimé depuis).
- **Toute suppression ou déplacement se confirme avec Adrien** avant d'agir.

Rappel : les fichiers de session sont un journal de passation, pas la mémoire vivante.

## Méthode de développement

Tout travail de construction (dérouler une tâche du plan, ajouter une commande,
reprendre le fil en début de session) passe par le skill `lean-development` dès
qu'il s'applique. Il fixe la façon d'avancer sans brûler le contexte : lectures
ciblées plutôt que fichiers entiers, sous-agents seulement quand ils paient,
passes de revue non multipliées. L'invoquer au début du travail, pas une fois le
contexte déjà saturé.

## Workflow git

Un **lot** est un groupe de tâches qui livre quelque chose de vérifiable seul.
On ne travaille jamais directement sur `main` ni `dev`.

`dev` reçoit le développement, `main` la production.
On ne passe d'une branche à la suivante que par une PR.

1. Brancher depuis `dev` à jour.
2. Un commit par tâche. Écrire le test d'abord là où un bug coûte cher et où la
   logique est subtile ; ailleurs, un test ciblé après coup suffit.
3. `bash -n *.sh` au vert sur toute la suite avant d'ouvrir la PR.
4. `gh pr create --base dev`.
5. Ne jamais fusionner sans accord explicite.
   Seule exception : la PR de résumé de fin de session ouverte par Claude
   (`docs/session-*`, seul le fichier de session touché), que Claude fusionne
   lui-même dès les tests verts.
6. Après fusion : revenir sur `dev`, `git pull`, supprimer la branche.
7. Mettre en production : `gh pr create --base main --head dev`, sur accord
   explicite.

### Messages de commit

En anglais, à l'impératif, sans point final. Préfixe `feat:`, `fix:`, `test:`,
`docs:` ou `refactor:`.

## Règles métier

- **Les skills d'Adrien vivent dans `skills/<nom>/`**, jamais directement dans
  `~/.claude/skills/`. Ce dernier ne reçoit qu'un lien symbolique vers le repo.
  Après la création d'un skill, lancer `./install.sh --own-only` pour le lier.
- **Un skill tiers ne se copie pas dans le repo** : seule sa source est
  versionnée, dans `manifests/`. Exception : `vendor/`, réservé aux skills tiers
  dont la source est introuvable.
- **Après l'installation ou le retrait d'un skill tiers ou d'un plugin**, lancer
  `./sync-manifests.sh` puis committer les manifestes.
- **Ne jamais versionner** `~/.claude/skills/synced/` (géré par la synchro
  claude.ai) ni le cache des plugins (`~/.claude/plugins/`).
