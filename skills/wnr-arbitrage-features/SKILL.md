---
name: wnr-arbitrage-features
description: Rend un verdict argumenté sur les fonctionnalités d'un produit existant en croisant leur usage réel avec les attentes du marché — que GARDER, AMÉLIORER, CHANGER, SUPPRIMER. Utilise ce skill dès que l'utilisateur veut décider du sort de ses features à la lumière de la concurrence : « fais une veille concurrentielle pour me dire ce que je peux améliorer / changer / supprimer », « est-ce que mes fonctionnalités tiennent la route face au marché », « qu'est-ce qui ne sert à rien dans mon produit », « qu'est-ce qui manque par rapport aux concurrents », « benchmark mes features », « on se compare comment », « qu'est-ce que je devrais couper », en français comme en anglais (« what should I cut / improve », « how do we stack up », « feature gap analysis », « competitive feature audit »). Déclenche AUSSI, sans qu'on te le demande, quand tu t'apprêtes à conseiller d'ajouter ou de retirer une fonctionnalité en invoquant « les concurrents font X » ou « c'est devenu un standard » : cette affirmation exige le croisement usage × marché que ce skill impose. Il embarque son propre cadrage de sources — pas besoin d'appeler un skill de veille séparé. NE l'utilise PAS pour produire une fiche concurrent ou un dossier d'intelligence marketing (→ `competitor-profiling`), une page SEO « X vs Y » (→ `competitors`), ni pour inventorier ce que fait un produit sans le juger (→ `wnr-use-case-audit`).
---

# Arbitrage de fonctionnalités

Décider, preuves à l'appui, ce qu'un produit existant doit garder, améliorer, changer ou supprimer — en confrontant ce qu'il fait *réellement* à ce que son marché tient pour acquis.

## Le piège que ce skill existe pour éviter

Une veille concurrentielle classique regarde dehors, revient avec une liste de ce que font les autres, et produit invariablement des **ajouts**. Elle ne peut rien dire d'autre : sans connaître l'usage réel du produit, on ne peut ni couper (on ignore ce qui ne sert pas) ni changer (on ignore ce qui rate sa cible). D'où des recommandations qui ne font que grossir le produit.

L'inversion est le cœur de la méthode : **mesurer d'abord chez soi, chercher dehors ensuite, et ne conclure qu'au croisement.** Un manque révélé par le marché n'a de valeur que rapporté à ce que le produit fait déjà ; une fonctionnalité inutilisée ne se coupe qu'après avoir vérifié si le marché la juge essentielle — auquel cas c'est son accès qu'il faut changer, pas elle qu'il faut supprimer.

## La méthode — 5 temps

Suis-les dans l'ordre ; l'ordre *est* la méthode. Crée une todo par temps.

Détecte la langue de travail du projet et produis **tout** dans cette langue — le rapport comme tes échanges dans la conversation.

### Temps 0 — Cadrer ce qu'on juge, et pour qui

Un même constat donne des verdicts opposés selon le contexte. « Pas de facturation en self-service » est rédhibitoire pour un SaaS, hors sujet pour un outil interne. Avant tout, établis :

