---
name: wnr-steps
description: >-
  Donne les étapes pour aller de là où on en est jusqu'à un but précis, en puces courtes : une
  action par ligne, avec le chemin exact dans l'outil (menu > onglet > bouton), et un statut
  (✅ fait, ⛔ bloqué, ⏳ à faire) une fois en cours de route. À utiliser sur « donne-moi les
  étapes », « liste des steps », « redonne la liste », « guide-moi », « /wnr-steps », « give me
  the steps », « walk me through », et sur « comment je fais pour » quand le but demande
  plusieurs actions. Sur « redonne la liste », met à jour la liste déjà donnée (statuts,
  décisions prises entre-temps) au lieu de la répéter. Pas pour un point d'avancement sur un
  projet entier (« où on en est », « fais un recap ») : c'est `wnr-recap`. Jamais sur
  « resume » ou « résume » : c'est reformuler en court la réponse qui précède.
---

# wnr-steps : les étapes de A à B

Le lecteur a un but précis (configurer un expéditeur, brancher un domaine, publier une
version) et veut savoir quoi faire, dans quel ordre, et où cliquer. Il ne veut pas un cours.
La valeur du skill tient dans deux choses : des étapes assez précises pour être suivies sans
réfléchir, et une liste qui reste vraie au fil de la conversation.

## 1. Poser A et B

- **B, le but** : ce que l'utilisateur veut obtenir, en une phrase pour soi. S'il est flou au
  point de changer toute la liste (deux buts possibles très différents), poser une seule
  question avant de lister. Sinon, prendre l'interprétation la plus probable.
- **Un seul geste ?** Si le but tient en une action (une commande, un bouton), répondre en une
  ligne, sans liste. Deux ajouts permis : une ligne ⚠️ si le geste a un piège (commit déjà
  poussé), et, si Claude peut faire le geste lui-même, la question « Je le fais ? ». Le skill
  sert aux chemins de plusieurs étapes.
- **A, le point de départ** : ce qui est déjà fait. Le tirer de la conversation, des sessions
  du projet ou de ce qu'on peut constater (configuration, fichiers, état de l'outil). Ne pas
  faire refaire ce qui est déjà fait : une étape faite apparaît en ✅, elle ne se redonne pas
  comme une consigne.

Si une étape dépend d'un écran ou d'un menu qu'on ne connaît pas avec certitude (interface
d'un outil tiers qui a pu changer), le vérifier (documentation, recherche) avant de donner un
chemin quand c'est possible. Un chemin faux fait perdre plus de temps qu'un chemin absent.
Quand on ne peut pas vérifier, donner le chemin le plus probable et le dire dans l'étape
(« le menu peut s'appeler X ou Y », « chemin non vérifié »). Le lecteur sait alors qu'il doit
chercher un peu.

## 2. Rédiger

Avant d'avoir commencé, des puces simples dans l'ordre d'exécution, sans statut :

```markdown
- <Action> : <Outil > Menu > Onglet > Bouton>
- ⚠️ <Ce qu'il ne faut pas toucher>
- <Action> : <chemin> (<contrainte qui fait échouer si ignorée>)
<Une seule question qui propose la première étape.>
```

Dès qu'une étape est faite ou bloquée, toute la liste passe au format à statuts :

```markdown
- ✅ <Étape faite>[ : <ce qui a été constaté, s'il sert pour la suite>]
- ⛔ <Étape bloquée> : on attend <qui>, sinon <suite prévue>
- ⏳ <Étape à faire> : <chemin>
- ⏳ Une fois <condition> : <action>
<Une seule question qui propose l'étape suivante.>
```

Rien d'autre autour : ni titre, ni introduction, ni conclusion.

Règles d'écriture, et pourquoi :

- **Une étape = une action concrète.** Un verbe à l'infinitif (« Ajouter », « Déclarer »,
  « Copier »), puis le chemin exact dans l'outil, séparé par des `>`. Le lecteur suit la liste
  l'écran ouvert à côté : il doit trouver le bouton sans chercher.
- **Les statuts seulement en cours de route.** Avant le départ, ils n'apportent rien : tout
  serait ⏳.
- **Pas d'explication.** Le pourquoi d'une étape ne s'écrit que si l'utilisateur le demande.
  Exception : une contrainte qui fait échouer l'étape si on l'ignore (« 11 caractères max »)
  tient en quelques mots dans la ligne.
- **Signaler ce qui demande sa main.** Connexion, double authentification, paiement, code reçu
  par SMS : le dire dans l'étape qui en a besoin, pas dans une étape à part (« Ajouter le
  domaine, toi (double authentification) : … »). Ce que Claude peut faire seul, il le fait ou
  le propose, il ne le met pas à la charge du lecteur.
- **Signaler ce qu'il ne faut pas faire.** Quand une fausse manœuvre est probable ou coûteuse,
  une ligne explicite : « ⚠️ Ne touche à rien chez OVH ». Elle se place juste avant la première
  étape où la tentation se présente, une seule fois. Sa conséquence peut tenir en quelques mots
  (« : le mail s'arrêterait ») : c'est elle qui rend l'avertissement crédible.
- **Une étape bloquée nomme qui on attend et la suite prévue.** Un blocage sans responsable est
  une étape à faire.
- **L'ordre de la liste est l'ordre d'exécution.** Les étapes faites se retrouvent donc en
  tête, et la première ⏳ est le prochain geste. Une étape bloquée garde sa place ; si on peut
  avancer sans elle, les ⏳ qui suivent restent faisables. Les étapes qui attendent une
  condition vont à la fin, condition en tête.
- **Courte.** Viser 3 à 8 étapes. Au-delà, regrouper les gestes qui se font sur le même écran
  en une seule étape.
- **Emojis : seulement ✅ ⛔ ⏳ ⚠️**, chacun avec son sens ici. Aucun autre.
- Langue de la conversation (français par défaut), sans cadratin dans les phrases.
- **Finir par une seule question** qui propose l'étape suivante (« On passe au nom
  d'expéditeur SMS ? »), jamais un menu de choix.

## 3. « Redonne la liste » : mettre à jour, pas répéter

Quand la liste a déjà été donnée plus haut dans la conversation :

- Repartir de cette liste et la mettre à jour : les étapes faites depuis passent en ✅, les
  nouveaux blocages en ⛔, les décisions prises entre-temps modifient, ajoutent ou retirent des
  étapes.
- Une étape devenue inutile disparaît. Si c'est une décision qui l'a rendue inutile, la
  nommer en quelques mots dans l'étape qui la remplace (« … bonjour@pyrene.fr (on garde
  pyrene.fr) »).
- Une étape dont la condition est levée perd son « Une fois … » et reprend sa place dans
  l'ordre.
- Un ✅ n'a besoin d'un « : ce qui a été constaté » que si ce constat sert pour la suite.
- Ne pas recopier la liste précédente à l'identique : si rien n'a changé, le dire en une ligne
  et redonner seulement la prochaine étape.

## Exemple

Demande : « redonne la liste des steps » (configuration Brevo pour une école, en cours).

```markdown
- ✅ Vérifier le compte Brevo de l'école : un seul compte, pyrene.fr authentifié
- ⛔ Ajouter ecole-pyrene.fr : refusé deux fois, on attend l'école (question dans le mail), sinon support Brevo
- ⏳ Nom d'expéditeur SMS : Settings > Transactional SMS (11 caractères max)
- ⏳ Une fois le domaine débloqué : déclarer bonjour@ecole-pyrene.fr comme expéditeur
On passe au nom d'expéditeur SMS ?
```
