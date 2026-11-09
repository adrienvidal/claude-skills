---
name: wnr-use-case-audit
description: >-
  Audit the use cases (the jobs users actually come to accomplish) of any application — a website, SaaS,
  web app, mobile app, or internal tool. Produces a dated Markdown report that inventories every existing
  use case with code evidence, flags duplicates / dead / low-value ones, and proposes the best new use
  cases to add, prioritized. Grounds proposals in real competitive research (web) and verifies that coded
  journeys actually work by driving the app (Playwright). Use this WHENEVER the user wants to audit,
  review, map, inventory, or take stock of what their product does or lets users do; asks "what use cases /
  features do we have", "what should we build next", "what's redundant or useless", "audit my app / SaaS /
  site", "fais un audit des use cases", "quelles fonctionnalités a-t-on", "qu'est-ce qu'on devrait
  ajouter", "y a-t-il des doublons", "cartographie le produit"; or is doing product discovery, roadmap
  planning, feature prioritization, or a competitive gap analysis on an existing codebase. Trigger even
  when the user says "features", "fonctionnalités", "parcours", or "flows" rather than the exact words
  "use case" — the underlying request is the same.
---

# Use-Case Audit

Audit what a product actually lets users do, then say clearly what to keep, what to cut, and what to build next — with evidence, not vibes.

## What a "use case" is (and isn't)

A **use case** is a concrete job a user comes to the product to get done — *"schedule a post to publish next Tuesday"*, *"invite a teammate to my workspace"*, *"export last month's invoices for my accountant"*. It's phrased from the user's side and has a beginning and an end.

A **feature** is machinery that serves one or more use cases. A **screen/route** is where a use case happens. Don't confuse the three: a settings page is not a use case; "change my billing email" is. One feature can serve several use cases, and several features can combine into one. Audit at the use-case level — that's the altitude where "keep / cut / add" decisions are actually made.

**When is a variant its own use case?** Products often ship one feature in several flavors (e.g. "generate a free image" vs. "generate a paid high-res one", "export as PDF" vs. "export as ZIP"). Rule of thumb: if the variant changes the *outcome or the cost for the user*, treat it as a distinct use case (it's separately keep/cut-able) — a paid slow path and a free fast path to a similar result are two use cases, and that's exactly where redundancy hides. If the variant is just a different route to the identical outcome, it's one use case with multiple entry points (and the extra entry points may themselves be the redundancy). List at the fine grain first, then consolidate in Phase 2 — don't pre-merge and lose the signal.

Why this matters: a codebase inventory of routes and components tells you what was *built*; it doesn't tell you what users can *accomplish* or whether it's worth the maintenance. The whole value of this skill is bridging that gap.

## The workflow

Work through these phases in order. This is a systematic, exhaustive audit — don't shortcut the exploration to reach conclusions faster; the conclusions are only as good as the map underneath them. "Exhaustive" here means passing over the product **more than once** — a single walk is a first draft of the map, not the map (see the saturation rule at the end of Phase 1). Create a todo per phase so nothing gets dropped.

### Phase 0 — Frame the product

Before enumerating anything, understand what you're auditing:

- **What is it?** Product type (SaaS, marketing site, internal tool…), one-line purpose, the primary user roles/personas.
- **What are its goals?** Read the project docs (`README`, `CLAUDE.md`, `AGENTS.md`, product/spec files, `package.json`). If the goals or target audience aren't derivable, ask the user one focused question rather than guessing — the "what to add" phase is worthless if it optimizes for the wrong objective.
- **How do users get in? Build the page map.** Enumerate every page/screen the product has — routes, top-level nav entries, modals/panels that are really their own surface, plus the API/CLI surface if there's no UI. (The map lists true *pages*; the smaller interaction-gated surfaces — menus, tooltips, dialogs, drawers — get catalogued when you walk each page in Phase 1, so don't try to list them all here.) Order them the way a user actually moves through the product (entry → onboarding → the core screens → admin → recovery). This ordered list *is* your itinerary for Phase 1: you'll walk it one page at a time, so make it complete now. A page that exists in the nav but you can't find in code, or a route with no nav entry, is already a finding — note it.

