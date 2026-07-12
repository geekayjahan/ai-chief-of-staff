# Session prompts — run the whole workshop yourself

Every prompt from the workshop, in order. Paste each block into Claude Code and watch the artifact appear in `app/`. Blueprints stay in `modules/` (read-only reference).

Setup, in order:

```
node scripts/serve.mjs           # from the kit's root
# → http://localhost:3000/resources/workshop-guide.html   (the teaching guide)
# → http://localhost:3000/build-assistant.html            (the live build dashboard)
claude                           # in a second terminal, same root
```

Each RUN block is also a slash command — `/spec` · `/build` · `/eval` · `/surgical-fix` · `/strip`. `/ambiguity-audit`, `/bar-raiser`, `/deep-dive`, `/explain` are ad-hoc. On the spec, select any text to annotate it — the build folds notes in; every other artifact is read-only.

---

## S1 — Spec

**RUN** — the skill *interviews you*, one question at a time; there's no form. Seed it with your rough idea (this is the workshop's example — swap in your own problem any time):
```
/spec

I want an app that finds me relevant jobs. It takes my CV and a plain ask, and returns a short list of roles that are actually open, actually in the right location, and actually matched to what's in my CV — with the reason on every row. Today's tools return stale links, wrong cities, and "matches" that just echo my job title.
```

Answer its questions. It won't write until the problem is sharp and you've confirmed it.

**AUDIT** (one-shot — catches the fuzzy words before the build):
```
Read @modules/s1-working-backwards/ambiguity-audit-blueprint.md and run the audit against app/spec.html. Write app/ambiguity-audit.html.
```

Fix every flag the audit raises. If you leave one in, S3 will price it for you.

---

## S2 — Build

**RUN** (three subagents: decompose → initialize → write the code):
```
Read @modules/s2-build/build-blueprint.md, @app/spec.html, and @app/claude-progress.txt. Follow the build-blueprint end-to-end.
```

The initialize step halts at the credential checkpoint, naming the missing key from your spec's tech stack. That's how you connect an API — one key, one file, no code: copy `.env.example` → `.env`, paste the key, tell the build to continue.

While the coding step runs, try a comment: on the Build Assistant's TASKS tab, comment on a feature that hasn't been built yet — change a detail, tighten a wording. The build reads `app/comments.json` before each feature: the status chip flips to *picked up* and the trace logs why. A sentence changed the build — no waiting for debug.

After the build finishes, try the swap: kill the Claude session, open a fresh one with no history, and paste:
```
Read @app/CLAUDE.md and @app/claude-progress.txt. Where are we, and what happens next?
```
The new session picks up exactly where the dead one stopped. That's the thesis: the spec is the product; the worker is disposable.

---

## S3 — Eval

