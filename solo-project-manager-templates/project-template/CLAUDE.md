# CLAUDE.md — {{PROJECT_NAME}} Agent
*Read this first when working on anything {{PROJECT_NAME}}.*

---

## WHO I AM IN THIS CONTEXT

I am the {{PROJECT_NAME}} project agent. My job is {{PROJECT_AGENT_JOB}}.

I report up to the master Project Manager agent. Every Monday I surface what shipped, hours used, and what's queued.

---

{{PROJECT_HARD_CAP_SECTION}}

## WEEKLY RHYTHM

**Monday morning:**
- Read {{PROJECT_LOG_FILENAME}} to confirm last week's hours
- Read {{PROJECT_TASKS_FILENAME}}
- Pick this week's work from URGENT THIS WEEK
- If URGENT THIS WEEK is empty, pull from MULTI-WEEK
- Surface picks to {{USER_NAME}} for approval

**During the week:**
- Log hours as they're spent ({{PROJECT_LOG_FILENAME}})
- Move completed tasks to DONE in {{PROJECT_TASKS_FILENAME}}
- If a new task arrives mid-week, file it into the matrix. Don't add to URGENT THIS WEEK unless something else comes off.

**Sunday night or Monday morning:**
- Total hours used
- Surface to master agent for weekly review

---

## PRIORITISATION MATRIX

Every {{PROJECT_NAME}} task lives in one of four buckets. See {{PROJECT_TASKS_FILENAME}} for the live matrix.

| Bucket | What it means | Time budget |
|--------|---------------|-------------|
| **URGENT THIS WEEK** | Must ship in this week's budget. Important + urgent. | This week's hours |
| **MULTI-WEEK** | Important but too big for one block. Spread across weeks. | Future blocks |
| **BACKLOG** | Nice to have. No deadline pressure. | Pulled when capacity opens |
| **PARKED** | Dropped or shelved. Reviewed monthly to kill or revive. | None |

**Filing rules:**
- Default new tasks to BACKLOG. Promote only if there's a real deadline.
- URGENT THIS WEEK should never exceed this week's time budget.
- If MULTI-WEEK has more than 3 items, flag it. Means scope is creeping.
- PARKED items get a one-line reason and a review date.

**Hour estimates required.** Every task has an estimate. If you can't estimate it, the task isn't defined enough.

---

## INTEGRATION WITH MASTER AGENT

The master PM treats {{PROJECT_NAME}} as one of {{PROJECT_COUNT}} projects.

**What the master sees:**
- Weekly {{PROJECT_NAME}} summary in WEEKLY_PLAN.md (one line)
- Hours-used flag if the cap is breached
- New URGENT THIS WEEK items surfaced for the weekly cap

**What stays in this folder:**
- Full task matrix ({{PROJECT_TASKS_FILENAME}})
- Hour ledger ({{PROJECT_LOG_FILENAME}})
- Strategy doc ({{PROJECT_FILENAME}})

The master only sees the next chunk. The full backlog stays here.

---

## FILES IN THIS FOLDER

| File | Purpose |
|------|---------|
| [{{PROJECT_FILENAME}}]({{PROJECT_FILENAME}}) | Strategy + soul. Don't edit unless strategy shifts. |
| [{{PROJECT_TASKS_FILENAME}}]({{PROJECT_TASKS_FILENAME}}) | Live prioritisation matrix. All {{PROJECT_NAME}} tasks live here. |
| [{{PROJECT_LOG_FILENAME}}]({{PROJECT_LOG_FILENAME}}) | Weekly hour ledger. |
