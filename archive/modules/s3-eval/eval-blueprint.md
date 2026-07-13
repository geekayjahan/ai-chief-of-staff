---
name: eval-blueprint
description: Run the two-pass eval — grade the spec's checks binary with a fresh agent, then read the traces for what the spec never imagined.
reads:
  - app/evals.md (the encoded checks, from the spec's Verification)
  - the app's output, via the trace app/claude-progress.txt
produces:
  - app/eval-results.html (pass/fail scorecard, one row per check)
  - app/eval-runs.json (run history, appended)
---

# Eval

The build faces the panel it would face on a real team; every question is a binary check; any fail holds the build. The eval is **two passes** — run the checks (top-down), then error analysis (bottom-up). Run both.

## The panel

The panel is how the checks were *written* back in S1 — the eval runs them. Reviewer → the question they raise → the check it becomes:

| Reviewer | Bar-raiser question | Encoded as a binary check |
|---|---|---|
| **QA** | Does it work, including the edges? | every link opens · empty / huge input doesn't crash · N results returned |
| **Architect** | Sound and consistent — nothing reinvented? | same output shape every run · one auth path, not five |
| **Security** | Could it leak data or be injected? | no PII in output · links only to allowed domains · injected input rejected |
| **Customer sense** | Would the person in the spec's Problem actually accept this row? Does it serve their stated outcome — not just match keywords? | ≥ X of N results meet every stated constraint · the "why it fits" reads true for *this* customer |
| **Data / accuracy** | Every claim true to the source? | every cited fact appears in the source (no hallucination) |

## Check-writing rules

Write every check so it is:

- **Binary** — pass or fail, never "7/10." "Every link opens" holds or it doesn't.
- **A rule, not one answer** — the AI rebuilds differently each run, so check the invariant ("every job is in the right city"), never "job #1 is the Google role."
- **Code or judge — the tie-breaker:** if a count, regex, substring, or status code can decide it, it's a **code** check — always. Use an AI **judge** only when meaning has to be interpreted (is this "why it fits" really about this candidate?), and give it two worked pass/fail examples so it grades the way the user would.
- **Shape checks mean *exactly* these fields** — an extra, unexpected field is a fail too (extra fields are how things leak).
- **Owned by a reviewer** — assign each `evals.md` check to one of the five dimensions above.

## Pass 1 — Run the checks

1. Turn each reviewer's question into a binary check in `app/evals.md` — tag each *code* or *judge*.
   Done when: every check is binary, tagged, and owned by a reviewer.
2. Run every check against every output item, honoring both checkpoints below. A row that fails a hard check (dead link, leaked data) is a broken row — **it counts toward no other check's pass** (a 404 job can't help you "meet the customer's ask").
   Done when: each check has a pass/fail + the value that failed.
3. Write the scorecard `app/eval-results.html`: one row per check — `reviewer · check · pass / fail / can't-tell · evidence`. **On a fail, the evidence names every failing item** (which row, which value) — "2/5 matched" alone gives Debug nothing to fix.
   Done when: every fail names its failing items.

## Checkpoints

- HALT IF any reviewer dimension has zero checks — **a blind spot, not a pass**: ask the user for that reviewer's missing question (customer sense goes silent most often) and write the answer in as a new `evals.md` row before the judge runs.
- Run every check with a **fresh agent** — never the one that built the app. *Why: a builder grading its own work talks its way to a pass, or quietly edits the check.*

## Pass 2 — Error analysis (human-led)

The checks are top-down: the spec wrote them, the judge ran them. Error analysis is bottom-up: the traces show what the spec never imagined.

1. **Read the failures and open-code them** — one annotator writes one note per failure: *the first thing that went wrong* (the root cause, not the cascade), as an observation, never an explanation ("missed the location filter", never "the model didn't understand"). No pre-defined failure list — categories emerge from what you actually see. One owner grounds the categories; a committee averages away the insight.
2. **Cluster the notes into patterns** — split when the root causes differ, merge when they're the same; a handful of grounded names ("stale listings pass the date check", never generic scores like "hallucination score"). If the AI proposes the clusters, **confirm them with the user before using them** — accept, rename, merge, or split.
3. **Label every failure** against the confirmed patterns — not just the annotated ones; spot-check the labels. Count per pattern; the counts set the priority.
4. **Triage each pattern through the three doors, in this order** — *fix the obvious, spec the repeating, log the rest*:

   | Door | Trigger | Action |
   |---|---|---|
   | **Fix the build** | an obvious bug | → Debug now — don't build an evaluator for something you can just fix |
   | **Fix the spec** | it repeats and matters | → a new row in `evals.md`; next run it's machine-checked — code check preferred, judge only for judgment calls |
   | **Let it ride** | rare and low-stakes | → logged, not chased |

