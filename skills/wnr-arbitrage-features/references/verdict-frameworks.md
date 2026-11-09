# Cadres de verdict

À lire au **temps 4**, quand un classement hésite ou qu'un coût est difficile à chiffrer.

> Sommaire : [Le quadrant](#le-quadrant-en-détail) · [Cas limites](#les-cas-limites) · [Chiffrer un coût honnête](#chiffrer-un-coût-honnête) · [Ordonner les verdicts](#ordonner-les-verdicts) · [Niveaux de preuve](#niveaux-de-preuve-dun-verdict)

## Le quadrant en détail

Deux axes : **l'usage réel** (temps 1) et **l'attente de catégorie** (temps 3).

|  | **Attendue par la catégorie** | **Non attendue** |
|---|---|---|
| **Utilisée** | 🟢 Garder · 🟡 Améliorer si en deçà | 🟢 **Garder — différenciation** |
| **Non utilisée** | 🟠 **Changer** | 🔴 Supprimer ou masquer |

### 🟢 Garder — utilisée et attendue
Le socle. Nomme-le quand même : un rapport qui ne liste que des reproches se lit comme un procès et finit ignoré. C'est aussi ce qui protège contre la refonte inutile — quelqu'un finira par proposer de « moderniser » ce qui marche.

### 🟢 Garder — utilisée mais non attendue : la différenciation
La case la plus fragile, parce que la veille pousse mécaniquement vers la moyenne de la catégorie. Une capacité que le produit sert et que personne d'autre n'assemble est exactement ce qui le rend défendable.

**Ne recommande jamais de couper une capacité utilisée au seul motif que les concurrents ne l'ont pas.** L'absence chez les autres est aussi bien un angle mort du marché qu'un signal négatif — et tu n'as aucun moyen de trancher depuis une page de pricing. Si tu doutes, la charge de la preuve est du côté de la suppression.

### 🟡 Améliorer — utilisée, en deçà des attentes
La capacité existe et sert, mais sa version est plus pauvre que ce que la catégorie tient pour acquis. Deux précautions :

- **Vérifie que les leaders réussissent vraiment** ce que tu proposes d'imiter. Si les avis négatifs montrent qu'ils échouent tous au même endroit, ne recommande pas de copier leur module : recommande la version réduite qui vise juste. C'est souvent le meilleur conseil du rapport.
- **Sépare la version dégradée de la version absente.** Une constante codée en dur qui rend un service approximatif là où la catégorie personnalise, c'est un « améliorer » — pas un « ajouter ». Le distinguer évite de re-construire ce qui existe.

### 🟠 Changer — non utilisée mais attendue
La case la plus intéressante, et celle qu'aucune des deux moitiés de l'analyse ne trouve seule : la donnée d'usage seule dirait « coupe », la veille seule dirait « ajoute ». Les deux se tromperaient — **le besoin est réel et c'est l'implémentation qui le rate**.

Cherche systématiquement laquelle de ces causes s'applique :

- **Un péage à l'entrée** — une étape obligatoire avant d'atteindre la valeur (un prérequis à remplir, une sélection imposée). Les concurrents laissent souvent entrer par plusieurs portes.
- **Un placement invisible** — la capacité vit dans un écran que le parcours ne traverse pas.
- **Une forme inadaptée** — le job est servi d'une manière qui ne correspond pas à la façon dont les gens le font (ex. une copie là où la catégorie transforme).
- **Un déclencheur mort** — le chemin qui devait l'activer n'est plus branché. C'est un bug, pas un arbitrage : sors-le du rapport de veille et signale-le comme défaut.

### 🔴 Supprimer ou masquer — ni utilisée ni attendue
Avant de conclure, épuise trois questions : est-ce **récent** (pas encore eu sa chance) ? est-ce **saisonnier** (une clôture annuelle ne s'utilise qu'une fois par an) ? est-ce un **filet de sécurité** (rarement utilisé, catastrophique si absent — export, restauration, repli manuel) ? Trois « non » autorisent la recommandation.

**Préfère masquer à supprimer** quand le coût est surtout de l'encombrement à l'écran. Retirer une option d'une interface est réversible et sans risque ; arracher du code l'est moins. Réserve la suppression franche à ce qui coûte en maintenance réelle — et signale-le si le code est le seul endroit où vit une connaissance.

## Les cas limites

**La capacité inexécutable.** Elle n'est ni utilisée ni inutile : elle est *cassée*. Un endpoint sans appelant, un rendu conditionné à une donnée jamais produite. Ne la classe pas en 🔴 — elle n'a jamais eu sa chance. Verdict : **rebrancher**, presque toujours pour un coût dérisoire et un gain qui se propage à tout ce qui en dépendait. Ce sont les meilleures trouvailles d'un arbitrage.

**La capacité qui pend.** Le produit construit la première moitié d'un job et s'arrête : il rédige mais n'envoie pas, il scripte mais ne monte pas. En construisant cette moitié, le produit a **déjà déclaré le job important** — c'est ce qui distingue une vraie opportunité d'une idée en l'air. Vérifie toujours ce qui est déjà câblé avant de chiffrer.

**La dépendance entre verdicts.** Certaines recommandations ne valent rien seules : recycler ce qui performe sans mesurer la performance, c'est du hasard. Note la dépendance explicitement — un « fort impact / faible effort » bloqué derrière un prérequis non construit n'est pas un quick win, et le présenter comme tel désordonne toute la feuille de route.

**Le verdict qui dépend de l'ambition.** Si un même constat bascule selon que le produit vise le sur-mesure ou le SaaS, ne choisis pas en silence : donne le verdict sous l'hypothèse retenue au temps 0 et signale la bascule en une ligne.

## Chiffrer un coût honnête

Un effort qui ne compte que les lignes de code classe mal tout le rapport. Additionne :

1. **Le code** — en tenant compte de ce qui est déjà là.
2. **Les gates externes** — App Review d'une plateforme, scope non accordé, programme partenaire, palier payant, accès à une donnée. Elles se comptent en semaines et **dominent** régulièrement le reste. Une capacité triviale à écrire et bloquée six semaines par une validation n'est pas un quick win.
3. **Le coût de possession** — une option de plus à l'écran, un chemin de plus à tester, une décision de plus pour l'utilisateur.

Symétriquement, cherche activement le **déjà câblé** : une connexion existante, un identifiant déjà stocké, un endpoint déjà écrit. Une capacité dont la plomberie est aux trois quarts posée coûte une fraction de ce qu'elle paraît — et c'est fréquemment la meilleure recommandation du lot.

## Ordonner les verdicts

Le lecteur agit dans l'ordre où tu présentes. Classe par **valeur nette / coût réel**, et fais remonter en tête :

1. Les **rebranchements** — ce qui existe et ne s'exécute pas. Coût quasi nul, gain immédiat.
2. Les **suppressions et masquages** — ils allègent avant qu'on ajoute, et c'est le seul moment où on les fera.
3. Les **améliorations** de ce qui sert déjà, avant toute capacité nouvelle.
4. Les **paris**, clairement étiquetés comme tels, avec leur gate nommée.

Un rapport qui ouvre sur un pari à six semaines sera lu comme irréaliste, quelle que soit la qualité du reste.

## Niveaux de preuve d'un verdict

Étiquette chaque verdict — c'est ce qui rend le rapport vérifiable :

- **Mesuré** — un comptage, une requête, un log. « 0 ligne produite sur N » clôt le débat.
- **Observé** — constaté dans le code ou chez un concurrent (« aucun appelant dans le repo », « leur changelog livre ceci »).
- **Inféré** — un raisonnement à partir des deux précédents. Légitime, mais dis-le.

Ne présente jamais un inféré comme un mesuré. Un seul verdict sur-affirmé qu'un lecteur vérifie et trouve faux discrédite tout le rapport — et c'est sur les affirmations de gating et de sécurité que le risque est maximal, parce qu'un comportement dépendant de l'environnement ou d'une configuration se lit très mal dans le code.