- **La nature du produit** et son ambition à 6-12 mois (outil sur mesure ? SaaS ? outil d'agence ? interne ?).
- **Qui l'utilise vraiment**, et combien de personnes.
- **Ce qui compte pour eux** — le job principal, pas la liste des fonctionnalités.

Si l'ambition n'est pas dérivable du repo ou de la conversation, **pose une question ciblée**. C'est le seul moment où une question bloquante se justifie : tout le reste du travail en dépend, et un verdict calibré sur la mauvaise ambition est pire qu'inutile.

### Temps 1 — Mesurer l'usage réel avant de regarder dehors

Objectif : distinguer la **surface déclarée** (ce que le produit propose) de la **surface utilisée** (ce qui sert). L'écart entre les deux porte à lui seul la moitié des verdicts.

Collecte, dans l'ordre de fiabilité décroissante :

- **Données d'usage** si accessibles — comptages en base, analytics, logs. C'est la preuve la plus forte : « 10 des 15 formats proposés n'ont jamais produit une ligne » clôt un débat qu'aucun argument d'autorité ne clôt.
- **Traces d'exécution** — un endpoint sans appelant, une route sans entrée de nav, un composant dont le rendu dépend d'une donnée qui n'existe jamais. Une fonctionnalité qui ne *peut pas* s'exécuter est un cas distinct de l'inutilisée : elle est cassée, pas superflue.
- **Proxys de code** — `git log` (une zone figée pendant que tout bouge autour), marqueurs deprecated/TODO, références venant uniquement des tests, flags périmés.

Énumère ensuite la surface déclarée : fonctionnalités, options, formats, réglages — **au grain où une décision se prend**. Si un produit propose 5 canaux × 3 formats, ce sont 15 lignes, pas 1. Les fonctionnalités mortes se cachent dans la granularité qu'on n'a pas ouverte.

Produis la **table de l'écart**, ton socle pour le temps 4 :

| Capacité déclarée | Usage réel constaté | Source de la mesure |
|---|---|---|
| … | utilisée N fois / jamais / inexécutable | requête, grep, git log |

Nomme la fiabilité de chaque mesure. « Aucun appelant dans le repo » est plus faible que « 0 ligne en base » — le lecteur doit pouvoir pondérer.

**Sans aucune donnée d'usage**, dis-le franchement et appuie-toi sur les proxys, en signalant quels verdicts basculeraient si de vraies données existaient. Ne renonce pas au temps 1 : même un socle imparfait vaut infiniment mieux qu'une veille hors-sol.

### Temps 2 — Nommer les catégories, jusqu'à saturation

Le produit ne joue pas dans une seule catégorie. C'est ici que se décide la qualité de tout le reste : **le meilleur constat vient presque toujours de la catégorie qu'on aurait sautée.** Deux passes obligatoires, avec des lentilles différentes.

**Passe A — les catégories revendiquées.** Ce que le produit dit être. Elles viennent d'elles-mêmes ; elles donnent les comparables évidents et rarement les meilleurs constats.

**Passe B — les catégories subies.** Trois questions qui débusquent les angles morts :

1. **« Ce que ça produit, qui d'autre le produit ? »** Les *sorties* trahissent le marché réel, quoi qu'en dise le positionnement. Un outil qui émet des scripts vidéo est jugé contre des outils vidéo ; un tracker qui logue des heures est dans le time-tracking.
2. **« Qu'est-ce qu'il produit à moitié ? »** Les capacités qui pendent — un brouillon qu'il ne sait pas livrer, un export qu'il ne sait pas envoyer. Le produit a déjà déclaré ces jobs importants en construisant leur première moitié.
3. **« Qu'est-ce que l'utilisateur va faire juste avant et juste après ? »** L'outil dans lequel il colle le résultat est une catégorie que le produit croise sans la servir.

Si la passe B n'ajoute aucune catégorie, tu n'as pas cherché les sorties — reprends la question 1 avec la liste concrète des artefacts produits. Annonce le compte à voix haute (« passe A : 3 catégories · passe B : +2 »), la discipline doit être visible.

### Temps 3 — Cadrer les sources, puis chercher

Une recherche non cadrée revient avec des listicles affiliés qui se recopient. Décide **où** chercher avant de brûler des requêtes.

**Hiérarchie de preuve** — cite d'abord le plus haut :

- **Primaire** : pages produit / pricing / **changelog** des acteurs (le changelog dit où ils investissent), docs officielles d'API et de plateformes, **avis négatifs G2/Capterra filtrés 1-2★**, données d'enquête sectorielles, posts réels dans le fil.
- **Secondaire** : comparateurs, Product Hunt, discussions Reddit/forums, rapports d'éditeurs (méthodo variable, à recouper).
- **Tertiaire** : listicles « N best tools 2026 », blogs affiliés. Usage légitime unique : **établir la liste des acteurs** à aller voir en direct. Jamais pour affirmer une fonctionnalité ou un prix.

`references/source-library.md` range des sources typées par domaine — lis-le à ce moment, et enrichis-le quand une veille te fait découvrir une bonne source.

**Les avis négatifs ne sont pas optionnels ici.** Ils sont la seule source qui dise à la fois *ce qui manque* et *ce qui déçoit chez les leaders* — et cette seconde information est celle qui calibre l'ambition. Découvrir que les références de la catégorie se font toutes reprocher la même faiblesse change une recommandation : viser juste et petit là où les gros ratent, plutôt que copier leur module au complet.

Montre un **plan de sources compact** (catégories → sources retenues → écartés), puis **enchaîne directement la recherche**. C'est un garde-fou, pas un péage : l'utilisateur peut corriger avant que tu ne cherches, mais n'attends pas sa réponse.

Nomme explicitement les **écartés** : listicles pris pour vérité, pages marketing lues comme neutres, ta propre mémoire sur les prix et versions (datée par construction — vérifie sur une source primaire).

### Temps 4 — Croiser. C'est ici que se fabrique le verdict

Ni la table du temps 1 ni les trouvailles du temps 3 ne valent séparément. Croise chaque capacité sur deux axes — **est-elle utilisée ?** et **la catégorie la tient-elle pour acquise ?** — et lis le quadrant :

|  | **Attendue par la catégorie** | **Non attendue** |
|---|---|---|
| **Utilisée** | 🟢 **Garder** (ou 🟡 améliorer si en deçà) | 🟢 **Garder — c'est ta différenciation** |
| **Non utilisée** | 🟠 **Changer** — le besoin existe, l'accès ou la forme rate | 🔴 **Supprimer ou masquer** |

Deux cases font tout l'intérêt de la manœuvre, et ce sont celles qu'une veille classique manque :

- **Non utilisée mais attendue → change, ne coupe pas.** Le besoin est réel et l'implémentation le rate. Cherche pourquoi : un péage à l'entrée, un placement invisible, un format inadapté. Couper ici serait l'erreur exacte que la donnée d'usage seule ferait commettre.
- **Utilisée mais non attendue → protège.** La veille pousse mécaniquement à la convergence vers la moyenne de la catégorie. Ce que le produit fait et que personne d'autre ne fait est précisément ce qui le rend défendable. **Ne recommande jamais de couper une capacité utilisée au seul motif que les concurrents ne l'ont pas.**

Avant de conclure quoi que ce soit en termes de retard, tranche une question : **existe-t-il un concurrent direct ?** Si tu n'en trouves aucun — le produit combine des choses que personne n'assemble — c'est un **résultat**, pas un échec de recherche. Dis-le en tête de rapport et requalifie tous les « manques » : ce ne sont plus des retards à rattraper mais des choix à trancher. Un produit sans équivalent jugé contre les normes d'une catégorie voisine se fait démolir pour de mauvaises raisons.

### Temps 5 — Rendre le verdict

Structure imposée — c'est elle qui garantit qu'on ne rende pas, une fois de plus, une liste d'ajouts :

```markdown
# Arbitrage des fonctionnalités — <Produit> (<date>)

## Le cadre
(Nature du produit, ambition, utilisateurs. Puis LA conclusion cadre :
concurrent direct ou non, et ce que ça implique pour la lecture du reste.)

## 🟢 Garder
(Ce qui marche et ce qui te différencie. Toujours renseigné — un rapport
qui n'est qu'une liste de reproches sera lu comme un procès et ignoré.)

## 🟡 Améliorer
(Utilisé, mais en deçà de ce que la catégorie tient pour acquis.)

## 🟠 Changer
(Le bon besoin, mal servi. Dis en quoi la forme actuelle rate sa cible.)

## 🔴 Supprimer ou masquer
(Ni utilisé ni attendu. Chiffre le coût de maintien : code, options à l'écran,
charge mentale.)

## Ce que cette veille ne peut pas dire
(Obligatoire. Voir plus bas.)
```

**Chaque ligne d'un verdict porte trois choses**, jamais moins :

1. **Le constat**, formulé côté produit — pas « Metricool a une inbox » mais « tu publies et tu n'entends jamais rien ».
2. **La preuve**, chiffrée si possible, avec sa source et son niveau (observé / inféré).
3. **La conséquence pour *ce* produit** — ce qui change concrètement, et à quel coût réel.

Une ligne qui se contente de « le concurrent X fait Y » n'est pas un verdict, c'est une note de lecture : reformule-la ou jette-la.

Sur le **coût**, compte ce qui est hors du code. Une fonctionnalité triviale à écrire mais bloquée par une App Review plateforme, un scope non accordé ou un accès payant coûte des semaines, pas des heures. Un effort qui ne compte que les lignes de code classe mal tout le rapport. Symétriquement, cherche ce qui est **déjà câblé** : une capacité dont 80 % de la plomberie existe déjà (une connexion, un identifiant déjà stocké, un endpoint déjà écrit) est bien moins chère qu'elle n'en a l'air, et c'est souvent la meilleure recommandation du lot.

**La section « ce que cette veille ne peut pas dire » n'est pas de la modestie de façade.** Elle protège le lecteur d'agir sur du sable, et c'est elle qui distingue un jugement d'une affirmation. Nomme au minimum : l'absence de comparable direct s'il y a lieu, la provenance et le biais des données sectorielles (géographie, taille, secteur des répondants), l'absence de données d'usage là où elle affaiblit un verdict, et les cas où « l'utilisateur n'en veut pas » et « personne ne le lui a proposé » produisent la même absence.

## Ce que ce skill n'est pas

- **Pas un inventaire.** Il juge un périmètre, il ne le cartographie pas exhaustivement. Si l'utilisateur veut d'abord savoir *ce que fait* son produit, c'est `wnr-use-case-audit` ; les deux se complètent, et un audit récent est un excellent intrant pour le temps 1.
- **Pas une fiche concurrent.** Le dossier détaillé par acteur (positionnement, pricing, SEO, social proof) est le travail de `competitor-profiling`. Ici, les concurrents sont un instrument de mesure, pas le sujet.
- **Pas du contenu marketing.** Les pages « X vs Y » relèvent de `competitors`.
- **Pas un substitut au jugement.** Une source primaire peut mentir (une page produit vend), un forum peut dire vrai. Recoupe, et assume tes verdicts au lieu de les faire porter par les sources.

## Références

- `references/source-library.md` — sources typées par domaine, avec leur niveau de preuve. À lire au temps 3, à enrichir après chaque veille.
- `references/verdict-frameworks.md` — le quadrant en détail, les cas limites, et comment chiffrer un coût qui inclut les gates externes. À lire au temps 4 en cas d'hésitation sur un classement.
- `assets/rapport-template.md` — le gabarit complet à remplir au temps 5.
