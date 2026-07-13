# Solo Project Manager

An EA-style project manager for solo operators running multiple projects. Holds the plan, surfaces the right thing at the right moment, defends weekly task caps, and processes brain dumps.

## What it is

A folder of opinionated Markdown templates that Claude reads at the start of every session to act as your project manager. Once installed, opening a Cowork session in the folder loads the full operating system: session ritual, hard rules, voice and POV, weekly plan, project snapshots, and per-project sub-agents.

The system is opinionated. The weekly task cap, 90-second cockpit, brain-dump-as-inbox, and session ritual are defaults inherited from a working installation, not tunable knobs.

## What gets installed

After onboarding, your folder contains:

- `CLAUDE.md` — session ritual and hard rules
- `STATUS.md` — handoff between sessions
- `PROJECT_HQ.md` — 90-second cockpit of all projects
- `WEEKLY_PLAN.md` — the weekly task contract
- `GOALS.md` — monthly goal hierarchy
- `ROADMAP.md` — 90-day milestone bridge
- `BRAIN_DUMP.md` — inbox that gets processed each session
- `USER_POV.md` — your spiky POV (content filter)
- `USER_VOICE.md` — writing rules and audiences
- `USER_GUARDRAILS.md` — failure modes the PM flags
- `USER_FRONTIER.md` — research synthesis log
- One subfolder per project, each with its own `CLAUDE.md` sub-agent, strategy doc, task matrix, and hour ledger

## How to install

1. Install the plugin in Cowork.
2. Open a chat and say: "Set up my project manager."
3. The `setup-pm` skill runs and walks you through onboarding in roughly 7 phases — you, your projects, rules, goals, POV, voice, guardrails.
4. The skill writes personalised files to the folder you choose.
5. Open that folder as a Cowork project and start a fresh session. The PM is live.

Onboarding takes 20–45 minutes depending on how much detail you want filled in up front. Sections can be skipped and filled later — the PM will work with skeleton files, it just won't filter content through anything specific until those sections are populated.

## What this isn't

- Not a task tracker — it points to external tools (ClickUp, Linear, Asana) for ticket-level detail
- Not an execution agent — it plans, routes, and manages; it does not edit your project deliverables unless you explicitly ask
- Not a one-size-fits-all template — the onboarding asks enough questions that the installed PM has your voice, your projects, and your guardrails baked in

## Reusing on other LLMs

A standalone folder version is shipped alongside this plugin (`solo-project-manager-templates/`). It contains the same templates plus an `ONBOARDING.md` listing the question set, so you can paste the questions into ChatGPT, Gemini, or any other LLM and have it fill in the files for you.
