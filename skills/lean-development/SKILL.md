---
name: lean-development
description: >
  Méthode pour développer une app ou une feature de façon efficace : construire
  le BON truc, et le construire sans brûler le contexte. Déclenche ce skill dès
  le DÉBUT d'un travail de construction — quand l'utilisateur veut lancer,
  scaffolder ou planifier un projet/une app, exécuter ou reprendre un plan
  d'implémentation, ajouter un écran / endpoint / feature, ou enchaîner des
  tâches de dev sur plusieurs sessions. Déclenche AUSSI quand l'utilisateur
  demande de cadrer, arbitrer ou simplifier une fonctionnalité (« par où
  commencer », « qu'est-ce qu'on construit d'abord », « dis-moi non », « c'est
  trop compliqué », « j'ai refait cet écran dix fois », « on part dans tous les
  sens »), quand il s'inquiète du coût EN TOKENS de son développement ou de la
  lenteur d'avancement (« ça bouffe mes sessions », « pourquoi le dev coûte si
  cher », « ça n'avance pas »), ou quand tu t'apprêtes toi-même à une action
  coûteuse : proposer plusieurs directions produit sans trancher, dessiner un
  écran dont le parcours n'a pas été validé, lancer un sous-agent par tâche,
  relire de gros fichiers en entier, ou multiplier les passes de revue. But :
  maximiser le ratio valeur livrée / tokens dépensés sans sacrifier la qualité
  utile. NE déclenche PAS pour : régler un paramètre de modèle ou d'API
  (max_tokens, fenêtre de contexte), optimiser la performance runtime d'une page,
  débugger un bug précis (→ systematic-debugging), soigner l'esthétique d'une
  interface déjà cadrée (→ un skill de design), rédiger du contenu marketing
  (post, email, carrousel), ou analyser une facture d'infra (Vercel, AWS) — ce
  skill traite du cadrage et de l'économie de tokens du DÉVELOPPEMENT, pas du
  coût produit ni de la perf d'exécution.
---

# Lean Development — construire le bon truc, sans brûler le contexte

## Pourquoi ce skill existe

Un projet peut « vider trois sessions » sans jamais faire de vrai progrès. Il y
a deux coupables, et on les confond souvent.

Le premier est un **pattern de travail qui multiplie le contexte** : on repaie
plusieurs fois pour la même connaissance. Le second, plus cher, est un
**périmètre qu'on n'a jamais arrêté** : on construit vite et proprement quelque
chose qui n'aurait pas dû exister.

Le principe unificateur : **on ne paie jamais deux fois — ni pour du contexte
déjà connu, ni pour du code qui n'aurait pas dû être écrit.** Le second gaspillage
est le pire des deux : un contexte re-payé coûte des tokens, un écran inutile
coûte des tokens *et* du produit, et il continue de coûter tant qu'il est là.

D'où l'ordre des règles : **cadrer d'abord** (1 à 4), **construire ensuite**
(5 à 11). Un cadrage parfait n'excuse pas de brûler le contexte ; une exécution
parfaite ne rachète pas un mauvais périmètre.

---

# Partie I — Cadrer : construire le bon truc

### 1. L'appétit avant la solution

La question n'est pas « combien de temps ça prend ? » mais **« combien ça
vaut ? »**. L'estimation dépend de la solution, qui dépend du périmètre, qui
enfle sous la pression : elle se négocie sans fin. L'appétit est une décision
prise *avant* qu'une solution existe — il contraint la solution au lieu de la
subir.

Deux tailles, pas d'intermédiaire :

| Appétit | Ce que c'est | Pour quoi |
| --- | --- | --- |
| **Un geste** | une session, quelques heures | correction, ajustement, expérience |
| **Un lot** | le format par défaut, quelques sessions | un écran, un endpoint, une capacité entière |

Si ça ne rentre ni dans l'un ni dans l'autre, ce n'est **pas encore cadré** —
retourne à la règle 3 avant d'écrire une ligne.

« Ça ne rentre pas dans l'appétit » est un vrai refus, pas une entrée en
négociation. Il force à chercher la version essentielle. Et l'appétit se fixe
honnêtement : le réduire artificiellement pour « faire vite » produit du
bâclé, pas du lean.

### 2. Non par défaut, et une seule direction proposée

Le rôle ici est celui d'un **curateur** : décider ce qui entre et ce qui reste
dehors. Son outil principal est le mot non.

**Proposer trois directions avec aplomb n'est pas de la rigueur, c'est un refus
de trancher déguisé.** Ça reporte sur l'humain le travail qu'on lui doit, et ça
lui coûte une session pour arbitrer ce qu'on aurait dû arbitrer soi-même. Rends
**un avis** : voilà la direction, voilà pourquoi, voilà ce que j'écarte et ce
qui me ferait changer d'avis. Une alternative ne se présente que si elle change
vraiment la décision — et alors on dit laquelle on prend.

