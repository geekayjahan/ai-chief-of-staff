---
name: working-backwards-blueprint
description: Interview the user until the problem is sharp, then write the spec — work backwards from the customer, not the solution.
reads:
  - a rough idea (the interview itself is the input — no PRODUCT / FEATURE / BROKE form to fill in first)
produces:
  - app/spec.html
  - app/CLAUDE.md
  - app/spec-summary.json
  - app/evals.md
---

# Working Backwards

A spec an agent can build from reliably starts with a problem the user has actually confirmed — grill first, write second.

## Steps

1. **Interview one topic at a time** (AskUserQuestion). Ask, wait for the answer, then probe the soft spots:
   - who has the problem · the pain today · the outcome that counts · what "good" looks like
   - then the hard parts they haven't thought through — edge cases, constraints, tradeoffs

   Done when: the problem statement is sharp, solution-free, every fuzzy word pinned — and the user confirms it.

2. **Write `app/spec.html`** — lean (under 120 lines) and living (updated whenever S2–S4 learn something). Seven parts:

   | Part | What it holds |
   |---|---|
   | **Problem** | who it's for · the pain now · the outcome that counts — solution-free |
   | **What good looks like** | the behaviour in one pass; names the screens + primary action |
   | **Inputs & interfaces** | the files, data, and APIs; the credentials the build will need |
   | **Out of scope** | what you're deliberately not building |
   | **Task decomposition** | ordered tasks, each with a done-check; carried over and detailed at build (S2) |
   | **Verification** | acceptance checks (any number) → written to `evals.md`; run at S3. Write the old "Always / Ask First / Never" rules as concrete checks here, not as a separate section |
   | **Tech stack** | the build/infra choices, one row per category — name them or the build invents them |

   Done when: all seven parts are filled and no fuzzy word is left undefined.

3. **Pin the tech stack** — one row per category, or the build picks silently at build time and reshapes what the eval can even measure.

   | Category | Why it must be named |
   |---|---|
   | data sources | every row / event carries a provenance; the provider list is what's being trusted |
   | persistence | "in-memory" vs "Postgres" is invisible in prose but reshapes the check surface |
   | frontend / design system | Tailwind vs MUI vs vanilla isn't a feature; every screen rides it |
   | hosting / runtime | local vs Vercel vs Lambda changes what the checks can measure |
   | auth | "no auth" is a decision, not an oversight — name it |
   | observability | the trace file, an APM, or "none" — pick one |

   Row schema:

   ```text
   id · category · status (decided | open) · choice · reason · owner · eta (when open)
   ```

   - Mirror open rows to the spec's Open Questions.
   - A data-sources row names the **concrete source and access path** — the API plus where the key lives, the file, or the snapshot. "Live data" is not a source; it's the ambiguity the build will trip on at the credential checkpoint.
   - Optional categories when the build uses them: payments · search · queue · ML/AI providers · jobs · secrets.

   Done when: every category has a row, and every open row is mirrored to Open Questions.

4. **Write `app/CLAUDE.md`** — the project's standing memory, per the CLAUDE.md rule: META about *how we build*, read first every session, never product content. Five sections:

   | § | Section | Content |
   |---|---|---|
   | §1 | Preamble | "This project follows spec engineering. `spec.html` is the canonical input; the build reads it directly; `evals.md` is the check bar." |
   | §2 | Durable tenets | rules that survive model swaps — seeded here, augmented by S4 (surviving tenets) and S5 (post-strip). e.g. *the spec is the source of truth; code is regenerated from it* · *one change per Surgical Fix* · *the eval's checks come from the spec* · *the build never imports an unlisted tech-stack choice*. |
   | §3 | Workflow map | **S1 spec → S2 build → S3 eval → S4 debug → S5 strip.** Each stage reads upstream artifacts only. |
   | §4 | Artifact map | one row per artifact — `spec.html · spec-summary.json · evals.md · feature-list.json · app-spec.json · eval-results.html · debug-log.html · claude-progress.txt` — path · what lives there · which stage writes it. |
   | §5 | Cross-stage rules | the eval reads the spec, not the code · `CLAUDE.md` never carries product content · per-feature traceability via `feature-list.json`. |

5. **Write `app/spec-summary.json`** — a short, machine-readable summary for later stages: problem · who it's for · outcome · out of scope · key constraints.

6. **Write `app/evals.md`** — the spec's Verification part written out as the checks S3 will run. Any number; cover the happy path, the edges, and a couple of adversarial cases. Row schema:

   ```text
   id · scenario · check (a pass/fail two strangers grade the same from the output alone)
   ```

   The checks grow over time — every failure pattern the eval's error analysis uncovers becomes a new row.

## Checkpoints

- HALT before writing (step 2) IF any fuzzy word is undefined, a solution is baked into the *problem*, or the user has not confirmed the problem statement.

## How the files connect

| Spec part | Consumed by | Artifact |
|---|---|---|
| Verification | S3 eval | `evals.md` |
| Task decomposition | S2 decompose step | `feature-list.json` |
| Tech stack + Inputs & interfaces | S2 initialize step | `app-spec.json` |
| open items | the spec's Open Questions | — |

- `CLAUDE.md` does **not** mirror spec content (CLAUDE.md rule).
- There is no contract stage; the build reads the spec directly.
- The spec is **living**: when S2–S4 learn something, the fix can be a spec edit — then re-run.

## Hand-off

Render the four artifacts per the **render rule** and close out per the **trace rule** (see [`../shared-rules.md`](../shared-rules.md)). `spec.html` goes to Build.
