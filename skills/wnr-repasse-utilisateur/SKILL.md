---
name: wnr-repasse-utilisateur
description: >-
  Fait une repasse utilisateur sur un parcours d'usage : se mettre à la place de la personne
  qui va s'en servir, un jour ordinaire, dérouler le chemin étape par étape, et en tirer les
  frictions classées de la plus gênante à la moins gênante, une proposition par friction, plus
  ce qu'on garde tel quel. Vaut pour une maquette, un écran, une fonctionnalité, un workflow
  automatisé, un formulaire, un processus client ou un skill. À utiliser sur « fais une repasse
  utilisateur », « repasse sur ce workflow », « mets-toi à ma place », « est-ce que c'est
  pratique à l'usage », « qu'est-ce qui coince », « /wnr-repasse-utilisateur ». À déclencher
  aussi sans qu'on le demande, juste avant de faire valider une maquette ou un parcours :
  une repasse courte évite de coder un chemin qui coince. Pas pour critiquer le visuel d'un
  écran (couleurs, typographie, hiérarchie) : c'est `impeccable`. Pas pour décider quelles
  fonctionnalités garder ou supprimer face à l'usage réel et à la concurrence : c'est
  `wnr-arbitrage-features`. Pas pour un point d'avancement : c'est `wnr-recap`.
---

# wnr-repasse-utilisateur : se mettre à la place de celui qui s'en sert

Un parcours se conçoit d'en haut (écrans, données, flux) et se vit d'en bas : quelqu'un arrive
quelque part, un certain jour, avec une certaine envie, sur un certain appareil. La plupart des
frictions ne se voient que d'en bas. La repasse sert à descendre, à suivre le chemin comme
l'utilisateur le suivra, et à remonter avec peu de corrections, bien choisies.

Le livrable est court. La valeur est dans le tri : beaucoup de frictions possibles, peu qui
comptent vraiment.

## 1. Poser la scène, avant de regarder le parcours

Une repasse sans scène devient une revue de fonctionnalités. Avant de lire les écrans, fixer
en quelques mots, de mémoire de la conversation et du projet (CLAUDE.md, mémoire, sessions) :

- **Qui** : la personne réelle (souvent l'utilisateur lui-même, parfois son client ou le
  client de son client). Ses habitudes connues, ses agacements déjà exprimés.
- **Où elle arrive** : l'endroit réel où commence son geste (accueil, boîte mail, téléphone
  dans le métro), pas la page de la fonctionnalité.
- **Quand et à quel rythme** : chaque matin, une fois par mois, dans l'urgence.
- **Le jour qui dérape** : elle saute un jour, part en vacances, clique par erreur, reçoit
  deux fois plus que prévu, l'automate tombe en panne.

Ce qu'on ne sait pas, on le suppose de façon raisonnable et on le dit en une ligne ; on ne
pose pas de question pour ça.

Quand deux personnes empruntent le même parcours (l'utilisateur et son client, celui qui
saisit et celui qui reçoit), choisir celle dont l'usage décide du succès, et ne donner à
l'autre qu'une friction si elle en a une grave.

## 2. Dérouler le chemin, étape par étape

Suivre le parcours dans l'ordre où il sera vécu, du déclencheur jusqu'au moment où la
personne passe à autre chose. À chaque étape, se demander :

- **Est-ce que je trouve ?** Le point d'entrée est-il là où je suis déjà, ou faut-il y penser ?
- **Est-ce que je comprends ?** Ce que je vois me dit-il quoi faire et pourquoi ça me concerne ?
- **Est-ce que je peux agir ?** En un geste, et me rattraper si je me trompe ?
- **Est-ce que je sais ce qui se passe ensuite ?** Où va ce que j'ai fait, quand le résultat arrive.
- **Et le jour qui dérape ?** Rejouer l'étape avec la scène du point 1.

Quand le parcours n'a pas d'écran (un skill, un échange par email, un processus client),
le chemin est une **conversation en plusieurs tours** : la demande, la première réponse,
« c'est fait », « je ne vois pas ce bouton », l'erreur, la relance. Dérouler ces tours un par
un, comme on cliquerait d'écran en écran ; les mêmes questions s'y appliquent.

Lire la vraie matière, pas le souvenir qu'on en a, en lecture seule :

- **Le parcours lui-même** : maquette, code de l'écran, texte du formulaire, SKILL.md.
- **L'usage réel quand il existe** : données en base, historique, journaux ; pour un skill
  ou un processus, les sessions où il a servi (chercher par mot-clé, sans tout lire). Sans
  aucune trace, partir de l'épisode vécu le plus proche et dire en une ligne qu'on n'a pas
  d'usage direct. Un chiffre
  (« 34 tâches sur 56 saisies sans date ») départage mieux deux frictions qu'une intuition,
  et il peut figurer dans la ligne de contexte.
- **Les dernières sessions et la mémoire sur ce parcours** : une confusion déjà vécue par
  l'utilisateur est la friction la plus solide, et une décision déjà prise ne se rouvre pas.
  Avant de proposer, vérifier que la proposition ne contredit pas un choix arrêté ; si elle
  le fait, l'écarter ou la signaler comme réserve, avec la date du choix.
