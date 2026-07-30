# AI Chief of Staff — lightning-lesson repo

This repo is a ~30-minute lightning lesson: build a **Claude plugin** from a plain-English spec, port it to Claude Desktop, and publish it as a local app. Start at [`README.md`](README.md).

- **The spec** is [`app/plugin-spec.md`](app/plugin-spec.md) — plain English, no code. The build follows it one capability at a time.
- **The plugin source** lives in `plugins/solo-project-manager/` (manifest + skills + templates). Edit there, then run `./build-plugin.sh` to repack `solo-project-manager.plugin` — never hand-edit the `.plugin` zip.
- **The local-app** version is `local-app/` (the same chief of staff as a plain folder any LLM can run). `everyday-pm.plugin` is the alternate variant kept as a comparison example.
- **The install kit** is `templates/` — the alternate variant's templates, refined. Work/personal session modes, the three routines written into the installed `CLAUDE.md` rather than shipped as skills, and onboarding that shows the user a spec before it writes anything. This is what students install from; `SESSION-FLOW.md`, `PROMPTS.md`, and `EXAMPLES.md` are its docs.
- **Capabilities are skills, not code** — each is a markdown `SKILL.md`. Keep them read-only-and-plan in spirit: the assistant plans and re-orients, it never executes project work, and app integration stays least-privilege (read-only, one app, narrow slice).
- Keys/credentials live in `.env` only (gitignored; template in `.env.example`).
