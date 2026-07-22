# Ground-truth brief for reviewers (Neuron firsthand QA, Jul 22)

Three live sites (repo /tmp/vzb, deployed krisvas333.github.io/vaiko-zemelapis). Reviewers: READ the actual files (index.html, testas/index.html, darzelis/index.html) and data/topics.json sample. This brief = my verified observations so you don't need a browser.

## The product (3 surfaces)
1. **MAIN MAP** `/` — 3D WebGL cone of **2 129 topics · 2 747 prerequisite links · 20 subjects**, kindergarten→grade 12, from official LT curriculum (BP 2022). Interactions: drag-spin, scroll-zoom, click a dot → side panel (subject·domain·age, description, "❓ Klauskite savo vaiko" prompt, "✅ Moka, kai" criteria, "Remiasi"/"Atrakina" prerequisite lists), neural intro animation (nodes ignite from roots, edges grow like synapses), subject legend toggles. NEW in Phase 0: search box (dropdown of matches, highlights nodes), grade filter dropdown, "🧭 Kur mano vaikas?" CTA, LT/EN toggle, About modal.
2. **KNOWLEDGE TEST** `/testas` — parent readiness check. Pick class (darželis→11–12) → mark ~14 backbone topics (✅moka/🌱mokosi/⚪dar ne) using the "Moka, kai" criteria → GRAPH INFERENCE (marking a topic infers all prerequisites known; verified: 3 marks → +21 inferred) → result: readiness % (positive framing), strengths (subject chips), "🌱 Ką verta pažaisti/paklausti" (real assessmentPrompts), share button, "🗺️ Pamatyti žemėlapyje". localStorage. Feeds child-mode.
3. **KINDERGARTEN MAP** `/darzelis` — pastel child-friendly, **272 skills all 18 official areas** (emotions, language, arts, self-care, movement), age filters 2/3/4/5/6 with growth logic (learning-now/mastered/next/ahead), private-kindergarten layer toggle (20 delta topics, 5 cities), LT/EN, warm "ask/play" prompts.
"Kur mano vaikas?" map mode (`?mode=child`) colors the big map from the test result: green=known/inferred, amber=next, gray=ahead + banner.

## LT/EN parity — VERIFIED (programmatic DOM diff)
- Main map: CLEAN. Every UI string translates (hero, sub, badge, data btn, about btn, credit, legend labels Matematika→Mathematics…, hint, search placeholder, grade options, About modal, child-mode banner). Only LT/EN button labels identical (correct — language codes).
- Test page: had a BUG (result screen frozen in one language on toggle) — FIXED (render now re-runs showResult on result mode).
- Darzelis: good (setLang→applyLang + re-renders open panel).

## KNOWN ISSUES (verified, honest)
- ⚠️ **Grammar in auto-filled prompts:** `{{name}}` → "jūsų vaikas" (nominative). Works for "Ar {{name}} gali…" ("Ar jūsų vaikas gali") but wrong for "Paklauskite {{name}}" → "Paklauskite jūsų vaikas" (should be genitive "vaiko"). Affects a subset of 2 129 prompts. Data-content fix, flagged for pedagogue pass.
- ⚠️ **Topic CONTENT is Lithuanian-only** even in EN mode (disclosed in About/credit: "topic content in Lithuanian"). EN user gets English UI + Lithuanian topic names/descriptions. Big gap for the "share internationally" goal.
- ⚠️ **Performance:** the 2 129-node map renders every frame (rAF); heavy enough that the screenshot script-injector timed out repeatedly. Likely janky on mid/low-end mobile. Big map is dense/overwhelming at first load (no guided entry beyond the age filter).
- ⚠️ **v0 draft, unreviewed by educators** — stated on-page, but the test gives a specific % which parents may over-trust.
- ⚠️ **Test backbone selection** = top-centrality per class, max 3/subject, cap 14 — not pedagogically validated; "readiness %" is an artifact of that selection.
- ⚠️ Private-kindergarten layer = domain-knowledge, not live-verified (flagged).
- No accounts/persistence beyond localStorage; no data captured (privacy-good, but no email loop yet).

## STRENGTHS (verified)
- Genuinely unique: only test tied to official LT curriculum; graph inference (few answers→full picture); visual result on the map.
- Positive framing throughout (avoids IXL "behind" trap).
- Beautiful, distinctive aesthetic (neural intro, subject colors, pastel kindergarten).
- Real pedagogical grounding: assessmentPrompts + "Moka, kai" criteria per topic.
- Bilingual UI, mobile-responsive layout, open data (ODbL), no login friction.
