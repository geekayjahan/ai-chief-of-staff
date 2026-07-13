---
description: Run the Surgical Fix loop — locate, one change, re-run every check, receipt. Two routes: eval-driven (walk the failed checks) or manual (locate the layer first). Produces app/debug-log.html.
---

Invoke the `surgical-fix` skill.

Reads `app/eval-results.html` + `app/claude-progress.txt`.

Ask the user once at the start: *"Debug from eval results, or describe a bug/change you want fixed?"* — pick the route based on the answer.

Follow the procedure in [`modules/s4-debug/surgical-fix-blueprint.md`](../../modules/s4-debug/surgical-fix-blueprint.md) verbatim. Every entry in `app/debug-log.html` carries a receipt — input tokens · output tokens · model · approx cost for AI fixes; files + lines for code edits.