5. **Stop and re-run rules:** stop reading when new failures stop naming new problems. Re-run the whole loop after a model swap or a big spec change — error analysis is not a one-time activity (S5's Model Recall is exactly this trigger).

## Hand-off

- An **obvious bug** → Debug's to-do list now (the failing check *is* the bug).
- A **repeating pattern that matters** → a new check in `evals.md` — the spec is living; the checks grow as you learn.
- A **can't-tell** → the *spec* never pinned it down (a missing number or bound); fix the spec and re-run — not a Debug fix. (If the check itself was just written vaguely, rewrite the check.)
- All **green** → the checks stay on as a regression net, re-run after every later change.
- Green means the machine-runnable checks came back clean — not that the app is *audited*. For money / data / safety, a human still signs off.

## Outputs — the eval dashboard

Render `app/eval-results.html` per the **render rule** (see [`../shared-rules.md`](../shared-rules.md)) — it's the workshop's most-watched screen. State the two passes in its header. Four tabs:

- **SCORECARD** — five reviewer cards (QA · architect · security · customer sense · data), each with:
  - its hard question
  - a binary verdict light per check (green pass · red fail · grey can't-tell)
  - evidence expanding under each fail, naming every failing item
  - a coverage chip ("3 checks" / "0 checks — blind spot")
  - a predictions row when the room's pass/fail tally was given: predicted vs actual per check — the gap is the drift lesson
- **TRACES** — header line: *"No grading yet — just read and name what you see."* Print the three annotation rules at the top, then the cards grouped by what the annotator does with each:
  - **Can't-tell → needs a spec decision** — one card per can't-tell check: the check, the uncertain item(s), the trace excerpt, a note field. (These are the spec gaps — a missing number or bound.)
  - **Uncovered → no check covers this** — the bottom-up finds: an observation the traces surface that no existing check catches (badge "Uncovered"), with the trace excerpt and a one-line "why it's worth a second look," and a note field. This is where Pass 2 names what the spec never imagined; each becomes a candidate `evals.md` row.
  - Order cards within each group for **diversity** (spread across checks and items, never dump order). Every card carries seeded context + the trace excerpt + one open-code note field (first thing that went wrong, observation not explanation).
  - Persist each note to `app/eval-annotations.json` via the kit server (`POST /eval-annotations`, one entry per run + item), using the same same-origin → `:3000` → clipboard cascade as the spec's selection annotator; `localStorage` is an offline draft only, and the server file is the source of truth on load. A **Copy annotations** button still exports every note as JSON to paste back for Pattern clustering. (PATTERNS-tab cards are read-only resolution summaries — no note field.)
- **PATTERNS** — populate **only from confirmed clusters of human notes**; before that show: *"No patterns yet. Patterns come from your notes, not from a pre-made list — read the traces first."* Then:
  - pattern counts ranked by frequency
  - the run-over-run strip (each re-run a column — a fix visibly flips a light)
  - the pass-rate trend from `eval-runs.json`
  - a coverage line ("4 of 9 failures annotated — the unread ones look unlike anything you've labeled; read those next")
- **ACTIONS** — the three doors as cards, in triage order: Fix the build (→ `/surgical-fix`) · Fix the spec (→ the new `evals.md` row, spelled out) · Let it ride (logged). *Fix the obvious. Spec the repeating. Log the rest.*

Each run also appends to `app/eval-runs.json` (dashboard data, not a handoff artifact) so history survives regeneration:

```json
{"run": "<n>", "timestamp": "<ISO>", "verdicts": {"<check-id>": "pass|fail|cant-tell"}}
```

Close out per the **trace rule**.
