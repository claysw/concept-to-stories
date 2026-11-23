# Concept to stories

Paste a product idea, get grilled one question at a time, and end up with user stories in a Claude Sheet you can filter, review and approve.

## Install

In Claude Code:

```
/plugin marketplace add claysw/concept-to-stories
/plugin install concept-to-stories@concept-to-stories
```

**Requires** the Claude Docs connector, which the skills use to create and edit the tracker as a Claude Sheet.

## Skills

| Skill | Use it to | Say something like |
|---|---|---|
| **grill-concept** | Turn a new concept into stories, or dig deeper into one | "Here's an idea: …", "re-grill C-003" |
| **critique-stories** | Check stories are ready and split the big ones | "critique C-001", "split S-010" |
| **story-tracker** | Everything between interviews: filter, approve, edit, link, confirm assumptions | "show in-review stories for quick-tidier", "approve S-004", "what's still assumed?" |

## How they fit

```
          new idea                       return visits
             │                                │
             ▼                                ▼
      grill-concept ──draft──▶ critique-stories ◀── story-tracker
             │                         │               │
             └──────────── writes ─────┴───── reads/writes
                                       ▼
                             Tracker Sheet (Claude Sheets)
             Concepts · Stories · Details · Personas · Assumptions
```

- grill-concept runs every draft through critique-stories before writing it.
- story-tracker hands "re-grill" to grill-concept and "critique" to critique-stories.
- All three follow one contract, [reference/SHEET-FORMAT.md](reference/SHEET-FORMAT.md): tab layout, IDs, statuses, two-sided relations and clickable links.

## The Sheet

- **Concept → Step → Story → Detail.** A story is one persona's need; a detail is one behavior that makes it work.
- Statuses: concepts are raw, grilling, storied or parked; stories and details are draft, in-review, approved or parked.
- Every cell that names another row is a link that jumps to it.
- A concept can serve several personas; each story belongs to one, so filtering by persona works.
- Concepts link to each other (spun out of, depends on, overlaps).
- The Assumptions tab lists everything still marked "(assumed, confirm)".

This plugin is for shaping and agreeing on what to build, not for tracking implementation.

## License

MIT. See [LICENSE](LICENSE).
