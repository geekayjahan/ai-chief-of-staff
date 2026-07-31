# Go live

Your chief of staff runs privately in a folder. This file covers putting a version of it on the
web, using hosts with free tiers: a published Claude artifact, Vercel, Netlify, or GitHub Pages.

## The one rule before anything ships

Publish the blank kit, never your personalised folder. The folder onboarding wrote contains
your projects, your guardrails, and your plans. Nothing below needs it, and no path here should
ever touch it.

## Path 1 — publish a Claude artifact (fastest)

Use this when you want a shareable page in minutes, with no accounts beyond claude.ai.

1. Open claude.ai and attach the kit files you want to show: the build guide, plus a skill or
   two.
2. Ask Claude to build an interactive page presenting your chief of staff: what it does, the
   six build prompts, and the routing map.
3. Publish the artifact and share the link. Artifacts start private; sharing is your call.

The result is a live page. It presents the system rather than running it, which makes it the
right way to show your build without shipping any credentials.

## Path 2 — host the kit as a site (Vercel, Netlify, or GitHub Pages)

Use this when you want a permanent URL on your own account.

**Vercel**

1. Fork this repo on GitHub.
2. On vercel.com, choose "Add New Project" and import your fork.
3. Deploy with no build settings. The files serve as-is at your `*.vercel.app` URL.

**GitHub Pages**

1. Fork this repo.
2. In your fork, go to Settings, then Pages, and deploy from the `main` branch.
3. Pages renders the markdown as web pages at your `*.github.io` URL.

Netlify follows the same shape as Vercel: import the repo, deploy without build settings.

Add an `index.html` later if you want a designed landing page. A plain deploy already gives
every file a public URL that people can read and copy from.

## Path 3 — a real chat app (the only path that needs a key)

Use this when you want visitors talking to a chief of staff instead of reading about one.

1. Scaffold a minimal chat app: one page, one API route, in whatever framework you like.
2. Load the kit's `CLAUDE.md` template and the skills in as the system prompt.
3. Call the model from the API route. `claude-sonnet-5` is a good default.
4. Deploy to Vercel's free tier and put the API key in the project's environment variables.

The key never goes in the repo. `.env` is gitignored here for exactly this use, and every host
provides an environment-variable panel, so a key never has a reason to appear in a commit. A
visitor-facing app also talks to strangers, so the folder it reads stays blank.

## Which path

| You want | Path |
|----------|------|
| A shareable page today | 1 — Claude artifact |
| A permanent URL on your own account | 2 — static host |
| Visitors talking to a live assistant | 3 — chat app with a key |
