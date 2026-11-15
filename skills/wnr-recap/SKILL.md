---
name: wnr-recap
description: >-
  Fait un point d'avancement simple sur un projet ou un dossier, en trois listes : ce qui est
  fait, ce qui nous attend, ce qui bloque. Fonctionne dans n'importe quel projet (dépôt de code,
  dossier client, projet de conseil) en lisant ce qui existe : CLAUDE.md, sessions, reste à faire,
  git, fiche client, et les outils de suivi que le projet déclare (base de données, CRM, Gmail). Utilise ce
  skill dès que l'utilisateur demande « fais un recap », « où on en est », « où en sommes-nous »,
  « état du projet », « point d'avancement », « résume-moi le projet », « qu'est-ce qui reste »,
  « qu'est-ce qui bloque », « /wnr-recap », éventuellement suivi d'un nom de dossier
  (« recap pyrene »), en français comme en anglais (« status update », « where are we at »).
  Déclenche aussi quand l'utilisateur redemande « sois simple » après un récapitulatif trop
  chargé, y compris en cours de session dans un projet qui a son propre récapitulatif de reprise.
  Ne l'utilise jamais sur « resume », « résume », « resume simple » ou « résumé simple » : c'est une
  demande de reformuler en court la réponse qui précède, sans relire le projet.
  Ne l'utilise pas pour lister les étapes vers un but précis (« donne-moi les étapes »,
  « redonne la liste des steps », « comment je fais pour ») : c'est `wnr-steps`.
  Ne l'utilise pas pour l'ouverture de session elle-même (« start », « on reprend ») quand le
  CLAUDE.md définit un format de reprise (bloc Reprise, J-n) : celui-là prime. Ne l'utilise pas
  non plus pour rédiger un compte rendu de réunion ou un email au client.
---

# wnr-recap : faire le point, simplement

Le lecteur veut savoir en trente secondes où en est un projet. Il ne veut pas la mécanique
interne (identifiants, numéros de PR, noms de fichiers, montants ligne à ligne), seulement ce
qui est acquis, ce qui vient, et ce qui empêche d'avancer. La valeur du skill tient dans le
tri : lire beaucoup, n'en garder que l'essentiel.

## 1. Cerner le périmètre

- Si un dossier est nommé (« recap pyrene »), ne traiter que lui. Le chercher dans les fiches
  clients, les noms de sessions, les dossiers du projet.
- Sinon, le périmètre est le projet courant. S'il contient plusieurs dossiers actifs (plusieurs
  clients par exemple), faire un bloc par dossier, du plus urgent au moins urgent.

## 2. Lire ce qui existe (lecture seule)

Prendre seulement les sources présentes, sans chercher à tout ouvrir. Dans l'ordre :

1. **`CLAUDE.md` et `.claude/rules/`** : ils disent où le projet range son suivi (sessions,
   backlog, CRM, fiche client) et quelles conventions d'écriture s'appliquent (langue, ton,
   emojis, cadratins). Les suivre.
2. **Les sessions récentes** (`.claude/sessions/`, hors `archive/`) : les deux ou trois
   dernières qui concernent le périmètre. Leurs rubriques « Réalisé », « Reste à faire »,
   « Blockers » sont la matière première.
3. **Le backlog** : `reste-a-faire.md`, section « Reste à faire » d'une fiche, `TODO.md`, ou
   la table de tâches que le CLAUDE.md désigne comme source de vérité, lue par le moyen qu'il
   déclare (commande SQL, MCP), en lecture seule.
4. **Pour un dépôt de code** : `git log --oneline -15`, `git status --short`, et
   `gh pr list` s'il y a un dépôt GitHub. Ce qui est fusionné est fait, ce qui est ouvert est
   en cours.
5. **La fiche client ou la fiche projet**, pour le contrat (périmètre, jalons, facturation)
   quand il y en a un.
