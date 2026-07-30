---
name: setup-pm
description: Onboards a user into the Everyday Project Manager by asking guided questions and writing their personalised PM files into a folder of their choosing. Handles both work and personal projects with compartmentalised sessions. Use when the user installs the plugin for the first time, says "set up my project manager", "configure the PM", "install the PM", "personalise this PM", "start onboarding", or wants to scaffold their everyday project manager.
---

# Setup PM — Onboarding Skill

## What this skill does

Walks the user through structured onboarding, then writes a folder of personalised Project Manager files to a location they choose. Templates live in `templates/` at the root of this kit. Read each template, substitute placeholders with the user's answers, write the result out.

The Project Manager itself runs from those files (via the root `CLAUDE.md`) once setup is complete. This skill only handles setup.

The PM supports both work and personal projects, with compartmentalised sessions: at session start the user picks work or personal mode, and only that context surfaces.

## Run order

Follow phases in order. Don't skip ahead. Ask only what is unclear from prior turns.

**Write nothing into the install folder until the spec is confirmed at Phase 6.** The one exception is `SPEC.md` itself: append each phase's answers to it as they come in. That is how the user pauses and resumes — the spec is the save file. Everything else gets written in one go at Phase 7, after the user has said yes.

This matters because the alternative is writing fifteen files off unconfirmed answers, and the natural fix at that point is re-running onboarding over a folder the user has already started using.

### Phase 0 — Pick the install folder

Ask where the personalised PM should be written.

- Never write into this kit. `templates/` stays clean so the user can install again later.
- Suggest a sensible default (a `Project Manager/` folder somewhere stable) and confirm before writing.
- If a `CLAUDE.md` already exists at the target, stop and confirm before proceeding.

### Phase 1 — You

Ask:

1. **What should I call you?**
2. **Describe yourself in one or two sentences.** Role, mode of working, key trait.
3. **Anything important about how you work or communicate?** Energy patterns, voice input, neurodivergence, communication preferences, anything the PM should adapt to.

Capture: `USER_NAME`, `USER_NAME_UPPER` (uppercase), `USER_ONE_LINER`, `USER_OPERATING_NOTES`.

### Phase 2 — Your projects

Ask the user to list active projects. For each, collect:

- Project name
- Optional emoji
- **Context: work / personal / both** (required — drives session-mode filtering)
- Role / one-line significance (whatever role label makes sense in their world: delivery, discovery, stakeholder work, operations, learning, health, family, etc. — open-ended)
- Partner (solo or named)
- Working directory (optional)
- Priority rank (1 = top, separate ranks for work vs. personal)
- **Hard weekly hours cap?** If yes, ask how many. Capped projects get a sub-agent that defends the cap.
- **If capped: why does this cap exist?** One sentence. Drives `PROJECT_CAP_REASON`.
- One-line current status
- Next milestone (date if known)
- One-line "what's involved" (what doing this project actually consists of)
- Stakeholders / who's affected (can be "just me" — that's fine)

Push for specifics. Don't accept "TBD" — if the user doesn't know, leave the field blank rather than fake.

Capture: `PROJECTS[]` with fields `name, emoji, context, role, role_description, partner, working_dir, priority, hours_cap, cap_reason, status, next_milestone, what, stakeholders, agent_job`.

`agent_job` is a short verb-phrase describing what the sub-agent's job is — derive it from role + cap. Example: "protect {{USER_NAME}}'s time from {{PROJECT_NAME}}'s pull and keep it running on {{PROJECT_HOURS_CAP}} hours" for a capped project, or "hold the matrix and surface next moves" for an uncapped one.

`PROJECT_COUNT` = `len(PROJECTS)`.

### Phase 3 — Rules of the cockpit

Ask:

1. **Weekly task cap?** (default: 7, across work and personal combined)
2. **Voice dump cadence** — when should the PM process the inbox? (default: each session)
3. **Any other hard rules to enforce?** Examples: "no Friday meetings", "monthly review by 7th", "no work on Sundays", "delegate detail to specific external tool".

Capture: `WEEKLY_TASK_CAP`, `ADDITIONAL_HARD_RULES` (one-line bullets for CLAUDE.md), `ADDITIONAL_HARD_RULES_BODY` (fuller text for USER_GUARDRAILS.md if more nuance was given — otherwise same as one-liners).

