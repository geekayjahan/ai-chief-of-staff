# Security

This repository holds prompts, skills and templates. It contains no server, no runtime dependencies and no code that calls a network service. Your assistant runs inside your own Claude session, in a folder you choose, with the permissions you give it.

## Reporting a problem

Please report a vulnerability privately through the repository's Security tab ("Report a vulnerability"). Please do not open a public issue for a security problem.

## How the design limits risk

| Risk | Control |
|---|---|
| An email or document tells the assistant what to do | Every skill treats connected content as data and takes instructions only from you in the session. See "Connecting your apps" in the README. |
| The assistant acts in your accounts | The skills only read from connectors. Read-only scopes cover everything they do, and every capability works from local files when nothing is connected. |
| The assistant sets something running without you | Onboarding offers two scheduled tasks, the daily brief and the Friday wrap, and creates them only after you confirm. |
| A key ends up in a commit | Nothing here needs a key. `.env` is ignored for the one optional path that does, and a secret scan runs on every push. |
| Your personal details end up in this repo | Onboarding writes your files to a folder outside this repo. The templates here carry placeholders only. |
| A workflow dependency is compromised | Each GitHub Action is pinned to a commit, and Dependabot proposes updates weekly. |

## Known limits

- The data-versus-instruction rule is a prompt instruction. It lowers the chance that hostile content steers the assistant and does not remove it, so grant read-only scopes.
- What a connector can reach is decided by the scopes you approve when you connect it. This repo cannot enforce them.
- A plugin is instructions that run with your session's permissions. Read `plugin/` before you install it, as you would any plugin.
