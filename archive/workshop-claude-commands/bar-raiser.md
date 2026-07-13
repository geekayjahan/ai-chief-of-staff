---
description: Apply the Bar Raiser 4-evaluator critique to a PM artifact — Customer · Data · Bet · Owner. One fix-and-re-evaluate pass.
---

Invoke the `bar-raiser` skill.

Pass the artifact path as the argument (default: prompt the user for ARTIFACT if no path provided). Halt if the file does not exist.

Follow the procedure in [`modules/bar-raiser-blueprint.md`](../../modules/bar-raiser-blueprint.md) verbatim. Dispatch the 4 evaluators in parallel — same call, four sub-agents. One fix pass only; if POST-FIX still has any ✗, stop with `Verdict: not ready · PM revises and re-invokes`.
