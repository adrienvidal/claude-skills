---
name: wnr-init-claude
description: |
  Crée le CLAUDE.md du projet courant à partir de la base de travail arrêtée
  d'Adrien : continuité de session, archivage, méthode de développement, workflow
  git par lot et PR, messages de commit. Trois natures de projet au choix dès la
  première question : application web fullstack, qui ajoute la stack Next.js et
  Neon ainsi que la règle de maquettage des écrans avant tout développement ;
  atelier local et portail client, la même stack web réduite à un portail où le
  client regarde et valide, toute la création restant en local dans Claude Code ;
  ou projet simple, qui n'embarque rien de web. Un court questionnaire
  ne recueille que ce qui change d'un projet à l'autre, le reste est recopié
  tel quel. À utiliser dès que l'utilisateur veut initialiser,
  cadrer ou configurer un projet pour Claude : « init le CLAUDE.md »,
  « nouveau projet », « configure le projet », « pose les conventions »,
  « /wnr-init-claude », « set up CLAUDE.md ».
  Déclencher aussi, sans qu'on le demande, avant d'écrire la première ligne de
  code d'un projet qui n'a pas encore de CLAUDE.md.
  Ne pas utiliser pour documenter un dépôt existant à partir de son code, c'est
  le rôle de la commande /init intégrée.
---

# Init CLAUDE.md

Ce skill écrit un `CLAUDE.md` à la racine du **projet courant**, en partant de
`assets/base-claude-md.md`.

Cette base n'est pas un gabarit à discuter : c'est la façon de travailler
d'Adrien, déjà arrêtée. Continuité de session, archivage, méthode de
développement, maquettes, workflow git et messages de commit se recopient
**mot pour mot**, aux seuls retraits près que commandent les réponses.
Les remettre en question à chaque projet ferait perdre exactement le temps que ce
skill est censé faire gagner.

Ce qui change d'un projet à l'autre est court, et c'est tout ce qu'on demande :
l'en-tête, la nature du projet, l'équipe et le suivi Trello, les fonctionnalités
que l'application embarque, les environnements, les écarts de stack et les
règles métier.

## Déroulé

### 1. Situer

Le fichier va à la racine du répertoire de travail courant, sauf indication
contraire de l'utilisateur.

Si un `CLAUDE.md` existe déjà, ne pas l'écraser : le lire, dire en une phrase ce
qu'il contient déjà, et demander s'il faut le compléter ou le remplacer.

Relever au passage, sans poser de question, ce que le dépôt répond déjà :

```bash
git branch -a                      # branches existantes : production, dev, staging
ls package.json 2>/dev/null           # projet Node : décide de la section Dépendances en projet simple
```

Une information lue dans le dépôt ne se redemande pas.

### 2. Questionnaire

Poser les questions avec `AskUserQuestion`, par lots, dans l'ordre ci-dessous. L'ensemble doit tenir
en moins d'une minute.

D'abord, en texte libre : **le nom du projet et une phrase sur ce qu'il fait,
pour qui.**

**Question d'ouverture — la nature du projet**

| Question | Options |
|---|---|
| Nature du projet | Application web fullstack ; atelier local, portail client ; projet simple |

Elle commande tout le reste, donc elle se pose avant tout autre lot.

Un **atelier local, portail client** sépare deux moitiés : la création (contenus,
analyses, veille) se fait en local dans Claude Code et dans des scripts, et un
portail web léger laisse le client regarder, valider, corriger et donner ses
informations. La base Neon fait le pont. C'est un projet web : il suit la stack
de référence, les maquettes et les lots 1 et 2, avec les écarts décrits plus bas,
plus le **lot atelier**.

Un **projet simple** n'a rien à voir avec la construction d'une application web :
un script, un outil interne, un espace de travail documentaire. Il garde la
méthode de travail (continuité de session, archivage, méthode de développement,
workflow git, messages de commit) et rien d'autre. Sauter alors le lot 1 en entier, ne pas poser la
question sur la stack, et passer directement au **lot simple** plus bas.

