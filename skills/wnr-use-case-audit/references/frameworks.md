# Frameworks & checklists

## Use-case taxonomy (the journey bands, used as a lens while walking pages)

Phase 1 walks the product **page by page**, but keep these journey bands in mind as you go: tag each page with the band it serves, and watch for a band that has **no page at all** — a missing band is itself a finding and a prime candidate for a proposed new page (Phase 4). A workable default arc:

1. **Acquisition / entry** — how a new user arrives and understands the product (landing, signup, pricing).
2. **Onboarding / activation** — the first-run jobs that get a user to value (setup, first creation, first invite).
3. **Core loop** — the repeated jobs that are the reason the product exists (the 2–4 things users do every session).
4. **Growth / collaboration** — inviting others, sharing, integrations, exports.
5. **Account & admin** — billing, settings, roles/permissions, data management.
6. **Support / recovery** — password reset, undo, error recovery, help.

Every product has 1–3, most have all six. Missing a whole band (e.g. no recovery, no collaboration) is itself a finding.

## Classifying an existing use case (Phase 2)

Tag each one:

| Tag | Meaning | Signal |
|-----|---------|--------|
| **Core** | Central to the product's value | High reachability, referenced everywhere, primary nav |
| **Support** | Legitimate but secondary | Reachable, serves core indirectly |
| **Redundant** | Overlaps another use case | Two paths to the same job; divergent implementations |
| **Dead** | Built but unreachable/broken | Orphaned route, stale flag, dead-ends in Playwright |
| **Low-value** | Works but questionable ROI | Reachable but niche, carries disproportionate UI/maintenance cost |

Redundant/Dead/Low-value are the "cut or consolidate" pile. Always name *which* one to keep when flagging a duplicate.

## Prioritizing proposals (Phase 4)

### Default: Impact × Effort

Score each proposed use case 1–5 on two axes, plot the four quadrants:

- **Impact** — how much it advances the product's stated goals *for its core users*. Not "cool", but "moves the needle on the thing the product is for".
- **Effort** — rough build cost given the *existing* codebase (reuse of current features lowers it).

Quadrants:
- **High impact / low effort → Quick wins.** Call these out first; they're the recommendation that earns trust.
- **High impact / high effort → Big bets.** Worth planning, needs a decision.
- **Low impact / low effort → Fill-ins.** Only if idle capacity.
- **Low impact / high effort → Drop.** Don't propose these.

### Alternative: RICE (use if the user wants a single ranked list)

`Score = (Reach × Impact × Confidence) / Effort`

- **Reach** — how many users / how often, per period.
- **Impact** — per-user effect (3 massive / 2 high / 1 medium / 0.5 low / 0.25 minimal).
- **Confidence** — % you believe your Reach/Impact estimates (100 / 80 / 50).
- **Effort** — person-months (or person-weeks for small teams).

RICE forces explicit estimates; only use it when you have enough signal to estimate Reach honestly, otherwise Impact×Effort is more defensible.

## Competitive-research checklist (Phase 3)

For each search dimension, look for use cases the product is *missing*, not just features:

- **Direct competitors** — name 3–5, list the jobs they let users do that this product doesn't.
- **Category leaders** — the reference product in the category; what's their table-stakes set?
- **Adjacent tools** — what do users switch to / paste into next? That's an integration or a missing use case.
- **Emerging patterns** — AI assistance, real-time collaboration, mobile parity, automation/workflows, API/webhooks.
- **Domain-specific must-haves** — compliance, localization, accessibility, industry workflow steps.

For each finding, record the source URL and whether it's observed ("competitor X ships this") or inferred ("users likely expect this because…").
