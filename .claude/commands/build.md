---
description: Run the decompose → initialize → code chain (three subagents) on the spec. Builds the app feature-by-feature with per-feature RATIONALE entries and one git commit per feature. Produces feature-list.json, app-spec.json, and the source under app/.
---

Invoke the `build` skill.

Reads `app/spec.html` + `app/claude-progress.txt`. Halts if the spec is missing.

Follow the procedure in [`modules/s2-build/build-blueprint.md`](../../modules/s2-build/build-blueprint.md) verbatim. Honor the credential checkpoint — stop when a needed key is missing and ask the user to put it in `.env` (never ask for the value in chat). Never invent a feature without a spec task; never import a tech-stack choice not listed in `app-spec.json`.