- **Is there a prior audit?** Glance at `audits/` (or wherever such docs live). If a previous `…-audit-use-cases*.md` exists, you're in **re-audit mode** — read it first and follow the re-audit section below, because the most valuable output changes from "map everything" to "what moved since last time".

Detect the working language of the project and use it for **everything you produce** — not only the final report but also your running narration in the conversation (status updates, questions, the recap table, the spoken summary). If the project works in French, talk to the user in French throughout; only the skill's own internal instructions stay in English. Never let the language of this SKILL file leak into how you address the user.

### Phase 1 — Walk the product page by page (evidence-based)

Go through the page map from Phase 0 **one page at a time**, in the user's navigation order. This is the spine of the whole audit: auditing screen by screen is how you guarantee nothing is skipped, it mirrors how a real user meets the product, and it's what makes the later proposals concrete — every "add this" lands on a specific page rather than floating in the abstract. Be exhaustive; this page-by-page map is the foundation everything else rests on.

For **each page**, capture:

- **What this page is for** — its job in one line, and where it sits in the user's journey (entry, onboarding, core loop, admin, recovery). Keeping the journey in mind while walking pages is what lets you notice a *whole band with no page at all* — e.g. no recovery screen anywhere — which becomes a "propose a new page" finding in Phase 4.
- **The use cases it hosts** — every distinct job a user can accomplish *on this page*, listed at fine grain (a page usually hosts several). For each, record **where it lives** (the components/handlers/routes behind it) so every claim is traceable. A use case with no code behind it is a hallucination; drop it.
- **What's conspicuously missing here** — jog your memory as you stand on the page: what would a user reasonably expect to do here that they can't? Jot it down now; it feeds Phase 4. This per-page "what's the best thing to add here" question, asked on every screen, is the engine that surfaces the best additions.
- **What this page half-does — capabilities that dangle.** Alongside "what's missing", ask the sharper question: what does the product let a user *produce* but not *finish*? A format it generates as a draft it can't deliver (a Reel or video *script* with no way to render or publish the video; a thread it writes but can't post), an export it prepares but can't send, a status it can set but never acts on. A dangling capability is a use case the product itself has already declared important — it built the front half — so completing it is usually a high-value, well-motivated addition. A pure "what's missing" scan walks right past these, because nothing on the page looks *absent*; it looks *present but truncated*. Record the truncation explicitly for Phase 4 — it's often the single best add on the page.

**Don't audit only the default render of a page — sweep what interaction reveals.** Most of a page's use cases are hidden one action away: a job lives inside a modal, a slide-over drawer, a right-click / context menu, a dropdown, a popover, a tooltip, a hover-revealed action, a bulk-action bar that appears on selection, a confirmation dialog, an inline editor, or a collapsed/expandable section. A walk that only looks at the page as it first paints will silently miss all of these — and they're often where the real work happens (e.g. "delete a post, but warn me if it's already published" is a distinct use case that exists *only* inside a confirmation dialog). So on each page, enumerate every interactive trigger and follow it to the sub-surface it opens; with Playwright, actually click it and snapshot the opened surface rather than inferring it from code. Attach each revealed use case to the page that triggers it, and note in the evidence column that it's action-gated (e.g. `(modal)`, `(menu contextuel)`).

**Also walk the page's other states, not just the happy one.** The same route hosts different jobs depending on state and on who's looking:
- **State** — the **empty state** often carries the onboarding CTA, the **error/failure state** carries a recovery job, and **loading** / **over-limit / paywall** states gate or offer things the populated view doesn't. Enter these states, don't just imagine them.
- **Role / permission** — admin vs. member vs. logged-out can each see use cases the others can't.
- **Feature flag / plan entitlement** — beta or paid-tier surfaces are reachable only under the right flag/plan.
- **Viewport** — mobile-only surfaces (bottom sheets, hamburger) and desktop-only ones (hover actions, drag-and-drop) each hide jobs the other layout doesn't.