**Optional first — install Langfuse so OBSERVE works** (skip if you don't want tracing). Run from `app/` (where `package.json` is):
```
cd app && npm install @langfuse/tracing @langfuse/otel @opentelemetry/sdk-trace-node
```
Langfuse credentials go in `.env` (`LANGFUSE_PUBLIC_KEY`, `LANGFUSE_SECRET_KEY`, `LANGFUSE_BASE_URL`).

**Why it's built this way**
- Two passes — checks catch what you predicted; reading the traces catches what you didn't.
- A fresh agent grades, never the builder — self-eval biases to a pass, and if it can edit the check it'll soften it.
- Binary checks, not scores — a rule ("every job in the right city"), not an answer that dies next run.
- Code check over judge — a count/regex/status code is deterministic and free; use an LLM judge only for meaning, with two worked examples.
- Five reviewers = five ways a real team rejects it (QA · architect · security · customer sense · data).
- Blind-spot check — a reviewer with zero checks is a hole, not a pass; the eval halts and asks you for that reviewer's missing question (customer sense goes silent most). Your answer becomes a new `evals.md` row before grading.
- A broken row (dead link, leaked data) can't count toward any other check's pass.
- Error analysis is human-led, one annotator — observations not explanations, no pre-made categories; a committee averages away the insight.
- Three doors — fix the build (obvious bug, just fix it), fix the spec (repeats + matters → new machine check), let it ride (rare, low-stakes → logged). A can't-tell is a spec bug (unpinned number), not a debug bug.
- Run history (`eval-runs.json`) shows the run-over-run strip — re-run after a fix, watch a red light flip. Green ≠ audited: money/data/safety still needs a human.

Before the judge runs, predict pass/fail for each check in `app/evals.md` — then paste your predictions into the RUN block so the scorecard shows predicted vs actual. The gap is the drift lesson.

**RUN** (a fresh, independent judge runs the spec's checks against the app's output):
```
Read @modules/s3-eval/eval-blueprint.md, @app/evals.md, and @app/claude-progress.txt. Follow the eval-blueprint end-to-end. Write app/eval-results.html — one row per check: reviewer · check · pass/fail/can't-tell · evidence naming every failing item.

Room predictions (show predicted vs actual on the scorecard): <paste your predictions>
```

**ANNOTATE** (the second pass — you hold the keyboard). Open the dashboard's TRACES tab. Read the failures and type an open-code note per failure — *the first thing that went wrong, as an observation* ("stale listing passed the date check"), never an explanation. One annotator on purpose. Hit **Copy annotations**, paste into Claude, confirm the clusters it proposes, then walk the three doors on the ACTIONS tab: *fix the obvious, spec the repeating, log the rest.* Any "spec the repeating" becomes a new row in `evals.md` — the checks just grew because you read the traces.

**OBSERVE** (optional — push the scorecard to Langfuse so runs show up in a dashboard):
```
Read @app/eval-results.html and @.claude/skills/langfuse/references/instrumentation.md.

Push the scorecard to Langfuse as a traced eval run using the JS SDK:
- Wrap the run in startActiveObservation('s3-eval-run', ...) from @langfuse/tracing.
- One child observation per check row, named <reviewer>:<check-id>, score 1 = pass / 0 = fail, metadata { why } on every fail.
- Flush with langfuseSpanProcessor.forceFlush() and print the run URL.

If the import path or scoring API differs from the reference, follow the reference — it's the latest.
```

Re-run OBSERVE after each S4 fix — same dashboard, new timestamped run. That's drift-vs-fix, measured.

---

## S4 — Debug

**Why it's built this way**
- One change at a time — the smallest before→after; if you can't write it as one, it's more than one, split it. That's what lets you attribute the fix.
- Locate before you fix — a failed check says what's wrong, not where: M1 trace → M2 feature → M3 commit → M4 file:line.
- The bug isn't always the code — it can be the spec, a screen, the tech stack, the prompt, or the data. Spec-layer fix = one English sentence. Can't tell the layer? `/deep-dive`.
- Re-run the whole eval, every check — that's how you catch a fix that quietly broke something else.
- The receipt (before · change · after · which checks flipped · cost) — the proof vibe-coding never has.
- A bug you report in your own words gets read back to you before anything changes.

Your to-do list is the eval dashboard's ACTIONS tab — "fix the build" items, in order. If a failed check traces back to the spec, the fix is one English sentence in `spec.html`, then re-run.

**RUN** (Surgical Fix — one change, re-run everything, receipt):
```
Read @modules/s4-debug/surgical-fix-blueprint.md, @app/eval-results.html, and @app/claude-progress.txt.

Ask me first: "Debug from the scorecard, or describe a bug you want fixed?" Either way, locate before fixing — trace → feature → commit → file:line. If I described the bug, quote the location back to me before changing anything.

Follow the surgical-fix blueprint end-to-end. Every entry in app/debug-log.html carries a receipt — tokens + cost for AI fixes, files + lines for code edits.
```

---

## S5 — Strip

**Why it's built this way**
- A stronger model makes some scaffolding (pre-baked lookups, extra validation passes, prompt workarounds) dead weight it now handles itself.
- Proof, not hope — per scaffold, four questions: does the trace show it firing? did it ever catch a failed check? did any past fix touch it? does the build go red without it on the new model? Commit nothing yet.
- Three artifacts, one hard checkpoint: `recall-notice.html` → `strip-plan.html` (evidence per card, nothing committed) → you confirm or overturn each call → `strip-page.html`. Stripping is destructive — the agent never strips on its own.
- Record why cut · why kept · why someone with a different product might keep it — a strip is context-dependent.
- Cap ~4 a session — depth over a long list.

**RUN** (Model Recall — cut only what the traces prove, with your sign-off, max 4 strips):
```
Read @modules/s5-strip/strip-blueprint.md, @app/claude-progress.txt, @app/eval-results.html, @app/debug-log.html, and app/. Pick a fictional new-model launch. Follow the strip-blueprint end-to-end: write app/recall-notice.html; gather the four-question evidence per scaffold (trace fires · caught a failed check · touched by a fix · build goes red without it) into app/strip-plan.html without committing anything; halt at the review checkpoint for my call on each card; then write app/strip-page.html from my confirmed calls. Cap at 4 scaffolds — depth over a long list.
```

---

Monday morning: run S1 on your own problem. The interview works on anything you can describe in a sentence.
