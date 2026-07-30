# Eval results

**Date:** 2026-07-30
**Branch:** `claude/ea-plugin-rubric-eng0dq` (`7ee84a2`, 28 files)
**Scope:** Claude path only. F3–F6 parked — audience confirmed on Claude Code + Desktop.
**Revision:** Transfer group (T1–T5) added after the lesson design was clarified, and scored.
**Auditor:** Claude. Same model that authored the kit. See *Bias* at the end.

```
GATES: 1/6 · TALLY: 14/30 scored · VERDICT: fix-first
```

Five of the six gates fail. They trace to three root causes, not sixteen separate problems.

---

## The three root causes

### 1. The commands don't travel with the files

`.claude/` exists only at the kit root. `setup-pm` Phase 0 says never write into the kit, then
writes the PM to a folder elsewhere and never copies `.claude/` across. README:43 says *open your
new PM folder in a fresh session, it takes over from there.*

It can't. That folder has no skills and no commands. The `CLAUDE.md` written into it carries a
CAPABILITIES table instructing the assistant to invoke `voice-dump`, `daily-brief` and
`friday-wrap` — none of which resolve at that path.

The two halves live in two folders and only one can be the working directory. Sit in the kit and
the commands work but the PM files are elsewhere, and the kit's own `CLAUDE.md` says *this is the
kit, not your PM*. Sit in the PM folder and you have files with nothing to run on them.

Takes down **F1, F2, P1**, and blocks the loop from running even though **E1** is structurally
sound.

*Caveat:* this likely works on the author's machine, where those skills are probably installed at
user level in `~/.claude/skills/` and resolve from anywhere. A learner handed a zip gets the
project-scoped copy and hits it immediately.

### 2. The kit ships the answer, not the method

The lesson's point is that the learner leaves able to rebuild this. The kit hands them finished
templates with blanks to fill.

`PROMPTS.md` has eight sections and every one is about *running* the assistant: install, start a
session, set the week, monthly review, add a project, re-orient, fix it. None of them build it.
`templates/` is the completed artefact with `{{PLACEHOLDER}}` markers, so the learner receives an
assistant and never sees what produced it.

They also cannot explain it afterwards. README:6 gives the reasoning for three things — the cap,
the cockpit, the cleared brain dump. The other five root files appear in a table that says what
each one is and never why it exists.

Takes down **T1**, drives **T2**.

### 3. There is no front door

The interview exists and is good. Nothing routes a new user into it.

README opens with a product description, and "Start here" step 1 is *decide where your personalised
PM should live* — a filing decision before a conversation. Three install paths follow, then
`PROMPTS.md` restates all three in different words. Four-plus entry points, none of them "open this
file."

Takes down **M1, M2, M3**, and drives **L1, L3**.

---

## Gates

| ID | Question | Verdict | Evidence |
|---|---|---|---|
| **M1** | First output is a question about the user | **FAIL** *(inferred)* | README:3 opens with product description; README:39 first instruction is a filing decision. Interview starts only after `/setup-pm` or pasting ONBOARDING. |
| **M2** | Zero pre-work before that question | **FAIL** | Three required actions first: decide folder (README:39), choose install path (README:50–55), run command or paste file. Any count above zero fails. |
| **F1** | Runs with the vendor layer absent | **FAIL** | Not hypothetical — the install path itself produces a PM folder without `.claude/`. Grep of `setup-pm/SKILL.md`, `ONBOARDING.md`, `commands/setup-pm.md` finds no copy step. |
| **F2** | No vendor mechanism is load-bearing | **FAIL** | `templates/CLAUDE.md` CAPABILITIES table names three capabilities that only resolve from the kit's `.claude/`. Same file also assumes something auto-reads it at session start. |
| **T1** | Hands over prompts that build, not files to fill | **FAIL** | All eight `PROMPTS.md` sections are runtime operations. `templates/` ships the finished artefact with blanks. No prompt in the kit produces the kit. |
| **E1** | The loop closes | **PASS** | `friday-wrap:51,55` writes `STATUS.md` and `PROJECT_HQ.md`; `daily-brief:19,21` reads both, `STATUS.md` first. Structurally sound. Blocked at runtime by F1, not by its own design. |

---

## Scored criteria

