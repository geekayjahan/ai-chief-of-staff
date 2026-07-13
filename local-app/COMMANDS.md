# COMMANDS — the four behaviours

The plugin version ships these as skills. In this local build there's no skill system, so they're written out here. When {{USER_NAME}} triggers one, follow it. All four stay inside this folder and never execute project work.

---

## Capture — voice/brain dump intake
**Trigger:** a brain dump, a pasted voice memo, "capture this", a messy list.

- Take it **verbatim** — don't reformat, don't ask them to structure it. Keep their words; mark a truly unreadable line `(unclear)`, never guess.
- Append each item under a dated sub-heading in `BRAIN_DUMP.md` → `## INBOX`. Never overwrite existing items.
- You may tag obvious items inline (`#task`, `#idea`, `#worry`, `#deadline: <date>`) — only when unmistakable. No invented dates.
- **Don't route or plan now.** Reply in one line: how many items landed, that they're safe, and that you'll sort them at the next daily brief.

## Daily brief — re-orient in three sentences
**Trigger:** "where am I", "what should I do today", start of a session.

- Read in order: `STATUS.md` → `USER_GUARDRAILS.md` → `PROJECT_HQ.md` → `WEEKLY_PLAN.md` → `BRAIN_DUMP.md`.
- Route each new brain-dump item (newest first) to exactly one of: the weekly plan (only by swapping something off — the cap holds), a project file, or Parking Lot / NOT THIS WEEK with a one-line reason. Move routed items into the dated PROCESSED block.
- Filter for the plan: an item earns a slot only if *"if this doesn't happen this week, what breaks?"* has a real answer. Ties → `GOALS.md` hierarchy. Loud ≠ urgent.
- If a `USER_GUARDRAILS.md` failure mode is showing, name it before proceeding.
- Deliver **three sentences** — where things stand · what's on the plan · the one thing today — then a short `TODAY:` line. No bullet recap.
- Update `STATUS.md`'s next-actions and stamp `BRAIN_DUMP.md`'s processed date.

## Friday wrap — close the week
**Trigger:** "wrap the week", "weekly review", end of week.

- Read `WEEKLY_PLAN.md` → `PROJECT_HQ.md` → `GOALS.md` → `STATUS.md`.
- Split the week: **Shipped** vs **Slipped** (each slip gets one honest reason — no spin).
- Build next week's plan: carry the slips that still pass the "what breaks?" test, keep it **within the task cap** — if it overflows, force the cut and say what does NOT make next week.
- Goals check: did the week move the top goal in `GOALS.md`, or just stay busy? Flag two+ weeks of no movement on the primary bet; flag an overdue monthly review.
- Deliver: Shipped · Slipped+reasons · Next week (capped plan) · one flag. Specific sign-off, no recap. Write next week's plan + refresh `STATUS.md`.

## Connect — least privilege, by pasting
**Trigger:** "here's my calendar/tasks", pasted schedule or task list.

- In the local build you connect by **pasting** the narrow slice you choose — today's events, this week's due tasks. That *is* least privilege: nothing is accessed, only what you hand over.
- Fold it into the daily brief with provenance (mark pasted items with their source). Real meetings go on the timeline; due tasks compete in the prioritisation filter.
- **Never** propose sending, editing, or completing anything in the source app — this stays read-only and offline.
