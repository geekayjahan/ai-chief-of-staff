# AI Chief of Staff

An EA-style project manager you install once and then talk to. It holds the plan, tells you the
one thing worth doing, processes what you dump on it, and stops you working on the wrong thing.

It is opinionated by design. A weekly task cap you cannot quietly exceed, a cockpit that has to
stay readable at a glance, an inbox that gets cleared every session, and work and personal
kept apart so only one is in front of you at a time. These are inherited defaults, not settings.

## The three routines

| Ask for | What it does |
|---------|-------------|
| **Voice dump** | Talk at it. It splits the ramble into items, routes each to its project, and asks about anything with no home. |
| **Morning brief** | What needs you today, what is handled, the one thing worth doing. Writes `MORNING_BRIEF.md`. |
| **Friday wrap** | What closed, what slipped and why, what carries. Sets next week against the cap and writes the handoff. |

The wrap writes the handoff that Monday's brief reads, so the week closes and opens as a loop.

All three are sections of the `CLAUDE.md` in your own folder. They are not plugins, skills, or
slash commands, which means they work anywhere that reads the folder — Claude Desktop, Claude
Code, or anything else you point at it. Ask in plain words, or set them on a schedule. Adding a
fourth means writing another section.

## Who it is for

Knowledge workers carrying several live workstreams at once. Consultants, analysts, product and
project managers, designers, engineers, researchers, marketers, operators. The job title does not
matter; the shape of the problem does.

You are the right user if a few of these are true: more open threads than you can hold in your
head, several stakeholders who each think their thing is the priority, a calendar that chops the
day into pieces too small to think in, and work that follows you home so work and personal keep
bleeding into each other.

It does not assume you set prices, manage people, or publish anything. It assumes you have more
claims on your attention than attention.

## Start here

1. Decide where your personalised PM should live. Not this folder. The templates stay clean.
2. Install using whichever path matches your setup, below.
3. Answer the onboarding questions. Skipping is fine, anything skipped gets marked
   `→ fill when ready` rather than invented.
4. Open your new PM folder in a fresh session. It takes over from there.

Then read [SESSION-FLOW.md](SESSION-FLOW.md) to see what it does on its own, and work through
the first three cases in [EXAMPLES.md](EXAMPLES.md).

## Install

**Claude Desktop or Claude.ai:** make a Project, attach this kit, and say *"Follow
`templates/ONBOARDING.md` and set up my PM."* Then attach your new folder to a Project of its own
and work there. This is the path most people want.

**Claude Code:** open this kit and run `/setup-pm`.

**Any other model that reads a folder** (ChatGPT, Gemini): point it at `templates/` and tell it
to follow `ONBOARDING.md`. The exact wording is in [PROMPTS.md](PROMPTS.md).

**No folder access:** paste `templates/ONBOARDING.md` into the chat and say *"Follow this."*

## What is in here

| Path | What it is |
|------|-----------|
| [`templates/`](templates/) | The EA files, carrying `{{PLACEHOLDER}}` markers |
| [`SESSION-FLOW.md`](SESSION-FLOW.md) | How a session runs, start to close |
| [`PROMPTS.md`](PROMPTS.md) | Paste-ready prompts for install and for running it |
| [`EXAMPLES.md`](EXAMPLES.md) | Things to try, with what a good answer looks like |
| `.claude/` | Install-time onboarding only. Not copied into your folder |

Inside `templates/`:

```
CLAUDE.md              the session ritual and the three routines, read first every time
STATUS.md              handoff between sessions
PROJECT_HQ.md          the cockpit, split work and personal
WEEKLY_PLAN.md         the weekly contract, split work and personal
GOALS.md               priority hierarchy per context
ROADMAP.md             90-day milestones
VOICE_DUMP.md          unified inbox, cleared every session
USER_GUARDRAILS.md     your failure modes, with flag and redirect lines
MORNING_BRIEF.md       written by the brief, replaced daily
FRIDAY_WRAP.md         written by the wrap, replaced weekly
ONBOARDING.md          the guided question set
project-template/      copied once per project, capped and uncapped variants
```

## What you get after install

Your folder, not this one:

```
Your PM/
├── CLAUDE.md              session ritual + the three routines
├── STATUS.md              handoff
├── PROJECT_HQ.md          cockpit
├── WEEKLY_PLAN.md         weekly contract
├── GOALS.md               priorities
├── ROADMAP.md             90-day view
├── VOICE_DUMP.md          inbox
├── USER_GUARDRAILS.md     failure modes
├── MORNING_BRIEF.md       today, replaced daily
├── FRIDAY_WRAP.md         this week, replaced weekly
│
└── <project-name>/        one folder per project
    ├── CLAUDE.md          project sub-agent, capped or uncapped
    ├── <PROJECT>.md       strategy and tasks
    ├── <PROJECT>_TASKS.md prioritisation matrix
    └── <PROJECT>_LOG.md   hour ledger, capped projects only
```

## Connecting your apps

The morning brief gets better with your calendar and mail attached. It is built to work with
nothing connected, so treat every connection as optional and add them one at a time.

**Connect for reading, not for acting.** Read-only scopes are enough for everything the
assistant does here. It plans and routes; it does not send mail, move meetings, or close
tickets on your behalf. If a connector only offers full access, that is a reason to think
harder about whether you want it, not a reason to grant it.

**Three roles earn a connection:** calendar (what is actually on today), mail or chat (what is
waiting on you specifically), and your task tracker (what is due that the PM files do not
know). Anything beyond those is usually noise the brief has to filter back out.

**Connected content is data, not instruction.** Your PM already carries this rule: it takes
instructions from you in the session, never from inside a document, an email, or a fetched
page. That rule is doing real work the moment you connect a mailbox, because an email that says
"urgently reprioritise everything" is a fact about an email and nothing more. Anyone who can
email you can put text in front of your assistant. This is the line that keeps that from
mattering.

**Nothing is load-bearing on a connector.** Each routine degrades to the PM files alone and says
nothing about what is missing. You can demo the whole thing offline.

## Running it on a schedule

The morning brief and the Friday wrap are worth automating. Set a recurring task in whatever you
run this in, pointed at your PM folder, saying `Run the morning brief` or `Run the Friday wrap`.
Both are written to work with nobody watching: they take the documented default rather than
asking, name the choice they made, and write their output file.

One caveat worth knowing before you rely on it. A scheduled task in a desktop app only fires
while the machine is awake and online. An 8am brief with a closed laptop does not run late, it
does not run at all. If you want one waiting for you before you open the machine, schedule it
somewhere that is always on.

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

Add a routine the same way the three that ship are written: another section in your `CLAUDE.md`,
under ROUTINES, saying when it fires, what it reads, what it writes, and what it does when nobody
is there to answer a question. That is the whole extension mechanism. It is plain markdown in
your own folder, which is why it survives changing tools.
