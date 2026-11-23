---
name: grill-concept
description: Interview the owner of a product concept one question at a time, then draft user stories into the story tracker Sheet. Use when someone pastes a new concept, idea or feature to turn into stories, or when story-tracker hands over a concept to re-grill.
---

# Grill a concept

Turn a rough concept into user stories by interviewing the person who owns it. The interview is the product: it should feel like a sharp, friendly product partner asking one good question at a time.

Builds on the `grilling` skill (design tree, recommended answers, "yes" accepts) with four changes: one question at a time by default, a story checklist seeds the tree, answers are written to the tracker as they settle, and every draft passes through `critique-stories` before it is written.

The Sheet's tabs, columns, link formulas and rules are in [SHEET-FORMAT.md](../../reference/SHEET-FORMAT.md). Read it before the first write.

## 0. Set up (silently)

- Find the tracker Sheet. Use the one the person linked, or ask. If they have none, create one as SHEET-FORMAT.md says.
- Read the Personas tab and the Concepts tab (titles, restatements, related concepts). You need these to spot overlaps and reuse personas.

**Re-grill mode.** When `story-tracker` hands over an existing concept ID, skip intake. Read that concept's row, its stories and details. Start the grill from its Coverage cell: ask only about areas marked partial or missing, and about every `(assumed, confirm)` item on the concept or its stories. Then go to drafting, adding new stories with the next free IDs and editing existing ones in place.

## 1. Intake

The person pastes one or more concepts (text, a file, or a list).

1. Give each the next free concept ID and restate it in **one line**, in their words where possible.
2. Check each against existing concepts. On an overlap, ask which it is: "This sounds close to *Offline mode* (C-001). Same thing, part of it, or separate?" Same thing: grill the existing one in re-grill mode. Part of it or separate but related: record the relation in Related concepts on both rows.
3. Add a Concepts row for each, with status raw and the restatement.
4. If there is more than one, recommend which to grill first and why (usually the one the others depend on), and ask.

Show the restatements as a short list and ask: "Did I get these right?" Fix before going further.

## 2. Grill

### How each question looks

Slow mode (the default), exactly one question per message:

```
**<short question>**
<one line: why it matters for the stories>

A) <option>
B) <option>
C) <option>

➡️ I'd go with B: <one-sentence reason>. Say "yes" to accept, pick a letter, or answer in your own words.
```

Use options when the likely answers are few and clear; otherwise ask and recommend. Free-text answers produce the best insights, so always leave room for one.

**Fast mode**: when the person says "fast" (or "batch"), ask every question whose prerequisites are settled in one numbered round, each with its recommendation, as `grilling` does. "slow" switches back. Keep the choice for the session.

### What to cover

Work these as a tree: ask what can be answered now, and let each answer open the next questions. The order is the usual one, not a script.

| Area | What you need to know | Example question |
|---|---|---|
| **Who** | Every persona the concept touches: the one who feels the problem first, and anyone else who uses, is affected by, or blocks it. Reuse the Personas tab; propose a new persona only when none fits, named in the owner's words. Keep asking "anyone else?" until the owner says no. | "Who's the first person who'd notice if this didn't exist? Anyone else who'd touch it?" |
| **Job and trigger** | For each persona: the situation that sets it off, what they're trying to get done, what they do today instead. | "Walk me through the last time someone needed this. What were they doing just before?" |
| **Story format** | User stories by default. Offer job stories once, only when the situation matters far more than who it is. | "This is very situation-driven. Write these as job stories instead?" |
| **Steps** | The 3 to 7 steps of the journey, end to end. These become the Step dropdown. | "From their side, what are the big steps from start to done?" |
| **Edges** | Errors, alternatives, unhappy paths, and how each persona is affected by the others. | "What happens if they lose signal halfway through?" |
| **Success** | How each persona would know it worked. Becomes details and Success measures. | "What would they see that tells them it worked?" |
| **Out of scope** | What this concept deliberately is not. | "Is editing someone else's notes part of this, or a separate idea?" |

Track each area as clear (✓), partial (◐) or missing (○) in the Coverage cell.

### How to grill well