| ID | Question | Verdict | Evidence |
|---|---|---|---|
| M3 | Exactly one file to open first | FAIL | 3 install paths in README:50–55, restated in PROMPTS:18–34. |
| M4 | Personalised artefact before the sitting ends | PASS | `setup-pm` Phase 6 writes files, Phase 7 reports location. |
| M5 | Repeatable in one sentence | PASS | README:3, 12 words, no jargon. |
| F7 | `templates/` free of personal detail | PASS | Grep for names, orgs, dates: clean. |
| A1 | No second source of truth in the vendor layer | FAIL | Each `commands/*.md` paraphrases its skill: 60w vs 587w, 70w vs 517w, 64w vs 589w, 129w vs 2088w. |
| A2 | Skills fire without being named | PASS | Descriptions are trigger-shaped — `daily-brief` lists "where am I", "what's today", "orient me". |
| A3 | Connectors optional, read-only, silent | PASS | README:104–126 states all three; `daily-brief:36` requires silent skip. |
| A4 | Injection rule at every boundary | FAIL | Present in `daily-brief` (×2), README, `templates/CLAUDE.md`. Absent in `voice-dump`, which ingests pasted transcripts — a live boundary. Absent in `friday-wrap`. |
| L1 | ≤3 files before first output | FAIL | README → PROMPTS or ONBOARDING → `setup-pm/SKILL.md` → templates. Four-plus. |
| L2 | Runtime budget under 2,000 words | FAIL | 2,031 words across the files one brief must read. Over by 31. |
| L3 | No instruction stated twice in different words | FAIL | Install paths in README:50–55 and PROMPTS:18–34. Onboarding phases in both `ONBOARDING.md` (0–5) and `setup-pm/SKILL.md` (0–7) — already drifted once, see commit `9f4a4f6`. |
| L4 | No orphan files | FAIL | All four `commands/*.md` are referenced by nothing; they resolve by convention only. |
| N1 | Invented terms defined at first use | FAIL | "cockpit" README:6, "handoff" README:16, "sub-agent" README:98 — all undefined at first use. "session mode" never appears in README despite being core. |
| N2 | Every doc ends with a next action | FAIL | `EXAMPLES.md` ends mid-commentary. |
| N3 | Survives low-effort onboarding | PASS *(inferred)* | "→ fill when ready" rule stated in three places. |
| N4 | No untaught tool knowledge assumed | FAIL | README:50 says run `/setup-pm` without explaining slash commands or that they need Claude Code. "skills" (README:20) and "sub-agent" (README:98) likewise. |
| E2 | One product name | FAIL | "AI Chief of Staff" (README:1), "Everyday Project Manager" (2 files), "Project Manager" (9 files). |
| E3 | Install paths produce the same file set | FAIL | The paste path returns files as chat output, not written files (PROMPTS:34). No path copies `.claude/`. |
| E4 | File lists agree wherever they appear | PASS | Same 8 root files in README's tree, ONBOARDING's "What to write", and setup-pm's table. |
| E5 | Placeholder bijection | PASS | 52 placeholders in `templates/`, all documented; no undocumented or unused. |
| E6 | Ritual matches across files | FAIL | 6 numbered steps in `templates/CLAUDE.md`, 8 in `SESSION-FLOW.md`. |
| E7 | Numeric defaults agree | PASS | Cap, 90-second cockpit, 7th-of-month all consistent. |
| P1 | Every claim demonstrable | FAIL | README:18 promises the wrap-to-brief loop; not demonstrable on the install path, per root cause 1. |
| P2 | Named recovery per failure | PASS | PROMPTS:129 plus SESSION-FLOW:97 cover the five named modes. |
| P3 | Low-effort onboarding usable | PASS *(inferred)* | Same rule as N3. |
| P4 | Worked example with expected output | PASS | `EXAMPLES.md`, 11 sections showing what good looks like. |
| T2 | Learner can say why each file exists | FAIL | README:6 gives rationale for 3 of 8 root files. The rest get function-only rows in a table. |
| T3 | Blueprint separable from instance | PASS | README:39 "the templates stay clean"; `setup-pm` Phase 0 forbids writing into the kit. Enforced, not just stated. |
| T4 | Build outputs an installed plugin | FAIL | No `.claude-plugin/plugin.json` on this branch. It exists on `claude/plugin-status-demo-u3hsim`, which this lineage dropped. |
| T5 | Blueprint changeable and rebuildable | PASS | README:140–149 names what to edit for the cap, the tone, a new project, a fourth capability. |

**Parked:** F3, F4, F5, F6 — cross-model portability. Audience is on Claude Code and Desktop.

---

## Punch list

Gates first. Two fixes clear four of them.

1. **Make the build produce an installed plugin.** A plugin's skills resolve from any folder, which
   is why this works on the author's machine and breaks for anyone handed a loose folder. The
   manifest and `build-plugin.sh` already exist on `claude/plugin-status-demo-u3hsim`. Clears F1,
   F2, T4, P1.
2. **Write the prompts that build the kit.** The learner runs them and their assistant comes out the
   other end. Add the reason each file exists while doing it. Clears T1, T2.
3. **Give it a front door.** One file, named the same everywhere, that opens by asking the user a
   question. Move the folder decision after the interview or drop it. Clears M1, M2, M3.
4. Collapse the duplicated install instructions and the duplicated onboarding phases. L3, L1, A1.
5. Pick one product name. E2.
6. Add the injection rule to `voice-dump`. A4.
7. Reconcile the 6-step and 8-step rituals. E6.
8. Define cockpit, handoff, sub-agent, session mode at first use. N1, N4.

Items 5–8 are cheap and independent. Items 1–3 are structural and should land first.

---

## Bias

This audit was run by the same model that wrote every file in it — 11 of 12 commits are authored by
Claude. Two specific effects:

- The rubric was written *after* reading all 28 files, so it is sharp on flaws already spotted and
  silent on dimensions nothing prompted. Blind spots in the kit are blind spots in the rubric.
- Six findings were predicted before the audit ran. Five were confirmed here. That is weaker
  evidence than it looks.
