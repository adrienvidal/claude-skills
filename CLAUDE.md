# CLAUDE.md : claude-skills

Versionne les skills Claude Code globaux d'Adrien et reconstruit son environnement (skills tiers, plugins) sur une nouvelle machine.

## Session Continuity

En début de session :

- Lire le fichier de la dernière session dans `.claude/sessions/`
- Identifier où on s'est arrêté et les blockers en cours
- Recopier son bloc « Reprise » (à défaut, le rédiger), puis finir par une seule
  question qui porte la proposition

En fin de session :

- Sauvegarder un résumé dans `.claude/sessions/[date]_[sujet].md`
- Commencer par un bloc « Reprise » juste sous le titre, puis : Réalisé, Reste à
  faire, Blockers, Décisions
- Si un fichier existe déjà pour aujourd'hui, le compléter plutôt que le remplacer,
  bloc « Reprise » compris

Gabarit du bloc « Reprise » (une ligne par rubrique, phrases courtes, échéance
datée entre parenthèses, et pour les blockers seulement qui on attend), sous un
titre `## Reprise` et dans un bloc de code pour garder l'alignement :

```
✅ Fait      Base restructurée, interface republiée, formulaire en ligne
⛔ Bloqué    Clé d'API (Juliette), accès Microsoft 365 (Alexis)
🎯 Priorité  Import du tableau de Mathilde (échéance 06/11)
```

En début de session, ajouter « J-n » à l'échéance (calculé avec `date`) et coiffer
le bloc de « Reprise · JJ/MM · sujet ». Les trois pictogrammes restent dans les
fichiers de session et le récapitulatif.

Ce bloc est aussi ce que le hook de fin de session publie dans le Cockpit (bloc
« À côté ») : une session sans bloc « Reprise » n'y apparaît pas.

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
- **Archivage automatique** : le déplacement se fait sans demander, une fois le filet anti-oubli passé. En cas de doute (chantier peut-être encore ouvert), la session reste à la racine. Les sessions archivées sont listées dans « Réalisé » du résumé du jour.
- **Ne jamais toucher** au « Reste à faire » de la session active la plus récente : c'est la liste de priorités vivante.
- **Hygiène de fond** au passage : corriger une contradiction à sa source (pas seulement dans le dernier fichier), refermer un « Reste à faire » qu'une session ultérieure a accompli, signaler une info devenue fausse (par exemple un agent supprimé depuis).
- **Toute suppression se confirme avec Adrien** avant d'agir.

Rappel : les fichiers de session sont un journal de passation, pas la mémoire vivante.

## Méthode de développement

Tout travail de construction (dérouler une tâche du plan, ajouter une commande,
reprendre le fil en début de session) passe par le skill `lean-development` dès
qu'il s'applique. Il fixe la façon d'avancer sans brûler le contexte : lectures
ciblées plutôt que fichiers entiers, sous-agents seulement quand ils paient,
passes de revue non multipliées. L'invoquer au début du travail, pas une fois le
contexte déjà saturé.

## Workflow git

Une seule branche, `main`, et pas de PR. Les skills sont liés à
`~/.claude/skills/` depuis ce dossier : toute modification est active dès
l'enregistrement, quelle que soit la branche. Une branche `dev` ne protégerait
donc rien ; le filet de sécurité, c'est l'historique git (`git revert`).

1. Un commit par changement cohérent (un skill modifié, un manifeste mis à jour).
2. `bash -n *.sh` au vert avant tout commit qui touche un script.
3. `git push` après chaque commit, pour que GitHub reste la sauvegarde à jour.
   S'il ne reste que des fichiers de `.claude/sessions/` à committer (résumé,
   archives, `reste-a-faire.md`), Claude committe et pousse sans demander :
   `docs: update session summary`.
4. Refonte profonde d'un skill, où l'ancienne version doit rester active
   pendant le travail : la faire dans un worktree séparé
   (`git worktree add ../claude-skills-<sujet> -b <sujet>`), puis fusionner
   dans `main` une fois le skill testé.

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
