# Scrumboard Designsprint 2: Jira-opzet & ticketvoorstellen

Hoort bij [`Planning-en-Deliverables-DTI.md`](./Planning-en-Deliverables-DTI.md), [`Projecthandboek-DTI.md`](./Projecthandboek-DTI.md) en het [Onderzoeksplan](./Lesmateriaal/28-9%20tot%204-10/Onderzoeksplan.md).
Opgesteld: 2 oktober 2026, na afronding van designsprint 1.

> **Status:** dit is een **menu**, geen vaste planning. Kies samen in de sprintplanning welke tickets jullie echt overnemen, pas de schattingen aan en zet er namen bij. Alles wat hier te veel is, schuif je door naar de backlog (sprint 3).

**Uitgangspunten**
- **Tool:** Jira (Scrum-template) + Confluence voor documentatie, zie de beslissing in [`Tools-Vergelijking-DTI.md`](./Tools-Vergelijking-DTI.md). Documenten worden vanuit tickets gelinkt.
- **Sprintdoel designsprint 2:** *idee gekozen, uitgewerkt, eerste prototype getoetst.*
- **Concept:** we neigen naar **concept 1, de fysieke/virtuele trein**, maar dat is nog **geen besluit**. Eerst toetsen bij de doelgroep, daarna een expliciete go/no-go (zie [beslismoment](#het-beslismoment-trein-go--no-go)). AI-huisdier en biometrie blijven tot dan de alternatieven (kill your darlings).

---

## Inhoud

1. [Tijdlijn van designsprint 2](#1-tijdlijn-van-designsprint-2)
2. [Jira inrichten](#2-jira-inrichten)
3. [Labels](#3-labels)
4. [Schatten: story points & uren](#4-schatten-story-points--uren)
5. [Definition of Ready / Done](#5-definition-of-ready--done)
6. [Epics](#6-epics)
7. [Tickets per epic](#7-tickets-per-epic)
8. [Product backlog: user stories voor de trein](#8-product-backlog-user-stories-voor-de-trein)
9. [Capaciteit & totaal](#9-capaciteit--totaal)
10. [Risico's voor deze sprint](#10-risicos-voor-deze-sprint)

---

## 1. Tijdlijn van designsprint 2

Designsprint 2 loopt van **week 41 t/m week 46** (5 werkweken, week 43 is herfstvakantie). Zes weken is lang voor één Jira-sprint, dus het voorstel is om de designsprint op te splitsen in **twee Jira-sprints** met een beslismoment ertussen:

| Jira-sprint | Periode | Sprintdoel (in Jira invullen) |
|---|---|---|
| **DS2a: Toetsen & kiezen** | ma 5 okt – vr 16 okt (wk 41–42) | "Concept (trein of alternatief) getoetst bij de doelgroep en onderbouwd gekozen" |
| *(herfstvakantie)* | wk 43 | n.v.t. |
| **DS2b: Uitwerken, bouwen & testen** | ma 26 okt – vr 13 nov (wk 44–46) | "Eerste prototype van het gekozen concept gebouwd en getest bij de doelgroep" |

*Alternatief: één Jira-sprint van 5 okt t/m 13 nov. Dat is simpeler, maar dan zie je op het board minder goed dat er halverwege een keuze gemaakt is (en die keuze wil je juist laten zien voor PR1/PR2).*

| Week | Wat in het rooster staat | Wat dat betekent voor het board |
|---|---|---|
| **41** (5–9 okt) | di: begeleiding · do: **LES Prototypen** (Blender, Unity, Vibe-Coding, Arduino) | Jira inrichten, sprintplanning, feedback stakeholder 1 verwerken, toetsplan maken, technische quick scan tijdens de prototypeles |
| **42** (12–16 okt) | do: **Werkplaats − / contact met gebruikers** | Concepttoets bij de doelgroep uitvoeren + analyseren → **vr 16 okt: go/no-go trein** · sprint review/retro DS2a |
| 43 | Herfstvakantie | Niks gepland. Wel handig: Design Rationale vóór de vakantie op orde (week 44 = toets!) |
| **44** (26–30 okt) | do: **Feedback + LES Interviewen & coderen / Ethiek** · 📌 **"Week 8": Design Rationale + 3× peer review (summatief)** | Sprintplanning DS2b, DR inleveren/presenteren, peer reviews, start bouwen |
| **45** (2–6 nov) | do: **LES Prototypen (vervolg)** · LES bedrijfsprocessen | Prototype v1 af, testplan klaar · **za 7 nov: open dag Nijmegen** (testmoment, nog afstemmen!) |
| **46** (9–13 nov) | do: 🤝 **Stakeholderbijeenkomst 2** | Testresultaten analyseren, stakeholderpresentatie = sprint review · *za 14 nov open dag Arnhem valt al in de overgang naar sprint 3* |
| 47 (16 nov) | di: Intervisie/retrospective | Retro DS2b + start designsprint 3 |

### Het beslismoment: trein go / no-go

**Wanneer:** vr 16 okt (einde DS2a). **Op basis van:** concepttoets bij de doelgroep (S2-11) + beslismatrix (S2-13) + haalbaarheidsscan (S2-21).

- **Go:** DS2b bouwt de trein, de tickets in epic E6 gelden zoals ze er staan.
- **No-go / bijsturen:** de E5- en E6-tickets blijven staan, maar je hernoemt het label `concept-trein` naar het gekozen concept en past de subtaken aan. Leg in beide gevallen vast **waarom** (beslissingenlog), want dat is precies wat de rubric wil zien.

---

## 2. Jira inrichten

| Instelling | Voorstel | Waarom |
|---|---|---|
| **Projecttype** | Scrum, **team-managed** | Simpelste variant, iedereen kan zelf labels/kolommen aanpassen. Company-managed heeft meer opties (components, versions), maar ook meer setup |
| **Projectkey** | `DTI` | Tickets heten dan `DTI-1`, `DTI-2`, … (de `S2-xx`-nummers in dit document zijn alleen voor verwijzingen hier) |
| **Leden** | Jae, Bart, Maryam, Karlijn (+ evt. docent als viewer) | Free plan van Jira is gratis voor kleine teams (check het huidige maximum aantal gebruikers) |
| **Werktypes** | Epic · Story · Task · Sub-task · Bug | Story = iets wat waarde oplevert voor de gebruiker/opdrachtgever, Task = onderzoeks-/proceswerk, Bug = fout in het prototype |
| **Board-kolommen** | Backlog → To Do → In Progress → **Review** → Done | "Review" = een teamgenoot kijkt mee voordat iets Done is. Dat geeft zichtbaar "constructief kritisch op andermans werk" (PR2, goed) |
| **Velden aanzetten** | Story point estimate, Original estimate/Time tracking, Due date, Labels, Priority | Story points op stories/tasks, uren op sub-tasks (zie §4) |
| **Sprints** | DS2a en DS2b aanmaken, sprintdoel invullen bij "Start sprint" | Het sprintdoel komt terug in de sprintreview en het burndown-rapport |
| **Koppelingen** | Confluence-pagina's (of documenten in Teams/repo) koppelen aan tickets; optioneel GitHub-integratie voor de prototypecode | Zo is vanuit het board te zien welk document bij welk werk hoort |
| **Rapporten** | Burndown + Sprint report screenshotten aan het eind van elke sprint | Bewijs voor de Design Rationale (agile werkwijze, PR2) |

**Werkafspraken (tip: zet ze in de projectbeschrijving):**
- Iedereen werkt alleen aan tickets die **op zijn/haar naam** staan, en zet ze zelf door. Geen naam = niemand doet het.
- **Stand-up:** di en do, 10 min, vóór het board staan: wat heb ik gedaan / wat ga ik doen / waar loop ik vast. Kort notuleren in het dagverslag.
- Een ticket dat in een sprint niet af komt, gaat met een comment ("waarom niet af") terug naar de backlog of door naar de volgende sprint.

---

## 3. Labels

Jira-labels mogen **geen spaties** bevatten en zijn hoofdlettergevoelig, dus alles in lowercase met koppeltekens. Per ticket kies je er meerdere, uit elke groep er hooguit één of twee.

| Groep | Labels | Gebruik |
|---|---|---|
| **Werksoort** | `onderzoek` · `ontwerp` · `prototype` · `test` · `documentatie` · `stakeholder` · `proces` · `beeld` | Wat voor werk is het? Filter hierop om te zien of je niet alleen maar documenten schrijft |
| **Deelvraag** | `deelvraag-1a` · `deelvraag-2a` · `deelvraag-1b` · `deelvraag-1c` · `deelvraag-1d` | Koppelt het ticket aan het onderzoeksplan (rode draad, PR1). 1D = ethiek (staat in het plan nog verkeerd als 1C) |
| **Concept** | `concept-trein` · `concept-aihuisdier` · `concept-biometrie` · `concept-algemeen` | Na het beslismoment zie je meteen welk werk voor welk concept was |
| **Doelgroep** | `mbo` · `havo-vwo` · `propedeuse` | Voor welke doelgroep is dit werk / deze test? |
| **Contactmoment** | `schoolvoorlichting` · `open-dag` · `proefstuderen` · `keuzemoment` | Voor welk van de vier contactmomenten? |
| **Rubric** | `pr1` (rode draad/prototype) · `pr2` (agile) · `pr3` (stakeholders) · `pr4` (presentatie/reflectie) · `op1` (vragen) · `op2` (methodes) · `op3` (deelresultaten) | Laat zien welk criterium het ticket "bewijst". Handig bij het schrijven van de DR |
| **Eindterm** | `et1-kennis` · `et2-oordeel` · `et3-communicatie` | Idem, voor de Dublin-descriptoren |
| **Deliverable** | `del-designrationale` · `del-prototype` · `del-video` · `del-poster` · `del-beelden` · `del-projectbeschrijving` | Werk dat direct in een (eind)deliverable belandt |
| **Status-extra** | `blocked-extern` · `stretch` · `individueel` | `blocked-extern` = wacht op opdrachtgever/docent · `stretch` = alleen als er tijd over is · `individueel` = telt voor de eigen beoordeling |

*Alternatief voor de groep Werksoort: in een company-managed project kun je hier **Components** voor gebruiken. In team-managed zijn labels prima.*

---

## 4. Schatten: story points & uren

**Twee lagen:**
- **Story points** (Fibonacci) op Stories en Tasks: hoe groot/onzeker is het, *relatief* ten opzichte van elkaar. Gebruik je voor de velocity en de burndown.
- **Uren** (Original estimate) op Sub-tasks: hoeveel tijd kost het concreet. Gebruik je om te checken of het in de sprint past (§9).

**Afspraak uren:** schat in **persoonsuren**. Een teammeeting van 1 uur met 4 personen = `4h`. Schrijf in Jira altijd in uren (`2h`, `30m`) en niet in `1d`, want Jira rekent standaard met 8 uur per dag en dat geeft verwarring.

| SP | Betekenis | Referentieticket |
|---|---|---|
| 1 | Klein, duidelijk, < 2 uur werk | Beslissing in het beslissingenlog zetten |
| 2 | Duidelijk, halve dag | Stakeholderanalyse bijwerken |
| 3 | Een paar onderdelen, ~1 dag | Toetsplan opstellen |
| 5 | Meerdere dagen of meerdere mensen, wat onzekerheid | Concepttoets uitvoeren |
| 8 | Groot en onzeker | Prototype v1 bouwen |
| 13 | Te groot → **opknippen** voordat het in een sprint mag | n.v.t. |

*Tip: schat de story points samen met **planning poker** (iedereen tegelijk een kaart/getal, verschillen bespreken). Dat is meteen zichtbaar "taken gepland vanuit een gezamenlijk doel" (PR2).*

**Prioriteit:** Highest = blokkeert het beslismoment of een deadline · High = nodig voor het sprintdoel · Medium = helpt het sprintdoel · Low = `stretch`.

---

## 5. Definition of Ready / Done

**Definition of Ready** (een ticket mag pas de sprint in als…)
- [ ] er een duidelijke titel + "waarom" in de beschrijving staat
- [ ] er acceptatiecriteria zijn
- [ ] het geschat is (SP, en uren op de sub-tasks)
- [ ] labels en een eigenaar zijn ingevuld
- [ ] het kleiner is dan 13 SP

**Definition of Done** (een ticket is pas Done als…)
- [ ] de acceptatiecriteria gehaald zijn
- [ ] een teamgenoot het in "Review" bekeken heeft
- [ ] het resultaat gelinkt is in het ticket (document, foto, code)
- [ ] beslissingen/feedback in het beslissingenlog/feedbacklog staan, **met waarom**
- [ ] het in de Design Rationale terug te vinden is, **met naam** (wie deed wat)
- [ ] er (waar het kan) een foto/screenshot is opgeslagen, getagd *context / interactie / detail*

---

## 6. Epics

| Epic | Naam | Jira-sprint | Gekoppeld aan |
|---|---|---|---|
| **E1** | Sprint 1 afronden & openstaande actiepunten | DS2a | OP1–OP3, PR3 |
| **E2** | Proces & Jira | DS2a + DS2b | PR2 |
| **E3** | Doelgroeponderzoek & concepttoets | DS2a | Deelvraag 1A, 2A |
| **E4** | Conceptkeuze | DS2a | Deelvraag 1B |
| **E5** | Concept uitwerken (trein) | DS2a eind + DS2b | Deelvraag 1B, PR1 |
| **E6** | Haalbaarheid & prototype v1 bouwen | DS2a (scan) + DS2b | Deelvraag 1C, PR1 |
| **E7** | Prototype testen | DS2b | Deelvraag 2A, PR1 |
| **E8** | Ethiek & privacy | DS2a + DS2b | Deelvraag 1D, ET2 |
| **E9** | Stakeholders | DS2a + DS2b | PR3 |
| **E10** | Design Rationale & week-8-toets | DS2a + DS2b | PR4, `individueel` |
| **E11** | Beeldmateriaal (doorlopend) | DS2a + DS2b | DEL |

---

## 7. Tickets per epic

Notatie: **Type · SP · Prio · Sprint · Due**. Uren staan achter elke sub-task. `[naam]` vul je in tijdens de sprintplanning.

### E1: Sprint 1 afronden & openstaande actiepunten

#### S2-01 · Feedback stakeholderbijeenkomst 1 verwerken in het onderzoeksplan
**Task · 3 SP · High · DS2a · Due 9 okt** · Labels: `documentatie` `op1` `op2` `op3`
**Waarom:** het onderzoeksplan is de basis van alles wat we deze sprint doen; de rubric-checks uit v0.5 staan er nog open in.
**Acceptatiecriteria:** feedback van 1 okt staat in het feedbacklog met reactie (overgenomen/aangepast/geparkeerd); openstaande rubric-checks zijn opgelost of bewust geparkeerd; nieuwe regel in het versiebeheer.
- [ ] Feedback stakeholderbijeenkomst 1 in feedbacklog zetten, per punt een reactie — `1h`
- [ ] Hoofdvraag afmaken en afstemmen op doelstelling + aantal contactmomenten — `1h`
- [ ] Per deelvraag een "analyse"-rij toevoegen (hoe analyseren we de data) — `2h`
- [ ] Opdrachtcontext + kwaliteitscriteria (betrouwbaarheid, validiteit, triangulatie) bij methodekeuze — `2h`
- [ ] Hoofdstuk "Deelresultaten & planning" (deelvraag → deelresultaat → wanneer → bijdrage einddoel) — `2h`
- [ ] Bronvermelding notulen 23-9 en citaten opdrachtgever in de inleiding — `1h`
- [ ] Versiebeheer bijwerken — `0.5h`

#### S2-02 · Sprintreview & retro designsprint 1 vastleggen
**Task · 2 SP · High · DS2a · Due 6 okt** · Labels: `proces` `pr2` `del-designrationale`
**Waarom:** het resultaat van een sprint is de herformuleerde focus voor de volgende; dat moet zichtbaar zijn in de DR.
**Acceptatiecriteria:** DR-blok sprint 1 met sprintdoel, resultaten, waarde voor het doel, retropunten en de focus voor sprint 2.
- [ ] Retro (start/stop/continue), hele team — `4h`
- [ ] Sprintreview-blok sprint 1 in de DR schrijven — `1.5h`
- [ ] Retropunten omzetten naar concrete afspraken/tickets — `0.5h`

#### S2-03 · Openstaande actiepunten opdrachtgever (23-9) afhandelen
**Task · 2 SP · Medium · DS2a · Due 9 okt** · Labels: `stakeholder` `pr3` `blocked-extern`
**Waarom:** deze punten staan al sinds 23-9 open en leveren input voor de concepttoets (instroomcijfers) en de bestaande toepassingen (data-games).
- [ ] Instroomcijfers opvragen bij Anhoud — `0.5h`
- [ ] Curriculum-briefing (Teams, dinsdagmiddag) inplannen met opdrachtgever — `0.5h`
- [ ] Contact Erwin Volmering (Lectoraat iWDT) — `0.5h`
- [ ] Bestaande data-games (Aliander, CMD) opvragen — `0.5h`
- [ ] Curriculum-briefing bijwonen + notulen — `4h`

#### S2-04 · Analyse bestaande toepassingen
**Task · 5 SP · High · DS2a · Due 14 okt** · Labels: `onderzoek` `deelvraag-1b` `op1` `et1-kennis` `concept-trein`
**Waarom:** de rubric wil dat het plan start vanuit een analyse van een bestaande toepassing; dat ontbreekt nu. Voor de trein is 'Hack je gek' van Infra meteen de belangrijkste.
**Acceptatiecriteria:** per toepassing: wat is het, wat werkt/werkt niet, welke vraag levert het ons op. Opgenomen in het onderzoeksplan.
- [ ] 'Hack je gek' (Infra) bekijken/navragen: opzet, waarom werkte het voor de instroom? — `3h`
- [ ] Huidige Data & AI-workshop analyseren ("waardeloos" volgens opdrachtgever: waarom precies?) — `2h`
- [ ] Data-games Aliander/CMD + 1–2 externe voorbeelden (deskresearch) — `3h`
- [ ] Analyse uitschrijven in het onderzoeksplan + bronnen — `2h`

---

### E2: Proces & Jira

#### S2-05 · Jira inrichten
**Task · 3 SP · Highest · DS2a · Due 6 okt** · Labels: `proces` `pr2`
**Acceptatiecriteria:** project staat zoals §2, labels zoals §3, DoR/DoD in de projectbeschrijving, iedereen kan inloggen en een ticket verplaatsen.
- [ ] Project + board-kolommen + velden aanmaken — `1h`
- [ ] Epics + tickets uit dit document overnemen — `2h`
- [ ] DoR/DoD en werkafspraken in projectbeschrijving — `0.5h`
- [ ] Korte uitleg-sessie voor het team (30 min) — `2h`

#### S2-06 · Toolkeuze Jira vastleggen in het beslissingenlog
**Task · 1 SP · Medium · DS2a · Due 9 okt** · Labels: `proces` `documentatie` `pr2`
**Waarom:** de onderbouwing staat al in [`Tools-Vergelijking-DTI.md`](./Tools-Vergelijking-DTI.md) (sectie "Beslissing": Jira + Confluence, 63/90, iedereen heeft er ervaring mee). Die moet nog als beslissing in het beslissingenlog, met datum en wie besloten heeft.
- [ ] Beslissing uit de tools-vergelijking overnemen in het beslissingenlog (+ datum/namen invullen) — `0.5h`

#### S2-07 · Scrum-ceremonies designsprint 2
**Task · 3 SP · High · DS2a + DS2b** · Labels: `proces` `pr2`
**Waarom:** stand-ups, planning en reviews tellen alleen als ze zichtbaar zijn.
- [ ] Sprintplanning DS2a (incl. planning poker) — `6h`
- [ ] Stand-ups wk 41–42 (4× 10 min × 4 p.) — `3h`
- [ ] Sprintreview + retro DS2a (vr 16 okt) — `4h`
- [ ] Sprintplanning DS2b (ma 26 okt) — `4h`
- [ ] Stand-ups wk 44–46 (6× 10 min × 4 p.) — `4h`
- [ ] Burndown/sprint report screenshotten na elke sprint → DR — `0.5h`

---

### E3: Doelgroeponderzoek & concepttoets

#### S2-08 · Toetsplan opstellen
**Story · 3 SP · Highest · DS2a · Due 8 okt** · Labels: `onderzoek` `deelvraag-1a` `deelvraag-2a` `op2` `concept-trein`
**Waarom:** we neigen naar de trein, maar dat is nu nog het beeld van ons en de opdrachtgever. Eerst checken bij de doelgroep zelf.
**Acceptatiecriteria:** aannamelijst, vragen, methode, doelgroep + aantal deelnemers, analyse-aanpak en planning staan op papier en zijn door het hele team gezien.
- [ ] Aannamelijst trein: wat denkt de opdrachtgever / wat denken wij / wat moeten we bij de doelgroep toetsen — `2h`
- [ ] Interviewguide (begrip van Data & AI vóór/na, reactie op concept, zelfmaak-element) — `2h`
- [ ] Korte enquête (bv. 5 vragen, ook bruikbaar op open dag) — `2h`
- [ ] Toetsmomenten zoeken: Excel schoolvoorlichtingen (Teams) + eerstejaarsgroepen via opdrachtgever — `1h`
- [ ] Analyse-aanpak vastleggen (coderen + thematisch clusteren, per doelgroep vergelijken) — `1h`

#### S2-09 · Low-fi toetsmateriaal maken (trein + alternatieven)
**Story · 3 SP · High · DS2a · Due 12 okt** · Labels: `ontwerp` `prototype` `concept-trein` `concept-aihuisdier` `concept-biometrie` `pr1`
**Waarom:** om echt te kunnen kiezen laten we de trein zien **naast** de twee alternatieven, anders toetsen we alleen of mensen de trein "wel leuk" vinden.
- [ ] Storyboard trein (6–8 frames: aankomst → spoor aanpassen → AI reageert → dashboard) — `3h`
- [ ] 1-pager/schets AI-huisdier en biometrie, zelfde format — `2h`
- [ ] Optioneel: korte mock-up/video van de trein (Unity of tekening) — `3h` · `stretch`

#### S2-10 · Concepttoets uitvoeren bij de doelgroep
**Story · 5 SP · Highest · DS2a · Due 15 okt** · Labels: `onderzoek` `test` `deelvraag-1a` `deelvraag-2a` `mbo` `havo-vwo` `propedeuse`
**Acceptatiecriteria:** minimaal 2 doelgroepen gesproken (bv. ≥ 5 eerstejaars + ≥ 5 scholieren), toestemming geregeld, ruwe notities/opnames opgeslagen.
- [ ] Afspraken maken met eerstejaarsgroep(en) — `1h`
- [ ] Afspraak schoolvoorlichting of MBO/HAVO-scholieren (via opdrachtgever/eigen netwerk) — `1h`
- [ ] Sessies uitvoeren (2 personen per sessie) — `8h`
- [ ] Notities uitwerken + foto's maken (met toestemming) — `3h`

#### S2-11 · Toetsresultaten analyseren
**Task · 5 SP · Highest · DS2a · Due 16 okt** · Labels: `onderzoek` `deelvraag-1a` `deelvraag-2a` `op2` `op3`
**Acceptatiecriteria:** gecodeerde resultaten, top-inzichten per doelgroep, getoetste vs. niet-getoetste aannames, conclusie per concept.
- [ ] Coderen + thematisch clusteren (samen, op whiteboard/Miro) — `4h`
- [ ] Vergelijking per doelgroep + aannamelijst bijwerken (getoetst/nog te toetsen) — `2h`
- [ ] Conclusie uitschrijven voor het beslismoment — `1.5h`

#### S2-12 · Persona's / empathy maps bijwerken
**Task · 3 SP · Medium · DS2a · Due 16 okt** · Labels: `ontwerp` `mbo` `havo-vwo` `propedeuse` `et3-communicatie`
- [ ] Per doelgroep een persona of empathy map op basis van de toetsdata — `4h`
- [ ] Koppelen aan contactmoment (inspireren/informeren/activeren/committeren) — `1h`

---

### E4: Conceptkeuze

#### S2-13 · Beslismatrix concepten
**Task · 3 SP · Highest · DS2a · Due 16 okt** · Labels: `onderzoek` `deelvraag-1b` `concept-algemeen` `op3`
**Criteria (voorstel, uit de feedback van de opdrachtgever):** zelfmaak-element · zelfstandig op te zetten door studenten/docenten · cross-over tussen ICT-richtingen · spreekt brede doelgroep aan (incl. meiden, niet alleen "nerds") · past bij contactmoment(en) · kosten/haalbaarheid · uitleg Data & AI verder dan "LLM's" · reactie van de doelgroep (S2-11).
- [ ] Criteria + gewichten samen vaststellen — `2h`
- [ ] Scoren (ieder apart, daarna bespreken) — `2h`
- [ ] Matrix + uitleg in het onderzoeksplan — `1h`

#### S2-14 · Go/no-go trein + terugkoppeling opdrachtgever
**Task · 2 SP · Highest · DS2a · Due 16 okt** · Labels: `stakeholder` `concept-trein` `pr1` `pr3`
**Acceptatiecriteria:** besluit in het beslissingenlog (wat / alternatieven / waarom / op basis van welke data); opdrachtgever via Teams op de hoogte.
- [ ] Besluitbespreking team — `2h`
- [ ] Beslissingenlog + korte update naar opdrachtgever — `1h`

#### S2-15 · Afstemming met Infra over 'Hack je gek'
**Task · 2 SP · High · DS2a · Due 15 okt** · Labels: `stakeholder` `concept-trein` `open-dag` `pr3` `blocked-extern`
**Waarom:** feedback opdrachtgever: de trein moet op open dagen afgestemd worden met bestaande Infra-opstellingen. Kans: samenwerking (cross-over is juist de kracht). Risico: overlap of concurrentie om dezelfde bezoekers.
- [ ] Contactpersoon Infra achterhalen + gesprek plannen — `0.5h`
- [ ] Gesprek voeren (2 personen) + notulen — `2h`
- [ ] Conflicterende/gedeelde belangen in de stakeholderanalyse zetten — `0.5h`

---

### E5: Concept uitwerken (trein)

*Deze tickets starten pas na een "go" (of worden omgelabeld na een no-go).*

#### S2-16 · Primair contactmoment + doelgroep voor prototype v1 kiezen
**Task · 2 SP · Highest · DS2b · Due 27 okt** · Labels: `ontwerp` `concept-trein` `pr1`
**Waarom:** een idee dat voor alle vier contactmomenten tegelijk moet werken wordt te vaag. Voor de hand liggend: **open dag, ~15 min "iets te doen"**, want daar kunnen we op 7 nov testen. Schoolvoorlichting/proefstuderen kunnen variaties zijn in sprint 3.
- [ ] Keuze + onderbouwing (met toetsresultaten) in het beslissingenlog — `1.5h`

#### S2-17 · Requirements & user stories trein
**Story · 3 SP · High · DS2b · Due 28 okt** · Labels: `ontwerp` `concept-trein` `op1`
**Acceptatiecriteria:** SMART-requirements + user stories (ITVES) in de backlog (zie §8), MoSCoW-prioriteit erbij.
- [ ] Requirements opstellen (incl. randvoorwaarden opdrachtgever: zelfstandig op te zetten, budget) — `2h`
- [ ] User stories uitschrijven en checken op ITVES — `2h`
- [ ] MoSCoW: wat moet in v1, wat is voor sprint 3 — `1h`

#### S2-18 · Interactieontwerp: de ervaring van 15 minuten
**Story · 5 SP · High · DS2b · Due 30 okt** · Labels: `ontwerp` `concept-trein` `open-dag` `pr1` `et3-communicatie`
**Waarom:** hier zit het zelfmaak-element. Wat doet de scholier precies zelf (spoor leggen? sensor kiezen? de AI een regel/voorbeeld "leren"?), en wanneer snapt hij/zij wat Data & AI is?
- [ ] Customer journey open dag: aankomst → doen → begrijpen → meenemen — `3h`
- [ ] Zelfmaak-element uitwerken (2–3 varianten, kiezen) — `3h`
- [ ] Storyboard v2 op basis van toetsresultaten — `2h`

#### S2-19 · Wat is "de AI" in de trein?
**Task · 3 SP · High · DS2b · Due 30 okt** · Labels: `onderzoek` `concept-trein` `deelvraag-1c` `et1-kennis` `et3-communicatie`
**Waarom:** de doelgroep denkt bij AI vooral aan LLM's of banenverlies. De trein moet laten zien wat AI met data doet, en niet alleen een vaste route-berekening zijn die we "AI" noemen. Kritische vraag voor onszelf: is het echt AI/ML, en kan een scholier dat in 15 min snappen?
- [ ] Opties uitzoeken (bv. route leren uit data, objectherkenning op het spoor, voorspelling vertraging) — `3h`
- [ ] Keuze + uitleg voor een niet-specialist (1 alinea, scholierentaal) — `1.5h`
- [ ] Theoretisch kader aanvullen met de begrippen die we nu gebruiken — `1h`

#### S2-20 · Dashboard/visualisatie ontwerpen
**Story · 3 SP · Medium · DS2b · Due 3 nov** · Labels: `ontwerp` `prototype` `concept-trein`
- [ ] Wireframes dashboard (welke data, hoe zie je wat de AI beslist) — `3h`
- [ ] Snelle check bij 2–3 eerstejaars of medestudenten — `1h`

---

### E6: Haalbaarheid & prototype v1 bouwen

#### S2-21 · Technische quick scan: fysiek vs. virtueel vs. hybride
**Task · 5 SP · Highest · DS2a · Due 14 okt** · Labels: `onderzoek` `prototype` `deelvraag-1c` `concept-trein`
**Waarom:** nodig voor het beslismoment én bepaalt wat we in DS2b bouwen. Gebruik de LES Prototypen (do 8 okt) hiervoor.
- [ ] Fysiek: Arduino/Raspberry Pi + (speelgoed)trein + sensoren, wat is nodig? — `4h`
- [ ] Virtueel: Unity-simulatie (of VR), wat is nodig? — `4h`
- [ ] Vergelijkingstabel (tijd, kosten, skills in team, opzetten door docent, "wow") — `2h`
- [ ] Expertgesprek FabLab/docent — `1h`

#### S2-22 · Materialen & budget regelen
**Task · 2 SP · High · DS2a/DS2b · Due 27 okt** · Labels: `prototype` `stakeholder` `blocked-extern`
- [ ] Materiaallijst + kosten — `1.5h`
- [ ] HAN-resources aanvragen (Raspberry Pi's e.d.) — `0.5h`
- [ ] Budgetverzoek naar opdrachtgever (met onderbouwing) — `1h`

#### S2-23 · Prototype v1 bouwen
**Story · 8 SP · Highest · DS2b · Due 5 nov** · Labels: `prototype` `concept-trein` `del-prototype` `pr1`
**Acceptatiecriteria:** een scholier kan de kerninteractie (zelf iets aanpassen → AI reageert → zichtbaar in dashboard) in ~15 min doorlopen; v1 mag lelijk zijn, de interactie moet werken.
*Sub-tasks hangen af van S2-21, voorstel voor beide varianten:*
- [ ] Fysiek: spoor/trein opbouwen + sensoren aansluiten — `8h`
- [ ] Fysiek: microcontroller-code (data uitlezen, wissel/route aansturen) — `8h`
- [ ] *of* Virtueel: Unity-scène trein + spoor + interactie — `12h`
- [ ] AI-onderdeel (uit S2-19) implementeren, simpelste versie — `6h`
- [ ] Interne test met het team + bugfix-ronde — `3h`

*Uren: tel alleen de variant die je kiest (fysiek ≈ 25h, virtueel ≈ 21h).*

#### S2-24 · Dashboard koppelen aan het prototype
**Story · 5 SP · High · DS2b · Due 5 nov** · Labels: `prototype` `concept-trein` `del-prototype`
- [ ] Datastroom prototype → dashboard — `4h`
- [ ] Dashboard bouwen op basis van wireframes (S2-20) — `5h`

#### S2-25 · Code & bestanden in GitHub, gekoppeld aan Jira
**Task · 1 SP · Medium · DS2b** · Labels: `prototype` `proces` `del-prototype`
- [ ] Map/repo voor prototypecode + commit-afspraak (`DTI-xx` in commit message) — `1h`

#### S2-26 · Opzet-instructie v0.1
**Task · 2 SP · Low · DS2b** · Labels: `documentatie` `del-prototype` `stretch`
**Waarom:** eis van de opdrachtgever (klein docententeam, moet zelfstandig op te zetten zijn) én onderdeel van het eind-deliverable "interactief prototype + instructiedocument".
- [ ] Stappen opzetten/afbreken + benodigdheden opschrijven — `2h`

---

### E7: Prototype testen

#### S2-27 · Testplan prototype v1
**Task · 3 SP · High · DS2b · Due 4 nov** · Labels: `test` `onderzoek` `deelvraag-2a` `op2`
**Wat meten (voorstel):** snapt de scholier na afloop wat Data & AI is (vóór/na) · enthousiasme/interesse · duur · waar loopt men vast · kan iemand anders het opzetten/begeleiden?
- [ ] Testvragen + observatieformulier — `2h`
- [ ] Korte vóór/na-vragenlijst — `1h`
- [ ] Rolverdeling op de testdag (begeleider, observator, fotograaf) — `0.5h`

#### S2-28 · Test op open dag Nijmegen (za 7 nov)
**Story · 5 SP · Highest · DS2b · Due 7 nov** · Labels: `test` `open-dag` `havo-vwo` `mbo` `concept-trein` `blocked-extern`
**Let op:** nog **niet bevestigd** dat we op de open dag mogen staan. Fallback: eerstejaarsgroep of schoolvoorlichting in week 45/46.
- [ ] Toestemming + plek regelen bij opdrachtgever (uiterlijk eind wk 44) — `1h`
- [ ] Opbouwen + testen op locatie — `3h`
- [ ] Testdag uitvoeren (bv. 3 personen × 4 uur) — `12h`
- [ ] Foto's/video (met toestemming), getagd — `1h`

#### S2-29 · Testresultaten analyseren + eisen sprint 3
**Task · 3 SP · Highest · DS2b · Due 11 nov** · Labels: `onderzoek` `test` `op3` `pr1`
**Acceptatiecriteria:** inzichten, aangepaste aannames en een **herformuleerde focus/eisen voor designsprint 3** (dat is het eigenlijke resultaat van deze sprint).
- [ ] Data verwerken + clusteren — `3h`
- [ ] Conclusies + nieuwe eisen voor sprint 3 — `2h`

---

### E8: Ethiek & privacy

#### S2-30 · Deelvraag 1D (ethiek & privacy) uitwerken
**Task · 3 SP · High · DS2a · Due 16 okt** · Labels: `onderzoek` `deelvraag-1d` `et2-oordeel` `op2`
**Waarom:** blok D is in het onderzoeksplan nog leeg, en ethiek is een expliciet beoordelingspunt (ET2). Relevant voor de trein: verzamelen we data van (vaak minderjarige) scholieren? Zo ja, welke, waar blijft die? Liefst: geen persoonsgegevens, alleen data van de trein zelf.
- [ ] Tabel 1D invullen (type, doel, strategie, methode, waarom, bron) + nummering fixen — `1.5h`
- [ ] Ethische afweging trein uitschrijven (data, minderjarigen, beeldvorming "AI pakt banen af") — `2h`
- [ ] Na LES Ethiek (wk 44/45): aanvullen — `1h`

#### S2-31 · Toestemming voor tests & beeldmateriaal
**Task · 2 SP · High · DS2a · Due 12 okt** · Labels: `documentatie` `et2-oordeel` `beeld`
- [ ] Kort toestemmingsformulier (deelname + foto/video), check met docent — `1.5h`
- [ ] Afspraak: geen herkenbare gezichten van minderjarigen zonder toestemming — `0.5h`

---

### E9: Stakeholders

#### S2-32 · Stakeholderanalyse bijwerken
**Task · 2 SP · Medium · DS2a · Due 16 okt** · Labels: `stakeholder` `pr3`
**Nieuwe/veranderde stakeholders om te checken:** Infra ('Hack je gek'), open-dag-organisatie, Anhoud (cijfers), Lectoraat iWDT, eerstejaars als testgroep, FabLab.
- [ ] Analyse bijwerken (belang, houding, macht/invloed, conflicten) — `2h`

#### S2-33 · Stakeholderbijeenkomst 2 voorbereiden (= sprintreview DS2b)
**Story · 5 SP · Highest · DS2b · Due 12 nov** · Labels: `stakeholder` `pr3` `pr4` `et3-communicatie`
**Acceptatiecriteria:** presentatie met: wat getoetst, wat gekozen en waarom, prototype (demo), testresultaten, plan sprint 3. Individuele bijdragen gelabeld.
- [ ] Presentatie maken — `4h`
- [ ] Demo voorbereiden — `2h`
- [ ] Oefenen (hele team) — `4h`
- [ ] Bijeenkomst + notulen + feedback in feedbacklog — `5h`

#### S2-34 · Tweewekelijkse update aan opdrachtgever
**Task · 1 SP · Medium · DS2a + DS2b** · Labels: `stakeholder` `pr3`
- [ ] Update via Teams (wk 41, 42, 45) — `1.5h`

---

### E10: Design Rationale & week-8-toets

#### S2-35 · Design Rationale bijwerken t/m sprint 2a
**Task · 5 SP · Highest · DS2a · Due 16 okt (vóór vakantie!)** · Labels: `documentatie` `del-designrationale` `pr1` `pr4`
**Waarom:** de week-8-toets is do 29 okt, de eerste werkdag na de vakantie zit maar 3 dagen eerder. De DR moet dus vóór de vakantie grotendeels staan.
- [ ] Per week (35–42) een blok: vraag, aanpak, resultaat, beslissing, met namen — `6h`
- [ ] Koppeling aan activiteitenplanning/Jira (screenshots board) — `1h`
- [ ] Visuele rode draad (tijdlijn) opzetten — `3h`

#### S2-36 · Feedbacksessie week 44 voorbereiden
**Task · 3 SP · Highest · DS2b · Due 29 okt** · Labels: `pr4` `et3-communicatie` `del-designrationale`
- [ ] Presentatie (5–12 min) — `3h`
- [ ] Oefenen — `2h`

#### S2-37 t/m S2-40 · 3× peer review (één ticket per persoon)
**Task · 2 SP · Highest · DS2b · Due 29 okt** · Labels: `individueel` `pr2` `pr4`
*Maak dit ticket 4× aan, één per teamlid, zodat ieders bijdrage apart zichtbaar is.*
- [ ] Peer review 1 — `1h`
- [ ] Peer review 2 — `1h`
- [ ] Peer review 3 — `1h`
- [ ] Ontvangen feedback verwerken in eigen deel van de DR — `1.5h`

#### S2-41 · Definitieve DR-presentatie
**Task · 3 SP · High · DS2b** · Labels: `del-designrationale` `pr4`
*Check bij de docent wanneer deze precies ingeleverd moet worden (na de peer reviews).*
- [ ] Feedback peer reviews + eigen reviews verwerken — `3h`
- [ ] DR aanvullen t/m week 46 — `2h`

---

### E11: Beeldmateriaal (doorlopend)

#### S2-42 · Beeldmateriaal designsprint 2
**Task · 2 SP · Medium · DS2a + DS2b** · Labels: `beeld` `del-beelden` `del-video` `del-poster`
**Waarom:** foto's van tussenproducten krijg je later nooit meer terug, en je hebt ze nodig voor DR, poster, 3 beelden en de video.
- [ ] Elke week ≥ 1 foto/screenshot, getagd *context / interactie / detail* — `2h`
- [ ] Bouwproces trein filmen (korte clips voor de walkthrough) — `1h`
- [ ] Testdag: interactie-foto's/video (met toestemming) — `1h`

---

## 8. Product backlog: user stories voor de trein

Deze stories gaan over het **product** (de trein), niet over ons onderzoeksproces. Zet ze in de backlog als type Story met label `concept-trein`. Na S2-17 kies je welke in v1 komen; de rest gaat naar sprint 3. Prioriteit nu nog voorlopig, want die hangt af van de toetsresultaten.

| # | User story | MoSCoW (voorlopig) | SP |
|---|---|---|---|
| US-01 | Als **scholier op de open dag** wil ik zelf het spoor of een wissel kunnen aanpassen, zodat ik zie dat mijn keuze invloed heeft op wat de AI doet. | Must | 5 |
| US-02 | Als **scholier** wil ik op een scherm zien welke data de trein verzamelt, zodat ik snap dat AI met data werkt. | Must | 3 |
| US-03 | Als **scholier** wil ik zien *waarom* de AI een andere route kiest, zodat AI geen "magie" is. | Must | 5 |
| US-04 | Als **scholier zonder ICT-achtergrond** wil ik in een paar minuten zonder uitleg kunnen beginnen, zodat ik niet afhaak. | Should | 3 |
| US-05 | Als **docent Data & AI** wil ik de opstelling in < 15 min zelfstandig kunnen opbouwen, zodat het werkt zonder het projectteam. | Should | 3 |
| US-06 | Als **scholier** wil ik iets meenemen wat ik zelf gemaakt heb (bv. mijn route/score), zodat ik er thuis nog over praat. | Could | 3 |
| US-07 | Als **opdrachtgever** wil ik dat software, infra en data zichtbaar samenkomen, zodat de opstelling naast 'Hack je gek' kan staan. | Should | 2 |
| US-08 | Als **scholier die niet in treinen geïnteresseerd is** wil ik een thema kunnen kiezen (bv. fiets, vliegtuig, robot), zodat het ook voor mij interessant is. | Could | 5 |
| US-09 | Als **eerstejaars** wil ik een moeilijker niveau dat lijkt op een echte les, zodat het ook werkt bij het keuzemoment/proefstuderen. | Won't (sprint 3) | 8 |
| US-10 | Als **bezoeker die alleen kijkt** wil ik zonder mee te doen begrijpen wat er gebeurt, zodat de opstelling ook als showcase werkt. | Could | 2 |

*ITVES-check per story bij het verfijnen: Independent, Testable, Valuable, Estimatable, Small. US-09 is nu te groot en moet opgeknipt worden.*

---

## 9. Capaciteit & totaal

**Totaal geschat in dit document:**

| Epic | SP | Uren (persoonsuren) |
|---|---|---|
| E1 Sprint 1 afronden | 12 | 31.5 |
| E2 Proces & Jira | 7 | 28 |
| E3 Doelgroeponderzoek | 19 | 41.5 |
| E4 Conceptkeuze | 7 | 11 |
| E5 Concept uitwerken | 16 | 24 |
| E6 Haalbaarheid & bouwen | 23 | 51 (fysiek) / 47 (virtueel) |
| E7 Testen | 11 | 25.5 |
| E8 Ethiek & privacy | 5 | 6.5 |
| E9 Stakeholders | 8 | 18.5 |
| E10 DR & week-8-toets (peer review 4× geteld) | 19 | 38 |
| E11 Beeldmateriaal | 2 | 4 |
| **Totaal** | **129** | **± 280** |

*Exclusief de product-backlog (§8), die schat je pas na S2-17. Inclusief de `stretch`-tickets (5h).*

**Hoeveel kunnen we aan?** Vul dit in tijdens de sprintplanning:

```
beschikbare uren = (aantal personen) × (projecturen per persoon per week) × (aantal weken) × 0,8
```

De 0,8 is buffer voor ziekte, uitloop en dingen die we nu nog niet weten. Lessen tellen niet mee als projecturen.

*Voorbeeld met een aanname van 15 projecturen p.p. per week:* 4 × 15 × 5 × 0,8 = **240 uur**. Dan is dit menu (± 280 uur) **te vol** en moet er ± 40 uur uit. Kandidaten om te schrappen of door te schuiven:
- S2-09 video-mockup (`stretch`), S2-26 opzet-instructie (`stretch`)
- S2-12 persona's: alleen empathy maps, geen volledige persona's
- S2-20/S2-24 dashboard: in v1 alleen ruwe data op een scherm, mooi maken in sprint 3
- S2-28 testdag korter (2 personen i.p.v. 3)

**Velocity:** we hebben nog geen velocity uit sprint 1 (er was geen board). Noteer aan het eind van DS2a hoeveel SP echt Done is; dat is de eerste referentie voor DS2b en sprint 3.

---

## 10. Risico's voor deze sprint

| Risico | Kans | Impact | Wat doen we eraan | Ticket |
|---|---|---|---|---|
| Doelgroep vindt de trein niet aansprekend (bv. "kinderachtig", alleen voor "nerds") | Middel | Hoog | Toetsen naast alternatieven, eerlijk go/no-go, themavariatie (US-08) | S2-09, S2-14 |
| Geen toetsmoment met scholieren in wk 41–42 | Middel | Hoog | Vroeg aanvragen via opdrachtgever; fallback eerstejaars of eigen netwerk (broertjes/zusjes, oude school) | S2-08, S2-10 |
| Week-8-toets valt direct na de vakantie | Hoog | Hoog | DR vóór 16 okt grotendeels af | S2-35 |
| Open dag 7 nov niet beschikbaar als testmoment | Middel | Middel | Uiterlijk eind wk 44 bevestigen, fallback eerstejaars | S2-28 |
| Fysieke trein te duur/te complex in ± 3 weken bouwtijd | Middel | Hoog | Quick scan vóór het beslismoment; v1 mag virtueel of hybride zijn | S2-21, S2-22 |
| Overlap/conflict met Infra ('Hack je gek') | Laag | Middel | Vroeg gesprek, samenwerking als kans | S2-15 |
| "AI" in de trein is eigenlijk geen AI → doelgroep leert niks nieuws | Middel | Middel | Bewust kiezen wat de AI doet en hoe we dat laten zien | S2-19, US-03 |
| Jira wordt na 2 weken niet meer bijgehouden (zie de tools-vergelijking 😉) | Middel | Middel | Stand-ups vóór het board, DoD, "geen naam = niemand doet het" | S2-05, S2-07 |
| Data van minderjarigen in tests/prototype | Laag | Hoog | Geen persoonsgegevens verzamelen, toestemmingsformulier | S2-30, S2-31 |
