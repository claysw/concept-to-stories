# The story tracker Sheet

Every skill in this plugin reads and writes one Claude Sheet (an Artifact of the Sheets type) through the Claude Docs connector. This file is the contract between the skills: when a skill writes a row, it writes it the way this file says, so the others can read it.

Load the connector's `topic.sheets` guide before the first call in a session, and `topic.sheets-building` before creating a Sheet.

## Hierarchy

**Concept → Step → Story → Detail.** A concept is one idea. Steps are the 3 to 7 stages of the persona's journey. A story is one need of one persona. A detail is one behavior that makes the story work, short enough to approve or park on its own.

Default wording is a user story: "As a <persona>, I want <need>, so that <outcome>." A concept whose Format is `job` uses job stories instead: "When <situation>, I want <need>, so I can <outcome>." Details use the same wording as their story.

## Tabs and columns

Column letters matter: formulas and links depend on them. Add new columns only at the right edge.

### Concepts

| Col | Name | Holds |
|---|---|---|
| A | ID | `C-001`, next free number |
| B | Title | Short name in the owner's words |
| C | Problem | One paragraph, from the persona's side |
| D | Solution | One paragraph, from the persona's side |
| E | Success measures | One per line, each ending with the detail that delivers it, like `(S-002.1)`, where there is one. Goals with no behavior behind them stay here and never become stories |
| F | Status | Dropdown: raw, grilling, storied, parked |
| G | Stories | Link formula: count of its stories, jumping to the first |
| H | Format | `user` or `job` |
| I | Restatement | One line, from intake |
| J | Decisions | One per line. Unconfirmed ones end with `(assumed, confirm)` |
| K | Out of scope | One per line. An item that became its own concept names it: `Sharing with roommates (C-002)` |
| L | Coverage | `Who ✓ Job ✓ Steps ◐ Edges ○ Success ○ Out of scope ○` |
| M | Personas | Every persona the concept serves, one per line |
| N | Related concepts | One link per line: `Spun out of C-001 Title`, `Spins off C-002 Title`, `Overlaps C-004 Title`, `Depends on C-003 Title` |

### Stories

| Col | Name | Holds |
|---|---|---|
| A | ID | `S-001`, next free number across the whole Sheet |
| B | Title | Verb-first, the persona's words |
| C | Step | Dropdown of the concept's steps |
| D | Priority | Dropdown: P1, P2, P3 |
| E | Status | Dropdown: draft, in-review, approved, parked |
| F | Story | The full story sentence |
| G | Details | Link formula: count of its details, jumping to the first |
| H | Why this priority | One line |
| I | Blocked by | Story link(s) |
| J | Blocks | Story link(s), the mirror of Blocked by |
| K | Relates to | Story link(s), including stories in other concepts |
| L | Assumptions to confirm | One per line, each ending with `(assumed, confirm)` |
| M | Concept | Concept link, label `C-001 Title` |
| N | Persona | Exactly one persona from the Personas tab |
| O | Critique | Latest verdict from critique-stories, like `Ready 2026-11-23` or `Too big: split by path`. A split story holds `Split into S-014, S-015` |

### Details

| Col | Name | Holds |
|---|---|---|
| A | ID | Story ID plus a number: `S-004.2` |
| B | Detail | The detail sentence |
| C | Story | Link formula to the parent story, label `S-004 Title` |
| D | Step | `=XLOOKUP(LEFT(A2,5),Stories!A:A,Stories!C:C)` |
| E | Priority | `=XLOOKUP(LEFT(A2,5),Stories!A:A,Stories!D:D)` |
| F | Status | Dropdown: draft, in-review, approved, parked |
| G | Concept | Link formula to the parent story's concept (below), so a detail always shows and jumps to its concept |

### Personas

| Col | Name | Holds |
|---|---|---|
| A | Persona | Lowercase-hyphenated name in the owner's words: `quick-tidier` |
| B | Description | One or two sentences: who they are and the habit that matters |
| C | Stories | `=COUNTIF(Stories!N:N,A2)` |
| D | Concepts | `=COUNTIF(Concepts!M:M,"*"&A2&"*")` |

### Assumptions

A read-only view. One formula in A2 fills it; nobody types here.

Headers: ID, Title, Assumption, Persona, Status, Concept.

```
=IFERROR(FILTER(HSTACK(Stories!A2:A,Stories!B2:B,Stories!L2:L,Stories!N2:N,Stories!E2:E,Stories!M2:M),Stories!L2:L<>""),"No open assumptions")
```

Concept-level assumptions live in Concepts → Decisions with the same `(assumed, confirm)` suffix; the tracker reads both places when asked for assumptions.

## Rules every skill keeps

- **IDs are permanent.** Never reuse or renumber an ID. A split or merged story is parked and points to its replacements in Critique.
- **Relations are two-sided.** Writing Blocked by on one story writes Blocks on the other in the same update. Same for Spun out of / Spins off between concepts. Relates to and Overlaps go on both sides too.
- **One persona per story.** A need two personas share becomes two stories, or one story for the persona who feels it most, with the other noted in Relates to.
- **Statuses only move forward through review**: draft → in-review → approved. Parked can be set from any status and undone to draft.
- **Write formulas row by row.** A multi-row write does not shift relative references, so each row's formula names its own row.

## Links

Every cell that names another row is a link that jumps to that row and highlights it. Get each tab's `linkFragment` from `readSheets` and the Sheet's URL from `frame.artifactUrl`.

- **One target:** a formula that finds the row by ID when clicked, so sorting and new rows never break it:
  `=HYPERLINK("<url><fragment>~A"&MATCH("S-002",Stories!A:A,0)&"-O"&MATCH("S-002",Stories!A:A,0),"S-002 Title")`
  The last column in the highlight is the tab's last column (Stories O, Details G, Concepts N).
- **Derived links** (Details G) follow the parent story's Concept cell, so they stay right if a story moves to another concept:
  `=LET(c,XLOOKUP(LEFT(A2,5),Stories!A:A,Stories!M:M),HYPERLINK("<url><concepts fragment>~A"&MATCH(LEFT(c,5),Concepts!A:A,0)&"-N"&MATCH(LEFT(c,5),Concepts!A:A,0),c))`
- **Counts** (Stories G, Concepts G) use the same shape with a wildcard match, wrapped in `IFERROR(..., 0)`:
  `=IFERROR(HYPERLINK("<url><details fragment>~A"&MATCH(A2&".*",Details!A:A,0)&"-G"&MATCH(A2&".*",Details!A:A,0),COUNTIF(Details!A:A,A2&".*")),0)`
- **Several targets in one cell:** a markdown cell with one fixed link per line: `[S-003 Title](<url><fragment>~A4-O4)`. These point at a row number, so they go stale after a sort or insert. story-tracker's "refresh links" rewrites them.

## Creating a tracker

When the person has no tracker Sheet, create one from the Sheets Artifact type, titled `<Project> Stories`, then build it in this order:

1. One update: rename Sheet1 to Stories, add Details, Concepts, Personas and Assumptions, write every header row, fill each header `#f3f3f3`, and `setCellTable` each tab.
2. One update: the dropdowns (Status, Priority, Step for Stories; Status for Concepts and Details), wrapping on long-text columns, widths (story and detail text 360 to 400 px, notes 220 to 280 px), freeze column B on Stories, and the Assumptions formula.
3. Open the Sheet with the Artifact tool, then read the Assumptions formula back to check it.
