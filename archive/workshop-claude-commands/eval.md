---
description: Run the two-pass eval — the bar-raiser panel grades evals.md binary, then human-led error analysis reads the traces. Produces app/eval-results.html (scorecard · traces · patterns · actions).
---

Invoke the `eval` skill.

Reads `app/evals.md` + locates app outputs via `app/claude-progress.txt`. If multiple plausible entry points exist, ask the user before choosing.

Follow the procedure in [`modules/s3-eval/eval-blueprint.md`](../../modules/s3-eval/eval-blueprint.md) verbatim. Every check belongs to a reviewer dimension — a dimension with zero checks is a blind spot: ask for the missing question. Verdicts are pass / fail / can't-tell; a can't-tell is a spec gap — fix the spec and re-run, never invent a threshold. After the judge: the human-led error analysis (annotate → confirm clusters → label all → three doors).
