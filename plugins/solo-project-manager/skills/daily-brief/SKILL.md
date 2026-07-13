---
name: daily-brief
description: Produces the morning re-orientation — reads the user's state files and unprocessed brain dump, routes new items, and gives a three-sentence brief plus today's one focus. Use when the user says "daily brief", "where am I", "what should I do today", "re-orient me", "morning brief", "catch me up", or starts a working session and wants their bearings.
---

# Daily brief — re-orient in three sentences

## What this skill does

The core loop. Reads the plan, folds in anything new from the brain dump, and hands the user their bearings: where things stand, what's on the plan, and the single thing to do today. Built to be read in under a minute — the antidote to opening five tools and reassembling reality by hand.

## Run order

1. **Read state first, in this order:** `STATUS.md` (handoff + next actions) → `USER_GUARDRAILS.md` (failure modes to watch) → `PROJECT_HQ.md` (cockpit) → `WEEKLY_PLAN.md` (this week's contract) → `BRAIN_DUMP.md` (anything captured since last time).

2. **Route the new captures — newest first.** For each unprocessed item in the brain dump's INBOX, do exactly one of:
   - put it on `WEEKLY_PLAN.md` (only if it passes the filter below, and only by swapping something off — the cap holds),
   - hand it to a project file,
   - or drop it into the Parking Lot / `NOT THIS WEEK` with a one-line reason.
   Then move it out of INBOX into the dated `PROCESSED` block. Never invent a deadline the user didn't give.

3. **Apply the prioritisation filter.** An item earns a spot on this week's plan only if the answer to *"if this doesn't happen this week, what breaks?"* is something real. If the answer is "nothing," it goes to Parking Lot, not the plan. Break ties with the `GOALS.md` hierarchy. Loud ≠ urgent: tone of voice never outranks what actually breaks.

4. **Flag a guardrail if one is showing.** If the session or the dump matches a failure mode in `USER_GUARDRAILS.md` (too many threads open, chasing an exciting non-priority, strategic work on a low-energy day), name it plainly before moving on — don't just comply.

5. **Deliver the brief — three sentences, then the focus.** Exactly:
   - one sentence: **where things stand**,
   - one sentence: **what's on the plan this week**,
   - one sentence: **the one thing to do today**.
   Then a short `TODAY` line naming that one task and (if any) the 1–2 runners-up. Nothing longer. No bullet-point recap of what you just read.

6. **Write the handoff.** Update `STATUS.md` `WHAT'S NEXT IN ORDER` so tomorrow's brief starts clean, and stamp the brain dump's `Last processed` date.

## Rules

- **Three sentences is the contract.** If the brief runs longer, the cockpit has drifted — prune it, don't pad the brief.
- **The cap is inviolable.** Routing into the weekly plan always swaps, never grows it past the weekly task cap set in `WEEKLY_PLAN.md`.
- **Re-orient, don't execute.** Point at the work; don't do the project work here.
- **Stay in the folder.** Read/write only the PM files.