6. **Les messages reçus depuis la dernière session**, si le projet déclare une boîte mail
   accessible (Gmail via MCP) : chercher les emails du client depuis la date de la dernière
   session. Un message nouveau change souvent la priorité.
7. **Le projet voisin**, quand le suivi est partagé entre deux endroits. Cas typique : un dépôt
   de code client dont la relation (emails, factures, réponses du client) est consignée dans un
   projet de pilotage à part, ou l'inverse. Le CLAUDE.md, les sessions ou le backlog y renvoient
   souvent (« côté webnrolls-viloris », « via le dépôt X »). Lire alors les sessions récentes de
   ce projet voisin qui portent sur le même dossier, en lecture seule. Sans cela, le recap
   présente comme ouverts des points déjà réglés côté client.

Croiser les sources : un point marqué ouvert dans une vieille session mais fait dans une
plus récente est fait, que cette session soit dans le projet courant ou dans le projet voisin.
Une source plus récente l'emporte sur une plus ancienne, et un fait constaté (commit, email
reçu ou envoyé, statut CRM, fait consigné dans une session) l'emporte sur une intention notée.

Ne rien écrire, ne rien commiter, n'envoyer aucun message : le recap est une lecture. Si des
incohérences apparaissent entre les sources (backlog périmé par exemple), les signaler en une
ligne à la fin, sans les corriger.

## 3. Rédiger

Toujours ce format, rien de plus :

```markdown
## <Nom du projet ou du dossier>

**Ce qui est fait**
- ...

**Ce qui nous attend**
- ... (date entre parenthèses quand elle existe)

**Ce qui bloque**
- <le sujet> : on attend <qui ou quoi>

<Une seule question qui propose la prochaine action.>
```

Règles d'écriture, et pourquoi :

- **Une ligne par point, une idée par ligne.** Le lecteur parcourt, il ne lit pas.
- **Regrouper plutôt qu'énumérer.** Six corrections livrées deviennent « Les six corrections
  demandées par X sont faites ». Viser 3 à 6 lignes par rubrique ; au-delà, regrouper.
- **Ni identifiants, ni chemins, ni numéros de commit ou de PR.** Ils ne servent qu'à la
  machine. Un montant global ou une échéance de paiement peut figurer s'il aide à décider.
- **Fait = constaté.** Livré, envoyé, signé, encaissé, fusionné. Ce qui est « en cours » va
  dans « Ce qui nous attend ».
- **Un blocage nomme qui on attend.** Un blocage sans responsable est une tâche, il va dans
  « Ce qui nous attend ».
- **Les dates s'écrivent JJ/MM, sans J-n** : le recap reste lisible d'un coup d'œil. Tout jour
  de la semaine ou « demain », « cette semaine » se vérifie avec `date`, jamais de tête.
- **Aucune rubrique vide masquée** : s'il n'y a rien qui bloque, écrire « Rien pour l'instant ».
- Langue du projet (français par défaut), sans emojis, sans cadratin dans les phrases.

Si l'utilisateur demande plus de détail ensuite, il le dira : rester court par défaut.

## Exemple

```markdown
## École Pyrène

**Ce qui est fait**
- Devis signé (21/09) et accord sur les données personnelles signé (23/10).
- Onyx, le CRM de l'école, en service depuis le 03/11 avec les vraies demandes.
- Les six corrections demandées par Mathilde sont faites ; elle juge l'outil agréable.
- Deux factures sur trois envoyées, l'acompte est encaissé.

**Ce qui nous attend**
- Répondre à Mathilde sur un doublon de demande (reçu ce midi).
- Liaison avec Digiforma, paiement Stripe, dates des sessions sur le site.
- Encaisser la deuxième facture (04/12), puis le solde à la fin du dernier chantier.

**Ce qui bloque**
- Digiforma : on attend les réponses de l'école à nos questions du 04/11.
- Envoi des mails depuis Onyx : on attend les accès Microsoft 365 d'Alexis.

On commence par la réponse à Mathilde ?
```
