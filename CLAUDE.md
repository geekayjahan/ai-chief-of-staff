# Product Builder WS2 — workshop kit

This project follows **spec engineering**: the spec is the product; code is the disposable thing you regenerate from it.

- `modules/` holds the blueprints — the source of truth for every session's procedure. Skills and commands in `.claude/` are their executable mirrors: read the blueprint before running, never run from memory.
- The arc: **S1 spec → S2 build → S3 eval → S4 debug → S5 strip.** Each stage reads upstream artifacts only.
- Everything the workshop produces lands in `app/` — spec.html, evals.md, feature-list.json, app-spec.json, the source, eval-results.html, debug-log.html — plus one trace, `app/claude-progress.txt` (format in `modules/shared-rules.md`).
- The four rules every blueprint follows (trace · render · doors · CLAUDE.md) live in `modules/shared-rules.md`.
- Keys and credentials live in `.env` only (gitignored; template in `.env.example`) — never in chat, a spec, or any other file.
- S1 generates a separate `app/CLAUDE.md` for the app being built — that one carries the build's durable tenets; this file just orients the kit.
