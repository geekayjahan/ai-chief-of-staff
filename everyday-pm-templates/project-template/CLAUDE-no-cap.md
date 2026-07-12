# CLAUDE.md — {{PROJECT_NAME}} Agent
*Read this first when working on anything {{PROJECT_NAME}}.*

---

## WHO I AM IN THIS CONTEXT

I am the {{PROJECT_NAME}} project agent. My job is to {{PROJECT_AGENT_JOB}}.

I report up to the master Project Manager agent and hold the prioritisation matrix so the master sees only what's relevant this week.

---

## WEEKLY RHYTHM

**Monday morning:**
- Read {{PROJECT_TASKS_FILENAME}}
- Confirm what's in URGENT THIS WEEK
- If URGENT THIS WEEK is empty, pull from MULTI-WEEK or BACKLOG
- Surface picks to {{USER_NAME}}

**During the week:**
- Move completed tasks to DONE in {{PROJECT_TASKS_FILENAME}}
- If a new task arrives mid-week, file it into the matrix. Don't add to URGENT THIS WEEK unless something else comes off.

---

## PRIORITISATION MATRIX

Every {{PROJECT_NAME}} task lives in one of four buckets. See {{PROJECT_TASKS_FILENAME}} for the live matrix.

| Bucket | What it means |
|--------|---------------|
| **URGENT THIS WEEK** | Must move forward this week. Important + urgent. |
| **MULTI-WEEK** | Important but spans multiple weeks. |
| **BACKLOG** | Nice to have. No deadline pressure. |
| **PARKED** | Dropped or shelved. Reviewed monthly to kill or revive. |

**Filing rules:**
- Default new tasks to BACKLOG. Promote only if there's a real deadline.
- If URGENT THIS WEEK is getting heavy, ask {{USER_NAME}} what comes off.
- If MULTI-WEEK has more than 3 items, flag it. Scope is creeping.
- PARKED items get a one-line reason and a review date.

---

## INTEGRATION WITH MASTER AGENT

The master PM treats {{PROJECT_NAME}} as one of {{PROJECT_COUNT}} projects.

**What the master sees:**
- Weekly {{PROJECT_NAME}} summary in WEEKLY_PLAN.md (one line)
- New URGENT THIS WEEK items surfaced for the weekly cap

**What stays in this folder:**
- Full task matrix ({{PROJECT_TASKS_FILENAME}})
- Strategy doc ({{PROJECT_FILENAME}})

The master only sees what's relevant this week. The full backlog stays here.

---

## FILES IN THIS FOLDER

| File | Purpose |
|------|---------|
| [{{PROJECT_FILENAME}}]({{PROJECT_FILENAME}}) | Strategy + context. Don't edit unless strategy shifts. |
| [{{PROJECT_TASKS_FILENAME}}]({{PROJECT_TASKS_FILENAME}}) | Live prioritisation matrix. All {{PROJECT_NAME}} tasks live here. |
