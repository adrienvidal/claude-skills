# 15/11/2026 : Claude Skills, nouveau skill wnr-steps

## Reprise

```
✅ Fait      wnr-steps créé, testé sur 4 cas, lié et poussé ; wnr-recap resserré
⛔ Bloqué    Rien
🎯 Priorité  Tester wnr-steps en vrai dans onyx-pyrene, vérifier le chemin Brevo de l'exemple
```

Note déposée depuis la session onyx-pyrene du 15/11 (étapes Brevo), puis skill construit le même jour.

## Brief

Créer `skills/wnr-steps` (avec `skill-creator`), sur le modèle de `wnr-recap`.

**But** : donner la liste des étapes pour aller d'un point A (où on en est) à un point B (le but), en bullet points.

**Règles tirées de l'usage** :

- une étape = une action concrète, avec le chemin exact dans l'outil (menu > onglet > bouton) ;
- statut devant chaque étape quand on est en cours de route : ✅ fait, ⛔ bloqué (on attend qui), ⏳ à faire ;
- pas d'explication : le pourquoi seulement si l'utilisateur le demande ;
- signaler les étapes qui demandent sa main (connexion, double authentification) et celles à ne pas faire (« ne touche à rien chez OVH ») ;
- une étape bloquée nomme qui on attend et la suite prévue ;
- « redonne la liste des steps » remet la liste à jour (statuts, décisions prises entre-temps) au lieu de la répéter ;
- finir par une seule question qui propose l'étape suivante.

**Déclencheurs** : « donne-moi les étapes », « liste des steps », « redonne la liste », « comment je fais pour », « /wnr-steps ».

**Ne pas déclencher** pour un point d'avancement de projet (→ `wnr-recap`), ni sur « resume simple » (reformuler court la réponse précédente).

**Exemple réel** (onyx-pyrene, 15/11) :

```
- ✅ Vérifier le compte Brevo de l'école : un seul compte, pyrene.fr authentifié
- ⛔ Ajouter ecole-pyrene.fr : refusé deux fois, on attend l'école (question dans le mail), sinon support Brevo
- ⏳ Nom d'expéditeur SMS : Settings > Transactional SMS (11 caractères max)
- ⏳ Une fois le domaine débloqué : déclarer bonjour@ecole-pyrene.fr comme expéditeur
On passe au nom d'expéditeur SMS ?
```

## Réalisé

- Commit de la modif en attente de `wnr-recap` : « resume » ne le déclenche plus (`4af1021`).
- `skills/wnr-steps/SKILL.md` écrit d'après le brief, avec 5 cas de test dans `evals/evals.json`, lié via `install.sh --own-only` (`3ab6973`).
- Renvoi croisé entre `wnr-recap` et `wnr-steps` dans les descriptions (`5d0d6f1`).
- Deux passes de revue sur `wnr-steps` : relecture (5 corrections), puis test par un agent neuf sur 4 cas, tous conformes, 7 précisions ajoutées (`c041719`).
- Description de `wnr-recap` ramenée de 1 540 à 873 caractères, sous la limite de 1 024 (`f301706`).

## Reste à faire

- [ ] Premier usage réel de `wnr-steps` dans onyx-pyrene : vérifier qu'il se déclenche et que le format tient.
- [ ] Vérifier sur le compte Brevo que `Settings > Transactional SMS` est le bon chemin ; sinon corriger l'exemple du skill.

## Blockers

Aucun.

## Décisions

- Pas de boucle complète de benchmark `skill-creator` : brief déjà cadré, on corrige à l'usage.
- Deux passes de revue, pas trois : la troisième aurait relu le même texte pour peu de gain.
- Écartés : étape de vérification finale systématique, détail des valeurs DNS.
- Un seul geste = une ligne, avec ⚠️ et « Je le fais ? » permis.
