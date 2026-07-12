---
description: Run a 5-Whys orchestrator-workers deep dive on a fuzzy incident. One question per turn, then 5 parallel workers compile the report. Output appends to claude-progress.txt as a trace entry (or writes deep-dive-report.md standalone).
---

Invoke the `deep-dive` skill.

If the user passed an incident paragraph as the argument, treat that as the input. Otherwise ask the user for the fuzzy incident.

Follow the procedure in [`modules/deep-dive-blueprint.md`](../../modules/deep-dive-blueprint.md) verbatim. **One question per turn.** Apply the depth rubric on every answer. Refuse on sight: "we forgot", "human error", "they should have known", "communication gap" without a named mechanism.
