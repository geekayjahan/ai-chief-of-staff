---
description: Run the Model Recall + Strip discipline — re-inspect every harness component against a new model, gather evidence with traces, route candidates through a user review checkpoint. Produces app/recall-notice.html + app/strip-plan.html + app/strip-page.html.
---

Invoke the `strip` skill.

Ask the user for the NEW MODEL name + launch date (real or fictional for the demo). Read the build under `app/`, `app/claude-progress.txt`, `app/eval-results.html`, `app/debug-log.html`.

Follow the procedure in [`modules/s5-strip/strip-blueprint.md`](../../modules/s5-strip/strip-blueprint.md) verbatim. Never strip on your own — every candidate goes through an explicit user review checkpoint before it lands in `strip-page.html`. Time-box to 4 strips per session.
