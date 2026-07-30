# Eval results

**Date:** 2026-07-30
**Branch:** `claude/ea-plugin-rubric-eng0dq` (`7ee84a2`, 28 files)
**Scope:** Claude path only. F3–F6 parked — cross-model portability deferred by request.
**Auditor:** Claude. Same model that authored the kit. See *Bias* at the end.

```
GATES: 1/5 · TALLY: 12/26 scored · VERDICT: fix-first
```

Four of the five gates fail, and they trace to two root causes. Not thirty separate problems.

---

## The two root causes

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

### 2. There is no front door

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

**Parked:** F3, F4, F5, F6 — cross-model portability, deferred.

---

## Punch list

Gates first. Two fixes clear four of them.

1. **Ship the capabilities with the PM.** Either `setup-pm` copies `.claude/` into the install
   folder, or the routines are written there as plain markdown. Clears F1, F2, P1.
2. **Give it a front door.** One file, named the same everywhere, that opens by asking the user a
   question. Move the folder decision after the interview or drop it. Clears M1, M2, M3.
3. Collapse the duplicated install instructions and the duplicated onboarding phases. L3, L1, A1.
4. Pick one product name. E2.
5. Add the injection rule to `voice-dump`. A4.
6. Reconcile the 6-step and 8-step rituals. E6.
7. Define cockpit, handoff, sub-agent, session mode at first use. N1, N4.

Items 4–7 are cheap and independent. Items 1–2 are structural and should land first.

---

## Bias

This audit was run by the same model that wrote every file in it — 11 of 12 commits are authored by
Claude. Two specific effects:

- The rubric was written *after* reading all 28 files, so it is sharp on flaws already spotted and
  silent on dimensions nothing prompted. Blind spots in the kit are blind spots in the rubric.
- Six findings were predicted before the audit ran. Five were confirmed here. That is weaker
  evidence than it looks.

Five criteria are marked *inferred* — M1, M2, N3, P3, and A2's trigger behaviour — because no live
session could be run in this environment. They need a human to open the entry file cold and watch
what it says first. That settles two gates outright.
