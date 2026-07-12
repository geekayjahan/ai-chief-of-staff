# Solo Project Manager — Standalone Templates

An EA-style project manager for solo operators running multiple projects. This is the LLM-agnostic version. Use it with Claude, ChatGPT, Gemini, or any model that can read a folder.

## How to use

1. Drop this folder somewhere your LLM can read.
2. Open `ONBOARDING.md` and either paste it into the model or hand the model the folder and tell it to follow that file.
3. Answer the onboarding questions. The model fills the templates.
4. Once filled, open the folder for any future session. The model reads `CLAUDE.md` first and runs the PM from there.

## What's in here

- `CLAUDE.md` — session ritual the model reads first
- `STATUS.md` — handoff between sessions
- `PROJECT_HQ.md` — 90-second cockpit
- `WEEKLY_PLAN.md` — weekly task contract
- `GOALS.md` — monthly goal hierarchy
- `ROADMAP.md` — 90-day milestone bridge
- `BRAIN_DUMP.md` — inbox processed each session
- `USER_POV.md` — spiky POV (content filter)
- `USER_VOICE.md` — writing rules and audiences
- `USER_GUARDRAILS.md` — failure modes
- `USER_FRONTIER.md` — research synthesis log
- `project-template/` — copy this folder once per project, rename, fill in
- `ONBOARDING.md` — the guided question set

## For Cowork users

A Cowork plugin version exists alongside this folder. It bundles the same templates plus a `setup-pm` skill that runs onboarding automatically. If you're on Cowork, install that instead — it's smoother.
