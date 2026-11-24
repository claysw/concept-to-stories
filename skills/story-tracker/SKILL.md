---
name: story-tracker
description: Look up, filter and update concepts and user stories in the story tracker Sheet between interviews. Use when someone asks to show, filter, approve, park, review, edit or link stories or concepts, confirm assumptions, refresh links, set up a tracker, export an outline doc, or re-grill one concept.
---

# Story tracker

The front desk for the tracker Sheet: everything someone does between interviews. Each request is short. Answer it, write it, and point to the row.

The Sheet's tabs, columns, link formulas and rules are in [SHEET-FORMAT.md](../../reference/SHEET-FORMAT.md). Read it before the first write.

## Every request

1. Find the Sheet (the one the person linked, or ask), read what the request touches, and act.
2. When the request names things loosely ("the search stories", "the plant one"), match by title and say which IDs you took.
3. Show results as a compact list with each ID linked to its row: `[S-004](<url><stories fragment>~A5-O5) Fix a wrong guess · approved · P1`. At most 15 lines; offer the rest.
4. After a write, read back what changed and say it in one line.

## What people ask for

### Show and filter

"Show in-review stories for casual-plant-owner", "what's P1 in C-001?", "stories needing work", "what's left for search?"

Filter Stories (and Details when asked; each detail carries its concept in column G) by any mix of persona, status, priority, step, concept, critique note and text. "Needing work" means a Critique cell that isn't `Ready`, or no critique yet. Group the result by concept, then step.

"Who is this for?" or "show personas" lists each persona with its story and concept counts from the Personas tab.

### Change status

"Approve S-004", "park S-003", "send C-001 to review", "approve all details for S-002".

- Approving or parking a story asks once whether its draft details go the same way, with "yes" as the recommendation.
- A concept-wide move ("send C-001 to review") applies to every story in it that isn't parked, and lists what changed.
- Statuses move draft → in-review → approved. A jump from draft straight to approved is fine when the person asks for it; say it skipped review.
- Approving a story whose Critique isn't `Ready` asks first: "S-010 still has a note: *Too big*. Approve anyway, or critique it?"

### Edit and add

"Change S-004's priority to P2", "reword S-006", "add a detail to S-002: …", "add a story to C-001: …".

- New stories and details take the next free ID and status draft, with links written as SHEET-FORMAT.md says.
- A new or reworded story gets a quick critique in draft mode (`critique-stories`) before it's written, and any note goes in its Critique cell.
- Changing a relation writes both sides.

### Assumptions

"What's still assumed?", "confirm the S-006 assumption", "show assumptions for quick-tidier".

1. Read the Assumptions tab and every `(assumed, confirm)` line in Concepts → Decisions.
2. Show them grouped by concept, with the story or concept each belongs to.
3. Walk them one at a time when the person wants to confirm: ask whether it holds, with your recommendation.
   - **Holds**: drop the `(assumed, confirm)` suffix. In Stories, move the line from Assumptions to confirm into the concept's Decisions.
   - **Wrong**: write the corrected decision, then find every story and detail the old assumption shaped and offer the edits, one at a time.

### Link concepts

"C-003 depends on C-002", "C-004 is part of C-001", "what came out of C-001?"

Write the relation on both concept rows (Spun out of / Spins off, Depends on on one side, Overlaps on both). "What came out of" lists the concept's Related concepts with their status and story counts.

### Re-grill or critique

- "Re-grill C-003", "grill C-002 now", "dig into the edges on C-001": hand over to `grill-concept` in re-grill mode with the concept ID. A raw concept gets a normal grill, skipping intake.
- "Critique C-001", "split S-010", "check the plant stories": hand over to `critique-stories` in Sheet mode.

### Refresh links

"Refresh links", or after any sort, insert or split.

Rewrite every multi-link markdown cell (Blocked by, Blocks, Relates to, Related concepts with more than one target) to point at the rows as they now lie, and rewrite any link formula that reads `#N/A` or `#REF!`. Report how many cells changed.

### Export an outline

"Export as an outline", "make a doc of C-001", "give me pages I can read".

Write a Claude Doc that reads top-down as Concept > Step > Story > Detail. Load the Docs guide first.

1. Read Concepts, Stories and Details (Title, Problem, Status, Step, Story and Detail text).
2. Create the doc titled `<tracker name> Outline`. Its lead says it's a snapshot of the Sheet, with a link, and that statuses change in the Sheet.
3. Create two dropdown enums in the doc: Status (draft, in-review, approved, parked) and Concept status (raw, grilling, storied, parked).
4. Write one section per storied concept, in ID order, one call per section:
   - `## C-001 Title` followed by a Concept status chip, then `**Problem:**` in one line.
   - `### <Step>` per step, in the order the steps happen.
   - Under each step, a table with columns ID | Story and details | Status, so the chips line up in their own column on the right.
   - A story row: bold ID, then the bold title followed by the full story sentence, then its Status chip.
   - Its detail rows follow it: the ID, the detail as a short behavior, then a Status chip. Drop the repeated "As a <persona>, I want" opening, but keep the meaning.
5. End with a "Not yet storied" section: a table of raw or grilling concepts (ID | Concept | Status).

When one concept is named, export only that one. When asked again, make a fresh doc, or replace the sections of the earlier one when the person gives its link. The doc never writes back to the Sheet.

### Set up a tracker

"Start a new tracker", "set up stories for <project>": create the Sheet as SHEET-FORMAT.md's "Creating a tracker" says, then offer to grill the first concept.

## Wrap up

End each request with what changed, in one line, and the Sheet link. When the request leaves a natural next step (draft stories with no critique, a raw concept in the queue, open assumptions), name it once.
