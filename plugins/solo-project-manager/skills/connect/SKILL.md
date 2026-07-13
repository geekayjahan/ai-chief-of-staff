---
name: connect
description: Pulls context from ONE app the user already uses (calendar or task list) into the daily brief, read-only and least-privilege. Use when the user says "connect my calendar", "pull in my tasks", "check my schedule", "use my [app]", or wants the brief to reflect what's actually on their day. Enforces least access — never more reach than the job needs.
---

# Connect — one app, read-only, least privilege

## What this skill does

Sharpens the daily brief with real signal from one app the user already lives in — today's calendar, or an external task list — without handing the assistant broad reach into their accounts. The guarantee students should walk away with: *you can connect an assistant to your apps without giving it the keys.*

## The least-privilege rule (the whole point)

Every connection follows four defaults. State them to the user the first time they connect:

1. **Default deny.** No app is reachable until the user deliberately connects it. Nothing is assumed.
2. **Read-only over write.** This skill only *reads*. It never sends an email, edits an event, or completes a task. If a connector only offers read+write, use the read calls exclusively and say so.
3. **One app, not all.** Connect the single app that sharpens today's brief — usually the calendar. Don't chain into everything because you can.
4. **Scoped over total.** Pull the narrow slice the brief needs (today's events; tasks due this week), not the whole history. Ask for the smallest window that answers the question.

If a step would need more than the above, stop and tell the user what extra access it wants and why — let them grant it deliberately, or decline.

## Run order

1. **Confirm the one app + the slice.** "I'll read *today's* calendar events, read-only. Nothing else, nothing written. OK?" Get a yes before reading.
2. **Read the narrow slice.** Fetch only what was agreed (e.g., today's events with times and titles; or tasks due ≤ this week). Make no write calls of any kind.
3. **Fold it into the brief, with provenance.** Hand the result to `daily-brief` as extra context: put real meetings on the timeline, let due external tasks compete in the prioritisation filter. Mark each pulled-in item with its source so the user can see where it came from.
4. **Name what you touched.** Close by stating plainly what was accessed and that nothing was written — e.g., "Read 4 events from today's calendar; no other access, nothing changed."

## Rules

- **Never write.** Creating, editing, sending, completing, or deleting anything in a connected app is out of scope for this skill, always.
- **No scope creep.** One app, one narrow window, per the user's yes. Widening access is a new, explicit ask.
- **Provenance on every pulled item.** If it came from an app, the brief says so.
- **Degrade gracefully.** No connector available? Say so and run the brief on the PM files alone — the assistant works fully offline.