Les trois réflexes du curateur :

- **La réponse par défaut à une idée surgie en cours de route est non.** Ce qui
  revient une troisième fois mérite qu'on le construise ; le reste s'oublie tout
  seul, et c'est le but.
- **Sous-faire plutôt que sur-faire.** Trois choses qui marchent parfaitement
  battent dix à moitié. La moitié d'un produit, jamais un produit à moitié : ce
  qui est livré est fini, documenté, sans contournement. Le seul interdit est de
  couper dans le **cœur du métier** — on retire le périphérique, jamais le geste
  central.
- **Traque les épicycles.** Un épicycle est une fonctionnalité ajoutée pour
  réparer le problème causé par une fonctionnalité précédente. C'est le signal
  le plus fiable qu'on est en train d'empiler : la cause est en amont. Retirer
  la cause coûte presque toujours moins cher que la couche qu'on s'apprête à
  poser dessus.

### 3. Le parcours avant l'écran

Avant toute maquette, écris le **parcours** en trois éléments et rien d'autre :

- **Lieux** — les écrans ou états, en noms.
- **Affordances** — ce sur quoi on agit à cet endroit, en verbes ou en éléments.
- **Connexions** — les flèches, qui mènent où.

Ni mise en page, ni couleur, ni libellés définitifs.

```
[Profil]
  - zone de collage d'un document
  - bouton « Enregistrer »
      ↓
[Profil, document enregistré]
  - état du document : lisible / incomplet
  - lien « Voir les offres » → [Offres]
```

Sauter cette étape fait débattre des pixels d'un écran dont personne n'a validé
qu'il devait exister. **Un parcours faux se voit en cinq lignes de texte ; il ne
se voit pas dans une belle maquette** — et une maquette coûte vingt fois plus
cher à jeter, en tokens comme en attachement.

Le test : si le parcours ne tient pas en cinq lignes lisibles à voix haute, il
n'est pas cadré. La maquette vient après, et c'est elle qui fait foi ensuite.

### 4. Écris les no-gos et les fondrières avant de commencer

Deux listes courtes, deux ou trois lignes chacune, en tête du plan ou du message
qui ouvre le lot :

- **No-gos** — ce qu'on ne construit **pas** dans ce lot, nommé. Un no-go rend
  le dérapage visible : rouvrir un no-go redevient une décision qu'on prend, au
  lieu d'une pente qu'on descend.
- **Fondrières** — ce qui peut faire exploser le périmètre, avec la limite posée
  d'avance. « Les permissions vont devenir complexes → deux rôles pour ce lot,
  point. »

Le dérapage ne se produit jamais par une grande décision. Il se produit par une
suite de petites qu'on n'a jamais eu l'occasion de refuser, parce qu'aucune
n'était écrite nulle part.

### Le signal d'alarme : l'écran repensé pour la troisième fois

Quand un écran est redessiné trois fois, le problème n'est presque jamais
l'écran. C'est que le parcours n'a jamais été cadré (règle 3), ou que **l'écran
n'aurait pas dû exister**.

Avant de le redessiner une quatrième fois, **va voir l'usage réel** : ce chemin
a-t-il déjà été emprunté une seule fois en production ? Les données répondent en
une requête, et elles tranchent mieux que trois propositions de design. Un écran
jamais utilisé ne se raffine pas — il se remplace par le chemin que les gens
prennent vraiment.

---

# Partie II — Construire : sans brûler le contexte

Le contexte est la ressource chère, pas le calcul. Tout ce qui recharge,
re-dérive ou recopie du contexte déjà connu est du gaspillage. Optimise pour le
garder *chaud* et *petit*.

### 5. Dimensionne le process au projet, pas l'inverse

Le plus gros gaspillage n'est pas technique, il est méthodologique : appliquer
un pipeline « enterprise » (brainstorm → spec durcie en 3 passes → plan durci en
2 passes → TDD systématique → un sous-agent par tâche) à un **MVP solo**.

Avant de lancer la machinerie, calibre :

| Contexte | Process adapté |
| --- | --- |
| MVP solo, prototype, outil interne | Cadrage court (règles 1 à 4) → construire inline. Pas de passes de durcissement en boucle. |
| Code critique, équipe, prod à risque | Le pipeline complet se justifie. |

**Les « passes de durcissement » ont un rendement décroissant.** Une passe relit
*et réécrit* le document entier. Passé la 2e, tu paies le prix fort pour des
gains marginaux. Si tu te surprends à faire une 3e passe de revue sur une spec,
arrête et construis — on corrige au contact du réel, moins cher.

### 6. Exécute les plans INLINE, pas avec un sous-agent froid par tâche

C'est le multiplicateur de coût numéro un.

