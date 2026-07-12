---
description: Interrogate the build against the spec — requirement → where it lives → what depends on it. Produces app/understanding-map.html.
---

Invoke the `explain` skill.

Reads `app/` + `app/spec.html` + `app/claude-progress.txt`.

Follow the procedure in [`modules/explain-blueprint.md`](../../modules/explain-blueprint.md) verbatim. A requirement with no home in the code is a gap — report it as a bug for `/surgical-fix`, don't paper over it.