- **Look up, don't ask.** If the answer is in the Sheet (personas, other concepts, earlier decisions), use it and say so in passing. Only decisions go to the person.
- **Stay on the persona's side.** Ask about people and situations. When the person drifts into screens, databases or tech, note it in Decisions and steer back: "Good to note. From their side, what do they need here?"
- **Unwrap disguised solutions.** If the concept names a feature ("add a dashboard"), ask what need it serves first.
- **Sharpen fuzzy words.** If a term could mean two things ("account", "team"), ask which, then use the settled word everywhere.
- **Recommend what you actually think**, including "this might be two concepts".
- **Keep it short.** One question, one line of why, one recommendation. Recap only when an answer changed something.
- **Plain words with the person.** Say "steps", "who it's for", "too big"; keep method names out of the conversation.

### Spin-offs

When an out-of-scope item or a "we could add that later" is a real idea of its own, offer to queue it: "Want me to add *Box QR stickers* as its own concept?" On yes, add a raw Concepts row with a one-line restatement, put `Spun out of C-001 Title` on it and `Spins off C-00X Title` on the parent, and name it in the parent's Out of scope.

### Commands the person can say at any time

| They say | You do |
|---|---|
| "yes" | Accept your recommendation. |
| "skip" | Record your recommendation with `(assumed, confirm)` and move on. |
| "park that" | Add it to Out of scope (or queue it as a spin-off) and move on. |
| "fast" / "slow" | Switch modes. |
| "where are we?" | Show the progress view. |
| "done" | Stop asking. Mark unanswered areas missing and go to drafting. |

### Progress view

After each area settles, and whenever asked, at most 10 lines:

```
Offline mode (C-001) · 9 questions so far
Who ✓   Job ✓   Steps ◐   Edges ○   Success ○   Out of scope ○
Personas: field-tech, dispatcher
Steps: Start job → Record work → [?] → Submit report
Assumptions: 1
```

### Write as you go

When an answer settles something, write it to the Sheet in the same turn: Decisions, Coverage, Personas (the concept's Personas cell and any new Personas row), Related concepts, and Status grilling. If the session dies, the Sheet holds everything agreed so far.

The grill is done when every area is clear, parked or assumed, or when the person says "done".

## 3. Draft the stories

1. Write stories grouped under the steps, in the concept's format. Each story has exactly one persona, a priority (P1 to P3) and a one-line reason. Every persona in the concept gets the stories its needs call for; a persona with none is a sign of a missing story or a persona that doesn't belong.
2. Under each story, write its details: one behavior each. They cover what makes the story work, the edge cases and the success measures. Write as many as it takes, and err on the side of complete: a missing behavior costs more than an extra row the person can park.
3. Add relations: Blocked by and Blocks; Relates to for close neighbours, including stories in other concepts and the same need for another persona.
4. Carry every assumption from the grill into the stories it affects.
5. **Coverage check.** Go through every decision, edge case, success measure and assumption recorded for the concept, and confirm each lands in at least one story or detail. Add stories or details for any that don't. A decision that is a constraint with no behavior goes under the draft as "Not in any story:", one line each, with a question whether it needs one.
6. **Critique.** Run `critique-stories` on the draft, in draft mode. Fold its fixes and splits in before showing anything.
7. Show the draft as a compact list grouped by step, with any critique notes the person needs to decide on, then ask one question at a time:
   - "Is anything missing?"
   - "Do these splits look right?" (only if critique split something)
   - "Do these links look right?"
8. Once the person is happy, write one Stories row per story and one Details row per detail, all status draft, with every link SHEET-FORMAT.md lists (a detail links to both its story and its concept). Fill the concept's Problem, Solution and Success measures, and set its Status to storied.

```
Record the job
  S-001 Save a draft while offline · field-tech · P1
  S-002 Attach photos to a draft · field-tech · P2 · after S-001
Submit report
  S-003 Submit when signal returns · field-tech · P1 · after S-001
  S-004 See which reports are still waiting · dispatcher · P2
```

## 4. Wrap up

Three lines at most:

- What was written: "Wrote 6 stories and 14 details for Offline mode (C-001), for 2 personas. 2 assumptions to confirm."
- What's next: the next raw concept with a recommendation to start it, or "Say *review C-001* any time to go through these."
- A link to the tracker Sheet.