Un sous-agent *froid* redémarre de zéro à chaque fois : il recharge les
instructions projet, la liste des skills, les schémas MCP, **puis re-explore le
codebase** pour retrouver un contexte que la session principale possédait déjà.
Un plan de 17 tâches × un sous-agent froid par tâche = **17 re-dérivations
complètes du même contexte**.

- **Par défaut : exécute le plan inline**, par lots de 2–3 tâches, dans une
  session dont le contexte reste chaud. Zéro re-amorçage.
- **Les sous-agents ne se justifient que** pour des tâches *vraiment
  indépendantes et parallélisables* (pas de state partagé, pas de dépendance
  séquentielle), ou pour isoler une exploration très bruyante dont tu ne veux
  que la conclusion.
- Si tu délègues, **donne au sous-agent le contexte déjà connu** (fichiers
  exacts, décisions prises) plutôt que de le laisser tout redécouvrir.

Règle du pouce : si les tâches se lisent « fais A, puis avec le résultat fais
B », c'est séquentiel → inline. Ne délègue pas ce que tu peux enchaîner à chaud.

### 7. Ne lis jamais un gros fichier généré en entier

Lire un fichier entier pour en utiliser 20 lignes, c'est acheter tout le livre
pour une citation. Coûteux : `package-lock.json`, `.next/`, dumps, migrations,
gros composants vendus (kits UI de plusieurs centaines de lignes).

- **Grep d'abord** pour localiser, puis **Read ciblé par plage de lignes**.
- Ne relis pas un fichier que tu viens d'éditer « pour vérifier » — l'édition
  aurait échoué sinon.
- Les captures d'écran et images sont *particulièrement* chères en contexte.
  N'en prends que si tu as besoin de *voir* le rendu, pas par réflexe. Une seule
  capture ciblée vaut mieux qu'une rafale.

### 8. Sessions courtes, focalisées, à contexte chaud

Chaque nouvelle session repaie un « droit d'entrée » fixe (instructions,
skills, MCP). Le contexte long finit résumé, ce qui coûte aussi.

- 1 session = 1 objectif net (un lot de tâches), puis on clôt avec un résumé.
- Écris un résumé de fin de session actionnable (Réalisé / Reste à faire /
  Blockers / Décisions) pour que la suivante recharge le *strict nécessaire*,
  pas tout le transcript.
- N'ouvre pas dix chantiers dans une même session : le contexte gonfle et tout
  ralentit.

### 9. Réduis le baseline par projet

C'est un coût fixe payé à *chaque* session, avant tout travail utile.

- **Débranche les serveurs MCP inutiles** pour ce projet. Un serveur MCP peut
  exposer des centaines d'outils dont les instructions sont injectées à chaque
  session. Développer une app web n'a pas besoin d'un MCP Gmail/Agenda/Drive.
- **Traque les doublons** (même MCP monté deux fois, deux intégrations qui se
  recouvrent).
- Garde `CLAUDE.md` et la mémoire projet **denses** : des faits non dérivables
  du code, pas ce que le repo dit déjà.

### 10. Cible le TDD, ne le rends pas systématique

Le TDD est précieux là où un bug est coûteux et la logique subtile : garde-fous
déterministes, calculs, parsing, contrats d'API, logique métier. Là, écris le
test d'abord.

Pour l'UI et le glue code, un test complet par élément multiplie les cycles
(écrire test + impl + faire tourner) pour un filet faible. Un contrôle visuel ou
un smoke test suffit souvent. Investis les tokens de test là où ils rachètent un
vrai risque.

### 11. Batche les actions indépendantes

Des appels d'outils sans dépendance entre eux partent dans **un seul tour**
(plusieurs Read/Grep en parallèle). Enchaîner un-par-un des lectures
indépendantes rallonge la conversation donc le contexte rechargé. Ne séquencialise
que ce qui a une vraie dépendance de données.

---

## Les deux réflexes à garder

**Avant de construire** — quand une feature, un écran ou une idée arrive :
**« Est-ce que je m'apprête à construire quelque chose que personne n'a demandé
à voir ? »** Si l'appétit n'est pas fixé, si le parcours ne tient pas en cinq
lignes, ou si les no-gos ne sont écrits nulle part, le cadrage n'est pas fait —
et cinq minutes de cadrage rachètent deux jours de code.

**Avant une action coûteuse** — lancer des sous-agents, relire un gros fichier,
enchaîner une énième passe de revue : **« Est-ce que je m'apprête à re-payer un
contexte que je possède déjà ? »** Si oui, il y a presque toujours une voie plus
chaude et moins chère.

La qualité ne vient pas du volume de tokens brûlés. Elle vient de les dépenser
là où ils rachètent un risque réel — et de ne pas les dépenser du tout sur ce
qui n'aurait pas dû être construit.