### Phase 4 — Goals and roadmap

For each project, ask:

1. **What does success look like in 90 days?** One sentence each.
2. **Priority hierarchy** with a role label (e.g., "primary strategic bet", "revenue", "health foundation", "family"). Separate hierarchies for work and personal.

Capture: `WORK_NINETY_DAY_HORIZON[]`, `PERSONAL_NINETY_DAY_HORIZON[]`, `WORK_GOAL_HIERARCHY[]`, `PERSONAL_GOAL_HIERARCHY[]`.

### Phase 5 — Guardrails

Ask:

1. **Known failure modes** — patterns you fall into that the PM should flag. Prompt with examples: opening too many threads at once, going deep on tangents while higher-priority work stalls, arriving with too many "urgent" items, saying yes to exciting things that don't fit the goal hierarchy, doing strategic work on low-energy days. Format as named patterns with a `Flag when:` and `Redirect:` line for each.
2. **Decision fatigue patterns** — when does your judgment go? (e.g., overwhelm + urgency, low energy + high pressure)
3. **Collaboration dynamics** — for any partnered project, what's the operating principle with that partner and what should the PM watch for?
4. **Energy and focus rhythms** — when are you best for deep work, admin, creative? Optional.

Capture: `USER_FAILURE_MODES`, `USER_DECISION_FATIGUE`, `USER_COLLABORATION_DYNAMICS`, `USER_ENERGY_RHYTHMS`.

### Phase 6 — The spec

Everything has been answered. Before writing anything, show the user what they are about to get, on one page, and get a yes.

Render `templates/SPEC.md` in full and put it in front of them. It covers who it is for, the projects with their context tags and caps, the rules it will enforce, the guardrails it will watch for, the three routines and what each writes, what it will refuse to do, and what was skipped and will land as `→ fill when ready`.

Then ask one question: **does this match, or what needs changing?**

- **If they confirm**, move to Phase 7 and write everything.
- **If they correct something**, apply it, go back to whichever phase owns that answer if it needs re-asking, and re-show **only the part that changed**. Do not re-render the whole spec. They have read it once.
- **If they skim and say "looks fine"**, take it. This is a gate, not an exam. Do not walk them through it line by line.

The "still blank" section is the one worth pointing at directly. It is the user's last cheap chance to fill something in before it becomes a skeleton they have to go back and edit.

### Phase 7 — Write the files

Read each template from `templates/`. Substitute placeholders. Write to the install folder.

**Root files (always):**

