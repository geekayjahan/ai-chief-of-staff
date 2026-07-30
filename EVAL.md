# Eval

A binary rubric for this kit. Forty criteria, each answerable yes or no, six of which are
gates that block on their own.

Run it after any change worth arguing about. Write the results to `EVAL-RESULTS.md` with a date,
so drift is visible over time.

## What this is testing

The lesson runs like this. An intro on what this can do, a live demo of the plugin working in
Claude Desktop, then the audience is handed a kit. They all have Claude Code and Claude Desktop
installed beforehand. They open the kit, an interview discovers who they are, and the files get
built from their answers.

But receiving a working assistant is only half of it. They should also be able to build it
themselves. The core logic and the blueprint are the author's. The assistant is not. A learner who
walks away holding files they could not reproduce has been given a tool and taught nothing.

So the thing under test is both halves. Does the kit land the moment and produce a working
assistant, and does it hand over enough that the learner could build their own. A kit that ships
perfect files and teaches nothing fails, however good the files are.

Cross-model portability is parked. F3 to F6 stay in the rubric but are not scored while the
audience is known to have Claude Code and Desktop.

## The rule for every criterion

A criterion is binary only if two people auditing separately reach the same verdict without
conferring. Each one is settled by something you can count, grep, or watch happen.

"Is this simple enough" is not a criterion. It is an opinion wearing one. Every row below carries
the test that settles it.

---

## M — The moment

The audience opens one file and gets interviewed. This group tests whether that happens, or
whether setup is standing in front of it.

| ID | Question | How it is settled |
|---|---|---|
| **M1** ⛔ | Is the first output a question about the user? | Open the entry file cold. The first response must contain a question about them. An explanation, a file tour, a menu, or "where should I install this" fails. |
| **M2** ⛔ | Does the user reach that question with zero pre-work? | Count the actions required first: choosing a folder, running a command, copying files, editing anything. Any count above zero fails. |
| **M3** | Is there exactly one file the user is told to open first? | Grep every doc for start instructions and count distinct entry points. More than one fails. Two docs naming different files fails. |
| **M4** | Does a personalised artefact exist before the first sitting ends? | The user sees their own words in a file they can open. "Now open a fresh session to see it work" fails. |
| **M5** | Can a learner repeat what this is in one sentence? | One sentence exists in the entry file, under 25 words, no internal jargon. |

## F — Fungibility

The spine. Whether the kit survives contact with a tool that has none of the Claude features.

| ID | Question | How it is settled |
|---|---|---|
| **F1** ⛔ | Does the kit run with the vendor layer deleted? | Delete `.claude/`. Walk install, first brief, wrap, using only what remains. Any break fails. Run this for real in a scratch copy. Do not reason about it. |
| **F2** ⛔ | Is any vendor mechanism load-bearing? | List every mechanism the kit leans on: slash commands, skill frontmatter, auto-read `CLAUDE.md`, scheduled tasks, connectors, plugin install. For each, ask whether meaning is lost without it. One yes fails. |
| **F3** | Does the entry file work when pasted, with no folder access? | Its instructions must be self-contained enough that pasting it into a bare chat produces the interview. Content that only resolves by reading a sibling file fails. |
| **F4** | Are the recurring routines available as plain prompts? | Morning brief and Friday wrap each exist as text a user can paste into any scheduler, or none. Available only as a slash command or a Desktop task fails. |
| **F5** | Is every file portable markdown? | No YAML frontmatter, `$ARGUMENTS`, or vendor path convention required for a file to function. Present but ignorable passes. Required fails. |
| **F6** | Is swapping the domain a bounded edit? | A doc names which files to change to repoint the kit at a different job. Absent fails. |
| **F7** | Is `templates/` free of personal detail? | Grep for real names, dates, org names, project names. Any hit fails. |

## A — Capability use is additive

Latest capabilities are worth using. For this audience, using them well means using them additively.

| ID | Question | How it is settled |
|---|---|---|
| **A1** | Does the vendor layer introduce a second source of truth? | Diff each `commands/*.md` against its `SKILL.md`, and each skill against the portable core. Anything stated only in the vendor layer fails. Anything restated there in different words fails. |
| **A2** | Do skills fire without being named? | Each description must be trigger-shaped, naming the user's words rather than the skill's job. Test: "where am I", with no slash command, should fire the brief. |
| **A3** | Are connectors optional, read-only, and silently degrading? | Three checks, all must pass. Stated optional. Read-only scopes sufficient. Absence never mentioned to the user. |
| **A4** | Is the injection rule at every external-content boundary? | Every point where outside content enters, whether mail, calendar, fetched pages or pasted transcripts, carries the data-not-instruction rule. One boundary missing it fails. |

## L — Load

| ID | Question | How it is settled |
|---|---|---|
| **L1** | Does the user touch three files or fewer before their first personalised output? | Count them. |
| **L2** | Is the runtime read budget under 2,000 words? | `wc -w` across every file the model must read to produce one morning brief. |
| **L3** | Is any instruction stated twice in different words? | Pairwise across README, PROMPTS, SESSION-FLOW, ONBOARDING and the skills. One divergent restatement fails. Verbatim reuse passes. Paraphrase does not. |
| **L4** | Is every shipped file reachable within two hops of the entry file? | Build the reference graph. Any orphan fails. |

