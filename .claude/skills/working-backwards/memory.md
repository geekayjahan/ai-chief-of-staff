# Memory — working-backwards skill

One line per lesson, newest first, cap ~12. Read before running; append after any
session that taught something — especially interview questions that failed to
pin a fuzzy word, problem statements that turned out to hide a solution, and
tech-stack rows that were too vague for the build to act on. Prune as you append:
a lesson that has held for 3+ sessions moves into evals.md (if checkable) or the
blueprint (if procedural) and gets deleted here; merge duplicates; delete entries
about behavior that no longer happens.

- Log the problem-confirmation turn as its own trace line ("problem statement confirmed … before any artifact was written"). The confirmation happens at the plan/approval gate, but if the trace only lists the four artifacts, Check 4 is ungradable from output alone and reads as a fail — the confirmed problem is the one-way door, so record that it opened.
- Scrub `app/CLAUDE.md` §2 tenets of domain nouns. "No invented rows / no padded lists" leaks product content (rows, postings) even though it reads as build discipline; keep it generic ("no invented data; no padding to hit a target count") and let the spec carry specifics. The CLAUDE.md rule bars product content, full stop.
- When a comment renames a term, grep the verb/adjective forms too, not just the noun. Renaming the flag `location relaxed` → `widened` left a stray "flag the relaxed rows" in a different section — same concept, different wording, missed by a literal search for the old label. Sweep the synonym before closing.
- Ban the bare `~` on countable thresholds. "~10 rows" survived as a fuzzy word — two strangers can't agree whether 11 fails. Pin to "up to 10" / "≤30 days" so the edge checks grade identically. Sweep spec.html + spec-summary.json + evals.md for stray `~N` before closing.
