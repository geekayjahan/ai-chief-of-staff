# This is the kit, not your chief of staff

This repo holds the lesson and the finished plugin for building a personal AI Chief of Staff.
It is not itself a running assistant, and nothing here is personalised.

**The lesson lives in `BUILD-PROMPTS.md`.** Students paste its six prompts into Claude Code and
build their own. That is the primary path — the plugin is the worked answer, not the assignment.

**The plugin lives in `plugin/`.** Skills, commands, a manifest, and the templates (inside
`plugin/skills/setup-pm/references/templates/`, carrying `{{PLACEHOLDER}}` markers). Templates
are the source to copy from during onboarding, never the thing to run or edit in place.

## If someone asks you to set them up

Run the `setup-pm` skill (`plugin/skills/setup-pm/SKILL.md`) and follow it. Open with the
interview — nothing comes before it. Ask where the personalised files should go only when there
is something to write, and never write them into this repo.

## If someone opens this folder expecting their assistant to run

It will not. Point them at their own folder, the one onboarding wrote. That folder has its own
`CLAUDE.md`, which is the session ritual the assistant reads first.

## Map

| Path | What it is |
|------|-----------|
| `BUILD-PROMPTS.md` | The lesson — six prompts that build a chief of staff from scratch |
| `plugin/` | The finished plugin: 4 skills, 4 commands, manifest, templates |
| `SESSION-FLOW.md` | How a session runs, start to close |
| `PROMPTS.md` | Paste-ready prompts for running the thing |
| `EXAMPLES.md` | Example use cases, with what a good answer looks like |
| `EVAL.md` / `EVAL-RESULTS.md` | The rubric this kit is graded against, and the scorecards |
| `build-plugin.sh` | Packs `plugin/` into an installable `.plugin` file |

A capability is one folder under `plugin/skills/` with a `SKILL.md`, plus a one-line command in
`plugin/commands/`. Follow that shape when adding one — and add a matching prompt to
`BUILD-PROMPTS.md`, because anything the plugin can do, a student must be able to build.
