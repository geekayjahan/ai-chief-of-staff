---
name: friday-wrap
description: Runs the end-of-week review — what shipped, what slipped, rolls unfinished work into next week without breaking the task cap, and nudges a goals check. Use when the user says "Friday wrap", "wrap the week", "weekly review", "close out the week", "how did this week go", or it's the end of a working week.
---

# Friday wrap — close the week, set up the next

## What this skill does

The bookend to the daily brief. Closes the loop on the week so the user isn't rebuilding the plan from memory on Monday: names what shipped, faces what slipped, rolls the unfinished into next week *under the cap*, and checks whether the week moved the actual goals.

## Run order

1. **Read:** `WEEKLY_PLAN.md` (this week's contract) → `PROJECT_HQ.md` (cockpit + focus) → `GOALS.md` (hierarchy + 90-day horizon) → `STATUS.md`.

2. **Score the week honestly.** Split this week's tasks into:
   - **Shipped** — done, checked off.
   - **Slipped** — not done. For each, one plain reason (blocked · mis-estimated · deprioritised · avoided). No spin.

3. **Roll forward under the cap.** Build next week's `WEEKLY_PLAN.md`:
   - Carry slipped must-dos that still pass *"if this doesn't happen next week, what breaks?"*
   - Everything must fit within `{{WEEKLY_TASK_CAP}}`. If the carried-over work plus new commitments exceed it, the wrap's job is to force the cut — say explicitly what does NOT make next week and goes to Parking Lot. Do not quietly exceed the cap.
   - Roughly half must-dos, half nice-to-haves, per the plan's own rule.

4. **Goals check.** Ask one question: did this week move the top goal in `GOALS.md`, or just stay busy? If two-plus weeks have passed with no movement on the primary bet, flag it — that's the failure this system exists to catch. If `GOALS.md` hasn't been reviewed this month (past the 7th), say so.

5. **Deliver the wrap — short.** A tight readout: **Shipped** (list), **Slipped** (list + reasons), **Next week** (the new capped plan), **One flag** (the single most important thing to watch). Then a specific sign-off tied to what's actually happening next week — not a recap of this skill's steps.

6. **Write it down.** Save next week's plan to `WEEKLY_PLAN.md`, refresh `PROJECT_HQ.md`'s focus table, and update `STATUS.md` so Monday's daily brief starts from a real handoff. Log a one-line entry in `GOALS.md`'s change log only if the hierarchy actually shifted.

## Rules

- **The cap governs next week too.** A wrap that rolls everything forward and blows past `{{WEEKLY_TASK_CAP}}` has failed — forcing the cut is the point.
- **No spin on slippage.** Name the real reason; the user can't fix a week they can't see straight.
- **Plan, don't execute.** Set up next week; don't start doing it.
- **Stay in the folder.**
