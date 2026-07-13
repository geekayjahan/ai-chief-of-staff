---
name: setup-pm
description: Onboards a user into the Solo Project Manager by asking guided questions and writing their personalised PM files into a folder of their choosing. Use when the user installs the plugin for the first time, says "set up my project manager", "configure the PM", "install the project manager", "personalise this PM", "start onboarding", or wants to scaffold their solo project manager.
---

# Setup PM — Onboarding Skill

## What this skill does

Walks the user through a structured onboarding (you, your projects, your goals, your POV, your voice, your guardrails), then writes a folder of personalised Project Manager files to the location they choose. Templates live in `references/templates/` inside this skill — read them, substitute placeholders with the user's answers, and write them out.

The Project Manager itself runs from those files (via the root `CLAUDE.md`) once setup is complete. This skill only handles setup.

## Run order

Follow these phases in order. Don't skip ahead. Ask only what is unclear from prior turns. **Save progress as you go** by writing partial files when a section is complete — the user can pause and resume.

### Phase 0 — Pick the install folder

Ask where the personalised PM should be written.

- If the user has a Cowork folder selected, default to a subfolder named `Project Manager/` inside it. Confirm.
- If no folder is selected, call `request_cowork_directory` to ask the user to pick one.
- Never overwrite existing PM files without asking. If a `CLAUDE.md` already exists at the target, stop and confirm before proceeding.

### Phase 1 — You

Ask in one AskUserQuestion batch (or as a free-text response if the user prefers prose):

1. **What should I call you?** (name or how you want to be addressed)
2. **Describe yourself in one or two sentences** — role, mode of working, key trait. This sets how the PM frames everything.
3. **Anything important about how you work or communicate?** (energy patterns, voice input, neurodivergence, communication preferences, anything the PM should adapt to)

Capture answers into variables: `USER_NAME`, `USER_ONE_LINER`, `USER_OPERATING_NOTES`.

### Phase 2 — Your projects

Ask the user to list their active projects. For each project, gather:

- Project name
- Optional emoji
- One-line role in their portfolio (revenue engine / authority-building / credibility / internal / distribution / other — open-ended)
- Partner (solo or named)
- Where the actual project files live (working directory path) — optional
- Priority rank (1 = top)
- **Does this project have a hard weekly time cap?** If yes, ask how many hours. Capped projects get a sub-agent CLAUDE.md that defends the cap.

If the user gives an unclear list, ask follow-ups one at a time until each project has a complete row. Don't proceed with placeholder names like "TBD" — push for specifics.

Capture into a structured list `PROJECTS[]` with fields: `name, emoji, role, role_description, partner, working_dir, priority, hours_cap`.

### Phase 3 — Rules of the cockpit

Ask:

1. **Weekly task cap?** (default: 7)
2. **Brain dump cadence** — when should the PM process the brain dump? (default: each session)
3. **Any other hard rules you want the PM to enforce?** (e.g., "no Friday meetings", "monthly review by the 7th", "delegate detail to a specific external tool")

Capture: `WEEKLY_TASK_CAP`, `ADDITIONAL_HARD_RULES`.

### Phase 4 — Goals and roadmap

Ask:

1. **For each project, what does success look like over the next 90 days?** Take one sentence per project.
2. **Goal hierarchy** — restate the priority order from Phase 2, but with a role label per project (e.g., "primary strategic bet", "revenue engine", "internal compounding"). Confirm this with the user before writing it down.

Capture: `NINETY_DAY_HORIZON[]`, `GOAL_HIERARCHY[]`.

### Phase 5 — POV (skippable, but recommended)

Tell the user: "These shape every piece of writing the PM helps with. You can skip and fill later — but if you skip, the PM won't filter content through anything specific to you."

1. **Central lens** — one sentence everything you make should trace back to.
2. **3–5 core theses** — beliefs you hold that most others in your space don't.
3. **Contrarian takes** — where you push back on received wisdom.
4. **What you are NOT** — positioning by exclusion.
5. **Distinctive phrases / framings** that are uniquely yours.

