# Report template

Fill this in for Phase 5. Keep the frontmatter; adapt section language to the project's working language. Delete guidance in parentheses.

```markdown
---
type: use-case-audit
product: <product name>
date: <YYYY-MM-DD>
author: wnr-use-case-audit skill
verified_with_playwright: <yes = all key journeys driven end-to-end | partial = some driven, some only rendering/reachability, some untouched | no = app not run>
---

# Audit des use cases — <Product> (<date>)

## 1. Synthèse (TL;DR)
- (3–5 bullets: the state of the product, the biggest problem, the biggest opportunity.)
- **Top 3 à ajouter :** …
- **Top 3 à couper/consolider :** …
- (Re-audit mode only) **Depuis le dernier audit (<date>) :** shipped … · nouveau … · régressé/supprimé … · toujours ouvert …

## 2. Le produit en une carte
- **Type / mission :** …
- **Utilisateurs :** (roles/personas)
- **Objectifs produit :** (from Phase 0)

## 3. Inventaire des use cases existants (page par page)
(One sub-section per page, in the user's navigation order — same order you walked in Phase 1. For each page: its job in one line, its journey band, the use cases it hosts with evidence + tag, and what's conspicuously missing on it. Include the action-gated jobs — those inside modals, menus, dialogs, drawers, tooltips — and note the gate in the evidence column, e.g. `(modal)`. Include jobs reachable only in a specific state/role/plan/viewport, and say which gate. State the pass count you reached saturation at in the annex, e.g. "inventaire saturé au pass 3" — and if pass 3 still surfaced several new jobs, flag that the inventory may be incomplete rather than launching a 4th pass.)

### <Nom de la page> — `/route`
*Rôle : <one line>. Bande : <entry/onboarding/core/admin/recovery>.*

| Use case (job utilisateur) | Où c'est implémenté | Statut Playwright | Tag |
|---|---|---|---|
| … | `components/…` | ✅ marche / ⚠️ cassé / ❔ non vérifié | Core/Support/Redundant/Dead/Low-value |

*Manque ici : <what a user would expect to do on this page but can't — feeds §6>.*

(Repeat per page. Note any band with no page at all — that's a candidate new page in §6.)

### Système / sans écran
(Use cases that run with no page: cron/scheduled jobs, webhooks, background workers, API-only endpoints, agent/LLM pipelines, server-side rules. Same evidence + tag treatment. A headless job that *should* be visible/triggerable but isn't → a §6 proposal.)

| Use case (job utilisateur) | Où c'est implémenté | Statut Playwright | Tag |
|---|---|---|---|
| … | `app/api/…` / cron / worker | ❔ (déclenché hors UI) | Core/Support/Dead/… |

## 4. À couper ou consolider
(Only the Redundant / Dead / Low-value items, with the evidence and the recommendation. Name which to keep when consolidating.)
- **<use case>** — <finding + evidence> → **Reco :** <cut / merge into X / keep behind flag>.

## 5. Veille externe
(What comparable products do that this one doesn't. Cite sources.)
- **<Concurrent / pattern>** — <the missing job> — <source URL> — <observed | inferred>.

## 6. Use cases à ajouter (priorisés)
(Impact × Effort. Lead with quick wins. Each proposal is anchored to a page — existing or 🆕 new.)

### Tableau récapitulatif de toutes les propositions
(Same table you print in the conversation: every proposal — ajouts, coupes, consolidations. Quick wins on top, à écarter at the bottom.)

| # | Proposition (le job) | Page | Type | Impact | Effort | Dépend de | Priorité | Où ça se branche |
|---|---|---|---|---|---|---|---|---|
| 1 | … | `/route` ou 🆕 NOUVELLE : <name> | Ajout/Couper/Consolider | n/5 | n/5 | — ou #<n> | Quick win/Pari/Fill-in/À écarter/Nettoyage | `components/…` |

### 🟢 Quick wins (fort impact / faible effort)
- **<job utilisateur>** — Page : <existante / 🆕 nouvelle>. Pourquoi : <goal + evidence>. S'accroche à : <feature/route>. Impact <n>/5 · Effort <n>/5.

### 🔵 Paris (fort impact / effort élevé)
- …

### ⚪️ Fill-ins / à écarter
- (brief)

## 7. Annexes
- Méthode (phases parcourues, ce qui a été vérifié en vrai vs. lu dans le code).
- Limites (ce qui nécessiterait de l'analytics ou un accès qu'on n'avait pas).
```
