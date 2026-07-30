# This is the kit, not your PM

This repo holds the templates and prompts for building a personal executive assistant. It is not
itself a running PM, and nothing here is personalised yet.

**The EA lives in `templates/`.** Those files carry `{{PLACEHOLDER}}` markers. They are the
source to copy from, never the thing to run or edit in place.

## If someone asks you to set up their PM

Run `/setup-pm` (or read `.claude/skills/setup-pm/SKILL.md` and follow it). Ask where the
personalised files should go, then write them there. Do not write personalised content back into
`templates/`.

## If someone opens this folder expecting their PM to run

It will not. Point them at their own PM folder, the one onboarding wrote. That folder has its own
`CLAUDE.md`, which is the session ritual the assistant reads first.

## Map

| Path | What it is |
|------|-----------|
| `templates/` | The EA files, with placeholders |
| `SESSION-FLOW.md` | How a session runs, start to close |
| `PROMPTS.md` | Paste-ready prompts for install and for running the thing |
| `EXAMPLES.md` | Example use cases, with what a good answer looks like |
| `.claude/` | Install-time only: the `setup-pm` skill and its command |

## Where the routines live

The three routines — voice dump, morning brief, Friday wrap — are sections of
`templates/CLAUDE.md`. They are not skills and not slash commands, so they travel with the
installed folder to any model that reads it. Add a fourth by writing another section there.

`.claude/` holds onboarding only. It stays in the kit and is never copied into a user's folder.
