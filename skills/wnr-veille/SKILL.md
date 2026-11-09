---
name: wnr-veille
description: >-
  Cadre les BONNES sources AVANT de lancer une recherche de marché, pour ne pas perdre la
  recherche dans des listicles SEO. C'est un skill d'EXPLORATION : il sert à découvrir et
  cartographier un paysage, pas à décider quoi faire de son propre produit. Utilise-le quand
  l'utilisateur veut savoir ce qui existe et où le trouver — « fais une veille sur X », « état
  de l'art de X », « qu'est-ce qui existe déjà », « qui sont les acteurs de X », « quelles sont
  les meilleures sources sur X », « comment se fait X ailleurs », « cadre les sources » ; en
  anglais « market research », « state of the art », « landscape of X », « who's doing X ».
  Utilise-le AUSSI, sans qu'on te le demande, quand tu t'apprêtes à lancer des `WebSearch` pour
  explorer un marché ou un domaine que tu ne connais pas : ce skill décide OÙ chercher avant de
  chercher. Il est également invoqué par la Phase 3 (veille externe) du skill `wnr-use-case-audit`.
  Ne l'utilise PAS quand la recherche vise une DÉCISION sur les fonctionnalités de l'utilisateur —
  « ce que je dois améliorer / changer / supprimer », « est-ce que mes features tiennent la route »,
  « qu'est-ce qui ne sert à rien chez moi », « on se compare comment » : là c'est
  `wnr-arbitrage-features`, qui embarque déjà son propre cadrage de sources et croise la veille
  avec l'usage réel. Ne l'utilise pas non plus pour une simple question factuelle ponctuelle
  (« quelle est la capitale de X », « à quoi sert telle lib »), pour un dossier détaillé par
  concurrent (→ `competitor-profiling`), ni pour rédiger le livrable marketing lui-même
  (post, page concurrent) — là, passe aux skills de rédaction.
---

# Veille — cadrer les sources avant de chercher

## Pourquoi ce skill existe

Une recherche de marché ratée se reconnaît à ses sources : dix onglets de « **10 Best X Tools 2026** », des articles affiliés qui se recopient, zéro source primaire. `WebSearch` ramène ça par défaut, parce que c'est ce qui est optimisé pour le référencement — pas ce qui est vrai.

Le travail utile se joue **avant** la première requête : décider **quelles catégories** le sujet croise vraiment, et **quelles sources** répondent le mieux à chacune. Une bonne veille n'est pas « chercher plus », c'est **chercher aux bons endroits, dans le bon ordre de confiance**. Ce skill formalise ce cadrage pour qu'il soit fait à chaque fois, vite, et pas réinventé à froid.

## La méthode — 5 temps

Suis-les dans l'ordre. Crée une todo par temps si tu tiens une liste.

### 1. Nommer TOUTES les catégories que le sujet croise (pas seulement l'évidente)

Dérive les catégories des **sorties et des jobs** du sujet, pas de son étiquette. C'est l'étape anti-angle-mort : le trou le plus intéressant est presque toujours dans la catégorie qu'on aurait sautée.

