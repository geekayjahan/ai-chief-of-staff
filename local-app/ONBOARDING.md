# Onboarding — Solo Project Manager

Paste this file (or the prompt below) into Claude, ChatGPT, Gemini, or any LLM that can read your folder. The model will walk you through the questions and fill in the templates.

## Prompt to give the model

> You are helping me set up a personal Project Manager system in this folder. The templates have `{{PLACEHOLDER}}` markers. Walk me through the onboarding questions below in order. Ask one phase at a time. Don't move on until I've answered. When I've answered all phases, fill in every template file by substituting placeholders and writing my answers into the prose sections. Never make up content — if I skip a section, leave a `→ fill when ready` marker. Once done, summarise what was written and where, and tell me to open this folder in a fresh session.

## The onboarding phases

### Phase 0 — Pick the install folder
If you're running this in a separate folder from the templates, confirm where the personalised files should be written. Otherwise the templates get overwritten in place.

### Phase 1 — You
1. What should I call you?
2. Describe yourself in one or two sentences — role, mode of working, key trait.
3. Anything important about how you work or communicate? (energy patterns, voice input, neurodivergence, communication preferences, anything the PM should adapt to)

### Phase 2 — Your projects
For each active project:
- Name
- Optional emoji
- One-line role in your portfolio (revenue engine / authority / credibility / internal / distribution / other)
- Partner (solo or named)
- Working directory (where the actual project files live)
- Priority rank (1 = top)
- Does it have a hard weekly time cap? If yes, how many hours? (Capped projects get their own sub-agent that defends the cap.)

### Phase 3 — Rules of the cockpit
1. Weekly task cap? (default 7)
2. When does the brain dump get processed? (default: each session)
3. Any extra hard rules you want enforced?

### Phase 4 — Goals and roadmap
1. For each project, what does success look like in 90 days? One sentence each.
2. Goal hierarchy — priority order with a role label per project (e.g., "primary strategic bet", "revenue engine", "internal compounding").

### Phase 5 — POV (skippable)
1. Central lens — one sentence everything you make traces back to.
2. 3–5 core theses — beliefs you hold that most others in your space don't.
3. Contrarian takes — where you push back on received wisdom.
4. What you are NOT — positioning by exclusion.
5. Distinctive phrases / framings that are uniquely yours.

### Phase 6 — Voice
1. Writing patterns to never use. (Defaults: AI-pattern phrases like "X lands" / "Not x, not y — but z" / "That's exactly where" / "In a world where", em dashes in external copy, billboard fragments, rambling.)
2. Audience per project — who they are, what they fear, what they want to believe, language they use, what makes them buy/subscribe/trust.
3. Your tone at your best — 3–5 bullets.

### Phase 7 — Guardrails
1. Known failure modes — patterns you fall into that the PM should flag.
2. Decision fatigue patterns — when does your judgment go?
3. Collaboration dynamics — for any partnered project, what's the operating principle with that partner?

## What to write

Once answers are collected, fill these files:

**Root**: `CLAUDE.md`, `STATUS.md`, `PROJECT_HQ.md`, `WEEKLY_PLAN.md`, `GOALS.md`, `ROADMAP.md`, `BRAIN_DUMP.md`, `USER_POV.md`, `USER_VOICE.md`, `USER_GUARDRAILS.md`, `USER_FRONTIER.md`.

**Per project**: Create a subfolder (kebab-case name) and copy the four files from `project-template/` into it. Rename them to the project's name (e.g., `CONTENT_ENGINE.md`, `CONTENT_ENGINE_TASKS.md`, `CONTENT_ENGINE_LOG.md`). The `CLAUDE.md` keeps its name.

For projects without a hard hours cap, delete the "THE HARD RULE" section from the project's `CLAUDE.md` and remove cap-related rows from the task matrix.

For projects with a hard cap, fill in `{{PROJECT_HOURS_CAP}}` with the number of hours.

## Placeholder list

| Placeholder | Filled with |
|-------------|-------------|
| `{{USER_NAME}}` | Your name |
| `{{USER_NAME_UPPER}}` | Same in uppercase |
| `{{USER_ONE_LINER}}` | One-line self-description |
| `{{USER_OPERATING_NOTES}}` | Communication / working notes |
| `{{PROJECT_COUNT}}` | Number of active projects |
| `{{WEEKLY_TASK_CAP}}` | Weekly cap (default 7) |
| `{{TODAY}}` | Today's date (YYYY-MM-DD) |
| `{{THIS_MONDAY}}` | Monday of this week |
| `{{NEXT_MONDAY}}` | Monday of next week |
| `{{CURRENT_MONTH_YEAR}}` | e.g., May 2026 |
| `{{NEXT_MONTH_YEAR}}` | e.g., June 2026 |
| `{{HORIZON_MONTH}}` `{{HORIZON_YEAR}}` | 90 days from today |
| `{{NEXT_MONTH_REVIEW_DATE}}` | 30 days from today |
| `{{PROJECT_DIRECTORY_TABLE}}` | Table rows of project → working dir |
| `{{PROJECT_SNAPSHOTS}}` | One snapshot block per project (see CLAUDE.md template) |
| `{{PROJECT_FILE_TABLE_ROWS}}` | One row per project linking to its folder |
| `{{TIME_ENVELOPES}}` | Bulleted time envelopes per project |
| `{{GOAL_HIERARCHY_LIST}}` | Numbered list (terse) |
| `{{GOAL_HIERARCHY_FULL}}` | Full prose version |
| `{{NINETY_DAY_HORIZON_LIST}}` | Bulleted 90-day success criteria |
| `{{CAPPED_PROJECT_INSTRUCTION}}` | Sentence about capped-project sub-agents (or empty) |
| `{{CAPPED_PROJECT_HARD_RULE}}` | Hard-rule line about capped projects (or empty) |
| `{{ADDITIONAL_HARD_RULES}}` | Bulleted extra rules |

Project-template placeholders are listed inside `project-template/CLAUDE.md` and `PROJECT.md` — substitute them when copying to each project's folder.

## After install

Open the folder in a fresh chat. The model reads `CLAUDE.md` first, which holds the full session ritual. From there, the PM runs itself.
