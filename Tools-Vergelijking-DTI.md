# Tools vergelijking

### Scrum board, updates, documentatie & bestanden

| **Auteur(s):** | Jae Dreijling |
|---|---|
| **Versie** | 1 |

## Inleiding

Voor de rest van het project hebben we één plek nodig (of maximaal twee) voor:

- **Scrum board:** backlog, sprints, wie doet wat
- **Updates:** stand-ups en sprintreviews
- **Documentatie:** onderzoeksplan, design rationale, beslissingenlog, feedbacklog, notulen, enz.
- **Bestanden en media:** foto's van prototypes, video's voor de deliverables
- **Code en hardware:** zodra we gaan bouwen (treinidee? Arduino / Unity / Raspberry Pi)

Het eerste idee was GitHub of Jira, maar we willen eerst meer opties bekijken voordat we er één kiezen.

Rubric-herinnering: stand-ups, sprintreviews, feedback en beslissingen tellen alleen mee als ze ZICHTBAAR zijn (PR2/PR4, zie [Dagelijkse-Documentatiecheck-DTI.md](./Dagelijkse-Documentatiecheck-DTI.md)). De tool moet dat makkelijker maken, niet moeilijker.

## Criteria

Wat voor ons belangrijk is. Weging = hoe belangrijk het criterium is voor ONS project (3 = heel belangrijk, 1 = leuk om te hebben).

| # | Criterium | Weging | Waarom |
|---|---|---|---|
| 1 | Scrum board (backlog, sprints, taken toewijzen) | 3 | We werken in design sprints; het board moet laten zien wie wat doet |
| 2 | Documentatie / wiki | 3 | Het project is vooral onderzoek, dus het meeste werk bestaat uit documenten |
| 3 | Makkelijk te leren voor het HELE team | 3 | 4 personen, niet iedereen is developer; als maar 1 persoon het gebruikt, heeft het geen zin |
| 4 | Kosten (gratis voor 4 studenten) | 2 | Geen budget voor tools (het HAN-budget is voor het product, niet hiervoor) |
| 5 | Code / bouwen (git, versies) | 2 | Voor het trein- / prototypedeel later |
| 6 | Delen met docent / opdrachtgever | 2 | Zij moeten zonder gedoe kunnen meekijken |
| 7 | Microsoft Teams / Office-integratie | 1 | De HAN gebruikt al Teams en Word voor alles |
| 8 | Media & bestanden (foto's, video's) | 1 | Nodig voor de eind-deliverables (3 beelden, video, poster) |
| 9 | Exporteren / bewaren na de minor | 1 | Overdraagbaarheid en reproduceerbaarheid (deliverables) |

**Maximale score = 5 × 18 = 90.**

## De opties

### 1. GitHub (repo + Issues + Projects board)

**Voordelen**
- Gratis, en we gebruiken het eigenlijk al (deze repo!)
- Projects = kanban-/scrumboard met sprints (iterations), gekoppeld aan issues
- Docs als markdown in de repo: versiegeschiedenis van alles, je ziet wie wat heeft aangepast (ideaal voor "individuele bijdrage zichtbaar")
- Beste optie voor het bouwdeel: code, Arduino-sketches, Unity-project, enz.
- Makkelijk te exporteren/ bewaren na de minor, het zijn gewoon bestanden

**Nadelen**
- Lastig voor niet-developers (git, commits, markdown): Redelijke risico dat niet iedereen er bekend mee is. (maar ik verwacht binnen het team zelf dat het wel bekend is)
- Word-documenten (onderzoeksplan) passen niet goed in git; geen fijne preview of bewerking
- Private repo = docent/opdrachtgever heeft een GitHub-account en een uitnodiging nodig
- Foto's en video's zijn onhandig in een repo (grote bestanden)

### 2. Jira (+ Confluence voor docs)

**Voordelen**
- Dé "professionele" scrumtool: sprints, backlog, burndown charts, story points, alles
- Ziet er goed uit om te laten zien dat we echt agile werken (sprintreviews enz.)
- Gratis plan voor kleine teams (huidige limieten checken)
- Integreert met GitHub en Teams

**Nadelen**
- Docs zitten NIET in Jira; daar is Confluence voor nodig = 2 tools om te leren
- Veel inrichtwerk en veel te veel functies voor een studententeam van 4 (overkill)
- Iedereen (ook de docent) heeft een Atlassian-account nodig
- Leercurve: eerlijk gezegd stopt iedereen na week 2 met bijwerken

