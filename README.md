# Concept to stories

Paste a product idea, get grilled one question at a time, and end up with user stories in a Claude Sheet you can filter, review and approve.

## Before you start

The skills keep your concepts and stories in a **Claude Sheet**, which they create and edit through the **Claude Docs** connector. Turn that connector on wherever you use the plugin:

1. Open **Customize > Connectors** (or click **+** in a chat and hover **Connectors**).
2. Find **Claude Docs** and click **Connect**.

On a Team or Enterprise plan, an Owner may need to allow the connector for your organization first.

## Install

Pick the one that matches where you use Claude.

### Claude Code (terminal or IDE)

Run these two commands inside Claude Code:

```
/plugin marketplace add claysw/concept-to-stories
/plugin install concept-to-stories@concept-to-stories
```

Or from your shell:

```
claude plugin marketplace add claysw/concept-to-stories
claude plugin install concept-to-stories@concept-to-stories
```

To get new versions later, run `/plugin marketplace update concept-to-stories`, or turn on auto-update for this marketplace under `/plugin` > **Marketplaces**.

### Claude Desktop app: Cowork

Cowork installs plugins straight from GitHub.

1. Open the Claude Desktop app and switch to **Cowork**.
2. Go to **Customize > Plugins** and choose **Add marketplace**.
3. Enter `claysw/concept-to-stories` (or paste `https://github.com/claysw/concept-to-stories`).
4. Open **Discover**, select **concept-to-stories**, and click **Install**.

### Claude Desktop app: regular chats

Regular chats use skills rather than plugins, so you upload each of the three skills once.

1. Download the three ZIP files from the [`dist` folder](dist/): `grill-concept.zip`, `critique-stories.zip` and `story-tracker.zip`. Leave them zipped.
2. Make sure **Code execution and file creation** is on under **Settings > Capabilities**. Skills need it.
3. Go to **Customize > Skills**, click **+**, then **Create skill > Upload a skill**.
4. Upload `grill-concept.zip`. Repeat for the other two.

Each ZIP carries its own copy of the Sheet format, so the skills work on their own. Skills work on Free, Pro, Max, Team and Enterprise plans; on Team and Enterprise an Owner can turn skill uploads off.

To update later, download the new ZIPs and upload them again.

### Check it worked

Start a new chat or session and say:

> Here's an idea: a reminder that tells me which houseplant to water today.

Claude should restate the idea in one line, ask whether it got it right, and offer to create a tracker Sheet. If it answers without asking questions, the skills aren't loaded: check the install step and the Claude Docs connector.

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

## For maintainers

The skills live in `skills/`, and the Sheet contract they share lives in `reference/SHEET-FORMAT.md`. After changing either, rebuild the desktop ZIPs and bump `version` in `.claude-plugin/plugin.json` so Claude Code users get the update:

```
./scripts/build-skill-zips.sh
```

## License

MIT. See [LICENSE](LICENSE).
