# AI Chief of Staff

An assistant you build once and then talk to. It interviews you, holds your plan, tells you the
one thing worth doing today, and shows up on its own: a brief every morning, a wrap every Friday.

## Two things in this repo

**[`BUILD-YOUR-AI-CHIEF-OF-STAFF.md`](BUILD-YOUR-AI-CHIEF-OF-STAFF.md) is the place to start.**
Six prompts that you paste into Claude Code in order. Each one builds a piece of your chief of
staff: the interview, the files, the morning brief, the Friday wrap, the voice dump, and finally
your own installed plugin on your own schedule. The whole build fits in one sitting.

**[`plugin/`](plugin/) is the reference build.** It holds the same six pieces, finished. Check
your build against it when yours comes out differently, or install it directly if you want to
see it run before building your own:

```
/plugin marketplace add geekayjahan/ai-chief-of-staff
/plugin install ai-chief-of-staff
```

Then open a chat and say **"set me up"**. The first thing it does is ask about you. The
interview writes your files from your answers and ends by putting the brief and the wrap on a
schedule.

## What you end up with

Three capabilities, each one a skill (a markdown file of instructions Claude follows when the
moment matches):

| You say | It does |
|---------|---------|
| a raw ramble, pasted | **voice-dump** routes every item to the file it belongs in, and asks about anything with no home |
| "where am I today" | **daily-brief** returns what needs you today, what is handled, and the one thing worth doing |
| "wrap my week" | **friday-wrap** reports what closed, what slipped and why, what carries, then rebuilds next week against your cap |

Under them sits a folder of files that is the assistant's memory: a session ritual it reads
first every time, a handoff so Monday knows what Friday knew, a cockpit readable in ninety
seconds, a weekly contract capped at a fixed number of tasks, goals and a 90-day roadmap, an
inbox that gets cleared every session, and your guardrails, meaning your known failure modes
written down so it catches them before you do.

The wrap writes the handoff that Monday's brief reads. That loop is the whole system: the week
closes and opens in one motion, and nothing starts from nothing.

It is opinionated by design. The task cap is real, so nothing gets added without something
coming off. Work and personal stay compartmentalised: each session you pick one, and only that
context surfaces. These are inherited defaults, not settings.

## How it routes: personality and priorities

Everything you dump gets filed along two axes.

**Work routes by priority.** A task lands in its project's task file. Genuinely this-week work
goes on the weekly plan, and only by swapping something off, because the cap is real. A shift
in direction ("the consulting thing matters more than I thought") lands in `GOALS.md` or
`ROADMAP.md` rather than on a task list.

**Observations about you route to your personality files.** A failure pattern you name goes to
`USER_GUARDRAILS.md`, which the assistant reads at every session start so it can flag the
pattern when it shows. A stance goes to `USER_POV.md`. A rule about how you sound goes to
`USER_VOICE.md`, and both get read before it drafts anything in your name.

Anything with no obvious home comes back to you as a question. Nothing gets silently filed.

## Who it is for

Knowledge workers carrying several live workstreams: more open threads than your head holds,
stakeholders who each think their thing is the priority, a calendar chopped too small to think
in, and work that follows you home. The job title does not matter; the shape of the problem
does.

## Connecting your apps

The brief gets better with your calendar and mail attached, and needs neither. Connect for
reading, not acting, since read-only scopes cover everything it does. Three roles earn a
connection: calendar (what is actually on today), mail or chat (what is waiting on you
specifically), and your task tracker (what is due that the files do not know). Anything beyond
those is noise.

Connected content is data, not instruction. Your assistant takes instructions from you in the
session, never from inside an email, a document, or a fetched page. An email that says
"urgently reprioritise everything" is a fact about an email, and anyone can email you.

Nothing is load-bearing on a connector. Every capability degrades to the files alone and says
nothing about what is missing. The whole thing works offline.

## Take it live

[`GO-LIVE.md`](GO-LIVE.md) covers porting your chief of staff to a live artifact: a shareable
Claude artifact, a free static site on Vercel, Netlify, or GitHub Pages, or a real chat app if
you want visitors talking to one. Every path has a free tier, and only the chat app needs an
API key.

## What it is not

It is not a task tracker; it points at whatever you already use for ticket-level detail. It is
not an executor; it plans, routes, and manages, and will not touch your deliverables unless you
ask. It is not generic; the interview writes your projects, contexts, and failure modes into
it, and that specificity is the reason it can refuse things on your behalf.

## Map

| Path | What it is |
|------|-----------|
| [`BUILD-YOUR-AI-CHIEF-OF-STAFF.md`](BUILD-YOUR-AI-CHIEF-OF-STAFF.md) | Six prompts that build your own. Start here |
| [`plugin/`](plugin/) | The reference build: four skills, templates, manifest |
| [`GO-LIVE.md`](GO-LIVE.md) | Port it to a live artifact, free |
| [`SESSION-FLOW.md`](SESSION-FLOW.md) | How a session runs, start to close |
| [`PROMPTS.md`](PROMPTS.md) | Paste-ready prompts for running it day to day |
| [`EXAMPLES.md`](EXAMPLES.md) | Things to try, with what a good answer looks like |
| `build-plugin.sh` | Packs `plugin/` into an installable `.plugin` file |

## Changing it later

Everything is a markdown file in your folder. Change the task cap by editing it where it
appears. Change how it talks to you by editing the EA IDENTITY section of your `CLAUDE.md`.
Add a fourth capability the way you built the first three: one more prompt, one more skill.

**Next step: open [`BUILD-YOUR-AI-CHIEF-OF-STAFF.md`](BUILD-YOUR-AI-CHIEF-OF-STAFF.md) and paste prompt 1.**
