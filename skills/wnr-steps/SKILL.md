---
name: wnr-steps
description: >-
  Donne les étapes pour aller de là où on en est jusqu'à un but précis, en étapes courtes : une
  étape par écran en trois lignes au plus (quoi, où, pourquoi), avec le chemin exact dans
  l'outil (menu > onglet > bouton), et un statut
  (✅ fait, ⛔ bloqué, ⏳ à faire) une fois en cours de route. À utiliser sur « donne-moi les
  étapes », « liste des steps », « redonne la liste », « guide-moi », « /wnr-steps », « give me
  the steps », « walk me through », et sur « comment je fais pour » (un seul geste : réponse en
  une ligne). Sur « redonne la liste », met à jour la liste déjà donnée (statuts,
  décisions prises entre-temps) au lieu de la répéter. Pas pour un point d'avancement sur un
  projet entier (« où on en est », « fais un recap ») : c'est `wnr-recap`. Jamais sur
  « resume » ou « résume » : c'est reformuler en court la réponse qui précède.
---

# wnr-steps : les étapes de A à B

Le lecteur suit la liste avec l'écran ouvert à côté. Il veut savoir quoi faire, dans quel
ordre, et où cliquer.

## 1. Avant d'écrire

- **Le but (B)** : s'il y a deux buts possibles très différents, poser une seule question.
  Sinon, prendre le plus probable.
- **Le point de départ (A)** : le tirer de la conversation, des sessions et du backlog du
  projet, ou de l'état constaté. Ce qui est déjà fait passe en ✅, sans être redonné comme
  consigne. N'écrire « ⛔ on attend X » que si la demande à X est réellement partie.
- **Un seul geste** : répondre en une ligne, sans liste. Ajouter si besoin une ligne ⚠️ pour
  le piège, et « Je le fais ? » si Claude peut le faire.
- **Les chemins** : vérifier ceux d'un outil tiers quand c'est possible. Sinon, donner le plus
  probable avec « (chemin non vérifié) ».

## 2. Le format

Chaque étape tient en trois lignes au plus, chacune avec son rôle :

1. **Quoi** : le statut, puis l'action, verbe à l'infinitif.
2. **Où** : le chemin exact dans l'outil, les `>` en gras ; pour un ✅, le constat ; pour
   un ⛔, qui on attend ; pour un ⚠️, ce qui arriverait.
3. **Pourquoi ou ce qu'on doit voir** : le but de l'étape, ou le résultat qui prouve qu'elle
   a marché. Seulement si elle aide à comprendre.

Avant de commencer, les mêmes étapes sans ✅ ⛔ ⏳ (⚠️ et « Une fois … » restent). Dès
qu'une étape est faite ou bloquée, toutes passent au format à statuts :

```markdown
✅ **<Étape faite>**
<Constat utile pour la suite>

⛔ **<Étape bloquée>**
On attend <qui>, sinon <suite prévue>

⚠️ **<Ce qu'il ne faut pas faire>**
<Ce qui arriverait>

⏳ **<Étape à faire>**
<Outil> **>** <Menu> **>** <Bouton>
<Pourquoi, ou ce qu'on doit voir>

⏳ **Une fois <condition> : <action>**
<Où ou pourquoi>

<Une seule question qui propose l'étape suivante.>
```

Rien autour : ni titre, ni introduction, ni conclusion.

## 3. Les règles

- **Une étape = un écran**, trois lignes au plus : quoi, où, pourquoi. Les actions faites
  sur le même écran tiennent dans la même étape. Viser 3 à 8 étapes.
- **Pas de liste à puces** : chaque étape est un petit paragraphe qui commence par son statut (s'il y en a)
  et son titre en gras, sans tiret. Le terminal efface les lignes vides entre les
  puces et colle les étapes ; entre deux paragraphes, il les garde.
- **Une ligne vide entre deux étapes**, pour voir d'un coup d'œil où chacune commence.
- **Une douzaine de mots au plus par ligne.** S'il en faut plus, l'étape cache deux écrans :
  la couper en deux. La ligne du chemin seule peut dépasser.
- **Expliquer juste assez** : la 3e ligne dit à quoi sert l'étape ou ce qu'on doit voir
  après, pas comment marche l'outil. Une contrainte qui ferait échouer l'étape
  (« 11 caractères max ») y a toujours sa place.
- **Ce qui demande la main du lecteur** (connexion, double authentification, paiement, code
  reçu) : le dire dans l'étape même, « Ajouter le domaine, toi (connexion Brevo) : … ». Ce que
  Claude peut faire seul, il le propose dans la question finale.
- **⚠️ une seule fois**, à l'impératif, juste avant l'étape où la fausse manœuvre tente,
  avec toujours ce qui arriverait en 2e ligne.
- **L'ordre est celui de l'exécution** : ✅ en tête, puis ⛔ et ⏳ dans l'ordre où elles se
  font, et les « Une fois … » à la fin.
- **Emojis** : seulement ✅ ⛔ ⏳ ⚠️. Pas de cadratin.
- **Finir par une seule question**, jamais un menu de choix.

## 4. « Redonne la liste »

Mettre à jour la liste déjà donnée, ne pas la recopier :

- étapes faites depuis en ✅, nouveaux blocages en ⛔, condition levée : le préfixe « Une fois … » tombe, la ligne devient un ⏳ ;
- une étape rendue inutile par une décision disparaît, la décision tient en quelques mots dans
  l'étape qui la remplace (« (on garde pyrene.fr) ») ;
- si rien n'a changé, le dire en une ligne et redonner la prochaine étape.

## Exemple

« Redonne la liste » (domaine d'envoi Brevo d'une école, en cours) :

```markdown
✅ **Vérifier le compte Brevo**
Un seul compte, et ecole-pyrene.fr n'y figure pas

✅ **Demander à l'école si un autre compte Brevo détient le domaine**
Question posée dans le mail du 16/11

⛔ **Libérer ecole-pyrene.fr**
On attend l'école, sinon ticket au support Brevo

⚠️ **Ne supprime aucun enregistrement `brevo-code` chez OVH**
L'autre compte Brevo perdrait ses envois

⏳ **Une fois le domaine libre : l'ajouter, toi (connexion Brevo)**
Settings **>** Senders, Domains & Dedicated IPs **>** Domains **>** Add a domain (chemin non vérifié)
Brevo affiche alors les réglages DNS à transmettre à Alexis

⏳ **Une fois le domaine authentifié : déclarer l'expéditeur**
bonjour@ecole-pyrene.fr, l'adresse choisie par l'école
Les mails d'Onyx partiront alors de cette adresse

Je prépare le ticket au support Brevo en attendant ?
```
