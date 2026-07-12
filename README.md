# exec-assistant
Project manager plugin for Cowork and portable templates to run the PM on an platform

# Installation Guide — Everyday Project Manager

Two ways to install. Pick the one that matches your setup.

---

## Option A: Cowork plugin

**Best for:** Anyone using Claude Cowork on desktop. One-step install, automatic onboarding.

### What you need
- Cowork (desktop app) installed
- The file `everyday-pm.plugin`
- 20–45 minutes for onboarding

### Steps

1. **Install the plugin.** Open the `everyday-pm.plugin` file. Cowork shows a preview with the contents. Click the install / accept button.

2. **Pick a folder for your PM.** Decide where you want your personalised Project Manager to live. Common choices:
   - A subfolder inside an existing Cowork workspace (e.g., `~/Documents/Cowork/Project Manager/`)
   - A fresh folder anywhere on your computer
   The folder doesn't need to exist beforehand — the skill will create it.

3. **Start onboarding.** Open Cowork and say: *"Set up my project manager."*
   The `setup-pm` skill triggers and walks you through 7 phases.

4. **Answer the questions.** The skill asks one phase at a time:
   - Phase 1: you (name, self-description, working preferences)
   - Phase 2: do you publish content or teach? (gates whether POV/Voice/Frontier files get installed)
   - Phase 3: your projects (name, work or personal, role, partner, status, milestone, hours cap if any)
   - Phase 4: cockpit rules (weekly task cap, brain dump cadence, extra hard rules)
   - Phase 5: goals (90-day horizon per project, priority hierarchy split work/personal)
   - Phase 6: POV and voice (only if you said yes in Phase 2)
   - Phase 7: guardrails (failure modes, decision-fatigue patterns, collaboration dynamics)

5. **Wait for the files.** When all phases are answered, the skill writes the personalised files into your chosen folder. Expect 12+ files for a small install, more if you have many projects.

6. **Open the folder.** Switch to (or open a new session in) the folder where the PM lives. The PM is now live.

---

## Option B: Standalone folder (any LLM)

**Best for:** ChatGPT, Gemini, Claude.ai web, or any setup where the Cowork plugin doesn't apply.

### What you need
- The `everyday-pm-templates/` folder
- An LLM that can read files (or that you can paste content into)
- 20–45 minutes for onboarding

### Steps

1. **Copy the folder.** Put `everyday-pm-templates/` somewhere stable on your computer (or in cloud storage your LLM can access). Rename if you want — e.g., `My Project Manager/`.

2. **Open `ONBOARDING.md`.** The first section is a prompt you give to your LLM.

3. **Paste the prompt + the folder reference into your LLM.** Tell the model: *"This folder contains my Project Manager templates. Follow the instructions in ONBOARDING.md."* If the model can't directly read the folder, paste the content of ONBOARDING.md and ask it to walk you through.

4. **Answer the questions.** Same 7 phases as Option A. The model asks one phase at a time.

5. **The model fills the templates.** It substitutes `{{PLACEHOLDER}}` markers with your answers, copies the project-template files for each project you listed, and writes the personalised versions in place (or in a separate folder if you told it to).

6. **Open the folder for any future session.** The model reads `CLAUDE.md` first and runs the PM from there.

---

## What to expect during onboarding

**Phase 1 — You** (5 min)
Three questions: name, one-line self-description, how you work.

**Phase 2 — Content layer toggle** (1 min)
A single yes/no question. If no, skip Phase 6 entirely.

**Phase 3 — Projects** (10–20 min, depending on count)
For each active project: name, work/personal/both tag, role, partner, working directory, hours cap if any, current status, next milestone. This phase pushes for specifics — don't accept "TBD" from yourself.

**Phase 4 — Cockpit rules** (2 min)
Weekly task cap (default 7), brain dump cadence (default each session), any extra hard rules you want enforced.

**Phase 5 — Goals** (5–10 min)
90-day horizon per project, priority hierarchy with role labels.

