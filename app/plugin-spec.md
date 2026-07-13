# AI Chief of Staff — plain-English spec

*This is the whole spec. The live build turns it into a Claude plugin, one capability at a time. No code.*

## Who it's for

A super-IC juggling several projects at once — someone hustling to leave a 9–5, switch jobs, or run their own thing — who needs one place to hash out priorities instead of a Notion sprawl. Built to be gentle on a neurodivergent working style: talk at it, and it does the sorting.

## What it does (four capabilities, built in this order)

1. **Capture** — I dump whatever's in my head (a voice memo, a paragraph, a list). The assistant files it into my brain dump without making me structure it.
2. **Daily brief** — I ask "where am I?" and it re-orients me in three sentences: where things stand, what's on the plan, the one thing to do today. It pulls the newest capture in first.
3. **Friday wrap** — end of week, it tells me what shipped, what slipped, rolls the unfinished into next week *without breaking the weekly task cap*, and nudges a goals check.
4. **Connect (least privilege)** — it can read from one app I already use (a calendar or task list) to sharpen the brief — read-only, one app, nothing it doesn't need. It never gets more access than the job requires.

## The one rule on integration

Connect without handing the assistant the keys. Least access that does the job: read-only over write, one app over all of them, a scoped view over the whole account. The default is no access; each connection is a deliberate, narrow grant.

## What it is not

Not an executor — it plans, sorts, and re-orients; it doesn't do the project work for me. Not a database or a web app. Not a system that needs Claude Code or a terminal to run.

## Two ways it ships

- **As a Claude plugin** — install it into Claude Desktop, run guided onboarding, and it lives there.
- **As a local app** — for anyone without Claude Code or Claude Desktop: the same thing as a plain folder you paste into any chat assistant (ChatGPT, Gemini, Claude.ai). Same behavior, no install.

## Done means

I can talk at it in the morning and walk away knowing the one thing that matters today — and on Friday it closes the loop without me rebuilding the plan by hand.
