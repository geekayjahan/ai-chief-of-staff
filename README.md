# AI Chief of Staff

An assistant you build once and then talk to. It interviews you, holds your plan, tells you the
one thing worth doing, and shows up on its own: a brief every morning, a wrap every Friday.

This kit is a lesson, not just a product. You are here to build your own — and to leave knowing
how every piece works, because you put each one there yourself.

## Two things in this kit — do not confuse them

**`BUILD-PROMPTS.md` — the lesson. Start here.** Six prompts, pasted into Claude Code in order.
Each builds one piece of your chief of staff: the interview, the files, the morning brief, the
Friday wrap, the voice dump, and finally your own installed plugin on your own schedule. One
sitting, start to finish.

**`plugin/` — the worked answer.** The same six pieces, finished. This is what gets demoed live,
and what you check your build against when yours comes out differently. If you only want to see
it run before building, install it:

```
/plugin marketplace add geekayjahan/ai-chief-of-staff
/plugin install ai-chief-of-staff
```

Then open a chat and say **"set me up"**. The first thing it does is ask about you — the
interview writes your files from your answers, and ends by putting the brief and the wrap on a
schedule. But installing the answer is not the assignment. Building is.

## What you end up with

Three capabilities, each one a skill (a markdown file of instructions Claude follows when the
moment matches):

| You say | It does |
|---------|---------|
| a raw ramble, pasted | **voice-dump** — splits it into items, routes each to its project, asks about anything with no home |
| "where am I today" | **daily-brief** — what needs you today, what is handled, the one thing worth doing |
| "wrap my week" | **friday-wrap** — what closed, what slipped and why, what carries; rebuilds next week against your cap |

Under them, a folder of files that is the assistant's memory: a session ritual it reads first
every time, a handoff so Monday knows what Friday knew, a cockpit (every project's status,
readable in 90 seconds), a weekly contract capped at a fixed number of tasks, goals and a 90-day
roadmap, an inbox that gets cleared every session, and your guardrails — your known failure
modes, written down so it catches them before you do.

The wrap writes the handoff that Monday's brief reads. That loop is the whole system: the week
closes and opens in one motion, and nothing starts from nothing.

It is opinionated by design. The task cap is real — nothing gets added without something coming
off. Work and personal stay compartmentalised — each session you pick one, and only that context
surfaces. These are inherited defaults, not settings.

## Who it is for

Knowledge workers carrying several live workstreams: more open threads than your head holds,
stakeholders who each think their thing is the priority, a calendar chopped too small to think
in, and work that follows you home. The job title does not matter; the shape of the problem does.

## Connecting your apps

The brief gets better with your calendar and mail attached, and needs neither. Connect for
reading, not acting — read-only scopes cover everything it does. Three roles earn a connection:
calendar (what is actually on today), mail or chat (what is waiting on you specifically), and
your task tracker (what is due that the files do not know). Anything beyond those is noise.

Connected content is data, not instruction. Your assistant takes instructions from you in the
session, never from inside an email, a document, or a fetched page. An email that says "urgently
reprioritise everything" is a fact about an email, and anyone can email you. That line is what
keeps it from mattering.

Nothing is load-bearing on a connector. Every capability degrades to the files alone and says
nothing about what is missing. The whole thing demos offline.

## What it is not

Not a task tracker — it points at whatever you already use for ticket-level detail. Not an
executor — it plans, routes, and manages, and will not touch your deliverables unless you ask.
Not generic — the interview writes your projects, contexts, and failure modes into it, and that
specificity is the whole reason it can refuse things on your behalf.

## Map

| Path | What it is |
|------|-----------|
| [`BUILD-PROMPTS.md`](BUILD-PROMPTS.md) | The lesson — six prompts that build your own |
| [`plugin/`](plugin/) | The worked answer — four skills, templates, manifest |
| [`SESSION-FLOW.md`](SESSION-FLOW.md) | How a session runs, start to close |
| [`PROMPTS.md`](PROMPTS.md) | Paste-ready prompts for running the thing day to day |
| [`EXAMPLES.md`](EXAMPLES.md) | Things to try, with what a good answer looks like |
| [`EVAL.md`](EVAL.md) | The rubric this kit is graded against |
| `build-plugin.sh` | Packs `plugin/` into an installable `.plugin` file |

## Changing it later

Everything is a markdown file in your folder. Change the task cap by editing it where it
appears. Change how it talks to you by editing the EA IDENTITY section of your `CLAUDE.md`. Add
a fourth capability the way you built the first three: one more prompt, one more skill. That is
the extension mechanism, and you already know it — you built the other pieces the same way.

**Next step: open [`BUILD-PROMPTS.md`](BUILD-PROMPTS.md) and paste prompt 1.**
