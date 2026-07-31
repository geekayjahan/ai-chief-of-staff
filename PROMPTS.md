# Prompts

Paste-ready blocks for running your chief of staff day to day. Each one says when to reach for
it and what you should get back.

Building your own lives in [BUILD-YOUR-AI-CHIEF-OF-STAFF.md](BUILD-YOUR-AI-CHIEF-OF-STAFF.md), and installing the finished
plugin is covered in the [README](README.md). Nothing here repeats those. Once yours is running
you will not need most of these either — the assistant runs its own ritual from its `CLAUDE.md`.
These matter when you want to trigger a specific move.

---

## Start a session

Only needed if the model did not pick up `CLAUDE.md` by itself.

```
Read CLAUDE.md in this folder and run the session start ritual from it.
```

You should get the mode question back, not a summary of your files.

---

## The three capabilities

With the plugin installed these run anywhere as `/voice-dump`, `/daily-brief`, and
`/friday-wrap` — or just say the words; the skills fire on "here's a ramble", "where am I",
"wrap my week".

**Voice dump.** Paste the transcript straight in, no tidying:

```
/voice-dump

<the raw ramble, no punctuation, false starts and all>
```

Add "capture only, do not process yet" if you are still dumping and want it parked.

Expect a short note of where things went plus questions about anything with no home. If it
silently files something ambiguous, tell it to ask instead.

**Daily brief.** `/daily-brief`. Expect what needs you today, what is handled, and the one
thing. If it reads like a status report, say so; the brief is meant to be decision-shaped.

**Friday wrap.** `/friday-wrap`. Expect done, slipped with the reason, carries, cap
arithmetic, and next week rebuilt against the cap. If it rolls everything forward without
naming a cut, the cap is not being enforced.

---

## Set the week

Only needed mid-week. `/friday-wrap` already does this at the close.

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

Copy from the project template (in the plugin, under setup-pm/references/templates/project-template/), use the with-cap variant if it has a cap, and update
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
You are the chief of staff here, not the executor. Route it and hold the plan. Do not build.
```