### 3. Trello

**Voordelen**
- Supermakkelijk, iedereen snapt het binnen 5 minuten
- Openbare boardlink mogelijk (docent kan gewoon meekijken)
- Er is een Teams-app

**Nadelen**
- Alleen een kanbanboard; geen echte sprints/backlog zonder power-ups
- Helemaal geen documentatie (er is nog een tool nodig)
- Gratis plan heeft limieten (samenwerkers/boards, checken)
- Niets voor code

### 4. Notion

**Voordelen**
- Board ÉN docs op één plek (databases: sprintboard, beslissingenlog, feedbacklog, notulen als gekoppelde pagina's)
- Erg geschikt voor onderzoeksprojecten: pagina's, tabellen, embeds, afbeeldingen, video
- Gratis voor studenten met een schoolmail (education plan, checken)
- Pagina's openbaar delen via een link (docent/opdrachtgever hebben geen account nodig)
- Exporteren naar markdown/pdf

**Nadelen**
- Niet vaak gebruikt in de opleiding; mogelijk nieuw voor team.
- Geen "officiële" scrumtool; het sprintboard moeten we zelf opzetten (er zijn templates)
- Geen git/ versiebeheer voor code (code zou nog steeds in GitHub moeten)
- Kan snel rommelig worden als niemand de structuur bewaakt
- Geen echte Teams-integratie

### 5. Microsoft Teams + Planner (+ OneNote / SharePoint)

**Voordelen**
- We gebruiken het AL: de HAN, docenten en opdrachtgevers zitten allemaal in Teams
- Gratis (schoollicentie), geen inrichtwerk
- Word-documenten (onderzoeksplan!) samen live bewerken; opslag van bestanden en video via OneDrive
- Veruit het makkelijkst om te delen met docent/opdrachtgever

**Nadelen**
- Planner = basic kanban; geen echte sprints/backlog/story points (sprints zijn een premiumfunctie)
- Documentatie verspreid over bestanden/OneNote/chat, lastig terug te vinden
- Niets voor code
- Lastiger mee te nemen na de minor (schoolaccount)

### 6. Azure DevOps

**Voordelen**
- Volledige scrum (boards, sprints, backlogs) + wiki + git-repo's in één
- Gratis voor kleine teams (basic plan, gebruikerslimiet checken)

**Nadelen**
- ZEER technisch, gemaakt voor softwarebedrijven (veel te zwaar voor ons)
- Onoverzichtelijk/ingewikkeld voor niet-developers; iedereen heeft een Microsoft dev-account nodig
- Niet sterk in documenten/media

Miro / FigJam zijn goed voor brainstorms, stakeholdermaps en customer journey maps, maar het zijn geen scrum-/documentatietools. Die staan daarom los hiervan en zijn niet meegenomen in de tabel.

## Scoretabel

Scores van 1 (slecht) tot 5 (uitstekend); het gewogen totaal staat in de laatste rij. De hoogste score per criterium is vetgedrukt.

| Criterium (weging) | GitHub | Jira + Confl. | Trello | Notion | Teams + Planner | Azure DevOps |
|---|---|---|---|---|---|---|
| Scrum board (3) | 4 | **5** | 3 | 4 | 2 | **5** |
| Documentatie (3) | 3 | 3 | 1 | **5** | 3 | 3 |
| Makkelijk voor heel team (3) | 2 | 4 | **5** | 2 | **5** | 1 |
| Kosten (2) | **5** | 4 | 4 | **5** | **5** | 4 |
| Code / bouwen (2) | **5** | 3 | 2 | 2 | 1 | **5** |
| Delen met docent/opdrachtgever (2) | 3 | 2 | 4 | **5** | **5** | 2 |
| Teams/Office-integratie (1) | 2 | 3 | 3 | 2 | **5** | 3 |
| Media & bestanden (1) | 2 | 3 | 3 | 4 | **5** | 2 |
| Export / na de minor (1) | **5** | 3 | 2 | 4 | 3 | 3 |
| **Totaal (max 90)** | **62** | **63** | **55** | **67** | **65** | **57** |

> ✏️ *Nagerekend bij het omzetten naar markdown (2-10-2026): in de Word-versie stond Jira op 57 (en 59 in de ranking) en Notion op 69. Met de scores uit de tabel komt Jira uit op **63** en Notion op **67**. Waarschijnlijk zijn de totalen niet bijgewerkt na het aanpassen van "Makkelijk voor heel team" (Jira 2 → 4, Notion 3 → 2).*

### Ranking

| # | Tool | Score | Samenvatting |
|---|---|---|---|
| 1 | Notion | 67 | Beste allrounder: board + docs + delen |
| 2 | Teams + Planner | 65 | Makkelijkst en al aanwezig, maar zwak board |
| 3 | Jira + Confluence | 63 | Beste board, maar overkill en 2 tools |
| 4 | GitHub | 62 | Beste voor bouwen/code, lastig voor niet-developers |
| 5 | Azure DevOps | 57 | Zelfde als Jira, maar nog technischer |
| 6 | Trello | 55 | Makkelijk, maar geen documentatie |

De scores zijn mijn inschatting op basis van onze situatie, geen feiten. Als we de wegingen aanpassen (bijvoorbeeld als code veel belangrijker wordt zodra we de trein gaan bouwen), verandert de volgorde.

## Advies

Geen enkele tool wint op alles, dus de beste keuze is waarschijnlijk een combinatie van maximaal 2 tools.

### Optie A: Notion + GitHub

- **Notion:** scrumboard, stand-ups, beslissingenlog, feedbacklog, notulen, concepten van de design rationale
- **GitHub:** alleen het code-/bouwdeel (trein, Arduino, Unity) + back-up van de docs
- **Teams** blijft voor de chat en de officiële versies van Word-documenten (dat moeten we toch gebruiken)

### Optie B: GitHub + Teams

Dit is wat we nu al hebben. Het werkt alleen als IEDEREEN bereid is GitHub te leren, dus vraag dat eerst aan het team.

### Jira

Advies: laten vallen. Het ziet er professioneel uit, maar het zijn 2 tools (Jira + Confluence) met veel inrichtwerk voor 4 personen, en het documentatiedeel (= het grootste deel van ons werk) is juist het zwakste punt.

### Samen te beslissen

1. Vindt iedereen GitHub prima? (Zo niet → optie A)
2. Moet de docent/opdrachtgever ons board kunnen zien? (Zo ja → Notion of Teams, makkelijke links)
3. Hoeveel gaan we echt bouwen? (Veel → dan is GitHub een must voor dat deel)

Wat we ook kiezen: leg het vast als BESLISSING in de beslissingenlog, met de alternatieven en de onderbouwing (= precies dit document).

Dit is belangrijk in de rubriek, dus ook handig om onze tops + downs van de ideeën als beslissing log te houden, zelfs als het nog een concept blijft.

## Beslissing

**Gekozen: Jira + Confluence.**

**Waarom:** na het bekijken van de redenering hierboven bleek dat het hele team zich toch comfortabel voelt bij Jira, omdat iedereen er al ervaring mee heeft. Daardoor wegen de grootste nadelen uit het advies (de leercurve en twee tools moeten leren) voor ons veel minder zwaar. Dat zie je ook terug in de score: met "makkelijk voor heel team" op 4 komt Jira uit op 63 van de 90, de derde plek en vlak achter Notion en Teams. Jira scoort daarnaast het hoogst op het scrumboard, en dat is precies waar we de tool het meest voor nodig hebben.

**Overwogen alternatieven en waarom niet:**

| Alternatief | Waarom niet gekozen |
|---|---|
| Notion | Hoogste score, maar onbekend voor het team. Het risico is dat we de tool eerst moeten leren en hem daarna niet bijhouden. |
| Teams + Planner | Heeft geen goede sprint-mogelijkheid (sprints/backlog zijn een premiumfunctie), terwijl het scrumboard ons belangrijkste criterium is. Teams blijft wel in gebruik voor chat en Word-documenten. |
| GitHub | Te veel op code gericht. Het grootste deel van ons werk is onderzoek en documentatie. |
| Trello en Azure DevOps | Onbekend voor een deel van het team. Ze zijn kort overwogen, maar niet gekozen omdat ze onbekend zijn. |

*Datum beslissing: [invullen] · Besloten door: [teamleden invullen]*
