# AI Chief of Staff

An EA-style project manager you install once and then talk to. It holds the plan, tells you the
one thing worth doing, processes what you dump on it, and stops you working on the wrong thing.

It is opinionated by design. A weekly task cap you cannot quietly exceed, a cockpit that has to
stay readable at a glance, a brain dump that gets cleared every session, and work and personal
kept apart so only one is in front of you at a time. These are inherited defaults, not settings.

## Who it is for

Anyone running more than a couple of live projects across different parts of their life. Work,
side projects, household, family, learning, whatever else. It earns its keep when
context-switching is costing you focus, or when you are holding too many open threads in your
head to trust any of them.

## Start here

1. Decide where your personalised PM should live. Not this folder. The templates stay clean.
2. Install using whichever path matches your setup, below.
3. Answer the onboarding questions. Skipping is fine, anything skipped gets marked
   `→ fill when ready` rather than invented.
4. Open your new PM folder in a fresh session. It takes over from there.

Then read [SESSION-FLOW.md](SESSION-FLOW.md) to see what it does on its own, and work through
the first three cases in [EXAMPLES.md](EXAMPLES.md).

## Install

**Claude Code:** open this kit and run `/setup-pm`.

**Cowork:** open `everyday-pm.plugin`, accept the install, then say *"Set up my project
manager."*

**Any other model that reads a folder** (Claude.ai, ChatGPT, Gemini): point it at `templates/`
and tell it to follow `ONBOARDING.md`. The exact wording is in [PROMPTS.md](PROMPTS.md).

**No folder access:** paste `templates/ONBOARDING.md` into the chat and say *"Follow this."*

## What is in here

| Path | What it is |
|------|-----------|
| [`templates/`](templates/) | The EA files, carrying `{{PLACEHOLDER}}` markers |
| [`SESSION-FLOW.md`](SESSION-FLOW.md) | How a session runs, start to close |
| [`PROMPTS.md`](PROMPTS.md) | Paste-ready prompts for install and for running it |
| [`EXAMPLES.md`](EXAMPLES.md) | Things to try, with what a good answer looks like |
| `everyday-pm.plugin` | Cowork one-click installer, bundling the same templates |

Inside `templates/`:

```
CLAUDE.md              the session ritual, read first every time
STATUS.md              handoff between sessions
PROJECT_HQ.md          the cockpit, split work and personal
WEEKLY_PLAN.md         the weekly contract, split work and personal
GOALS.md               priority hierarchy per context
ROADMAP.md             90-day milestones
BRAIN_DUMP.md          unified inbox, cleared every session
USER_GUARDRAILS.md     your failure modes, with flag and redirect lines
ONBOARDING.md          the guided question set
content-optional/      POV, voice, and research files, installed only if you publish or teach
project-template/      copied once per project, capped and uncapped variants
```

## What you get after install

Your folder, not this one:

```
Your PM/
├── CLAUDE.md              session ritual
├── STATUS.md              handoff
├── PROJECT_HQ.md          cockpit
├── WEEKLY_PLAN.md         weekly contract
├── GOALS.md               priorities
├── ROADMAP.md             90-day view
├── BRAIN_DUMP.md          inbox
├── USER_GUARDRAILS.md     failure modes
├── USER_POV.md            only if the content layer is on
├── USER_VOICE.md          only if the content layer is on
├── USER_FRONTIER.md       only if the content layer is on
│
└── <project-name>/        one folder per project
    ├── CLAUDE.md          project sub-agent, capped or uncapped
    ├── <PROJECT>.md       strategy and tasks
    ├── <PROJECT>_TASKS.md prioritisation matrix
    └── <PROJECT>_LOG.md   hour ledger, capped projects only
```

## What it is not

**Not a task tracker.** It points at whatever you already use for ticket-level detail. It is not
trying to replace ClickUp or Linear or your reminders app.

**Not an executor.** It plans, routes, and manages. It will not touch your project deliverables
unless you ask it to directly.

**Not generic.** Onboarding asks enough that the installed version has your projects, your
contexts, and your failure modes written into it. That specificity is the whole reason it can
refuse things.

## Changing it later

Everything is a markdown file in your folder. Change the task cap by editing it in `CLAUDE.md`,
`WEEKLY_PLAN.md`, and `USER_GUARDRAILS.md`. Change how it talks to you by editing the EA IDENTITY
section of your `CLAUDE.md`. Add a project by copying `project-template/` and wiring it into
`PROJECT_HQ.md`, `GOALS.md`, and the key files table.

Add the content layer later by copying the three files out of `content-optional/` and filling
them in.

One caveat on the plugin: it is a packaged copy of `templates/`. If you edit the templates in
this kit, the bundle is stale until someone rebuilds it.
