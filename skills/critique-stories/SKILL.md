---
name: critique-stories
description: Check user stories for quality and split the ones that are too big. Use when someone asks to critique, check, review the quality of, or split stories in the story tracker, and when grill-concept hands over a draft.
---

# Critique and split stories

A story is **ready** when someone could approve it on its own and later check that it works. This skill holds every story to that bar, names what's off in plain words, and splits the ones that are too big.

The Sheet's columns and rules are in [SHEET-FORMAT.md](../../reference/SHEET-FORMAT.md).

## Two modes

- **Draft mode**: `grill-concept` hands over a draft that isn't in the Sheet yet. Fix what you can silently (wording, a missing "so that"), and return the splits and anything that needs the owner's call. Write nothing; grill-concept shows the result and writes the rows.
- **Sheet mode**: the person names a concept, some story IDs, a persona, or "everything". Read those stories and their details, critique them, talk through the findings one at a time, and write the outcome.

## The checks

Run every check on every story. A story that passes all of them is ready.

| Check | Ready when | Common miss |
|---|---|---|
| **One persona, one need** | The story names one persona and one thing they want. | "and" joining two needs; two personas in one story. |
| **Outcome** | The "so that" says what changes for the persona. | "so that it's saved", which restates the need. |
| **Persona's side** | It talks about people and situations, with no screens, tech or internal steps. | "I want a sync API", "a modal shows". |
| **Stands alone** | It could be approved and delivered without another story, except for one it is Blocked by. | Two stories that only make sense together and aren't linked. |
| **Small** | It covers one step of the journey and has about six details or fewer, all for the same need. | A story spanning several steps; details that serve different needs. |
| **Checkable** | Every detail describes something the persona would see or do, so anyone could say whether it works. | "Fast", "easy", "intuitive" with no measure. |
| **No overlap** | No other story in the Sheet asks for the same thing for the same persona. | The same need written twice under different steps. |
| **Linked** | Blocked by and Blocks mirror each other, Persona is on the Personas tab, Concept is set. | One-sided relations. |

For each failure, write a one-line note: what's off and the fix. "Checkable: S-004.2 says *quick*. Suggest *under 2 taps*."

## Splitting a story that's too big

Pick the pattern that fits, in this order of preference, and say which you used:

1. **By step**: one story per journey step it spans.
2. **By persona**: one story per persona when two share it.
3. **Happy path first**: the main path is one story; each unhappy path or exception is another.
4. **By rule or variation**: one story per business rule, case or kind of input.
5. **Simple first**: the plain version first, the richer version (more options, more precision) after it, Blocked by the first.
6. **Defer the measure**: "works" first, "works under a minute" as its own story, when the measure is hard.

A split:

- Gives each new story the next free IDs, its own persona, priority and reason.
- Moves each detail under the new story it belongs to, re-numbered under that story's ID (S-004.2 may become S-014.1). Every old detail lands somewhere or is parked.
- Carries the old story's assumptions and relations to whichever new stories they apply to, on both sides.
- Parks the old story, with `Split into S-014, S-015` in its Critique cell.

## Sheet mode, step by step

1. Read the target stories, their details, the concept's Personas and Success measures, and the stories they relate to.
2. Run every check on every target story. Done when each story has a verdict: ready, or a list of notes.
3. Show a compact summary, worst first, at most 12 lines:

   ```
   Critique · Doom box catalog (C-001) · 13 stories
   Ready: 9
   S-010 Search in my own words · Too big: 4 details, 2 needs → split by rule
   S-004 Fix a wrong guess · Checkable: S-004.2 "quick"
   ```
4. Go through the stories with notes one at a time, as `grill-concept` asks questions: the note, your recommended fix or split, "yes" to accept. "skip" leaves it with the note recorded. "fast" batches them.
5. Write as each one settles:
   - Ready stories: Critique `Ready <date>`. Leave Status alone.
   - Fixed stories: write the fix, then Critique `Ready <date>`. If the story was approved and the fix changed its meaning, move it back to in-review and say so.
   - Skipped: Critique holds the note.
   - Splits: write the new rows, move the details, park the old story, all in one update.
6. Wrap up in three lines: how many ready, fixed, split and still noted; a link to the Sheet; "Say *show stories needing work* to see what's left."