If the user skips, leave the corresponding sections in `USER_POV.md` as "→ fill when ready" prompts. Don't make up content.

Capture: `USER_CENTRAL_LENS`, `USER_CORE_THESES`, `USER_CONTRARIAN_TAKES`, `USER_NOT_LIST`, `USER_PHRASES`.

### Phase 6 — Voice

Ask:

1. **Writing patterns to never use.** Show the default banned list and ask if anything to add or remove:
   - AI-pattern phrases: "X lands", "It's X not Y", "Not x, not y — but z", "That's exactly where", "In a world where"
   - Em dashes (in external copy)
   - 2–3 word billboard sentences (unless headline)
   - Fragmented sentences using full stops instead of commas
   - Rambling or repetition
2. **Audience per project** — for each project: who they are, what they fear, what they want to believe, language they use, what makes them buy/subscribe/trust. Skippable per project.
3. **Your tone at your best** — 3–5 bullets describing how you sound when writing well.

Capture: `USER_BANNED_PATTERNS`, `USER_ALWAYS_PATTERNS`, `PROJECT_AUDIENCES[]`, `USER_TONE`, `USER_WRITING_PATTERNS`.

### Phase 7 — Guardrails

Ask:

1. **Known failure modes** — patterns you fall into that the PM should flag. Examples to prompt with:
   - Opening too many threads at once
   - Going deep on tangents while higher-priority work stalls
   - Arriving with too many "urgent" items
   - Saying yes to exciting things that don't fit the goal hierarchy
   - Doing strategic work on low-energy days
2. **Decision fatigue patterns** — when does your judgment go? (e.g., overwhelm + urgency together, low energy + high pressure)
3. **Collaboration dynamics** — for any partnered project, what's the operating principle with that partner and what should the PM watch for?

Capture: `USER_FAILURE_MODES`, `USER_DECISION_FATIGUE`, `USER_COLLABORATION_DYNAMICS`, `USER_ENERGY_RHYTHMS`.

### Phase 8 — Write the files

Now generate the personalised PM. Read each template from `references/templates/` and substitute placeholders.

**Root files to write** at the install folder:

- `CLAUDE.md` (from `templates/CLAUDE.md`)
- `STATUS.md` (from `templates/STATUS.md`)
- `PROJECT_HQ.md` (from `templates/PROJECT_HQ.md`)
- `WEEKLY_PLAN.md` (from `templates/WEEKLY_PLAN.md`)
- `GOALS.md` (from `templates/GOALS.md`)
- `ROADMAP.md` (from `templates/ROADMAP.md`)
- `BRAIN_DUMP.md` (from `templates/BRAIN_DUMP.md`)
- `USER_POV.md` (from `templates/USER_POV.md`)
- `USER_VOICE.md` (from `templates/USER_VOICE.md`)
- `USER_GUARDRAILS.md` (from `templates/USER_GUARDRAILS.md`)
- `USER_FRONTIER.md` (from `templates/USER_FRONTIER.md`)

**For each project** in `PROJECTS[]`, create a subfolder named after the project (kebab-case) containing:

- `CLAUDE.md` (from `templates/project/CLAUDE.md`)
- `<PROJECT>.md` (from `templates/project/PROJECT.md`) — file named after the project in uppercase kebab-case, e.g., `CONTENT_ENGINE.md`
- `<PROJECT>_TASKS.md` (from `templates/project/PROJECT_TASKS.md`)
- `<PROJECT>_LOG.md` (from `templates/project/PROJECT_LOG.md`)

For projects **without** a hard hours cap, set `PROJECT_HOURS_CAP` to a soft target the user gave (or leave the cap section blank and remove the "Hard cap" wording from the sub-agent CLAUDE.md). For projects **with** a hard cap, fill the `PROJECT_HARD_CAP_SECTION` placeholder with this block:

