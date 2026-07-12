# CLAUDE.md — Solo-Operator EA spec build

## §1 Preamble

This project follows spec engineering. `app/spec.html` is the canonical input; `app/evals.md` is the check bar. The subject being specified is the **existing EA logic** in `solo-project-manager-templates/` (and `everyday-pm-templates/`) — the spec documents and justifies that logic; it does not invent a new app. Read this file first every session — it is META about *how we build*, never product content.

## §2 Durable tenets

- The logic already exists in the template files; the spec grounds in them and never invents mechanics the templates don't have.
- The EA is a set of markdown files read by an LLM — there is no code, no database, no external API. Introducing any of those is a spec change, not a build decision.
- The EA plans, routes, and manages; it never executes a deliverable unless explicitly asked — unrequested execution is a defect wherever it appears.
- Onboarding fills placeholders from operator answers or leaves `→ fill when ready`; fabricated content is a defect.
- The eval grades the logic from a session transcript + the folder's before/after state — not from prose claims.
- The spec is the source of truth; one change per Surgical Fix; the eval's checks come from the spec.

## §3 Workflow map

**S1 spec → S2 build → S3 eval → S4 debug → S5 strip.** Each stage reads upstream artifacts only. Here "build" (S2) is largely already done — it lives in the template files; S2's job is to reconcile the templates against this spec, not to generate a new app.

## §4 Artifact map

| artifact | path | what lives there | written by |
|---|---|---|---|
| spec | `app/spec.html` | problem · the EA's logic · interfaces · components · checks · stack | S1 |
| checks | `app/evals.md` | the acceptance checks S3 runs | S1 (rows added by S3) |
| spec summary | `app/spec-summary.json` | machine-readable problem/outcome/constraints | S1 |
| the logic | `solo-project-manager-templates/`, `everyday-pm-templates/` | the EA itself: ritual, rules, templates, onboarding | source (gks-exec-assistant) |
| eval results | `app/eval-results.html` | scorecard · traces · patterns · actions | S3 |
| debug log | `app/debug-log.html` | one receipt per fix | S4 |
| trace | `app/claude-progress.txt` | one RATIONALE line per landed artifact | every stage |

## §5 Cross-stage rules

- The eval reads the spec and the template logic, not any generated code.
- `CLAUDE.md` never carries product content; update it only when a tenet survives a model swap.
- Provenance: every claim in the spec traces to a template file it came from.
