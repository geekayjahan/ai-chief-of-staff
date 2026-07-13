# Evals — eval skill

Binary checks on an eval session's outputs. Grade with a fresh agent that did not
run the eval, pointing at `app/eval-results.html`, `app/eval-runs.json`, and the
trace. Any fail: fix, then re-grade with a new fresh agent until all pass. Cap
~12 — to add a check, merge or retire a weaker one.

1. The scorecard covers all five reviewer dimensions (QA, architect, security,
   customer sense, data), each with at least one check — and where a dimension
   had none, the run shows the user was asked for that reviewer's missing
   question rather than the dimension being skipped.
2. Every verdict is pass, fail, or can't-tell. No scores, percentages, or
   "mostly" anywhere.
3. Every check is a rule that would hold across runs ("every link opens"), not a
   fact about one specific row ("row 1 is Google").
4. Every failing check's evidence names each failing item — which row, which
   value — not just a count.
5. A row that failed a hard check (dead link, leaked data) is excluded from
   every other check's pass count.
6. The grading was done by a fresh pass, not the builder — stated in the trace
   or the dashboard header.
7. The PATTERNS tab shows only clusters the user confirmed (accepted, renamed,
   or merged) — no pattern the user never saw.
8. Every failure pattern in ACTIONS got one of three decisions — hand to
   surgical-fix now, add a new row to app/evals.md, or logged as accepted —
   with none left undecided.

Gold example: `git show 11b7f67:app/evals.md` — the check format this skill
consumes (case ID, scenario, expected output, assertion, source).
