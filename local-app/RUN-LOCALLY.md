# Run it locally — no Claude Code, no Claude Desktop

This is the AI Chief of Staff as a plain folder. It runs in **any** assistant that can read files or accept pasted text — ChatGPT, Gemini, Claude.ai, whatever you have. Nothing to install.

## Setup (once, ~10–20 min)

1. **Put this folder where your assistant can see it** — upload it, drop it in a project, or keep it open to paste from.
2. **Onboard.** Open [`ONBOARDING.md`](ONBOARDING.md) and paste its prompt into your assistant. Answer the questions one section at a time. It fills every `{{PLACEHOLDER}}` with your answers and leaves `→ fill when ready` where you skip. It never invents your content.
3. Done. The folder is now *your* chief of staff.

## Each session

1. Start the chat by pasting (or pointing your assistant at) **`CLAUDE.md`** — that's the operating manual: the session ritual, the hard rules, and the four commands.
2. Then just talk:
   - **Dump:** "brain dump: …" → it files it, no sorting.
   - **Brief:** "where am I?" → three sentences + today's one thing.
   - **Wrap:** "wrap the week" → what shipped, what slipped, next week under the cap.
   - **Connect:** paste today's calendar or task list → it folds into the brief.
3. Your state lives in the markdown files (`WEEKLY_PLAN.md`, `PROJECT_HQ.md`, `STATUS.md`, `BRAIN_DUMP.md`, `GOALS.md`). If your assistant can't write files, ask it to hand back the updated file and save it yourself.

## The one integration rule

It only ever sees what you paste. That's least privilege by construction — no account access, nothing written, fully offline. When you later move to the Claude Desktop plugin, the same rule holds: read-only, one app, the narrow slice.

## Moving up later

Have Claude Desktop? Install `solo-project-manager.plugin` instead — same behaviour, guided onboarding, and real (still least-privilege) app connections. This folder and the plugin are the same chief of staff, two ways to run it.
