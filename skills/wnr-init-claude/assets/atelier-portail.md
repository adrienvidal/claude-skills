## Architecture : atelier local, portail client

Le projet a deux moitiés qui ne font pas le même travail.

- **L'atelier, en local** : toute la création (contenus, analyses, veille,
  productions) se fait dans Claude Code et dans les scripts du dépôt<robots>.
  C'est là que vit la logique métier.
- **Le portail, en ligne** : le client y regarde, valide, corrige et donne ses
  informations. Le portail lit, protège et enregistre ; il n'invente rien.
- **La base Neon fait le pont** : les scripts de l'atelier y écrivent ce qu'ils
  produisent et le portail le lit ; ce que le client saisit y est enregistré et
  les sessions de l'atelier le lisent.

Règles :

- Aucun appel à un modèle d'IA depuis le portail, aucun éditeur de contenu en
  ligne, aucune génération côté serveur. Une demande qui irait dans ce sens se
  traite dans l'atelier.
- Une règle métier utilisée à la fois par le portail et par les scripts (calcul
  d'une date, statut d'un contenu) vit dans un seul module partagé, jamais
  recopiée.
- Les scripts de l'atelier écrivent dans la base de production : ils publient du
  contenu, ils ne testent pas du code. Le code du portail se teste sur une
  branche Neon, jamais sur les données des clients.
- Un contenu destiné au client arrive d'abord en brouillon, visible du seul
  admin, puis passe visible : c'est l'aperçu, sans fusion git.
- Deux rôles : `admin` (le prestataire) voit tous les espaces et fait tout ;
  `client` ne voit que les espaces que lui ouvre la table d'accès. Toute page et
  toute action vérifie la session côté serveur.
- En local, le portail tourne connecté en admin sans saisie, par une variable de
  `.env.local` qui n'est jamais active en ligne.
- Git garde le code et les productions de l'atelier ; le contenu montré au client
  vit dans la base, qui est sauvegardée chaque jour hors de Neon.
