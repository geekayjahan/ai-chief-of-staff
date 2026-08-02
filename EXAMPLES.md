# Example use cases

Real things to try once your chief of staff is running, with what a good answer looks like. If you are
evaluating whether this is worth the setup, work through the first three. They are where the
difference shows.

---

## 1. The short window

```
I have twenty minutes before a call. What is worth doing?
```

**Good:** one task, named, with the reason it is that one and not another. It should be pulled
from this week's plan, in the mode you are in.

**Not good:** a list of options handed back to you. If it returns a menu, you are doing the
prioritising, which is the job you delegated.

---

## 2. The voice dump

Talk into your phone on the walk back, paste the transcript in raw. This is what one actually
looks like, and the point is that you do not clean it up:

```
/voice-dump

ok so um the review deck still needs the rewrite before thursday I keep pushing it, oh and I
never replied to Sam about the access thing, sorry the permissions, the permissions request
is still open too, what else, mum's birthday is coming up somewhere in the next couple of
weeks I should sort something, and the migration doc has been half done for a month now
which is annoying, and honestly I keep wondering whether we've scoped this way too big,
anyway the deck is the main thing
```

**Good:** the deck and the migration doc route to their projects, the birthday goes to personal,
the reply to Sam becomes a task, the repetition collapses into one item, and "I keep wondering
whether we've scoped this way too big" is kept as an open question rather than turned into a task
you never asked for. Anything it cannot place comes back as one question.

This is the one to try first. It is the clearest illustration of the whole system: messy input,
sorted output, nothing invented.

---

## 3. The week that fell apart

```
Everything slipped this week. Renegotiate the plan.
```

**Good:** it does not just roll everything forward. It asks what actually broke, then rebuilds
against the cap, which means naming what is getting dropped rather than deferred. Deferring
everything is how a plan becomes fiction.

---

## 4. The new commitment

```
I have been asked to join another workstream starting in three weeks. Should I?
```

**Good:** it runs your own filter back at you. What does this displace, where does it sit in the
priority hierarchy, and what breaks if it does not happen. A yes that does not name the thing it
pushes off is not a real yes.

---

## 5. The capped project

Only meaningful if a project has an hours cap.

```
How am I doing against the cap on <project> this week?
```

**Good:** hours logged against hours available, and a straight answer on whether the remaining
work fits. If it does not fit, it says so before the week ends rather than after.

---

## 6. Prep for a specific thing

```
Prep me for tomorrow's session with <partner>. What is outstanding on our side, what did we
agree last time, and what do I need a decision on.
```

**Good:** it pulls from the project log and the last handoff. Outstanding items on your side are
separated from things you are waiting on, because those need different conversations.

---

## 7. The morning brief

```
/daily-brief
```

**Good:** what needs you today, what is already handled, and the one thing. Short enough to read
standing up. It opens from whatever Friday's wrap wrote, so it should already know where you
stopped.

**Not good:** a status report on every project, or a greeting and a preamble before the first
real line. Also not good: stalling or complaining because you have no calendar connected. It is
built to run on your files alone.

---

## 8. The Friday wrap, and the loop

```
/friday-wrap
```

**Good:** what closed, what slipped **and why it slipped**, what carries, hours against any
capped project, and next week rebuilt against the cap with the cut named rather than everything
quietly fitted in.

Then the part worth seeing: run `/daily-brief` straight afterwards. It should open from the
handoff the wrap just wrote. That round trip, wrap writes and brief reads, is the system working
rather than two separate tricks.

---

## 9. The return

```
I have been away two weeks. Where am I?
```

**Good:** what changed, what is now late, and the first thing to pick up. Not a status report on
every project. The three sentence discipline holds here too, and this is exactly where a lesser
setup floods you.

---

## 10. The guardrail catch

You will not prompt for this one. It should happen on its own.

If you named a failure mode during onboarding, for example that you rewrite finished work rather
than shipping it, then the assistant should catch it in the session where you start doing it and
redirect you. That is `USER_GUARDRAILS.md` doing its job.

If it never fires, your guardrails are probably written too vaguely to be recognisable. Go back
and give each one a concrete "flag when" line.

---

## What to look for across all of these

The assistant is working if it says less than you expected, asks before routing something
ambiguous, and refuses things. An assistant that agrees with every addition to your week is a
list, and you already had one of those.

Work through the first three cases in your first week. Then stop testing it and let it run —
the Friday wrap will tell you whether the loop is holding.