Each of these is a **gate**: a job you can only reach as an admin, on mobile, on a paid plan, or from an empty state is still a real use case — record it with its gate as part of the evidence, because the gate itself is often a Phase 2 finding (a job buried behind a stale flag, or a recovery action reachable only from an error state a user rarely hits).

Use the **Explore** agent (or broad search) to find the code behind each page quickly — you're after user-facing capability, not internal plumbing. Some capabilities span pages (a global search box, a command palette); attach them to the page where the user invokes them and note the spillover.

**Verify the real thing with Playwright.** A coded route is not a working page — buttons dead-end, flows break, features hide behind flags. For a web app, actually navigate to each page in the browser (use the `webapp-testing` skill / Playwright MCP) and note which use cases on it work end-to-end vs. which are broken or unreachable. If the app can't be run, say so and mark those "unverified" rather than assuming they work. You usually can't (and shouldn't) execute *every* costly mutation — running expensive generations, real OAuth flows, or destructive actions burns time and money and can dirty real data. Verifying that a page **renders and is reachable** is a legitimate middle ground: mark those "verified (rendering/reachability)" and reserve "unverified" for pages you didn't open at all. When some pages are fully driven and others only rendered, set the report's `verified_with_playwright` to `partial` and say in the annex which is which — that honesty is more useful than a blanket yes/no.

**Calibrate certainty to what you actually drove.** A claim about *behavior you didn't execute* — "this test route is exposed in production", "there's no auth guard", "this deletes without a confirmation" — read from a static code scan is an **inference**, not a confirmation. Environment- and config-dependent behavior is exactly where a code read misleads: what a route does under `NODE_ENV=production`, behind a feature flag, or with a real session can be governed by middleware, a build config, or an env check you didn't trace. So reserve "confirmed" / "vérifié" for jobs you observed happen, and label everything else "d'après le code" so a reader never mistakes a plausible reading for a tested fact. This matters most on security and gating findings: over-claiming there ("route de test non gatée — confirmé", when it actually 404s in prod) is worse than under-claiming — it burns the whole audit's credibility the moment someone checks one and it's wrong. When a gating claim would change a keep/cut verdict, either drive it or downgrade the language.

**Then: the system / headless pass — don't let a page-by-page walk drop what has no screen.** Auditing screen by screen has one blind spot: real user jobs that run *without a page* — cron/scheduled jobs, webhooks, background workers, API-only endpoints, LLM/agent pipelines, server-side rules (validation, QA gates, auto-enrichment). These are often *Core* (e.g. "my scheduled posts publish themselves automatically" has no UI at all) and would silently vanish if you only mapped screens. So after the page walk, do one deliberate sweep of the non-page surface — background jobs, `api/` handlers with no view behind them, cron entries, queue consumers — and list each as a first-class use case under a **"Système / sans écran"** section in the inventory, with the same evidence + tag treatment. If such a job *should* have a surface a user can see or trigger (e.g. no way to see or retry a failed auto-publish), that gap is itself a strong Phase 4 proposal.

**Pass until saturation — but 3 passes maximum.** One walk is never complete: the first time through you're building the map, so you inevitably miss a trigger you didn't click, a state you didn't enter, a role you didn't assume, a route with no nav entry. So re-walk the map, but give each pass a **different lens** rather than repeating the same walk blindly — that's what makes it converge fast:

- **Pass 1 — default render.** Walk every page in its normal, populated state; capture what's visible at first paint. This lands the bulk of the inventory.
- **Pass 2 — interaction.** Re-walk clicking every trigger: modals, context menus, dropdowns, tooltips, dialogs, bulk-action bars, drawers, expandable sections. This is usually the most productive pass — it's where action-gated jobs hide.
- **Pass 3 — states, gates & system.** Enter the empty / error / loading / paywall states, switch role/flag/plan/viewport, and do the system / headless sweep (cron, webhooks, API-only). Also hunt specifically for what passes 1–2 missed.

**Stop at pass 3 — do not start a fourth.** The point of diminishing returns is deliberately capped here: three lensed passes catch the overwhelming majority of use cases, and a fourth costs more than the stray job it might find is worth. Stop earlier if a pass surfaces **no new use case** (a tiny app can saturate at pass 2 — don't run a third for the sake of a quota). Track it out loud so the discipline is visible — e.g. "pass 1: 34 use cases · pass 2: +6 (mostly action-gated) · pass 3: +1 → done." If pass 3 *still* turns up several new jobs, don't silently launch a pass 4: note in the report that the inventory may be incomplete and which surface looked richest, so the reader knows where the residual risk is.

### Phase 2 — Evaluate: duplicates, dead weight, weak spots

Now judge the inventory. For each use case assess:

- **Reachable & working?** Orphaned routes, features behind stale flags, journeys that dead-end → candidates for removal.
- **Redundant?** Two paths to the same job, overlapping features that confuse more than they help → flag the duplicate and recommend which to keep. Redundancy often hides *across* pages (the same job reachable from two different screens), so compare pages against each other, not just within one.
- **Low value vs. cost?** Rarely-useful capability that still carries UI clutter and maintenance → question whether it earns its place.

Be specific and cite evidence (the code, or what Playwright showed). "This seems unused" is weak; "these two routes both let a user create a post, with divergent validation — consolidate" is useful. Don't invent usage numbers you don't have; reason from reachability, redundancy, and code signals, and say when a claim would need analytics to confirm.

**Proxy signals when there's no analytics.** Many products (especially internal tools and early-stage apps) have no usage data to prove something is dead. Don't let that stall the judgment — use code-side proxies and label them as such: `git log`/blame recency (a use case whose files haven't been touched in a long time while everything around them evolved), TODO/deprecated/legacy markers, references only from test files (built but never wired into the UI), stale feature flags, and dead links in navigation. State the proxy you used ("only referenced from e2e tests", "untouched since the initial commit") so the reader can weigh it, and flag which verdicts would flip with real analytics.

### Phase 3 — External research (veille)

**Scope check first.** This phase is deliberately a short *input* to Phase 4 — it exists to keep "what to add" honest, and its output is a bulleted list. If what the user actually wants is a **verdict on their features** — what to keep, improve, change, or cut in light of the market — that is a different deliverable and this phase will underserve it: it can only ever produce additions, because it never crosses the market findings with real usage data. Hand off to **`wnr-arbitrage-features`** in that case, either instead of this audit or right after it (a fresh inventory is an excellent input to its usage-measurement step). Signs it's the right call: the user asks what to remove or change, questions whether a feature earns its place, or wants the competitive angle to be the point rather than a supporting note.

Otherwise, keep this phase short. Ground the "what to add" in reality, not imagination. **Before launching any search, invoke the `wnr-veille` skill to scope sources** — it names the categories the product straddles, picks the best-adapted sources per category (and ranks primary sources above the SEO listicles `WebSearch` returns by default), and shows a compact source plan before searching. The checklist below is the fallback if that skill is unavailable. Then use **WebSearch** (or `parallel-web-search` for breadth) to research:

- **First, name every category the product straddles — not just the obvious one.** A product's *outputs* tell you which markets it's really in, whatever the domain — an invoicing app that also captures expenses is competing with expense-management tools whether it means to or not; a project tracker that logs hours straddles the time-tracking category; a content tool that emits video scripts is judged against video tools, not just text ones. Anchoring the veille on the single most obvious category is the classic way an entire class of expected use cases stays invisible: you benchmark against the near neighbours, conclude the product is complete, and never notice it's a half-built entrant in the adjacent category it already feeds (e.g. a scriptwriter judged as a text tool when its real unmet rivals are HeyGen/Descript/Opus Clip). Derive the category list from the formats you inventoried in Phase 1 (especially the dangling ones), then research each — the gaps live in the categories you'd have skipped.
- **Direct competitors and category leaders** — what use cases do comparable products treat as table stakes that this product is missing?
- **Category expectations & emerging patterns** — what are users of this kind of product coming to expect (integrations, AI features, collaboration, mobile…)?
- **The specific domain** — regulatory, workflow, or industry specifics that imply must-have use cases.

Cite sources. Distinguish "competitor X does this" (verifiable) from your own inference.

### Phase 4 — Propose the best use cases to add

Synthesize Phases 1–3 into a prioritized shortlist. Because Phase 1 was a page-by-page walk, you have a "what's missing here" note for most pages — those notes are the raw material. **Anchor every proposal to a page.** For each proposed use case:

- **The job** — phrased from the user's side, one line.
- **The page it lives on** — either an existing page from the map, *or* a **new page** you're proposing. Proposing a new page is fair game and expected when a whole job-band has no home (e.g. no analytics/dashboard screen, no recovery screen) or when a job is substantial enough that bolting it onto an existing page would overload it. When you propose a new page, say what it contains and where it slots into the nav, so the reader can picture it.
- **Why it matters** — tie it to the product's goals (Phase 0) and the evidence (gap vs. competitors, category expectation, or a missing/broken step you saw on that page).
- **Priority** — score with a simple **Impact × Effort** matrix (or RICE if the user prefers). Impact = how much it advances the product's goals for its core users; Effort = rough build cost given the existing codebase **and the external gates around it**, not just lines of code. A feature can be trivial to write yet blocked by something you don't control: an OAuth scope you weren't granted, a third-party API behind an approval process or a paid tier, data the app can't legally access, a platform review that takes weeks. Those gates routinely dominate the real effort — a performance dashboard is cheap to build and useless until the analytics-API access is approved — so when one exists, name it and let it raise the Effort. An Effort score that counts only code is misleadingly low and mis-ranks the whole shortlist. Surface the quick wins (high impact, low *real* effort) explicitly.
- **Where it plugs in** — the concrete component/route it extends or sits beside (or, for a new page, the nav entry and the routes it would need), so the reader can picture the build.
- **Depends on** — whether this proposal only makes sense *after* another one ships. Some additions are worthless in isolation: a "best time to publish" suggestion or a pre-publish engagement score is noise until the analytics/measurement that feeds them exists. Capturing these links turns a flat Impact×Effort list into an actual build order — a high-impact proposal gated behind an unbuilt prerequisite isn't really a quick win. Note the prerequisite by its row number; most proposals depend on nothing, and that's fine.

**Leave room for one bolder move, not only page-level adds.** Everything above pulls toward incremental additions bolted onto existing pages — that's the safe, high-confidence majority of the shortlist, and it should be. But a page-by-page method has a known bias: it rarely proposes *changing what class of product this is*. If Phases 1–3 surfaced a dangling capability plus a whole adjacent category the product already straddles (it emits video scripts but renders no video; it drafts emails but sends none), name the capability-class move that would complete it — even at high effort — as an explicit **Pari**, and mark it as a direction bet rather than a quick win. Missing it entirely is the real failure: the user can always decline an ambitious proposal, but they can't decline one you never put on the table. One such bet per audit is usually enough — don't turn the shortlist into a fantasy roadmap.

Prefer a tight, opinionated shortlist (≈5–10 strong proposals) over an exhaustive brain-dump. The user asked for the *best* additions, not every conceivable one.

### Phase 5 — Deliver: the report file *and* the proposals table in chat

There are **two deliverables**, and both matter:

**(a) The dated Markdown report.** Write it to `audits/{YYYY-MM-DD}-audit-use-cases.md` at the repo root (create `audits/` if absent), unless the project has an obvious convention for where such docs live — match it. Use the template in `assets/report-template.md`. The inventory section is organized **page by page** (one sub-section per page), matching how you walked it in Phase 1.

**Never delete or overwrite a prior audit.** An audit is a dated, historical deliverable — a snapshot of what the product was at a moment — not a scratch file. If a report already exists at the target path (e.g. you're auditing again the same day, or re-auditing), do **not** clobber it: write to a suffixed path instead (`…-audit-use-cases-v2.md`, or a scope slug like `…-audit-use-cases-onboarding.md`). Losing a previous audit destroys the very baseline that makes the next one useful (see the re-audit mode below).

**(b) A recap table of *all* your proposals, printed directly in the conversation.** Don't make the user open the file to see the shortlist — put the whole set of proposals in front of them as a Markdown table in your reply. Include **every** proposal: additions, cuts, and consolidations together, so they can scan the full slate at a glance and react. Use these columns (they're the ones that make each row actionable — adjust only if the product genuinely calls for it):

| # | Proposition (le job, côté user) | Page | Type | Impact | Effort | Dépend de | Priorité | Où ça se branche |
|---|---|---|---|---|---|---|---|---|

- **Page** — the existing page it lands on, or `🆕 NOUVELLE : <name>` for a proposed new page.
- **Type** — `Ajout` · `Couper` · `Consolider`.
- **Impact / Effort** — `n/5` each (leave Impact/Effort blank or `—` for pure cuts where it doesn't apply).
- **Dépend de** — the row number(s) of any proposal that must ship first, or `—` if none. This is what makes the table a build order and not just a wishlist.
- **Priorité** — `Quick win` · `Pari` · `Fill-in` · `À écarter` · `Nettoyage` (for cuts/consolidations).
- **Où ça se branche** — the concrete route/component, terse.

Sort the table so the most actionable rows are on top (quick wins first, drops/écarter last). After the table, give a short spoken summary: the 3 most important findings and the top 3 recommended additions — don't make them re-derive the headline from the table.

## References

- `references/frameworks.md` — the prioritization frameworks (Impact×Effort, RICE), the use-case taxonomy, and the competitive-research checklist. Read it when scoring proposals (Phase 4) or structuring the veille (Phase 3).
- `assets/report-template.md` — the exact report structure to fill in (Phase 5).

## Re-audit mode (when a prior audit exists)

Products get audited more than once. When a previous `…-audit-use-cases*.md` is present (you spotted it in Phase 0), the job shifts: the reader already knows what the product does — what they want now is **what changed and whether the last recommendations landed**. Run the same phases, but re-frame the output around movement:

- **Read the prior audit first**, and treat its inventory and proposals as your baseline. You're producing a *delta*, not a fresh map from zero.
- **Reconcile the inventory.** For each use case, mark it **New** (didn't exist last time), **Changed** (behaves differently / moved page), **Removed** (was there, now gone — check it wasn't quietly dropped), or **Unchanged**. Walking page by page with the old inventory in hand makes this fast.
- **Score the old proposals.** For every recommendation in the prior report, state its status: **Shipped** (verify it in the live app with Playwright — don't take a changelog's word for it), **Partially shipped**, **Still open**, or **Abandoned/obsolete** (the ground shifted and it no longer makes sense). This closes the loop and is usually the single most useful thing a re-audit delivers.
- **Then propose forward** as usual — but a proposal that was already made and ignored should say so ("raised 2026-07-13, still not built"), because *why* it keeps getting skipped is itself signal (maybe it's not as valuable as scored, or maybe it's a genuine blind spot).
- **Write to a new file, never over the old one** (see the anti-overwrite rule) — the whole point of re-audit mode is that the previous report still exists to diff against. A date-stamped new filename gives you a timeline of audits.

In the report, lead the TL;DR with the delta: what shipped, what's new, what regressed, what's still open.

## Adapting to context

This skill is deliberately general. Adapt the depth to the product:
- **No runnable app / static site** → skip Playwright verification, lean harder on code + web research.
- **Backend/API-only** → "journeys" are API call sequences; Playwright is irrelevant, inspect the endpoints and their contracts instead.
- **Early-stage / tiny codebase** → the inventory is short; spend proportionally more on Phases 3–4 (what to add).
- **Large mature product** → the value is mostly in Phases 1–2 (mapping and cutting); be systematic and use parallel Explore agents.
