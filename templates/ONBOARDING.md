# Onboarding — Everyday Project Manager

Paste the prompt below into Claude, ChatGPT, Gemini, or any LLM that can read your folder. The model walks you through the questions and fills in the templates.

## Prompt to give the model

> You are helping me set up a personal Project Manager system in this folder. The templates have `{{PLACEHOLDER}}` markers. Walk me through the onboarding questions below in order. Ask one phase at a time. Don't move on until I've answered. When I've answered all phases, fill in every template file by substituting placeholders and writing my answers into the prose sections. Never make up content — if I skip a section, leave a `→ fill when ready` marker. Render two-section files (PROJECT_HQ, WEEKLY_PLAN, GOALS, ROADMAP) with both Work and Personal halves populated from the projects I tagged. Once done, summarise what was written and where, and tell me to open this folder in a fresh session.

## The onboarding phases

### Phase 0 — Pick the install folder
If you're running this in a separate folder from the templates, confirm where personalised files should be written. Otherwise the templates get overwritten in place.

### Phase 1 — You
1. What should I call you?
2. Describe yourself in one or two sentences — role, mode of working, key trait.
3. Anything important about how you work or communicate?

### Phase 2 — Your projects
For each active project:
- Name and optional emoji
- **Context: work / personal / both** (required — drives session-mode filtering)
- One-line role / significance
- Partner (solo or named)
- Working directory (optional)
- Priority rank (separate ranks for work and personal)
- Hard weekly hours cap? If yes, how many hours, and why does the cap exist?
- One-line current status
- Next milestone (date if known)
- One-line "what's involved"
- Stakeholders / who's affected (can be "just me")

Push for specifics. Skip rather than fake.

### Phase 3 — Rules of the cockpit
1. Weekly task cap? (default 7, across work + personal)
2. Voice dump cadence? (default: each session)
3. Any extra hard rules to enforce?

### Phase 4 — Goals and roadmap
1. For each project, what does success look like in 90 days?
2. Priority hierarchy with role labels, separate for work and personal.

### Phase 5 — Guardrails
1. Known failure modes — name each pattern with a "Flag when:" and "Redirect:" line.
2. Decision fatigue patterns.
3. Collaboration dynamics — per partnered project.
4. Energy and focus rhythms (optional).

## What to write

**Root files** (always): `CLAUDE.md`, `STATUS.md`, `PROJECT_HQ.md`, `WEEKLY_PLAN.md`, `GOALS.md`, `ROADMAP.md`, `VOICE_DUMP.md`, `USER_GUARDRAILS.md`, `MORNING_BRIEF.md`, `FRIDAY_WRAP.md`.

**Per project**: Create a subfolder (kebab-case name) and copy from `project-template/`:
- `CLAUDE.md` — use `CLAUDE-with-cap.md` if the project has a hard cap, else `CLAUDE-no-cap.md`
- `<PROJECT>.md` — renamed from `PROJECT.md`
- `<PROJECT>_TASKS.md`
- `<PROJECT>_LOG.md` — only if the project has a hard cap

### Filename derivation
For project "Website Redesign":
- Subfolder: `website-redesign`
- Files: `WEBSITE_REDESIGN.md`, `WEBSITE_REDESIGN_TASKS.md`, `WEBSITE_REDESIGN_LOG.md`

For project "Family":
- Subfolder: `family`
- Files: `FAMILY.md`, `FAMILY_TASKS.md`, `FAMILY_LOG.md`

### Two-section rendering
PROJECT_HQ.md, WEEKLY_PLAN.md, GOALS.md, ROADMAP.md, STATUS.md all have Work and Personal subsections. Populate each subsection with only the projects tagged for that context (projects tagged "both" appear in both).

If a context has no projects, render `_No projects in this context yet._` under that section.

### Conditional placeholders
Some placeholders should be empty strings (or the whole line deleted) when their condition isn't met:
- `CAPPED_PROJECT_INSTRUCTION` / `CAPPED_PROJECT_HARD_RULE` — empty if no project has a cap
- `ADDITIONAL_HARD_RULES` / `ADDITIONAL_HARD_RULES_BODY` — empty if no extra rules given
- `TASKS_HEADER_CAP_NOTE` / `TASKS_HOURS_LINE` — empty for uncapped projects

When a conditional placeholder is inside a markdown table, delete the whole line including its newline; otherwise the blank line ends the table.

## After install

Open the folder in a fresh chat. The model reads `CLAUDE.md` first, which asks the session-mode question ("work, personal, or both today?") and runs the rest of the ritual. From there, the PM runs itself.
