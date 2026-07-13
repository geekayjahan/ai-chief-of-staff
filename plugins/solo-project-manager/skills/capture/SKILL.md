---
name: capture
description: Captures a brain dump or voice dump into BRAIN_DUMP.md without forcing the user to structure it. Use when the user says "brain dump", "capture this", "here's what's on my mind", "dumping", "quick note", "add to my brain dump", pastes a voice-memo transcript, or offloads a messy list of tasks/ideas/worries. This only INTAKES — routing happens later during the daily brief.
---

# Capture — voice/brain dump intake

## What this skill does

Takes whatever the user offloads — a voice-memo transcript, a paragraph, a scattered list — and files it into `BRAIN_DUMP.md` verbatim, timestamped, with zero pressure to structure it. Sorting and routing are NOT this skill's job; they happen when the user runs the daily brief. The point is to make offloading frictionless so nothing stays stuck in their head.

## Run order

1. **Take the dump as-is.** Do not interrogate it, reformat it, or ask the user to categorise. If they spoke it, keep their words. One light touch only: if a line is truly unintelligible, keep it verbatim and mark it `(unclear)` — never guess.

2. **Append to the INBOX.** Open `BRAIN_DUMP.md`, find the `## INBOX` section, and append each item as its own bullet under a dated sub-heading (`### <today's date> HH:MM`). Never overwrite existing inbox items. Never move anything out of the inbox here.

3. **Light pass, no decisions.** As you write, you may *tag* an item inline if it's obvious — `#task`, `#idea`, `#worry`, `#deadline: <date>` — but only when unmistakable from the words themselves. Tagging is a hint for later routing, not a commitment. When in doubt, leave it untagged.

4. **Confirm in one line, then stop.** Reply with a single sentence: how many items landed and that they're safe in the brain dump — e.g., "Got it — 6 things in the brain dump; I'll sort them into your plan next time you run the daily brief." Do not orient, plan, or route now. Do not produce a summary of what you did.

## Rules

- **Capture ≠ process.** Never route items to `WEEKLY_PLAN.md`, project files, or `GOALS.md` from this skill. That's the daily brief's job, and it respects the weekly task cap. Mixing them here would sneak work past the cap.
- **Verbatim wins.** The user's raw words are the record. Don't polish, don't AI-rewrite, don't dedupe.
- **Stay in the folder.** Only `BRAIN_DUMP.md` is touched.
- **No new deadlines.** If the user didn't state a date, don't invent one — leave the item dateless.
