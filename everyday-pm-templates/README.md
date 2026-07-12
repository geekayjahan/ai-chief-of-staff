# Everyday Project Manager — Standalone Templates

An EA-style project manager for anyone juggling work and personal projects. This is the LLM-agnostic version. Use it with Claude, ChatGPT, Gemini, or any model that can read a folder.

## Who it's for

Anyone with more than a couple of active projects across multiple areas of life — work, side projects, household, family, fitness, learning, creative pursuits. Especially useful if context-switching costs you focus or you carry too many open threads in your head.

The PM is opinionated: weekly task cap, 90-second cockpit, brain-dump-as-inbox, session-mode compartmentalisation. These are inherited defaults, not tunable knobs.

## How to use

1. Drop this folder somewhere your LLM can read.
2. Open `ONBOARDING.md` and paste the prompt at the top into your model. Or hand the model the folder and tell it to follow that file.
3. Answer the onboarding questions across 7 phases. The model fills the templates with your answers.
4. Open the folder for any future session. The model reads `CLAUDE.md` first and runs the PM from there.

Onboarding takes 20–45 minutes depending on depth.

## What's in here

**Core templates (always installed):**
- `CLAUDE.md` — session ritual the model reads first
- `STATUS.md` — handoff between sessions
- `PROJECT_HQ.md` — 90-second cockpit, split by work / personal
- `WEEKLY_PLAN.md` — weekly task contract, split by work / personal
- `GOALS.md` — priority hierarchy for each context
- `ROADMAP.md` — 90-day milestone bridge
- `BRAIN_DUMP.md` — unified inbox, routed during processing
- `USER_GUARDRAILS.md` — failure modes the PM watches for

**Optional content layer** (only installed if you publish, teach, or build a public voice):
- `content-optional/USER_POV.md` — spiky POV
- `content-optional/USER_VOICE.md` — writing rules and audiences
- `content-optional/USER_FRONTIER.md` — research synthesis log

**Per-project template** (copy once per project):
- `project-template/CLAUDE-with-cap.md` — sub-agent for projects with a hard hours cap
- `project-template/CLAUDE-no-cap.md` — sub-agent for projects without a cap
- `project-template/PROJECT.md` — strategy + tasks
- `project-template/PROJECT_TASKS.md` — prioritisation matrix
- `project-template/PROJECT_LOG.md` — hour ledger (only for capped projects)

**Onboarding:** `ONBOARDING.md` — the guided question set with the prompt to paste into your LLM.

## How sessions work

Open the folder in a fresh chat. The PM asks: *"Work, personal, or both today?"*

That answer filters the cockpit, weekly plan, goal hierarchy, and orientation. Brain dump stays unified — ideas land where they land, routed during processing.

## What this isn't

- Not a task tracker. It points to external tools (ClickUp, Linear, Asana, Apple Reminders) for ticket-level detail.
- Not an execution agent. It plans, routes, and manages. It does not edit your project deliverables unless you ask.
- Not a one-size-fits-all template. Onboarding asks enough questions that the installed PM has your projects, contexts, and guardrails baked in.

## For Cowork users

A Cowork plugin version exists alongside this folder. It bundles the same templates plus a `setup-pm` skill that runs onboarding automatically. If you're on Cowork, install that — it's smoother.
