---
name: eval
description: Run the two-pass eval — the bar-raiser panel grades the spec's checks binary, then a human-led error analysis reads the traces for what the spec never imagined. Use when the user invokes /eval, says "evaluate the app", "run S3", "grade the output", "error analysis", or wants a pass/fail verdict per check. Produces app/eval-results.html (scorecard · traces · patterns · actions) + app/eval-runs.json history.
---

# Eval

Self-evaluation fails structurally — the builder biases toward favourable scoring. The fix is a fresh, independent pass, not a better prompt. And the checks alone aren't enough: the traces show what the spec never imagined. Two passes — top-down checks, bottom-up discovery.

Read `@modules/s3-eval/eval-blueprint.md` before running. Do not run from memory.

Read `memory.md` in this skill's folder before running. After the session, grade the eval outputs against this skill's `evals.md` with a fresh-context agent, then append what you learned to `memory.md`.

---

## Inputs

- `app/evals.md` — the spec's Verification checks (S1 wrote them; this skill runs them)
- App output — entry point + run command located via `app/claude-progress.txt`. If multiple plausible entry points exist, ask the user before choosing.
- `app/spec.html` — for context only; the checks come from `evals.md`.
- `app/comments.json` (when present) — process any `status:"new"` comments scoped to the eval before starting.

---

## Step 1 — Encode the checks, one reviewer each

Walk every `evals.md` row and encode it as a binary check, tagged:

- **code** — a count, regex, substring, or status code can decide it. If code *can* decide it, code *does* — always.
- **judge** — meaning has to be interpreted. Give the judge two worked pass/fail examples so it grades the way you would.

Assign every check to a reviewer dimension: **QA · architect · security · customer sense · data**. **A dimension with zero checks is a blind spot, not a pass** — flag it, ask the user for that reviewer's missing question (AskUserQuestion; customer sense goes silent most often), and write the answer into `evals.md` as a new row before the judge runs.

Rules: **binary** (never "7/10") · **a rule, not one answer** · **shape checks mean exactly these fields** (an extra field is a fail too).

---

## Step 2 — The independent judge

A **fresh** pass — not the builder — runs every check against every output item:

- Verdicts: **pass / fail / can't-tell**.
- **Broken-row rule:** a row that fails a hard check (dead link, leaked data) doesn't count toward any other check's pass.
- On a fail, the evidence names **every failing item** — which row, which value.
- **can't-tell** means the spec never pinned it down — a spec edit + re-run, never an invented threshold.

---

## Step 3 — Error analysis (human-led)

The judge found *that* it failed; the human names *why*. Follow the blueprint's five steps:

1. Point the user at the dashboard's TRACES tab — **one annotator**, open-code notes per failure (first thing that went wrong · observations not explanations). Never hand them a pre-defined failure list.
2. When annotations come back (pasted JSON), **propose clusters** — split by different root cause, merge by same, grounded names only. **Confirm with the user before using them** (AskUserQuestion: accept / rename / merge / split).
3. **Label every failure** against the confirmed patterns, not just the annotated ones; show the counts; invite a spot-check. Report coverage and point at unread failures that look unlike anything labeled yet.
4. **Triage each pattern through the three doors, in order:** obvious bug → hand to `/surgical-fix` now · repeats and matters → draft the new `evals.md` row (code check preferred) and add it on the user's yes · rare and low-stakes → log it. Update the dashboard's PATTERNS and ACTIONS data.
5. Remind once: re-run this loop after a model swap or big spec change (S5's Model Recall is the trigger).

---

## Outputs

- `app/eval-results.html` — four tabs per the blueprint's render spec: **SCORECARD** (five reviewer cards, hard question, binary lights, evidence, coverage chips, predicted-vs-actual when the room's tally was given) · **TRACES** (cards grouped into can't-tell→spec-decision and uncovered→no-check-covers-it, badged, diverse-ordered; annotation rules; notes persist to `app/eval-annotations.json` via `POST /eval-annotations` with a localStorage draft + clipboard fallback; Copy annotations export) · **PATTERNS** (only from confirmed clusters; run-over-run strip; trend) · **ACTIONS** (the three doors, triage order). Render via `frontend-design`; embed the current run's rows as a JSON blob.
- `app/eval-runs.json` — append `{run, timestamp, verdicts:[{check_id, reviewer, verdict, evidence_summary}]}` each run (dashboard history; not a handoff artifact).

Hand-off: obvious bugs → Debug now · repeating patterns → new `evals.md` rows (the checks grow as you learn) · can't-tell → fix the spec and re-run · all green → regression net.

---

## Close out

Append: `<ISO>  S3  eval-results.html landed  RATIONALE: <overall verdict + dominant failure pattern>`. Do not mirror failure details into CLAUDE.md. CLAUDE.md §2 is touched only if the eval surfaces a tenet that survives a model swap.

One caveat, said out loud: green means the machine-runnable checks came back clean — not that the app is *audited*. Simulated reviewers aren't real audits; for money / data / safety, a human still signs off.