## N — New user

| ID | Question | How it is settled |
|---|---|---|
| **N1** | Is every invented term defined at first use? | Checklist: cockpit, handoff, task cap, hours cap, session mode, guardrail, brain dump, capped project, sub-agent, the loop. Any left undefined where a first-time reader meets it fails. |
| **N2** | Does every user-facing file end with a next action? | Read the last paragraph of each. |
| **N3** | Does skipping every optional step still produce a working PM? | Answer only the required fields. The result must run a brief without erroring or asking for missing data. |
| **N4** | Does the kit assume tool knowledge it does not teach? | Grep for skills, commands, MCP, connectors, sub-agents, scheduled tasks, plugins, projects. Each must be explained in-line at first mention. |

## E — End to end

| ID | Question | How it is settled |
|---|---|---|
| **E1** ⛔ | Does the loop close? | `friday-wrap` must write the same file and the same section names that `daily-brief` reads. Compare the two literally. |
| **E2** | Is the product called one thing everywhere? | Grep the names. More than one product-level name fails. |
| **E3** | Do all documented install paths produce the same file set? | Enumerate every path the docs describe and diff the resulting file lists. Any divergence fails. A path that is demoed but not documented fails. |
| **E4** | Do the file lists agree wherever one appears? | Diff README's tree against ONBOARDING's "What to write" against setup-pm's write tables. |
| **E5** | Is there a bijection between placeholders and the setup reference? | Grep every `{{...}}` in `templates/`. Each must appear in the reference tables, and each table entry must appear in a template. Either direction failing fails. |
| **E6** | Does the ritual match itself across files? | Compare `SESSION-FLOW.md` step by step against the session start ritual in `templates/CLAUDE.md`. A different count or order fails. |
| **E7** | Do numeric defaults agree everywhere? | Task cap, brain dump cadence, cockpit read time, review date. One disagreement fails. |

## T — Transfer

The learner is meant to leave able to rebuild this, not just holding it. The blueprint is the
author's. The assistant should not be. This group tests whether the kit teaches or only ships.

| ID | Question | How it is settled |
|---|---|---|
| **T1** ⛔ | Does the kit hand over prompts that produce the files, rather than the files? | A learner following the kit must generate their own assistant. Receiving finished files with blanks to fill fails. |
| **T2** | Can a learner say why each file exists, from the kit alone? | Every file in the shipped set carries its rationale, not only its function. A table of what each file is fails. |
| **T3** | Is the blueprint separable from the instance? | The reusable logic and one person's filled-in copy must be distinguishable, and stay that way after install. |
| **T4** | Does the build output an installed plugin? | A plugin resolves from any folder. A folder to copy does not, and breaks the moment the user works somewhere else. |
| **T5** | Can the blueprint be changed and rebuilt without starting over? | A doc names what to edit and what to re-run. |

## P — Practical

| ID | Question | How it is settled |
|---|---|---|
| **P1** | Is every claim in the docs demonstrable? | List the README's promises. Each must be shown by the files. A promise the kit cannot keep fails. |
| **P2** | Is there a named recovery for each common failure? | Ritual skipped, placeholders survived install, it writes essays, it does the work instead of managing it, onboarding invents content. |
| **P3** | Does it survive low-effort onboarding? | Answer every question with one word or a skip. The output must be usable, with gaps marked rather than invented. |
| **P4** | Is there a worked example with expected output? | It must show what a good answer looks like, not only what to type. |

---

## Scoring

Six gates: **M1, M2, F1, F2, E1, T1**.

The first two are the moment, which is the opening promise. The next two are portability, which is
what makes the kit usable by an audience that is not all in one tool. The last is the loop, which
is what makes this a system rather than two prompts. Everything else is a defect to fix, not a
reason to stop.

- Any gate failing means not ready to teach, whatever the tally says.
- The rest report as a tally out of 34.
- Verdict line: `GATES: n/6 · TALLY: n/34 · VERDICT: ship | fix-first | rebuild`.

Every fail carries one line of evidence, either a file and line or the count that settled it. A
fail without evidence gets dropped. It is an opinion.

## Running it

| Type | Criteria | Method |
|---|---|---|
| Counting | L1, L2, L4, E5 | `wc -w`, grep `{{...}}`, build the reference graph |
| Diffing | L3, A1, E2, E4, E6, E7 | Pairwise compare the named files |
| Deletion | F1, F2, F3 | Remove the vendor layer in a scratch copy and walk the path |
| Behavioural | M1, M2, N3, A2, P3 | Where a live session cannot be run, reason from file contents and mark the result `inferred` rather than `observed` |
| Presence | M5, N1, N4, F6, F7, A3, A4, P2, P4 | Grep for the required thing |

The deletion tests are the most valuable in the rubric and the easiest to skip. Do not skip them.

One sanity check on the rubric itself: it should never return 40 out of 40 on first contact. A
rubric that passes everything is measuring nothing.
