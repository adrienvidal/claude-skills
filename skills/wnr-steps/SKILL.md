---
name: wnr-steps
description: >-
  Donne la liste des étapes pour aller d'un point A (où on en est) à un point B (le but
  visé), en puces courtes : une action concrète par ligne, avec le chemin exact dans l'outil
  (menu > onglet > bouton) et un statut devant chaque étape quand on est en cours de route
  (✅ fait, ⛔ bloqué, ⏳ à faire). Utilise ce skill dès que l'utilisateur demande « donne-moi
  les étapes », « liste des steps », « c'est quoi les étapes », « redonne la liste »,
  « redonne la liste des steps », « comment je fais pour », « je fais comment », « guide-moi »,
  « /wnr-steps », en français comme en anglais (« give me the steps », « walk me through »,
  « how do I »). Sur « redonne la liste », remet à jour la liste déjà donnée dans la
  conversation (statuts, décisions prises entre-temps) au lieu de la répéter. Ne l'utilise pas
  pour un point d'avancement sur tout un projet ou un dossier (« où on en est », « fais un
  recap ») : c'est `wnr-recap`. Ne l'utilise jamais sur « resume », « résume » ou « resume
  simple » : c'est une demande de reformuler en court la réponse qui précède.
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
- **A, le point de départ** : ce qui est déjà fait. Le tirer de la conversation, des sessions
  du projet ou de ce qu'on peut constater (configuration, fichiers, état de l'outil). Ne pas
  faire refaire ce qui est déjà fait : une étape faite apparaît en ✅, elle ne se redonne pas
  comme une consigne.

Si une étape dépend d'un écran ou d'un menu qu'on ne connaît pas avec certitude (interface
d'un outil tiers qui a pu changer), le vérifier (documentation, recherche) avant de donner un
chemin. Un chemin faux fait perdre plus de temps qu'un chemin absent : en cas de doute qui
subsiste, le dire dans l'étape (« le menu peut s'appeler X ou Y »).

## 2. Rédiger

Toujours ce format, rien de plus :

```markdown
- ✅ <Étape faite> : <ce qui a été constaté>
- ⛔ <Étape bloquée> : on attend <qui>, sinon <suite prévue>
- ⏳ <Étape à faire> : <Outil > Menu > Onglet > Bouton>
- ⏳ <Étape conditionnelle> : une fois <condition>, <action>
<Une seule question qui propose l'étape suivante.>
```

Règles d'écriture, et pourquoi :

- **Une étape = une action concrète.** Un verbe à l'infinitif (« Ajouter », « Déclarer »,
  « Copier »), puis le chemin exact dans l'outil, séparé par des `>`. Le lecteur suit la liste
  l'écran ouvert à côté : il doit trouver le bouton sans chercher.
- **Les statuts seulement en cours de route.** Pour une liste donnée avant d'avoir commencé,
  pas de statut : des puces simples, dans l'ordre. Dès qu'une étape est faite ou bloquée,
  passer au format à statuts pour toute la liste.
- **Pas d'explication.** Le pourquoi d'une étape ne s'écrit que si l'utilisateur le demande.
  Exception : une contrainte qui fait échouer l'étape si on l'ignore (« 11 caractères max »)
  tient en quelques mots dans la ligne.
- **Signaler ce qui demande sa main.** Connexion, double authentification, paiement, code reçu
  par SMS : le dire dans l'étape (« toi : connexion avec la double authentification »). Ce que
  Claude peut faire seul, il le fait ou le propose, il ne le met pas à la charge du lecteur.
- **Signaler ce qu'il ne faut pas faire.** Quand une fausse manœuvre est probable ou coûteuse,
  une ligne explicite : « ⚠️ Ne touche à rien chez OVH ». Elle se place juste avant l'étape où
  la tentation se présente.
- **Une étape bloquée nomme qui on attend et la suite prévue.** Un blocage sans responsable est
  une étape à faire.
- **Le prochain geste en premier parmi les ⏳.** L'ordre de la liste est l'ordre d'exécution ;
  les étapes qui attendent une condition vont à la fin, avec leur condition en tête.
- **Courte.** Viser 3 à 8 étapes. Au-delà, regrouper les gestes qui se font sur le même écran
  en une seule étape.
- Langue de la conversation (français par défaut), sans cadratin dans les phrases.
- **Finir par une seule question** qui propose l'étape suivante (« On passe au nom
  d'expéditeur SMS ? »), jamais un menu de choix.

## 3. « Redonne la liste » : mettre à jour, pas répéter

Quand la liste a déjà été donnée plus haut dans la conversation :

- Repartir de cette liste et la mettre à jour : les étapes faites depuis passent en ✅, les
  nouveaux blocages en ⛔, les décisions prises entre-temps modifient, ajoutent ou retirent des
  étapes.
- Une étape devenue inutile disparaît, sans mention.
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