- Un **agent de création de visuel** ne croise pas que « générateurs de carrousel » — il croise aussi *text-to-infographic* (Napkin, Canva) ET *critique de design assistée* (quasi vide côté concurrence → c'est là qu'est l'actif différenciant).
- Un **outil de facturation** qui capture aussi les dépenses croise la *gestion de notes de frais*, qu'il le veuille ou non.
- Un **tracker de projet** qui logue des heures croise le *time-tracking*.

Écris la liste des catégories explicitement. Si tu n'en vois qu'une, force-toi à en chercher une adjacente via les sorties : « ce que ça PRODUIT, qui d'autre le produit ? »

### 2. Mapper chaque catégorie → archétypes de sources

Pour chaque catégorie, va chercher les bons types de source dans la **bibliothèque** : `references/source-library.md`. Elle range les sources par domaine (design, social, produit/SaaS, génération d'image IA, docs techniques…), chacune avec son **niveau de qualité** et **à quoi elle sert**. Lis-la à cette étape.

### 3. Hiérarchiser par qualité de preuve

Toutes les sources ne se valent pas. Range-les en trois niveaux et cite d'abord les plus hautes :

- **Primaire (vérité observable)** : pages produit / pricing / **changelog** des acteurs, **model cards** (fal.ai, Replicate, HuggingFace), **avis négatifs** (G2/Capterra, filtrés 1-2★), posts/threads réels *dans le fil*, docs officielles, dépôts. → ce que l'acteur *livre* et *facture*, ce que les utilisateurs *reprochent*.
- **Secondaire (agrégat)** : comparateurs (G2/Capterra vue d'ensemble), Product Hunt, discussions Reddit/forums, rapports d'études (Buffer, Hootsuite, Socialinsider). → utile pour dénombrer et recouper.
- **Tertiaire (à manier avec méfiance)** : listicles « best of 2026 », blogs affiliés. → servent **uniquement à établir la LISTE** des acteurs à aller voir en direct, **jamais** comme source de vérité sur une feature ou un prix.

Règle d'or : **une affirmation de fond (feature, prix, limite) se vérifie sur une source primaire**, pas sur un listicle. Un listicle qui « dit que » n'est pas une preuve.

### 4. Nommer ce que tu écartes (et pourquoi)

Dis explicitement ce que tu ne prendras pas pour argent comptant : les listicles affiliés comme vérité, les pages marketing prises pour neutres, tes propres souvenirs de modèles/prix (ta donnée d'entraînement date — pour la doc d'une lib, passe par **context7 (MCP)** plutôt que ta mémoire). Nommer les écartés protège la crédibilité de la veille : le lecteur sait ce que tu n'as PAS gobé.

### 5. Soft-gate — montrer le plan, puis enchaîner

Présente le **plan de sources** en UN message compact (format dans `assets/source-plan-template.md`) : les catégories, les sources retenues par catégorie, et les écartés. Puis **enchaîne directement la recherche** — sauf si l'utilisateur redresse. C'est un garde-fou, pas un péage : pas de ping-pong, l'utilisateur peut corriger une source ou en ajouter une avant que tu ne brûles des requêtes au mauvais endroit.

Si tu es invoqué **depuis `wnr-use-case-audit` (Phase 3)**, le plan de sources s'insère juste avant les recherches de la Phase 3 ; garde-le court, l'audit a déjà son propre cadre.

## Exécuter la recherche (après le plan)

Une fois le plan montré, lance la recherche avec l'outillage adapté :

- **`WebSearch`** pour l'essentiel — mais dirigé par le plan (`allowed_domains` quand une source primaire est identifiée, ex. le domaine d'un concurrent).
- **`parallel-web-search`** quand il faut ratisser large sur plusieurs catégories d'un coup ; **`parallel-deep-research`** UNIQUEMENT si l'utilisateur demande explicitement une veille exhaustive/approfondie (c'est plus lent et plus coûteux).
- **context7 (MCP)** pour toute doc de lib/framework/API — à jour, contre ta mémoire qui date.
- **Délègue, ne duplique pas** : pour un **profilage concurrentiel profond** (fiche concurrent, page « X vs Y », battle card), passe la main aux skills marketing dédiés `competitor-profiling` et `competitors`. Ce skill-ci est la **porte d'entrée de cadrage**, pas l'outil de teardown détaillé.

Cite tes sources en distinguant l'**observé** (« le changelog de X montre… ») de l'**inféré** (« les utilisateurs attendent probablement… parce que… »).

## Ce que ce skill n'est PAS

- **Pas un outil de décision sur le produit de l'utilisateur.** Ce skill explore un paysage ; il ne dit pas quoi garder, améliorer, changer ou supprimer chez soi. Ce verdict-là exige de croiser la veille avec l'usage réel des fonctionnalités — sans ce croisement, une veille ne peut produire que des ajouts, jamais une coupe ni un changement. Si la demande vise une décision (« ce que je dois améliorer / supprimer », « est-ce que mes features tiennent la route »), passe la main à `wnr-arbitrage-features`, qui embarque son propre cadrage de sources et n'a donc pas besoin de celui-ci.
- Pas un répondeur à question factuelle ponctuelle (« à quoi sert telle lib ») — réponds directement.
- Pas le rédacteur du livrable marketing (post, page concurrent, email) — une fois la veille faite, enchaîne sur les skills de rédaction.
- Pas un substitut au jugement : la hiérarchie de sources oriente, elle ne pense pas à ta place. Une source primaire peut mentir (page marketing), un forum peut dire vrai. Recoupe.

## Entretenir la bibliothèque

`references/source-library.md` est vivante. Quand une veille te fait découvrir une source qui s'est révélée bonne (ou mauvaise), ajoute-la (ou dégrade-la) dans le bon domaine avec une ligne « à quoi elle sert ». C'est ce qui fait qu'on ne redémarre pas à froid la fois suivante.