- The first version of this rubric had 35 criteria and not one of them asked whether the learner
  could rebuild the kit — the stated point of the lesson. The Transfer group was added only after
  the author described the lesson design. A rubric written from the artefact grades the artefact.

Five criteria are marked *inferred* — M1, M2, N3, P3, and A2's trigger behaviour — because no live
session could be run in this environment. They need a human to open the entry file cold and watch
what it says first. That settles two gates outright.

---

# Eval results — second run

**Date:** 2026-07-30 (after rebuild)
**Branch:** `claude/ea-plugin-rubric-eng0dq` — restructured as plugin + build-prompts pack
**Scope:** Claude path. F3–F6 still parked. One scope note below on F1/F2.
**Auditor:** Claude, same caveats as run one.

```
GATES: 6/6 · TALLY: 29/30 · VERDICT: ship (pending live check of inferred criteria)
```

## What changed since run one

- `plugin/` is now a real plugin: manifest, marketplace.json for one-command install,
  `build-plugin.sh` verified packing all four skills. Templates live inside the setup skill, so
  everything resolves from any folder once installed. Root cause 1 closed.
- `BUILD-PROMPTS.md`: six prompts that build a student's own chief of staff from scratch, each
  with the why before the prompt. The lesson is the build; the plugin is the worked answer, and
  both README and kit CLAUDE.md state that hierarchy. Root cause 2 closed.
- One front door (README → BUILD-PROMPTS), interview opens setup with the folder question
  deferred to write time, and onboarding ends by putting the brief and wrap on a schedule.
  Root cause 3 closed.
- One name everywhere. Commands are thin pointers. ONBOARDING.md deleted (phases live only in
  the skill). Ritual is 7 steps in both files. Read budget 1,998 words.

## Gates

| ID | Verdict | Evidence |
|---|---|---|
| M1 | **PASS** *(inferred)* | setup-pm: "Open with the interview. Nothing comes before it." Build path: prompt 1 opens with a question about the user. Needs one live confirmation. |
| M2 | **PASS** *(inferred)* | Folder question moved to Phase 6. Between install (or paste) and the first question: zero actions. |
| F1 | **PASS** | The stranding bug is gone: installed plugin resolves from any folder; templates travel inside it. |
| F2 | **PASS** *(rescoped)* | Plugin install is now the platform assumption, per the audience decision (all on Claude Code). BUILD-PROMPTS is the rebuild path if that assumption breaks. |
| E1 | **PASS** | Unchanged: wrap writes what the brief reads. Now invocable everywhere, so the loop actually runs. |
| T1 | **PASS** | BUILD-PROMPTS.md: six prompts producing interview, files, brief, wrap, dump, package+schedule. |

## Corrections to run one

- **A4** claimed the injection rule was absent from `voice-dump`. Wrong — it was present at
  voice-dump:74 in different words than the grep pattern. `friday-wrap` reads no external
  content, so no rule is owed there. A4 was a PASS in run one as well.

## Scored (changes only; unchanged passes not relisted)

| ID | Was | Now | Evidence |
|---|---|---|---|
| M3 | FAIL | PASS | One entry point: BUILD-PROMPTS.md, stated in README, kit CLAUDE.md, and the README's closing line. |
| A1 | FAIL | PASS | Commands are 1-line pointers; ONBOARDING.md deleted; phases exist once. |
| A4 | FAIL | PASS | Correction above. |
| L1 | FAIL | PASS | README → BUILD-PROMPTS: two files to first output. |
| L2 | FAIL | PASS | 1,998 words. |
| L3 | FAIL | PASS | Install stated once (README); phases once (skill); ritual identical (7=7). |
| L4 | FAIL | PASS | Commands reachable via README → plugin/ map row; no doc orphans. |
| N1 | FAIL | PASS | skill, cockpit, handoff, guardrails defined inline at first use in README. |
| N2 | FAIL | PASS | EXAMPLES now closes with a next action. |
| N4 | FAIL | PASS | "skill" explained at first mention; install is one pasted command. |
| E2 | FAIL | PASS | AI Chief of Staff everywhere; only this file's run-one record retains old names. |
| E3 | FAIL | PASS | One install path. |
| E6 | FAIL | PASS | 7 steps both files, same order. |
| P1 | FAIL | PASS | The loop claim is now demonstrable end to end. |
| T2 | FAIL | PASS | Every BUILD-PROMPTS section opens with why the piece exists. |
| T4 | FAIL | PASS | plugin.json + marketplace.json + verified build script. |
| M4 | — | **FAIL → open** | Run one passed this; the rebuild moved scheduling into the sitting but the personalised files still land in a separate folder the user must open fresh. Mitigated (Phase 8 closes with "the first brief arrives tomorrow morning") but the fresh-session step survives. The one remaining tally fail. |

## What a human still has to do

1. Install the plugin cold and say "set me up" — confirm the first output is a question (M1/M2).
2. Run BUILD-PROMPTS prompt 1 in a fresh project — same check on the build path.
3. Run `friday-wrap` then `daily-brief` next morning — watch the handoff actually carry (E1 live).