```
## THE HARD RULE — {{PROJECT_HOURS_CAP}} HOURS A WEEK

{{USER_NAME}} has {{PROJECT_HOURS_CAP}} hours a week for {{PROJECT_NAME}}. That is the cap. Not a target. Not a guideline. A cap.

When the {{PROJECT_HOURS_CAP}} hours are spent, {{PROJECT_NAME}} is closed until next Monday. No "quick" emails. No "just one thing". Closed.

If {{USER_NAME}} asks me to help with {{PROJECT_NAME}} after the hours are gone, I push back. I name the cap, I show the log, and I ask what they'd cut from next week's hours to make room. If nothing — it waits.

---
```

If a project has no hard cap, replace `PROJECT_HARD_CAP_SECTION` with an empty string.

### Phase 9 — Confirm and close

After writing all files, summarise:

- Folder location
- Number of files written
- What's filled, what's still skeleton
- The first action: open the folder in Cowork and start a fresh session — the root `CLAUDE.md` will run the session ritual.

End with a single concrete next step. No bullet-point summary of everything that happened.

## Placeholder reference

Common placeholders used across templates:

| Placeholder | Filled with |
|-------------|-------------|
| `{{USER_NAME}}` | User's name |
| `{{USER_NAME_UPPER}}` | Same in uppercase |
| `{{USER_ONE_LINER}}` | One-line self-description |
| `{{USER_OPERATING_NOTES}}` | Communication / working notes |
| `{{PROJECT_COUNT}}` | Number of active projects |
| `{{WEEKLY_TASK_CAP}}` | Weekly cap (default 7) |
| `{{TODAY}}` | Today's date in YYYY-MM-DD |
| `{{THIS_MONDAY}}` | Date of this week's Monday |
| `{{NEXT_MONDAY}}` | Date of next Monday |
| `{{CURRENT_MONTH_YEAR}}` | e.g., "May 2026" |
| `{{NEXT_MONTH_YEAR}}` | e.g., "June 2026" |
| `{{HORIZON_MONTH}}` `{{HORIZON_YEAR}}` | 90 days from today |
| `{{NEXT_MONTH_REVIEW_DATE}}` | 30 days from today |
| `{{PROJECT_DIRECTORY_TABLE}}` | Table rows of project name → working dir |
| `{{PROJECT_SNAPSHOTS}}` | One snapshot block per project |
| `{{PROJECT_FILE_TABLE_ROWS}}` | One row per project linking to its folder |
| `{{TIME_ENVELOPES}}` | Bulleted list of time envelopes per project |
| `{{GOAL_HIERARCHY_LIST}}` | Numbered list — used in CLAUDE.md (terse) |
| `{{GOAL_HIERARCHY_FULL}}` | Full prose version — used in GOALS.md |
| `{{NINETY_DAY_HORIZON_LIST}}` | Bulleted list of 90-day success criteria |
| `{{CAPPED_PROJECT_INSTRUCTION}}` | Sentence pointing to capped-project sub-agent (or empty) |
| `{{CAPPED_PROJECT_HARD_RULE}}` | Hard-rule line about capped projects (or empty) |
| `{{ADDITIONAL_HARD_RULES}}` | Bulleted extra rules from Phase 3 |

Project-template placeholders are listed in `references/templates/project/CLAUDE.md` and `PROJECT.md`.

## Rules for writing the personalised files

- **Never invent content.** If the user skipped a section, write a `→ fill when ready` placeholder. Do not make up theses, audiences, or guardrails.
- **Preserve the structure.** Don't omit sections or change section names — they're load-bearing for how the PM operates.
- **Use the user's exact words** where possible. Don't paraphrase their POV or voice.
- **Date headers** use `YYYY-MM-DD` format.
- **Project subfolder names** are kebab-case (e.g., `content-engine`, `motivated-code`).
- **Project file names** are uppercase snake-case (e.g., `CONTENT_ENGINE.md`).

## After install

The skill is done after Phase 9. Future sessions run from the personalised `CLAUDE.md` in the user's folder, which contains the session ritual. This skill should not be invoked again unless the user wants to re-onboard or rebuild from scratch.
