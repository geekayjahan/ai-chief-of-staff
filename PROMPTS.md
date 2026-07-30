# Prompts

Paste-ready blocks for installing the assistant and running it. Each one says when to reach for
it and what you should get back.

Once your PM is installed you will not need most of these. The assistant runs its own ritual from
its `CLAUDE.md`. These matter when you are on a platform that does not auto-read that file, or
when you want to trigger a specific move.

---

## Install

The canonical install prompt is the block at the top of `templates/ONBOARDING.md`. It is kept in
one place on purpose, so it never drifts from the phases underneath it. What changes is how you
hand it over.

**Claude Desktop or Claude.ai:** make a Project, attach this kit, and use the block below.

**Claude Code:**

```
/setup-pm
```

**Anything that reads a folder:** upload or point at the `templates/` folder, then:

```
This folder contains my Project Manager templates. Open ONBOARDING.md and follow the
instructions in it. Walk me through the phases one at a time, and do not move on until I have
answered. When we are done, write the personalised files and tell me where they are.
```

**No folder access at all:** paste the contents of `templates/ONBOARDING.md` into the chat and
say `Follow this.` You will get the filled files back as chat output to save yourself.

Before you start, decide where the personalised files should live. It should not be the kit
folder. The templates stay clean so you can install again later.

---

## Start a session

Only needed if the model did not pick up `CLAUDE.md` by itself.

```
Read CLAUDE.md in this folder and run the session start ritual from it.
```

You should get the mode question back, not a summary of your files.

---

## The three routines

These live in your `CLAUDE.md`, so asking in plain words is enough. There is nothing to install
and no command syntax to remember. If the assistant does not seem to know a routine, it has not
read `CLAUDE.md` — tell it to, and try again.

**Voice dump.** Paste the transcript straight in, no tidying:

```
Voice dump.

<the raw ramble, no punctuation, false starts and all>
```

Add "capture only, do not process yet" if you are still dumping and want it parked.

Expect a short note of where things went plus questions about anything with no home. If it
silently files something ambiguous, tell it to ask instead.

**Morning brief.** `Run the morning brief.` Expect what needs you today, what is handled, and the
one thing, written to `MORNING_BRIEF.md`. If it reads like a status report, say so; the brief is
meant to be decision-shaped.

**Friday wrap.** `Run the Friday wrap.` Expect done, slipped with the reason, carries, cap
arithmetic, and next week rebuilt against the cap, written to `FRIDAY_WRAP.md` with the handoff
in `STATUS.md`. If it rolls everything forward without naming a cut, the cap is not being
enforced.

Both of these are the ones worth putting on a schedule. Same wording, pointed at your folder.

---

## Set the week

Only needed mid-week. The Friday wrap already does this at the close.

```
Set this week's plan. Hold the cap. For anything you are putting on, tell me what comes off.
```

---

## Monthly goal review

```
Review GOALS.md. For each project, is the 90-day horizon still true? Where has the priority
order actually changed, based on what happened this month rather than what I said last month.
```

---

## Add a project

```
Add a new project: <name>. It is <work / personal / both>. <One line on what it is and why it
matters.> <Hours cap, if it has one.>

Copy from templates/project-template/, use the with-cap variant if it has a cap, and update
PROJECT_HQ.md, GOALS.md, and the KEY FILES table in CLAUDE.md so it is wired in.
```

The last sentence is the part people forget. A project folder that nothing links to is invisible
to the assistant at session start.

---

## Re-orient after time away

```
I have been away. Do not summarise everything. Tell me what changed, what is now late, and the
first thing I should pick up.
```

---

## Fixing the assistant

**It is inventing content during onboarding:**

```
Do not invent content. Leave anything I skipped as → fill when ready.
```

**Placeholders survived the install:**

```
Scan every file in this folder for unfilled {{PLACEHOLDER}} markers. Fill them or replace them
with → fill when ready.
```

**It is doing the work instead of managing it:**

```
You are the PM here, not the executor. Route it and hold the plan. Do not build.
```