| File | Source template |
|------|-----------------|
| `CLAUDE.md` | `templates/CLAUDE.md` |
| `STATUS.md` | `templates/STATUS.md` |
| `PROJECT_HQ.md` | `templates/PROJECT_HQ.md` |
| `WEEKLY_PLAN.md` | `templates/WEEKLY_PLAN.md` |
| `GOALS.md` | `templates/GOALS.md` |
| `ROADMAP.md` | `templates/ROADMAP.md` |
| `VOICE_DUMP.md` | `templates/VOICE_DUMP.md` |
| `USER_GUARDRAILS.md` | `templates/USER_GUARDRAILS.md` |
| `MORNING_BRIEF.md` | `templates/MORNING_BRIEF.md` |
| `FRIDAY_WRAP.md` | `templates/FRIDAY_WRAP.md` |
| `SPEC.md` | `templates/SPEC.md` (already written and confirmed at Phase 6 — finalise it, don't ask again) |

**Per project**, create a subfolder named `kebab-case(project.name)` containing:

| File | Source template | Condition |
|------|-----------------|-----------|
| `CLAUDE.md` | `templates/project-template/CLAUDE-with-cap.md` | If `project.hours_cap` is set |
| `CLAUDE.md` | `templates/project-template/CLAUDE-no-cap.md` | If `project.hours_cap` is not set |
| `<PROJECT>.md` | `templates/project-template/PROJECT.md` | Always |
| `<PROJECT>_TASKS.md` | `templates/project-template/PROJECT_TASKS.md` | Always |
| `<PROJECT>_LOG.md` | `templates/project-template/PROJECT_LOG.md` | Only if `project.hours_cap` is set |

### Filename derivation rule

For project named "Website Redesign":

- Subfolder: `website-redesign` (lowercase, hyphens)
- `PROJECT_FILENAME` = `WEBSITE_REDESIGN.md` (uppercase, underscores)
- `PROJECT_TASKS_FILENAME` = `WEBSITE_REDESIGN_TASKS.md`
- `PROJECT_LOG_FILENAME` = `WEBSITE_REDESIGN_LOG.md`

For project "Family":
- Subfolder: `family`
- `PROJECT_FILENAME` = `FAMILY.md`
- `PROJECT_TASKS_FILENAME` = `FAMILY_TASKS.md`
- `PROJECT_LOG_FILENAME` = `FAMILY_LOG.md`

Strip non-alphanumeric chars (apostrophes, dots) before converting.

### Conditional placeholder rendering

Several placeholders are conditional. Render them as follows:

**`CAPPED_PROJECT_INSTRUCTION`** (in root CLAUDE.md, session ritual section):
- If any project has a cap: `When working on a capped project, read its sub-agent CLAUDE.md first. It holds the cap-defence rules.`
- Else: empty string.

**`CAPPED_PROJECT_HARD_RULE`** (in root CLAUDE.md, hard rules list):
- If any project has a cap: `- **Capped project hours.** [list each capped project: NAME (Nhrs/wk)]. Defended by the project sub-agent.` (no leading newline — the template line break handles it)
- Else: empty string (delete the line).

**`ADDITIONAL_HARD_RULES`** (in root CLAUDE.md, end of hard rules):
- If user gave extra rules: `- rule1\n- rule2` (one bullet per rule, no leading newline).
- Else: empty string (delete the line).

If both `CAPPED_PROJECT_HARD_RULE` and `ADDITIONAL_HARD_RULES` are present, render them on consecutive lines (one of them needs a leading newline at substitution time so they don't run together — Claude must handle this when substituting both on the same template line).

**`ADDITIONAL_HARD_RULES_BODY`** (in USER_GUARDRAILS.md):
- Same content, may include longer explanations if user gave them.
- Else: empty string.

**`TIME_ENVELOPES`** (in root CLAUDE.md):
- One bullet per project: `- {{PROJECT_NAME}}: {{X}} hrs/week ({{cap_type}})` where cap_type is "hard cap" or "soft target". If neither given, omit the project.

**`PROJECT_DIRECTORY_TABLE`** (in PROJECT_HQ.md):
- One row per project: `| {{project.emoji}} {{project.name}} | {{project.context}} | \`{{project.working_dir}}\` |`

**`WORK_PROJECT_SNAPSHOTS` / `PERSONAL_PROJECT_SNAPSHOTS`** (in PROJECT_HQ.md):
- One snapshot block per project filtered by context (work-tagged or both-tagged for work section; personal-tagged or both-tagged for personal section). Format each as:
  ```
  ### {{project.emoji}} {{project.name}}
  - **Role:** {{project.role}}
  - **Status:** {{project.status}}
  - **Next milestone:** {{project.next_milestone}}
  - **Partner:** {{project.partner}}
  → [Project file]({{kebab-case-name}}/{{PROJECT_FILENAME}})

  ---
  ```
- If no projects in that context: `_No projects in this context yet._`

**`WORK_GOAL_HIERARCHY` / `PERSONAL_GOAL_HIERARCHY`** (in GOALS.md):
- Numbered list, one per project in that context, ordered by priority:
  ```
  ### 1. {{project.name}} ← {{role_label}}
  {{project.role_description}}
  ```

**`WORK_NINETY_DAY_HORIZON` / `PERSONAL_NINETY_DAY_HORIZON`** (in ROADMAP.md):
- Bulleted list, one per project in that context:
  ```
  - [ ] **{{project.name}}:** {{horizon_sentence}}
  ```

**`SPEC_PROJECT_LIST`** (in SPEC.md):
- One bullet per project, work first then personal: `- **{{project.name}}** — {{project.context}}, priority {{project.priority}}{{, capped at N hrs/week if capped}}. {{project.status}}`

**`SPEC_SKIPPED`** (in SPEC.md):
- A bullet per thing the user skipped or left thin, naming the file it will show up in: `- Collaboration dynamics — will read \`→ fill when ready\` in USER_GUARDRAILS.md`
- If they answered everything: `Nothing. Every section was answered.`
- Be honest here. This section exists so the user finds out now rather than in week three.

**`GOAL_HIERARCHY_LIST`** (in root CLAUDE.md, terse version):
- Numbered list, work first then personal, format: `{{N}}. {{project.name}} — {{role_label}}`

**`PROJECT_FILE_TABLE_ROWS`** (in root CLAUDE.md, KEY FILES table):
- One row per project: `| {{kebab-case-name}}/{{PROJECT_FILENAME}} | {{project.role}} ({{project.context}}) |`

**Per-project sub-agent placeholders** (in project-template/CLAUDE-*.md):

**`PROJECT_CAP_REASON`** (only in with-cap variant): the one-sentence reason captured in Phase 2.

**`TASKS_HEADER_CAP_NOTE`** (in PROJECT_TASKS.md):
- If capped: ` | Cap: {{PROJECT_HOURS_CAP}} hours/week`
- Else: empty string.

**`TASKS_HOURS_LINE`** (in PROJECT_TASKS.md, under URGENT THIS WEEK):
- If capped: `**This week's hours:** 0/{{PROJECT_HOURS_CAP}} used.`
- Else: empty string.

### Phase 8 — Confirm and close

After writing all files, summarise:

- Folder location
- Number of files written (split: core, per-project)
- What's filled, what's still skeleton
- Tell the user: open the folder in a fresh session. The root `CLAUDE.md` will ask the session-mode question (work / personal / both) and run the rest of the ritual.

The three routines (voice dump, morning brief, Friday wrap) live inside the `CLAUDE.md` you just wrote. Nothing else needs installing for them to work, and they travel with the folder to any model that reads it.

If the user wants the morning brief to arrive on its own, tell them to set a recurring task in whatever they run this in, pointed at the folder, saying `Run the morning brief`. Add the caveat plainly: on a desktop app the task only fires while the machine is awake and online, so an 8am brief with a closed laptop will not run.

End with a single concrete next step. No bullet-point summary of everything that happened.

## Complete placeholder reference

### Identity
| Placeholder | Filled with |
|-------------|-------------|
| `{{USER_NAME}}` | User's name |
| `{{USER_NAME_UPPER}}` | Same in uppercase |
| `{{USER_ONE_LINER}}` | One-line self-description |
| `{{USER_OPERATING_NOTES}}` | Communication / working notes |

### Dates
| Placeholder | Filled with |
|-------------|-------------|
| `{{TODAY}}` | Today's date (YYYY-MM-DD) |
| `{{THIS_MONDAY}}` | Monday of this week (YYYY-MM-DD) |
| `{{NEXT_MONDAY}}` | Monday of next week |
| `{{CURRENT_MONTH_YEAR}}` | e.g., "May 2026" |
| `{{NEXT_MONTH_YEAR}}` | e.g., "June 2026" |
| `{{HORIZON_MONTH}}` `{{HORIZON_YEAR}}` | 90 days from today |
| `{{NEXT_MONTH_REVIEW_DATE}}` | 30 days from today |

### Counts and caps
| Placeholder | Filled with |
|-------------|-------------|
| `{{PROJECT_COUNT}}` | Number of active projects |
| `{{WEEKLY_TASK_CAP}}` | Weekly cap (default 7) |

### Project list rendering
| Placeholder | Filled with |
|-------------|-------------|
| `{{PROJECT_DIRECTORY_TABLE}}` | One row per project, name + context + working dir |
| `{{WORK_PROJECT_SNAPSHOTS}}` | Snapshot blocks for work-context projects |
| `{{PERSONAL_PROJECT_SNAPSHOTS}}` | Snapshot blocks for personal-context projects |
| `{{PROJECT_FILE_TABLE_ROWS}}` | Per-project links for KEY FILES table |
| `{{TIME_ENVELOPES}}` | Bulleted time envelopes per project (caps where set) |

### Goals and horizon
| Placeholder | Filled with |
|-------------|-------------|
| `{{GOAL_HIERARCHY_LIST}}` | Terse list (CLAUDE.md) |
| `{{WORK_GOAL_HIERARCHY}}` | Full prose for work projects (GOALS.md) |
| `{{PERSONAL_GOAL_HIERARCHY}}` | Same for personal |
| `{{WORK_NINETY_DAY_HORIZON}}` | Work 90-day bullets (ROADMAP.md) |
| `{{PERSONAL_NINETY_DAY_HORIZON}}` | Personal 90-day bullets |

### Conditional sections
| Placeholder | Filled with |
|-------------|-------------|
| `{{SPEC_PROJECT_LIST}}` | One bullet per project for SPEC.md: context, priority, cap, status |
| `{{SPEC_SKIPPED}}` | What was skipped, and which file it will be blank in |
| `{{CAPPED_PROJECT_INSTRUCTION}}` | Session-ritual sentence (empty if no caps) |
| `{{CAPPED_PROJECT_HARD_RULE}}` | Hard-rule line (empty if no caps) |
| `{{ADDITIONAL_HARD_RULES}}` | Extra rule bullets (empty if none) |
| `{{ADDITIONAL_HARD_RULES_BODY}}` | Same for GUARDRAILS file |

### Guardrails
| Placeholder | Filled with |
|-------------|-------------|
| `{{USER_FAILURE_MODES}}` | Named failure patterns with Flag/Redirect |
| `{{USER_DECISION_FATIGUE}}` | Decision-fatigue patterns |
| `{{USER_COLLABORATION_DYNAMICS}}` | Per-partner notes |
| `{{USER_ENERGY_RHYTHMS}}` | Energy patterns |

### Per project (filled per-project when iterating)
| Placeholder | Filled with |
|-------------|-------------|
| `{{PROJECT_NAME}}` | Project name |
| `{{PROJECT_EMOJI}}` | Emoji (or empty) |
| `{{PROJECT_CONTEXT}}` | work / personal / both |
| `{{PROJECT_ROLE}}` | One-line role label |
| `{{PROJECT_ROLE_DESCRIPTION}}` | Fuller "why this matters" |
| `{{PROJECT_PARTNER}}` | Solo or named |
| `{{PROJECT_WORKING_DIR}}` | Path to project files |
| `{{PROJECT_STATUS}}` | Current status |
| `{{PROJECT_NEXT_MILESTONE}}` | Next milestone |
| `{{PROJECT_WHAT}}` | What's involved |
| `{{PROJECT_STAKEHOLDERS}}` | Who's affected |
| `{{PROJECT_AGENT_JOB}}` | Sub-agent's job (derived) |
| `{{PROJECT_HOURS_CAP}}` | Hours/week cap (only for capped projects) |
| `{{PROJECT_CAP_REASON}}` | Why the cap exists (capped only) |
| `{{PROJECT_FILENAME}}` | e.g., `WEBSITE_REDESIGN.md` |
| `{{PROJECT_TASKS_FILENAME}}` | e.g., `WEBSITE_REDESIGN_TASKS.md` |
| `{{PROJECT_LOG_FILENAME}}` | e.g., `WEBSITE_REDESIGN_LOG.md` (capped only) |
| `{{TASKS_HEADER_CAP_NOTE}}` | Cap note in PROJECT_TASKS header (empty if uncapped) |
| `{{TASKS_HOURS_LINE}}` | Hours line in PROJECT_TASKS (empty if uncapped) |

## Rules for writing the personalised files

- **Never invent content.** If the user skipped a section, write `→ fill when ready`. Don't make up theses, audiences, guardrails, statuses.
- **Preserve the structure.** Don't omit sections or rename them — they're load-bearing.
- **Use the user's exact words** where possible. Don't paraphrase their statuses or guardrails.
- **Date headers** use `YYYY-MM-DD`.
- **Project subfolder names** are kebab-case (`website-redesign`, `family`, `vendor-migration`).
- **Project file names** are SCREAMING_SNAKE_CASE (`WEBSITE_REDESIGN.md`).
- **Strip non-alphanumeric characters** from project names before deriving filenames.
- **For uncapped projects**: do not write a `PROJECT_LOG.md`, do not include cap-related text in `PROJECT_TASKS.md` (use the empty-string conditional placeholders).
- **Empty placeholders inside markdown tables**: when a conditional row renders empty, delete the whole row rather than leaving a line of empty pipes. A table with a blank row reads as a broken file.
- **Leave no `{{PLACEHOLDER}}` behind.** Before you finish, scan every file you wrote for surviving `{{` markers. Anything the user skipped becomes `→ fill when ready`, not a raw placeholder.