**Lot équipe** (toutes natures de projet, juste après la question d'ouverture)

| Question | Options |
|---|---|
| Qui travaille sur le projet ? | Adrien seul ; à plusieurs, avec qui |
| Suivi dans Trello ? | Oui, je donne le lien du tableau ; non |
| Lié à un dossier client dans Brain ? | Oui, lequel ; non |

Si le projet est suivi dans Trello, lire le tableau par le MCP Trello
(`trelloReadBoard` pour le nom et l'identifiant, `trelloReadList` avec
`list_by_board` pour les colonnes) : ils remplissent les trois marqueurs de la
section `## Trello`. Si le MCP ne répond pas, demander ces
informations plutôt que de les deviner. Vérifier que les colonnes In progress,
In review et Done existent ; sinon, utiliser les noms réels du tableau.

Brain (`~/Workspace/apps/brain-webnrolls`) est le dépôt Viloris où vivent les
emails, le CRM et les tâches de chaque client. Le lien sert quand le projet est
construit pour un client : la reprise de session y lit ce qui s'est passé côté
client (email parti, fichier reçu) et que le dépôt ignore. Si le projet est lié,
proposer les dossiers existants (`ls ~/Workspace/apps/brain-webnrolls/clients/`)
plutôt que de faire taper un nom, puis lire le nom exact de l'entreprise dans
Neon, depuis la racine de Brain :
`npm --prefix app run -s sql <<< "SELECT nom FROM entreprises WHERE nom ILIKE '%<mot>%';"`.
Si rien ne correspond, demander le nom plutôt que de le deviner.

**Lot 1 — Ce que l'application embarque** (projet fullstack ou atelier)

| Question | Options |
|---|---|
| Authentification | Oui, Neon Auth par email et mot de passe ; non, pas de connexion |
| Plusieurs utilisateurs par espace | Oui, espace partagé ; non, un compte égale un espace |
| RLS Postgres | Oui ; non, la sécurité reste applicative |
| Tests de bout en bout | Oui, Playwright contre la base locale ; non, Vitest seulement |

Si l'authentification est écartée, ne pas poser les deux questions suivantes :
sans compte, ni le partage d'espace ni le RLS n'ont de sens. Les traiter comme
répondues « non » et le dire en une ligne.

En atelier, ne pas poser la question d'authentification : un portail client
exige une connexion, par code envoyé par e-mail (voir le tableau des effets).

**Lot 2 — Le reste** (projet fullstack ou atelier)

| Question | Options |
|---|---|
| Environnements | Trois : `dev` → `staging` → `main` (recommandé, projet avec des clients réels) ; deux : `dev` → `main` (démo, MVP) |
| Base de données en local | Oui, Postgres dans Docker ; non, on travaille directement sur la base en ligne |
| La stack de référence s'applique-t-elle telle quelle ? | Oui ; on retire des éléments ; on remplace des éléments |
| Règles métier structurantes déjà connues ? | Oui je les dicte ; aucune pour l'instant |

Si l'utilisateur retire ou remplace des éléments de la stack, lui faire préciser
lesquels. Ne jamais ajouter une techno qu'il n'a pas nommée.

npm comme gestionnaire de paquets ne fait pas partie des éléments remplaçables :
il reste même si l'utilisateur modifie la stack.

**Lot atelier** (atelier seulement, une question)

| Question | Options |
|---|---|
| Où tourne la création ? | Claude Code en local seulement ; en local et dans des robots planifiés (GitHub Actions) |

**Lot simple** (projet simple seulement, un seul lot)

| Question | Options |
|---|---|
| Vérification avant d'ouvrir une PR | Une commande à faire passer, laquelle ; aucune |
| Règles métier structurantes déjà connues ? | Oui je les dicte ; aucune pour l'instant |

Un projet simple n'a pas de préproduction : il tourne sur `dev` et `main`, sans
question.

La question sur la vérification remplace `npm test`, qui n'a de sens que dans un
projet Node. Si l'utilisateur répond « aucune », l'étape correspondante du
workflow git disparaît : mieux vaut un workflow en trois étapes vraies qu'une
quatrième qui renvoie à une commande inexistante.

La dernière question est celle qui rapporte le plus. Une règle métier du type
« les montants sont stockés en centimes » ou « une facture émise devient
non modifiable » ne se devine pas et coûte cher à découvrir trop tard. Si
l'utilisateur en dicte, elles vont dans une section `## Règles métier` placée
juste après la stack.

### 3. Écrire

Assembler dans cet ordre :

1. Un en-tête : `# CLAUDE.md : <nom du projet>`, puis la phrase d'objectif.
2. Le contenu de `assets/base-claude-md.md`, amendé selon le tableau ci-dessous.
3. En atelier seulement, le contenu de `assets/atelier-portail.md`, juste après
   la stack, recopié mot pour mot au marqueur `<robots>` près.
4. La section `## Règles métier`, seulement si l'utilisateur en a dicté.

La base est écrite dans sa version la plus complète : authentification, RLS,
base locale dans Docker, tests de bout en bout, trois environnements, travail à
plusieurs et suivi Trello présents. Chaque « non » **retire** quelque chose, il
n'ajoute rien.

| Réponse | Effet sur le fichier |
|---|---|
| Pas d'authentification | Retirer la ligne d'authentification Neon Auth. Les questions espace et RLS n'ayant pas été posées, n'appliquer aucune de leurs lignes : remplacer seulement « RLS optionnel » par « pas de RLS : sans compte, rien n'est à cloisonner » |
| Espace partagé | Ajouter à la stack : chaque table métier porte l'identifiant de l'espace, et toute requête filtre dessus |
| Un compte égale un espace | Ajouter à la stack : pas de notion d'organisation ni d'invitation, ne pas en prévoir |
| RLS activé | Remplacer « RLS optionnel » par « RLS activé : c'est la frontière de sécurité, la vérification applicative ne sert qu'à l'affichage » |
| RLS écarté | Remplacer « RLS optionnel » par « RLS non activé : la sécurité est applicative, toute requête filtre sur l'utilisateur courant » |
| Pas de tests de bout en bout | Retirer Playwright de la ligne de test et supprimer la ligne « e2e locale contre le Postgres Docker » |
| Pas de base locale | Supprimer la ligne « Postgres en local dans Docker ». Si les tests de bout en bout sont gardés, remplacer leur ligne par « e2e contre une branche Neon dédiée aux tests » : sans base locale, ils ne peuvent pas tourner contre elle |
| Deux environnements, ou projet simple | Dans le workflow git, retirer `staging` de la phrase d'interdiction et de la phrase de rôle des branches, supprimer l'étape de préproduction, et passer la mise en production à `gh pr create --base main --head dev`. Dans la ligne Neon, retirer la branche de préproduction ; dans la ligne des branches Neon d'aperçu, retirer « ni celle de préproduction `staging` » |
| À plusieurs | Remplacer `<équipiers>` par les prénoms donnés, par exemple « de Nicolas » |
| Adrien seul | Dans l'étape 5 du workflow git, garder seulement « Ne jamais fusionner sans accord explicite. » suivi de la phrase « Seule exception : … » sur les PR de fin de session, inchangée |
| Pas de Trello | Supprimer la section `## Trello`. Dans le workflow git, retirer la carte des étapes 1 et 6, supprimer la phrase sur la carte à l'étape 4, et remplacer « attend dans In review » par « attend » à l'étape 5 |
| Colonnes Trello nommées autrement | Remplacer In progress, In review et Done par les noms réels du tableau, dans le workflow git comme dans la section `## Trello` |
| Lié à un dossier Brain | Remplacer `<dossier brain>` par le nom du dossier (`cabinet-serre`) et `<entreprise brain>` par le nom exact lu dans Neon |
| Pas de dossier Brain | Supprimer la puce « Se mettre à jour avec Brain » de Session Continuity, avec ses sous-puces |
| Branche de production nommée autrement | Utiliser le nom réel lu par `git branch -a` (par exemple `master`), jamais `main` par réflexe |
| Branche `dev` ou `staging` absente du dépôt | Voir l'étape 4 : le fichier ne doit jamais renvoyer à une branche inexistante |
| Projet simple | Supprimer les sections `## Stack` et `## Maquettes` en entier. Ne rien écrire sur le web, la base de données ou le déploiement : rien n'a été demandé, donc rien n'est connu, et un projet sans écran n'a rien à maquetter |
| Projet simple en JavaScript ou TypeScript | Ajouter, à la place de `## Stack`, une section `## Dépendances` qui reprend telle quelle la ligne npm de la base. Pertinent seulement si le dépôt contient un `package.json`, si la commande de vérification passe par `npm`/`npx`/`node`, ou si l'utilisateur a nommé Node. Sinon ne rien écrire : une règle npm dans un projet Python ou documentaire est du bruit |
| Atelier | Remplacer la ligne d'authentification par « Authentification par code à usage unique envoyé par e-mail (email OTP de Neon Auth) : les clients se connectent depuis leur téléphone, sans mot de passe ». Dans la section Maquettes, rien ne change : le portail se maquette comme toute application |
| Atelier, création en local seulement | Supprimer le marqueur `<robots>` |
| Atelier, création aussi dans des robots | Remplacer `<robots>` par « , et dans les robots planifiés (GitHub Actions), qui lisent et écrivent la même base » |
| Projet simple, une commande de vérification | Remplacer `npm test` par cette commande |
| Projet simple, aucune vérification | Supprimer l'étape 3 du workflow git. Retirer aussi la phrase sur l'écriture des tests à l'étape 2 : parler de tests dans un projet qui n'en a aucun est du bruit |

Les numéros d'étape du tableau renvoient à la base. Appliquer tous les retraits,
puis renuméroter le workflow git une seule fois, à la fin.

Chaque réponse doit se voir dans le fichier produit. Une question dont la réponse
ne change rien est une question à supprimer du skill, pas une case à cocher.

Écrire le fichier, puis annoncer son chemin et son nombre de lignes en une phrase.

### 4. Fermer

Si une branche nommée dans le workflow git (`dev`, `staging`) n'existe pas
encore, demander l'accord pour la créer depuis la branche de production, puis
la créer et la pousser si un remote existe.

Ajouter à la mémoire automatique du projet (`MEMORY.md`) un rappel : en début de
session, chercher le fichier du jour dans `.claude/sessions/`. S'il y est déjà,
ne rien ajouter. Si le projet est lié à un dossier Brain, y ajouter aussi : puis
lire Brain, dernière session du dossier et tâches ouvertes, en lecture seule.

Puis une phrase, pas plus : ce fichier vit, les règles qui s'y ajouteront viendront
des corrections réelles, pas de suppositions.

## Ce qui ne s'invente jamais

Un CLAUDE.md qui affirme une chose fausse coûte plus cher qu'un CLAUDE.md
incomplet : Claude lui fera confiance et perdra du temps avant de comprendre.

- **Le nom de la branche de production** se lit avec `git branch -a`.
  L'écrire `main` par réflexe sur un dépôt en `master` casse tout le workflow git.
- **L'hébergement, l'authentification, les outils** ne s'ajoutent que si
  l'utilisateur les a nommés ou s'ils figurent dans la stack de référence.
- **Une rubrique sans contenu se supprime**, elle ne se remplit pas au jugé.

## Forme

- Français, accents compris. Le nommage du code reste en anglais.
- Pas d'emoji. Pas de cadratin dans la prose : virgule, point ou parenthèses.
- Une réserve ou une mise en garde tient en deux phrases. Au-delà c'est un
  sermon, et un sermon ne se lit pas.