**Phase 6 — POV and voice** (10–20 min, only if Phase 2 was yes)
Central lens, core theses, contrarian takes, what you are NOT, distinctive phrases, writing rules, per-project audiences, tone. Skippable per question.

**Phase 7 — Guardrails** (5–10 min)
Known failure modes (with Flag/Redirect lines), decision-fatigue patterns, collaboration dynamics, energy rhythms.

You can pause and resume between phases. Files are written incrementally.

---

## After install — your first real session

Open the folder in Cowork (or your LLM of choice). The model reads `CLAUDE.md` and asks:

> *"Are we focused on work, personal, or both today?"*

Your answer filters the rest of the session. The model orients you in 3 sentences: where things stand in that context, what's on this week's plan, the one thing to focus on today.

If `BRAIN_DUMP.md` has unprocessed content, the model flags it and offers to process.

End of session: confirm action items are in the right file, close out.

---

## File map after install

```
Your folder/
├── CLAUDE.md                  ← session ritual (model reads first)
├── STATUS.md                  ← handoff between sessions
├── PROJECT_HQ.md              ← 90-second cockpit (Work / Personal sections)
├── WEEKLY_PLAN.md             ← weekly task contract (Work / Personal sections)
├── GOALS.md                   ← priority hierarchy (Work / Personal)
├── ROADMAP.md                 ← 90-day milestones
├── BRAIN_DUMP.md              ← unified inbox
├── USER_GUARDRAILS.md         ← failure modes
│
├── USER_POV.md                ← (only if content layer ON)
├── USER_VOICE.md              ← (only if content layer ON)
├── USER_FRONTIER.md           ← (only if content layer ON)
│
└── <project-name>/            ← one subfolder per project
    ├── CLAUDE.md              ← sub-agent (with-cap or no-cap variant)
    ├── <PROJECT>.md           ← strategy + tasks
    ├── <PROJECT>_TASKS.md     ← prioritisation matrix
    └── <PROJECT>_LOG.md       ← hour ledger (only for capped projects)
```

---

## Common questions

**Can I skip onboarding sections and fill later?**
Yes. The model leaves `→ fill when ready` markers in any skipped section. You can run `setup-pm` again later, or just edit the files directly.

**Can I add or remove projects after install?**
Yes. Create a new subfolder, copy from `project-template/`, fill in the placeholders. Update `PROJECT_HQ.md`, `GOALS.md`, and the KEY FILES table in `CLAUDE.md` to reference it.

**What if I want to change the weekly task cap?**
Edit `CLAUDE.md`, `WEEKLY_PLAN.md`, and `USER_GUARDRAILS.md` — search-and-replace the number.

**Can I run this without the content layer and add it later?**
Yes. Re-run `setup-pm` and say yes to Phase 2, or manually copy the three files from `content-optional/` (in the templates) and fill them in.

**The model is making things up during onboarding.**
Stop and remind it: "Don't invent content. Leave skipped sections as `→ fill when ready`." This is also explicit in the SKILL instructions.

**How do I reset and start over?**
Delete (or move) your PM folder. Re-run `setup-pm` (Cowork) or re-paste `ONBOARDING.md` (standalone).

---

## Troubleshooting

**The model isn't reading CLAUDE.md at session start.**
- Cowork: make sure you opened the folder as a Cowork project, not as a free chat with the folder pasted in.
- Standalone: explicitly tell the model at session start: *"Read CLAUDE.md in this folder first."*

**Onboarding finished but some files have raw `{{PLACEHOLDER}}` markers.**
Tell the model: *"Scan all files in the folder for unfilled `{{PLACEHOLDER}}` markers and either fill them or replace with `→ fill when ready`."*

**The PM is too long-winded / too brief.**
Edit `CLAUDE.md` directly — the "EA IDENTITY" and "Tone" sections drive how it talks.

**Sessions feel cluttered even with mode switching.**
Check that every project has a clear context tag in `PROJECT_HQ.md`. Untagged projects show up in both modes.
