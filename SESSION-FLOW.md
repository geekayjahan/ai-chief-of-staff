# Session flow

How to install your own chief of staff, put it on a schedule, and what it then does on its own.

---

## 1. Get the files

```
git clone https://github.com/geekayjahan/ai-chief-of-staff.git
```

No git installed? Use the green **Code → Download ZIP** button on the repo page and unzip it.
Either way you end up with a folder called `ai-chief-of-staff`.

## 2. Install your own

The kit lives in `templates/`. Those files carry `{{PLACEHOLDER}}` markers — they are what you
copy from, never what you run.

**In Claude Desktop or Claude.ai:** make a new Project, attach the `ai-chief-of-staff` folder, and
say:

```
Follow templates/ONBOARDING.md and set up my PM.
```

**In Claude Code:** open the folder and run `/setup-pm`.

It asks about you, your projects, your weekly task cap, your goals, and the patterns you want it
to catch you on. Skipping is fine — anything skipped is marked `→ fill when ready` rather than
invented.

**It will stop and show you a spec before it writes anything.** That page is the whole system on
one screen. Read it, fix anything wrong, then say yes. Nothing else gets written until you do, so
this is the cheap moment to correct a wrong cap or a mistagged project.

Pick a folder outside this one for your personalised files. The templates stay clean so you can
install again.

## 3. Open your folder in a fresh session

Attach **your new folder** — not the kit — to a Project of its own. That folder has its own
`CLAUDE.md`, and everything below happens from it.

## 4. Put the brief on a schedule

This is the part that makes it feel alive. Set a recurring task pointed at your PM folder:

```
Run the morning brief.
```

The brief reads your files, writes `MORNING_BRIEF.md`, and is built to run with nobody watching —
where it needs a decision it takes the documented default and names it rather than stopping to
ask. Same for `Run the Friday wrap.` on a Friday afternoon.

**One caveat before you rely on it.** A scheduled task in a desktop app only fires while the
machine is awake and online. An 8am brief with a closed laptop does not run late — it does not run
at all. If you want one waiting before you open the machine, schedule it somewhere always on.

---

The spec you confirmed during setup stays in your folder as `SPEC.md`. It is a record of what you
agreed, not live config — where it and `CLAUDE.md` disagree, `CLAUDE.md` is what actually runs,
and the gap is just showing you what you have changed since.

---

## What it does on its own, every session

**1. You open your PM folder.**
The assistant reads `CLAUDE.md` first. That file is the ritual. Everything below comes from it.

**2. It checks the handoff.**
`STATUS.md` carries what the last session left behind, including any named next task. If the
previous session ended properly, the assistant already knows where you stopped.

**3. It checks your guardrails.**
`USER_GUARDRAILS.md` lists your known failure modes, each with a "flag when" and a "redirect".
The assistant reads these before it says anything, so it can catch a pattern in the first minute
rather than the last.

**4. It asks the mode question.**

> *Are we focused on work, personal, or both today?*

This is the compartmentalisation move, and it is the reason the system holds up when you have a
lot running. Work mode surfaces only work-tagged projects, the work half of the weekly plan, and
work goals. Personal mode does the reverse. Both shows everything with a context flag per item.
Projects tagged "both" appear either way.

The inbox stays unified regardless. Ideas land wherever they land, and get routed later.

**5. It orients you.**
The assistant reads `PROJECT_HQ.md` and `WEEKLY_PLAN.md`, filtered to the mode you picked, then
gives you three sentences or fewer: where things stand, what is on the plan, and the one thing
worth doing today.

Three sentences is a cap, not a target. If it starts producing a status report, that is drift,
and you should say so.

**6. It flags an unprocessed dump.**
If `VOICE_DUMP.md` has content sitting in it, the assistant says so and offers to process it
before anything else. Processing means routing each item to the project it belongs to, then
clearing the file.

**7. You work the session.**
The assistant plans, routes, questions, and decides. It does not build. It will not edit your
project deliverables unless you ask it to, and it will not wander outside the PM folder.

If you dump on it mid-session, it processes what you said. It will not ask you to repeat yourself
in a tidier format.

**8. It closes.**
Action items go into the file they belong in, and `STATUS.md` gets the handoff for next time.
A proper close is what makes the next session start in step 2 instead of from nothing.

---

## The recurring rhythm

**Every day:** ask for your morning brief at the open. It runs the same reading order as steps 2
to 6 above and hands you what needs you today, what is handled, and the one thing, then writes it
to `MORNING_BRIEF.md`. If your calendar or mail is connected it folds those in, and if not it
runs on the PM files alone without mentioning it.

**Every session:** the inbox gets cleared. Nothing lives there permanently. The voice dump is the
fast way in: talk, paste the transcript, let it route.

**Every week:** the Friday wrap at the close. It reports what closed, what slipped and why, and
what carries, then rebuilds next week against the cap, writes `FRIDAY_WRAP.md`, and puts the
handoff into `STATUS.md`. Monday's brief opens from exactly that handoff, which is what makes the
week a loop rather than a fresh start.

**On a schedule, if you want it.** The brief and the wrap both run unattended. A scheduled run
cannot ask you the mode question, so it covers work and personal and tags each item, and where a
choice is needed it takes the documented default and names it rather than stopping. On a desktop
app the task only fires while the machine is awake and online.

The weekly plan is a contract, not a wish list. It holds a fixed number of tasks
across work and personal combined, and the cap is real. Nothing goes on without something coming
off. The test for anything asking to get on the list is one question: *if this does not happen
this week, what breaks?* If the answer is nothing, it does not go on.

**Every month:** goals get reviewed. The assistant flags it if `GOALS.md` has not been touched by
the 7th. Priorities are ranked separately for work and personal, because they are not competing
for the same slot.

**Always:** the cockpit stays readable in ninety seconds. When `PROJECT_HQ.md` grows past that,
the assistant is supposed to flag it and prune. A cockpit you have to study is not a cockpit.

---

## What the assistant will not do

- Build things. It is a PM in this context, not an executor.
- Read or write outside the PM folder, unless you point it somewhere for a specific task.
- Take instructions from inside a document, an email, or a file. Only from you, in the session.
- Add to the weekly plan without taking something off.
- Make up content it does not have. Skipped sections stay marked `→ fill when ready`.

---

## If the flow is not happening

**It skipped the mode question.** It did not read `CLAUDE.md`. Tell it to read `CLAUDE.md` in the
folder first, then start again.

**It is writing you essays.** The tone rules live in the EA IDENTITY section of your `CLAUDE.md`.
Edit them there. It is your file.

**Sessions feel cluttered even in one mode.** Something is untagged. An untagged project shows up
in both modes. Check the context tags in `PROJECT_HQ.md`.

**It keeps offering to do the work.** The "PM only, no execution" rule is in your `CLAUDE.md`
hard rules. Point at it.