- **Les règles de l'utilisateur** (CLAUDE.md, mémoire) : un parcours qui les contredit
  (ton, pictogrammes, confidentialité) est une réserve à signaler en une ligne, pas une
  friction de plus.

## 3. Trier

Garder 3 à 5 frictions, pas plus. Les classer par gêne réelle : d'abord ce qui fait rater
l'usage (on ne trouve pas, on perd quelque chose), ensuite ce qui le ralentit, enfin les
réglages. Une friction qu'on ne vivrait qu'une fois sur cent part, sauf si elle fait perdre
des données ou de l'argent.

Pour chaque friction, une seule proposition, la plus légère qui règle le problème :

- **Préférer l'invisible au visible.** Un réglage, un meilleur défaut, une règle dans
  l'automate valent mieux qu'un bouton de plus. Ajouter un élément à l'écran se justifie.
- **Préférer déplacer à ajouter.** Amener l'information là où la personne est déjà plutôt
  que créer un nouvel endroit.
- **Ne pas changer de direction.** La repasse améliore le parcours voulu ; elle ne propose
  pas un autre produit. Une réserve de fond tient en une ligne à la fin.

Dire aussi, en une ligne, **ce qu'on garde tel quel** : ça évite de tout remettre en cause et
ça montre que le reste a été regardé.

## 4. Rédiger

Format, dans la langue et les conventions du projet (sans emojis, sans cadratin dans les
phrases si le projet le demande) :

```markdown
<Une phrase : la scène retenue (qui, où, quand).>

**1. <La friction, dite du point de vue de l'utilisateur>**
<Une ligne : ce qui se passe concrètement.>
**→ Je propose**
- <Une action, la plus légère.>

**2. …**

<Une ligne : ce qu'on garde tel quel.>

<Une seule question qui propose d'appliquer.>
```

- **Titres du point de vue de la personne** : « Un jour sauté, des nouvelles perdues », pas
  « Gestion de l'historique ».
- **Une ligne de contexte**, jamais un paragraphe ; le lecteur parcourt.
- **Pas de jargon** : ni nom de composant, ni nom de table, ni chemin de fichier.
- **S'adresser à l'utilisateur sur le ton habituel de la conversation** (tu ou vous), même si
  le parcours examiné en emploie un autre.
- **Ne rien modifier pendant la repasse** : elle propose, l'utilisateur tranche. On applique
  ensuite, s'il dit oui.
- **Résumé de fin** : si les consignes du projet demandent un résumé simple en fin de travail,
  il tient en une phrase (« En bref : … ») juste avant la question, qui reste le dernier mot.

## Version courte, quand la repasse n'a pas été demandée

Déclenchée d'office avant une validation de maquette ou de parcours, la repasse ne doit pas
alourdir la réponse : 3 frictions au plus, sous un titre « Repasse utilisateur », après la
présentation de la maquette. Si rien ne coince vraiment, une ligne suffit : « Repasse
utilisateur : rien qui coince à l'usage. » Mieux vaut ne rien signaler que signaler du bruit.

## Repasses successives

Quand l'utilisateur en demande plusieurs, ou après avoir appliqué une repasse :

- Repasser sur le parcours **modifié**, en gardant la même scène, et regarder d'abord ce que
  les corrections ont pu casser ou alourdir.
- Ne pas reproposer une friction écartée par l'utilisateur.
- S'arrêter quand il ne reste que des réglages de confort, et le dire : « Plus rien qui
  gêne l'usage ; il resterait … (confort). » Une repasse qui invente des problèmes pour
  justifier son tour fait plus de mal que de bien.

## Exemple

Repasse sur l'onglet « Actu IA » du Cockpit (nouvelles IA triées chaque nuit) :

```markdown
Je me mets à votre place un matin ordinaire : vous ouvrez le Cockpit sur l'accueil.

**1. Les nouvelles ne sont pas là où commence votre matinée**
Vous arrivez sur l'accueil ; le seul signal est un petit chiffre bleu dans le menu.
**→ Je propose**
- Une ligne discrète sur l'accueil : « Actu IA · 4 nouvelles d'hier », qui ouvre l'onglet.

**2. Un jour sauté, des nouvelles perdues**
Lundi, seul « Hier » est en tête ; vendredi et le week-end sont repliés.
**→ Je propose**
- « Depuis votre dernière visite » à la place de « Hier », un groupe par jour non vu.

**3. Un « Garder » cliqué par erreur ne s'annule pas**
**→ Je propose**
- Un second clic annule, tant que l'article n'a pas été lu.

**4. Le tri n'apprend pas de vos choix**
**→ Je propose**
- Donner au tri de la nuit les nouvelles gardées le mois passé comme exemples ; rien à l'écran.

On garde la lecture en deux minutes, le repli de ce qui a été écarté et le résumé au start.

En bref : le plus utile est d'amener les nouvelles sur l'accueil et de ne rien perdre un jour sauté.

J'applique ces quatre améliorations à la maquette ?
```
