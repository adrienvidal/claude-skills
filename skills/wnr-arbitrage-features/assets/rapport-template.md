# Gabarit du rapport

À remplir au **temps 5**. Adapte la langue au projet. Supprime les indications entre parenthèses.

Où l'écrire : suis la convention du projet s'il en a une (`audits/`, `docs/`…), sinon propose un emplacement. **N'écrase jamais un rapport antérieur** — c'est le point de comparaison de la prochaine passe. Suffixe le nom plutôt que de remplacer.

Si l'utilisateur veut seulement une réponse dans la conversation, garde exactement cette structure : c'est elle qui empêche le rapport de redevenir une liste d'ajouts.

---

```markdown
---
type: feature-arbitrage
product: <nom>
date: <YYYY-MM-DD>
---

# Arbitrage des fonctionnalités — <Produit> (<date>)

## Le cadre

- **Produit / ambition :** (nature, horizon 6-12 mois, tel que tranché au temps 0)
- **Utilisateurs réels :** (qui, combien, quel job principal)
- **Concurrent direct :** (nommé, ou « aucun » — et alors dire ce que ça change :
  les écarts ci-dessous ne sont pas des retards mais des choix à trancher)

### L'écart entre ce qui est proposé et ce qui sert

| Capacité déclarée | Usage réel | Preuve | Verdict |
|---|---|---|---|
| … | utilisée N fois / jamais / inexécutable | requête, grep, git log | 🟢 🟡 🟠 🔴 |

(Le socle du rapport. Au grain où une décision se prend : si le produit propose
5 canaux × 3 formats, ce sont 15 lignes. Les fonctionnalités mortes se cachent
dans la granularité qu'on n'a pas ouverte.)

## 🟢 Garder

(Ce qui marche, et surtout ce qui différencie. Toujours renseigné.)

- **<capacité>** — <ce qu'elle sert, preuve d'usage>. <Pourquoi elle tient, ou en
  quoi elle est un actif que la catégorie n'a pas>.

## 🟡 Améliorer

- **<le job, côté utilisateur>** — Constat : <formulé côté produit>. Preuve :
  <chiffre + source + observé/inféré>. Conséquence : <ce qui change, à quel coût
  réel — gates comprises>.

## 🟠 Changer

(Le bon besoin, mal servi. Dire *en quoi* la forme actuelle rate : péage à
l'entrée, placement invisible, forme inadaptée, déclencheur mort.)

- **<le job>** — Aujourd'hui : <…>. Ce que fait la catégorie : <…>. Ce qui rate : <…>.

## 🔴 Supprimer ou masquer

(Ni utilisé ni attendu. Chiffrer le coût de maintien. Préférer « masquer » quand
le coût est surtout de l'encombrement à l'écran.)

- **<capacité>** — <preuve de non-usage>. Coût de maintien : <code, options,
  charge mentale>. → **Reco :** supprimer / masquer derrière un réglage.

## Ordre recommandé

(Le lecteur agit dans l'ordre où tu présentes. Rebranchements d'abord, puis
suppressions, puis améliorations, puis paris. Signaler les dépendances : un
verdict bloqué derrière un prérequis non construit n'est pas un quick win.)

1. …

## Ce que cette veille ne peut pas dire

(Obligatoire. C'est ce qui distingue un jugement d'une affirmation.)

- (Absence de comparable direct, s'il y a lieu — et ce que ça relativise.)
- (Provenance et biais des données sectorielles : géographie, taille, segment
  des répondants.)
- (Verdicts qui basculeraient avec de vraies données d'usage.)
- (Là où « l'utilisateur n'en veut pas » et « personne ne le lui a proposé »
  produisent la même absence.)
```
