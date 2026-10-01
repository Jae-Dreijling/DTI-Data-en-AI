# Tools vergelijking: scrum board, updates, documentatie etc.

so for the rest of the project we need 1 place (or max 2!) for:
- scrum board (backlog, sprints, who does what)
- updates / stand-ups / sprintreviews
- documentation (onderzoeksplan, design rationale, beslissingenlog, feedbacklog, notulen etc.)
- files + media (photos of prototypes, video's for the deliverables)
- and some code/hardware stuff once we start building (train idea? arduino/unity/raspberry pi)

I was thinking github or jira, but we should look at more before we pick one.

* rubric reminder: stand-ups, sprintreviews, feedback and decisions only count if they're VISIBLE (PR2/PR4, see [Dagelijkse-Documentatiecheck-DTI.md](./Dagelijkse-Documentatiecheck-DTI.md)), so the tool has to make that easy, not harder!!

---

## What matters for us (criteria)

Weight = how important for OUR project (3 = very, 1 = nice to have).

| # | Criterium | Weight | Why |
|---|---|---|---|
| 1 | Scrum board (backlog, sprints, assign tasks) | 3 | we work in design sprints, needs to show who does what |
| 2 | Documentation / wiki | 3 | project is mostly research, so most of our work = documents |
| 3 | Easy to learn for the WHOLE team | 3 | 4 people, not everyone is a dev; if 1 person uses it, it's useless |
| 4 | Cost (free for 4 students) | 2 | no budget for tools (HAN budget is for the product, not this) |
| 5 | Code / building integration (git, versions) | 2 | for the train / prototype part later |
| 6 | Sharing with docent / opdrachtgever | 2 | they should be able to look without too much hassle |
| 7 | Microsoft Teams / Office integration | 1 | HAN uses Teams + Word for everything already |
| 8 | Media & files (photos, video's) | 1 | needed for the eind-deliverables (3 beelden, video, poster) |
| 9 | Export / keeping it after the minor | 1 | overdraagbaarheid + reproduceerbaarheid (deliverables) |

Max score = 5 x 18 = **90**

---

## The options

### 1. GitHub (repo + Issues + Projects board)
**tops:**
- free, and we basically already use it (this repo!)
- Projects = kanban/scrum board with sprints (iterations), linked to issues
- docs as markdown in the repo: version history of EVERYTHING, you can see who changed what (great for "individuele bijdrage zichtbaar")
- best option for the building part: code, arduino sketches, unity project etc.
- easy to export / keep after the minor, it's just files

**downs:**
- steep for non-devs (git, commits, markdown) (HIGH RISK for team adoption)
- word docs (onderzoeksplan) don't really "live" well in git, no nice preview/editing
- private repo = docent/opdrachtgever needs a github account + invite
- photos/video's are clunky in a repo (big files)

### 2. Jira (+ Confluence for docs)
**tops:**
- THE "professional" scrum tool: sprints, backlog, burndown charts, story points, everything
- looks good to show you did proper agile (sprintreviews etc.)
- free plan for small teams (check current limits)
- integrates with github and teams

**downs:**
- docs are NOT in jira, you need confluence on top = 2 tools to learn
- lots of setup + way too many features for a 4-person student team (overkill)
- everyone (incl. docent) needs an atlassian account
- learning curve, people will stop updating it after week 2 (be honest lol)

### 3. Trello
**tops:**
- super easy, everyone gets it in 5 min
- public board link possible (docent can just look)
- teams app exists

**downs:**
- just a kanban board, no real sprints/backlog without power-ups
- no documentation at all (need another tool)
- free plan has limits (collaborators/boards, check) 
- nothing for code

### 4. Notion
**tops:**
- board AND docs in 1 place (databases: sprint board, beslissingenlog, feedbacklog, notulen as linked pages)
- really nice for research projects: pages, tables, embeds, images, video
- free for students with a school email (education plan, check)
- share pages publicly with a link (docent/opdrachtgever don't need an account)
- export to markdown/pdf

**downs:**
- not an "official" scrum tool, you have to set up the sprint board yourself (templates exist)
- no git / code versioning (code would still need github)
- can get messy fast if nobody keeps structure
- no real teams integration

### 5. Microsoft Teams + Planner (+ OneNote / SharePoint)
**tops:**
- we ALREADY use it: HAN, docenten and opdrachtgevers are all in teams
- free (school license), zero setup
- word docs (onderzoeksplan!) edit together live, files + video storage via onedrive
- easiest for sharing with docent/opdrachtgever by far

**downs:**
- planner = basic kanban, no real sprints/backlog/story points (sprints are a premium thing)
- documentation spread over files/onenote/chat, hard to find stuff back
- nothing for code
- harder to take with you after the minor (school account)

### 6. Azure DevOps
**tops:**
- full scrum (boards, sprints, backlogs) + wiki + git repos in 1
- free for small teams (basic plan, check user limit)

**downs:**
- VERY technical, made for software companies (way too heavy for us)
- ugly/complicated for non-devs, everyone needs a microsoft dev account
- not great for documents/media

### 7. ClickUp
**tops:**
- tries to do everything: boards, sprints, docs, whiteboards
- free plan

**downs:**
- feature overload, overwhelming
- free plan has a small storage limit (bad for photos/video's)
- yet another account for everyone

* (Miro / FigJam = good for brainstorms, stakeholder maps, customer journey maps, but not a scrum/docs tool, so separate thing, not in the table)

---

## Score table

Scores 1 (bad) to 5 (great), weighted total in the last column.

| Criterium (weight) | GitHub | Jira + Confluence | Trello | Notion | Teams + Planner | Azure DevOps | ClickUp |
|---|---|---|---|---|---|---|---|
| Scrum board (3) | 4 | **5** | 3 | 4 | 2 | **5** | 4 |
| Documentatie (3) | 3 | 3 | 1 | **5** | 3 | 3 | 4 |
| Makkelijk voor heel team (3) | 2 | 2 | **5** | 3 | **5** | 1 | 2 |
| Kosten (2) | **5** | 4 | 4 | **5** | **5** | 4 | 3 |
| Code / bouwen (2) | **5** | 3 | 2 | 2 | 1 | **5** | 3 |
| Delen met docent/opdrachtgever (2) | 3 | 2 | 4 | **5** | **5** | 2 | 3 |
| Teams/Office integratie (1) | 2 | 3 | 3 | 2 | **5** | 3 | 3 |
| Media & bestanden (1) | 2 | 3 | 3 | 4 | **5** | 2 | 2 |
| Export / na de minor (1) | **5** | 3 | 2 | 4 | 3 | 3 | 3 |
| **Totaal (max 90)** | **62** | **57** | **55** | **70** | **65** | **57** | **56** |

### Ranking
1. **Notion: 70** (best all-rounder: board + docs + sharing)
2. **Teams + Planner: 65** (easiest, already there, but weak board)
3. **GitHub: 62** (best for building/code, hard for non-devs)
4. Jira + Confluence: 57 (best board, but overkill + 2 tools)
4. Azure DevOps: 57 (same, but even more technical)
6. ClickUp: 56
7. Trello: 55 (easy, but no docs)

* scores are OUR estimate based on our situation, not facts. if we change the weights (e.g. code becomes way more important once we build the train) the order changes!

---

## My take

no single tool wins on everything, so probably a **combo of max 2**:

- **option A: Notion + GitHub**
  - Notion = scrum board, stand-ups, beslissingenlog, feedbacklog, notulen, design rationale drafts
  - GitHub = only the code/building part (train, arduino, unity) + backup of docs
  - Teams stays for chat + the official word docs (we have to use it anyway)
- **option B: GitHub + Teams** (what we already have)
  - only works if EVERYONE is ok with learning github (ask the team first!)
- Jira: I'd drop it. looks professional, but it's 2 tools (jira + confluence) and a lot of setup for 4 people, and the docs part (= most of our work) is the weakest.

**to decide together:**
1. is everyone comfortable with github? (if not → option A)
2. does the docent/opdrachtgever need to see our board? (if yes → notion or teams, easy links)
3. how much building will we actually do? (if a lot → github is a must for that part)

* whatever we pick: write it down as a DECISION with the alternatives + why (= exactly this document) in the beslissingenlog. counts for the rubric!!
