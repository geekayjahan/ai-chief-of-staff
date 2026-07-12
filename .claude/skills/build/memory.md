# Memory — build skill

One line per lesson, newest first, cap ~12. Read before running; append after any
session that taught something. Prune as you append: a lesson that has held for
3+ sessions moves into evals.md (if checkable) or the blueprint (if procedural)
and gets deleted here; merge duplicates; delete entries about behavior that no
longer happens.

- Chunk + parallelize headless `claude -p` passes (small batches, bounded concurrency) — one prompt over ~15+ items times out (~90s) and drops a whole chunk to a failed score. Batched-all was the first instinct and it broke; smoke-test the LLM stage before assuming it scales.
- When the app itself calls Claude, prefer plan-auth headless (`claude -p`, the serve.mjs pattern) over an ANTHROPIC_API_KEY — it keeps the credential checkpoint a single key (the data source) and needs no second secret. `.env.example` already blesses plan auth.
- Credential-checkpoint hygiene: users may paste the key into the tracked `.env.example` (not `.env`). Move it to `.env` and scrub the template before building — a real key in a tracked file is a leak waiting for the next commit.
- Two sequential LLM passes (extract → fit) put a ~100s floor on one search; a live demo needs a loading state that sets that expectation, or a pre-warmed search. Not a bug — inherent to the pipeline shape.
