# Bibliothèque de sources typées

Sources rangées par domaine. Chaque entrée : **niveau** (primaire / secondaire / tertiaire) + **à quoi elle sert**. Le niveau dit le degré de confiance (voir la hiérarchie de preuve du SKILL.md), pas l'utilité — un tertiaire bien employé (dénombrer les acteurs) reste utile.

> Table des matières : [Design & direction artistique](#design--direction-artistique) · [Social & formats créateurs](#social--formats-créateurs) · [Produit / SaaS / concurrents](#produit--saas--concurrents) · [Génération d'image & modèles IA](#génération-dimage--modèles-ia) · [Docs techniques](#docs-techniques) · [Tendances & signaux faibles](#tendances--signaux-faibles) · [Les pièges](#les-pièges)

---

## Design & direction artistique
Pour juger la QUALITÉ visuelle, les tendances de composition, la typo.

- **Dribbble** — *primaire (inspiration)*. Compositions, UI, DA au niveau shot. Bon pour « à quoi ressemble le bon en ce moment ».
- **Behance** — *primaire*. Projets complets (campagnes, systèmes), plus contextualisés que Dribbble.
- **Awwwards** — *primaire*. Le haut du panier web/DA, parti-pris audacieux. À viser quand on cherche l'option osée.
- **It's Nice That** — *secondaire (éditorial)*. Tendances, direction éditoriale, ce qui bouge dans le graphisme.
- **Muzli** — *secondaire*. Agrégateur de tendances design quotidiennes ; bon radar.
- **Fonts In Use** — *primaire (typo)*. Usages typographiques réels ; précieux pour un visuel qui écrit du texte.
- **Pinterest** — *secondaire (mood)*. Pour capter un STYLE de série / une ambiance, pas une pièce isolée.
- **Land-book / Godly / SaaS Landing Page galleries** — *primaire*. Références de landing pages réelles par catégorie.

## Social & formats créateurs
Pour ce qui PERFORME sur les plateformes et les formats attendus.

- **Les créateurs eux-mêmes, DANS le fil** — *primaire*. Aller voir les posts/carrousels réels des références (pas un article qui les résume). La vérité terrain sur les hooks, la densité, les formats.
- **Buffer / Hootsuite / Socialinsider / Metricool (blogs d'études)** — *secondaire*. Études chiffrées (meilleurs formats, horaires, taux d'engagement par type). Recouper — méthodo variable.
- **Docs officielles des plateformes** (LinkedIn, Instagram, TikTok, YouTube) — *primaire*. Contraintes réelles : formats, ratios, limites d'API, ce qui est officiellement possible.
- **r/socialmedia, r/marketing, communautés créateurs** — *secondaire*. Ce que les opérateurs disent vraiment vouloir / ce qui les agace.

## Produit / SaaS / concurrents
Pour les features, le pricing, ce qui est table-stakes, ce qui manque.

- **Pages produit + pricing + CHANGELOG des concurrents** — *primaire*. Source de vérité sur ce qu'ils livrent et facturent. Le changelog révèle la trajectoire (où ils investissent).
- **G2 / Capterra — filtrer les avis NÉGATIFS (1-2★)** — *primaire pour les manques*. Les avis négatifs disent « ce qui manque », « pourquoi j'ai résilié » : la mine de trous à combler. La note globale, elle, est *secondaire*.
- **Product Hunt** — *secondaire*. Lancements récents + commentaires ; radar des entrants et de leur accueil.
- **Reddit / Hacker News / forums de niche** — *secondaire*. Débats non filtrés, comparaisons vécues, « j'ai quitté X pour Y parce que… ». ⚠️ **Reddit est bloqué au crawler `WebSearch`** (`allowed_domains: ["reddit.com"]` → erreur 400) : ne PAS filtrer sur reddit.com ; passer par une requête non filtrée qui remontera les fils indexés, ou lire un fil précis via `WebFetch`.
- **Agrégateurs d'avis** (checkthat.ai, comparateurs indé) — *secondaire*. Recoupent les avis multi-plateformes (G2/Trustpilot/PH) ; pratiques pour repérer l'écart de note pré/post-achat, à recouper avec la source primaire.
- **LinkedIn (posts des fondateurs/PMM concurrents)** — *secondaire*. Positionnement revendiqué, roadmap teasée.
- **Comparateurs (« X vs Y » sur leurs propres sites)** — *tertiaire*. Biaisé par construction ; utile pour repérer les axes de comparaison qu'EUX jugent importants.

## Génération d'image & modèles IA
Pour le MOTEUR (quand la feature repose sur un modèle génératif) — distinct du produit.

- **fal.ai / Replicate — pages de modèles** — *primaire*. Modèles dispo, forces (rendu de texte, cohérence), coût, latence. Dit si un meilleur moteur existe que celui en place.
- **HuggingFace — model cards & spaces** — *primaire*. Specs, benchmarks, démos live.
- **Ideogram / Recraft / Reve / Midjourney / Freepik** — *primaire*. Les spécialistes « texte dans l'image » / design ; comparables directs pour un poster/infographie.
- **artificialanalysis.ai** — *secondaire*. Comparatifs indépendants de modèles (qualité/prix/vitesse).
- **Changelogs / release notes des providers** (OpenAI, Google, Anthropic, Black Forest Labs…) — *primaire*. Ce qui vient de sortir, contre ta mémoire qui date.

## Docs techniques
Pour tout ce qui touche une lib, un framework, une API.

- **context7 (MCP)** — *primaire*. Doc à jour des libs/frameworks/SDK. À préférer SYSTÉMATIQUEMENT à ta mémoire, qui reflète un état figé de l'entraînement.
- **Dépôts GitHub (README, issues, releases)** — *primaire*. L'état réel du code, les bugs connus, la vélocité.
- **Docs officielles du produit/API** — *primaire*.

## Tendances & signaux faibles
Pour sentir où va un marché, pas juste où il est.

- **Product Hunt (leaderboard mensuel), Hacker News (Show HN)** — *secondaire*. Ce qui émerge.
- **Newsletters de niche / analystes du secteur** — *secondaire*. Synthèses de tendance ; citer l'auteur.
- **Google Trends** — *secondaire*. Trajectoire d'intérêt sur un terme ; jamais une preuve d'usage, juste un signal.

## Enquêtes sectorielles & données d'usage déclaratives
Pour savoir ce que les utilisateurs d'une catégorie FONT vraiment, plutôt que ce que les éditeurs disent qu'ils font. C'est la source qui recalibre une priorité : découvrir qu'un canal pèse 13 % d'usage réel là où tout le monde le présente comme incontournable change un verdict.

- **Enquêtes d'acteurs de la niche auprès de leurs utilisateurs** (type « données de N+ répondants ») — *primaire*. Chiffres d'usage réel par canal, freins déclarés, verbatims. Chercher « data from N authors/marketers/developers » + le secteur. ⚠️ Lire la composition de l'échantillon avant de citer : géographie, taille, segment — un panel à 73 % d'auto-édités US ne décrit pas un professionnel européen.
- **Rapports annuels d'éditeurs sur leur propre catégorie** — *secondaire*. Riches mais intéressés : l'éditeur mesure ce qu'il vend bien.
- **Blogs de référence d'une profession** (les praticiens reconnus, pas les agrégateurs SEO) — *secondaire*. Ils disent les freins vécus, utiles pour interpréter les chiffres.

## Coût et capacité réelle d'une fonctionnalité
Pour chiffrer un effort qui inclut ce qui ne dépend pas de toi — la partie qui domine le plus souvent.

- **Docs de permissions / scopes des plateformes** (Meta, LinkedIn, Google, TikTok) — *primaire*. Disent si une capacité exige une App Review, un programme partenaire ou un plan payant. C'est là que se cache l'essentiel du délai.
- **Changelogs et pages de dépréciation d'API** — *primaire*. Une capacité qui vient d'ouvrir ou de fermer change le verdict.
- **Pages de modèles / pricing des fournisseurs IA** (fal.ai, Replicate, HuggingFace, providers LLM) — *primaire*. Vérifient si le moteur en place est encore le bon choix ; un modèle de deux générations en retard est un « améliorer » à effort quasi nul.

## Les pièges
À reconnaître et écarter comme SOURCE DE VÉRITÉ (utilisables autrement) :

- **Listicles « N Best X Tools 2026 »** — contenu SEO/affilié qui se recopie. Usage légitime UNIQUE : établir la liste des acteurs à aller voir en direct. Jamais pour affirmer une feature ou un prix.
- **Pages marketing prises pour neutres** — un acteur décrivant ses propres forces n'est pas une évaluation. Primaire pour « ce qu'il REVENDIQUE », pas pour « ce qu'il VAUT ».
- **Ta propre mémoire sur modèles/prix/versions** — datée par construction. Vérifie sur une source primaire à jour.
- **Un seul avis / un seul post** — anecdote, pas tendance. Recoupe avant de conclure.
