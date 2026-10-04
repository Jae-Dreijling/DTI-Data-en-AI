# Scrumboard Designsprint 2: Jira-opzet & tickets

Hoort bij [`Planning-en-Deliverables-DTI.md`](./Planning-en-Deliverables-DTI.md), [`Projecthandboek-DTI.md`](./Projecthandboek-DTI.md) en het [Onderzoeksplan](./Lesmateriaal/28-9%20tot%204-10/Onderzoeksplan.md).
Opgesteld: 2 oktober 2026, na sprint 1. Per helft van de sprint komt er een eigen Excel (om te importeren in Jira). Nu alleen DS2a: [`Scrumboard-Sprint2a-DTI.xlsx`](./Scrumboard-Sprint2a-DTI.xlsx); de DS2b-Excel maken we na de go/no-go.

> **Status:** dit is een MENU, geen vaste planning! In de sprintplanning kiezen we samen welke tickets we echt overnemen; schattingen aanpassen, namen erbij. Wat te veel is gaat naar de backlog (sprint 3).

**Uitgangspunten**
- **Tool:** Jira (Scrum-template) + Confluence voor de docs (zie de beslissing in [`Tools-Vergelijking-DTI.md`](./Tools-Vergelijking-DTI.md)); docs linken we vanuit de tickets.
- **Sprintdoel designsprint 2:** *idee gekozen, uitgewerkt, eerste prototype getoetst.*
- **Concept:** er is nog GEEN keuze tussen de drie concepten (trein, AI-huisdier, biometrie)! In DS2a toetsen we ze alle drie eerlijk naast elkaar bij de doelgroep, en op 16 okt kiezen we (zie [beslismoment](#het-beslismoment-conceptkeuze)). Kill your darlings!

---

## Inhoud

1. [Tijdlijn van designsprint 2](#1-tijdlijn-van-designsprint-2)
2. [Jira inrichten](#2-jira-inrichten)
3. [Labels](#3-labels)
4. [Schatten: story points & uren](#4-schatten-story-points--uren)
5. [Definition of Ready / Done](#5-definition-of-ready--done)
6. [Epics](#6-epics)
7. [Tickets per epic](#7-tickets-per-epic)
8. [Product backlog: user stories (voorbeeld: trein)](#8-product-backlog-user-stories-voorbeeld-trein)
9. [Capaciteit & totaal](#9-capaciteit--totaal)
10. [Risico's voor deze sprint](#10-risicos-voor-deze-sprint)

---

## 1. Tijdlijn van designsprint 2

Designsprint 2 = **week 41 t/m 46** (5 werkweken; week 43 is herfstvakantie). In Jira heet de sprint **2**. Zes weken is lang, dus we plannen hem in **twee helften** (DS2a = eerste helft, DS2b = tweede helft), met het beslismoment ertussen:

| Helft van sprint 2 | Periode | Doel van deze helft |
|---|---|---|
| **DS2a: Toetsen & kiezen** | ma 5 okt – vr 16 okt (wk 41–42) | "De drie concepten getoetst bij de doelgroep en er onderbouwd één gekozen" |
| *(herfstvakantie)* | wk 43 | n.v.t. |
| **DS2b: Uitwerken, bouwen & testen** | ma 26 okt – vr 13 nov (wk 44–46) | "Eerste prototype van het gekozen concept gebouwd en getest bij de doelgroep" |

* Elke helft krijgt een eigen Excel (in de kolom Sprint staat bij allebei `2`). **DS2a staat nu klaar; DS2b is nog LEEG**, want wat we daar doen hangt af van de uitkomst van DS2a (welk concept, welk contactmoment etc.). De DS2b-tickets hieronder zijn dus alleen een voorlopige schets!

| Week | Wat in het rooster staat | Wat dat betekent voor het board |
|---|---|---|
| **41** (5–9 okt) | di: begeleiding · do: **LES Prototypen** (Blender, Unity, Vibe-Coding, Arduino) | Jira inrichten, sprintplanning, feedback stakeholder 1 verwerken, toetsplan maken, technische quick scan tijdens de prototypeles |
| **42** (12–16 okt) | do: **Werkplaats − / contact met gebruikers** | Concepttoets bij de doelgroep uitvoeren + analyseren → **vr 16 okt: conceptkeuze** · sprintreview + retro DS2a |
| 43 | Herfstvakantie | Niks gepland. Wel: Design Rationale vóór de vakantie op orde (week 44 = toets!!) |
| **44** (26–30 okt) | do: **Feedback + LES Interviewen & coderen / Ethiek** · 📌 **"Week 8": Design Rationale + 3× peer review (summatief)** | Sprintplanning DS2b, DR inleveren/presenteren, peer reviews, start bouwen |
| **45** (2–6 nov) | do: **LES Prototypen (vervolg)** · LES bedrijfsprocessen | Prototype v1 af, testplan klaar · **za 7 nov: open dag Nijmegen** (testmoment, nog afstemmen!) |
| **46** (9–13 nov) | do: 🤝 **Stakeholderbijeenkomst 2** | Testresultaten analyseren, stakeholderpresentatie = sprint review · *za 14 nov open dag Arnhem valt al in de overgang naar sprint 3* |
| 47 (16 nov) | di: Intervisie/retrospective | Retro DS2b + start designsprint 3 |

### Het beslismoment: conceptkeuze

**Wanneer:** vr 16 okt (einde DS2a). **Op basis van:** concepttoets bij de doelgroep (S2-11) + beslismatrix (S2-13) + haalbaarheidsscan (S2-21).

- **Daarna:** de DS2b-schets hieronder werken we uit voor het gekozen concept, en dat wordt de DS2b-Excel.
- De schets is nu met de trein als VOORBEELD ingevuld (het was het eerste concept dat we uitwerkten), maar wordt dus herschreven als het een ander concept wordt.
  * Hoe dan ook: WAAROM vastleggen in het beslissingenlog, want dat is precies wat de rubric wil zien!

---

## 2. Jira inrichten

| Instelling | Voorstel | Waarom |
|---|---|---|
| **Projecttype** | Scrum, **team-managed** | Simpelste variant; iedereen kan zelf labels/kolommen aanpassen. Company-managed heeft meer opties (components, versions) maar ook meer setup |
| **Projectkey** | `DTI` | Tickets heten dan `DTI-1`, `DTI-2`, … (de `S2-xx`-nummers zijn alleen om hier naar te verwijzen) |
| **Leden** | Jae, Bart, Maryam, Karlijn (+ evt. docent als viewer) | Free plan is gratis voor kleine teams (huidige max. aantal gebruikers wel even checken) |
| **Werktypes** | Epic · Story · Task · Sub-task · Bug | Story = waarde voor gebruiker/opdrachtgever; Task = onderzoeks-/proceswerk; Bug = fout in het prototype |
| **Board-kolommen** | Backlog → To Do → In Progress → **Review** → Done | Review = een teamgenoot kijkt mee voordat iets Done is (= zichtbaar "constructief kritisch op andermans werk", PR2 goed!) |
| **Velden aanzetten** | Story point estimate, Original estimate/Time tracking, Due date, Labels, Priority | Story points op stories/tasks, uren op sub-tasks (zie §4) |
| **Sprint** | Sprint `2` aanmaken en starten met de tickets van de eerste helft (DS2a); de tickets van de tweede helft (DS2b) pas toevoegen na de conceptkeuze | Sprintdoel komt terug in de sprintreview + burndown |
| **Koppelingen** | Confluence-pagina's (of docs in Teams/repo) koppelen aan tickets; optioneel GitHub-integratie voor de prototypecode | Zo zie je vanaf het board welk document bij welk werk hoort |
| **Rapporten** | Burndown + Sprint report screenshotten aan het eind van elke sprint | Bewijs voor de Design Rationale (agile werkwijze, PR2) |

**Werkafspraken** (tip: in de projectbeschrijving zetten)
- Alleen werken aan tickets met **jouw naam** erop, en zelf doorzetten. Geen naam = niemand doet het!
- **Stand-up:** di + do, 10 min, vóór het board: wat heb ik gedaan / wat ga ik doen / waar loop ik vast. Kort notuleren in het dagverslag.
- Ticket niet af in de sprint? Comment erbij ("waarom niet af") en terug naar de backlog of door naar de volgende sprint.

---

## 3. Labels

Jira-labels: GEEN spaties en hoofdlettergevoelig, dus alles lowercase met koppeltekens. Per ticket meerdere labels; per groep max. één of twee.

| Groep | Labels | Gebruik |
|---|---|---|
| **Werksoort** | `onderzoek` · `ontwerp` · `prototype` · `test` · `documentatie` · `stakeholder` · `proces` · `beeld` | Wat voor werk is het? (handig filter: schrijven we niet ALLEEN maar documenten?) |
| **Deelvraag** | `deelvraag-1` · `deelvraag-2` · `deelvraag-3` · `deelvraag-4` · `deelvraag-5` · `ethiek` | Koppeling aan de 5 deelvragen uit het onderzoeksplan (v0.6) = rode draad (PR1); `ethiek` = het hoofdstuk ethiek & privacy |
| **Concept** | `concept-trein` · `concept-aihuisdier` · `concept-biometrie` · `concept-algemeen` | Na het beslismoment meteen zien welk werk voor welk concept was |
| **Doelgroep** | `mbo` · `havo-vwo` · `propedeuse` | Voor welke doelgroep is dit werk / deze test? |
| **Contactmoment** | `schoolvoorlichting` · `open-dag` · `proefstuderen` · `keuzemoment` | Welk van de vier contactmomenten? |
| **Rubric** | `pr1` (rode draad/prototype) · `pr2` (agile) · `pr3` (stakeholders) · `pr4` (presentatie/reflectie) · `op1` (vragen) · `op2` (methodes) · `op3` (deelresultaten) | Welk criterium "bewijst" dit ticket? Super handig bij het schrijven van de DR |
| **Eindterm** | `et1-kennis` · `et2-oordeel` · `et3-communicatie` | Idem, voor de Dublin-descriptoren |
| **Deliverable** | `del-designrationale` · `del-prototype` · `del-video` · `del-poster` · `del-beelden` · `del-projectbeschrijving` | Werk dat direct in een (eind)deliverable komt |
| **Status-extra** | `blocked-extern` · `stretch` · `individueel` | `blocked-extern` = wachten op opdrachtgever/docent · `stretch` = alleen als er tijd over is · `individueel` = telt voor je eigen beoordeling |

* In een company-managed project kan de groep Werksoort ook als **Components**; in team-managed zijn labels prima.

---

## 4. Schatten: story points & uren

**Twee lagen:**
- **Story points** (Fibonacci) op Stories en Tasks: hoe groot/onzeker, *relatief* ten opzichte van elkaar (voor de velocity + burndown).
- **Uren** (Original estimate) op Sub-tasks: hoeveel tijd kost het echt (om te checken of het past, zie §9).

**Afspraak uren:** altijd in **persoonsuren**; teammeeting van 1 uur met 4 personen = `4h`. In Jira altijd in uren (`2h`, `30m`), NIET in `1d` (Jira rekent standaard met 8 uur per dag, geeft alleen maar verwarring).

| SP | Betekenis | Referentieticket |
|---|---|---|
| 1 | Klein, duidelijk, < 2 uur werk | Beslissing in het beslissingenlog zetten |
| 2 | Duidelijk, halve dag | Stakeholderanalyse bijwerken |
| 3 | Een paar onderdelen, ~1 dag | Toetsplan opstellen |
| 5 | Meerdere dagen of meerdere mensen, wat onzekerheid | Concepttoets uitvoeren |
| 8 | Groot en onzeker | Prototype v1 bouwen |
| 13 | Te groot → eerst **opknippen** | n.v.t. |

* Story points samen schatten met **planning poker** (iedereen tegelijk een getal, verschillen bespreken); meteen zichtbaar "taken gepland vanuit een gezamenlijk doel" (PR2)!

**Prioriteit:** Highest = blokkeert het beslismoment of een deadline · High = nodig voor het sprintdoel · Medium = helpt het sprintdoel · Low = `stretch`.

---

## 5. Definition of Ready / Done

**Definition of Ready** (ticket mag pas de sprint in als…)
- [ ] er een duidelijke titel + "waarom" in de beschrijving staat
- [ ] er acceptatiecriteria zijn
- [ ] het geschat is (SP, en uren op de sub-tasks)
- [ ] labels + eigenaar ingevuld zijn
- [ ] het kleiner is dan 13 SP

**Definition of Done** (ticket is pas Done als…)
- [ ] de acceptatiecriteria gehaald zijn
- [ ] een teamgenoot het in "Review" bekeken heeft
- [ ] het resultaat gelinkt is in het ticket (document, foto, code)
- [ ] beslissingen/feedback in het beslissingenlog/feedbacklog staan, MET waarom
- [ ] het terug te vinden is in de Design Rationale, MET naam (wie deed wat)
- [ ] er (waar het kan) een foto/screenshot is opgeslagen, getagd *context / interactie / detail*

---

## 6. Epics

| Epic | Naam | Helft | Gekoppeld aan |
|---|---|---|---|
| **E1** | Sprint 1 afronden & openstaande actiepunten | DS2a | OP1–OP3, PR3 |
| **E2** | Proces & Jira | DS2a + DS2b | PR2 |
| **E3** | Doelgroeponderzoek & concepttoets | DS2a | Deelvraag 2, 3 |
| **E4** | Conceptkeuze | DS2a | Deelvraag 4 |
| **E5** | Gekozen concept uitwerken | DS2a (co-creatie plannen) + DS2b | Deelvraag 4, PR1 |
| **E6** | Haalbaarheid & prototype v1 bouwen | DS2a (scan) + DS2b | Deelvraag 4, PR1 |
| **E7** | Prototype testen | DS2b | Deelvraag 5, PR1 |
| **E8** | Ethiek & privacy | DS2a + DS2b | Ethiek, ET2 |
| **E9** | Stakeholders | DS2a + DS2b | PR3 |
| **E10** | Design Rationale & week-8-toets | DS2a + DS2b | PR4, `individueel` |
| **E11** | Beeldmateriaal (doorlopend) | DS2a + DS2b | DEL |

---

## 7. Tickets per epic

Notatie: **Type · SP · Prio · Helft · Due** (in Jira zit alles in sprint `2`). Uren staan achter elke sub-task; namen vullen we in tijdens de sprintplanning.

* Tickets met **DS2b** zijn een voorlopige schets (nog niet plannen!); die werken we uit na de go/no-go van 16 okt.

### E1: Sprint 1 afronden & openstaande actiepunten

*Waarom: alles wat nog openstaat uit sprint 1 (onderzoeksplan v1.0, retro, actiepunten opdrachtgever) afronden, zodat we DS2a met een schone lei beginnen.*

#### S2-01 · Onderzoeksplan v1.0 afmaken + inleveren
**Task · 5 SP · Highest · DS2a · Due 16 okt** · Labels: `documentatie` `op1` `op2` `op3`
**Waarom:** het onderzoeksplan is de basis van alles deze sprint, en de go/no-go van de docent hangt ervan af. Deelvragen, analyse-aanpak, kwaliteitscriteria en risico's zijn al gedaan in v0.6 (2-10); wat overblijft: de open opmerkingen in de andere hoofdstukken, de feedback van stakeholderbijeenkomst 1, en inleveren.
**Let op:** volgens het lesoverzicht sluit het inleveren van de definitieve versie in week 44 (nog navragen bij de docent of dat klopt!). Wij mikken op af vóór de herfstvakantie.
**Acceptatiecriteria:** alle open opmerkingen afgehandeld of bewust geparkeerd; feedback van 1 okt in het feedbacklog met reactie; hoofdvraag compleet; literatuurlijst gevuld; Word-versie = markdown; versie 1.0 ingeleverd.
- [ ] Feedback stakeholderbijeenkomst 1 in feedbacklog zetten, per punt een reactie — `1h`
  - Wat: alle feedback van stakeholderbijeenkomst 1 (1 okt) in het feedbacklog, per punt: overgenomen / aangepast / geparkeerd + reden. · Waarom: feedback telt alleen als zichtbaar is wat we ermee deden (PR4).
- [ ] Hoofdvraag afmaken + afstemmen op doelstelling en aantal contactmomenten — `1h`
  - Hoofdvraag afmaken en vaststellen; ook checken of hij past bij de doelstelling en de contactmomenten. · Waarom: zonder complete hoofdvraag is het plan niet af (OP1).
- [ ] Bronvermelding notulen 23-9 en citaten opdrachtgever in de inleiding — `1h`
  - Wat: bij de aanleiding de notulen van 23-9 als bron noemen, ook voor de citaten ("slecht en bagger", "waardeloos") en de Infra-instroom. · Waarom: zo is zichtbaar dat we ons baseren op oriënterend onderzoek in het veld (OP1 voldoende).
- [ ] Theoretisch kader uitschrijven — `2h`
  - Wat: het theoretisch kader uitschrijven: de begrippen die we gebruiken (bv. doelgroepsegmentatie, co-creatie, AI/ML) met definitie + bron. · Waarom: Ik heerinner dat Karlijn er iets over gezegd had, ik weet de details niet meer, dus verbeter deze ticket graag; 
- [ ]  "3 momenten" in de aanleiding afhandelen — `0.5h`
  - Wat: Bart vroeg of de zin over "3 momenten" moet blijven; samen beslissen (het zijn er eigenlijk 4) en aanpassen. · Waarom: open opmerking, en de aanleiding moet kloppen met de rest van het plan.
- [ ] Literatuurlijst invullen (alle bronnen uit het plan,  APA) — `1.5h`
  - Wat: alle gebruikte bronnen (lesmateriaal, notulen, rubrics, deskresearch) in één stijl in de literatuurlijst. · Waarom: de lijst is nu nog leeg, en bronnen moeten controleerbaar zijn.
- [ ] Deelvragen toetsen — `1h`
  - Wat: de verbeterede deelvragen toetsen voor bruikbaarheid. · Waarom: Zonder deelvragen kunnen we de hoofdvraag niet goed beantwoorden
- [ ] Laatste check tegen de rubric onderzoeksplan (OP1–OP3) door een teamgenoot — `1h`
  - Wat: iemand die het niet zelf schreef leest het plan na met de rubric onderzoeksplan ernaast (OP1–OP3). · Waarom: een frisse blik vangt wat wij missen, en het is meteen "constructief kritisch op andermans werk" (PR2).
- [ ] Navragen bij docent: wanneer + waar inleveren? — `0.5h`
  - Wat: navragen of de definitieve versie in week 44 ingeleverd moet worden (zo staat het in het lesoverzicht), en waar/hoe. · Waarom: de deadline is onduidelijk; liever niet gokken!
- [ ] Versiebeheer naar 1.0 + inleveren — `0.5h`
  - Wat: versie 1.0 in het versiebeheer zetten en inleveren. · Waarom: afronding van het plan; daarna krijgen alleen grotere updates een nieuw versienummer.

#### S2-02 · Sprintreview & retro designsprint 1 vastleggen
**Task · 2 SP · High · DS2a · Due 6 okt** · Labels: `proces` `pr2` `del-designrationale`
**Waarom:** het resultaat van een sprint = de herformuleerde focus voor de volgende; moet zichtbaar zijn in de DR (design rationale)! (volgens de kickoff, kan het niet in de rubriek vinden :( )
**Acceptatiecriteria:** DR-blok sprint 1 met sprintdoel, resultaten, waarde voor het doel, retropunten + focus voor sprint 2.
- [ ] Retro (start/stop/continue), hele team — `4h`
  - Wat: met het hele team terugkijken op sprint 1: waar starten we mee, stoppen we mee, gaan we mee door? · Waarom: teamevaluatie hoort bij elke designsprint, en levert verbeterpunten voor DS2a.
- [ ] Sprintreview-blok sprint 1 in de DR schrijven — `1.5h`
  - Wat: in de DR een blok voor sprint 1: sprintdoel, resultaten, waarde voor het doel, focus voor sprint 2. · Waarom: de DR bouwen we per sprint op, niet pas achteraf.
- [ ] Retropunten omzetten naar concrete afspraken/tickets — `0.5h`
  - Wat: elk retropunt wordt een afspraak of een ticket. · Waarom: anders blijft het bij praten en verandert er niks.

#### S2-03 · Openstaande actiepunten opdrachtgever (23-9) afhandelen
**Task · 2 SP · Medium · DS2a · Due 9 okt** · Labels: `stakeholder` `pr3` `blocked-extern` `deelvraag-1`
**Waarom:** staan al sinds 23-9 open (oeps); input voor de concepttoets (instroomcijfers) en de bestaande toepassingen (data-games).
- [ ] Instroomcijfers van Arnoud checken: bruikbaar? Meer nodig? — `0.5h`
  - Wat: Arnoud heeft de instroomcijfers al gestuurd; checken of ze bruikbaar zijn voor de analyse (S2-43) en of we nog iets missen. Zo ja: gericht nog opvragen. · Waarom: we willen het probleem met cijfers onderbouwen, maar alleen als de data ook echt antwoord geeft op onze vragen.
- [ ] Curriculum-briefing (Teams, dinsdagmiddag) inplannen met opdrachtgever — `0.5h`
  - Wat: een online sessie plannen (bij voorkeur dinsdagmiddag) waarin de opdrachtgever het 2e jaar Data & AI uitlegt. · Waarom: input voor deelvraag 1: wat houdt Data & AI eigenlijk in?
- [ ] Contact Erwin Volmering (Lectoraat iWDT) — `0.5h`
  - Wat: contact zoeken met Erwin Volmering van het lectoraat iWDT. · Waarom: actiepunt uit het gesprek van 23-9; mogelijk expert/bron voor onze concepten.
- [ ] Bestaande data-games (Aliander, CMD) opvragen — `0.5h`
  - Wat: vragen naar de bestaande data-games die met Aliander en CMD gemaakt zijn. · Waarom: input voor de analyse van bestaande toepassingen (S2-04).
- [ ] Curriculum-briefing bijwonen + notulen — `4h`
  - Wat: de curriculum-briefing bijwonen en notuleren. · Waarom: geeft antwoord op deelvraag 1 en is meteen een bron.

#### S2-04 · Analyse bestaande toepassingen
**Task · 5 SP · High · DS2a · Due 14 okt** · Labels: `onderzoek` `deelvraag-4` `op1` `et1-kennis` `concept-algemeen`
**Waarom:** de rubric wil dat het plan start vanuit een analyse van een bestaande toepassing, en die missen we nog! Input voor alle drie de concepten (wat werkt wel/niet bij werving?).
**Acceptatiecriteria:** per toepassing: wat is het, wat werkt/werkt niet, welke vraag levert het ons op; staat in het onderzoeksplan.
- [ ] 'Hack je gek' (Infra) bekijken/navragen: opzet, waarom werkte het wel voor de instroom? — `3h`
  - Wat: uitzoeken hoe 'Hack je gek' van Infra werkt en waarom het daar wél meer instroom gaf. · Waarom: een succesvol bestaand voorbeeld; wat kunnen we ervan leren?
- [ ] Huidige Data & AI-workshop analyseren ("waardeloos" volgens opdrachtgever: maar waarom precies?) — `2h`
  - Wat: de huidige Data & AI-workshop bekijken en uitzoeken WAAROM die niet werkt. · Waarom: zo maken wij niet dezelfde fouten.
- [ ] Data-games Aliander/CMD + 1–2 externe voorbeelden (deskresearch) (als ie er zijn !!) — `3h`
  - Wat: de data-games van Aliander/CMD bekijken + 1–2 voorbeelden van buiten de HAN zoeken. · Waarom: breder beeld van wat er al bestaat.
- [ ] Analyse uitschrijven in het onderzoeksplan + sources — `2h`
  - Wat: de analyse als paragraaf in het onderzoeksplan zetten, met bronnen. · Waarom: de rubric wil dat het plan start vanuit een analyse van bestaande toepassingen.

---

### E2: Proces & Jira

*Waarom: het board, de werkafspraken en de scrum-ceremonies. Stand-ups en reviews tellen alleen mee als ze ZICHTBAAR zijn*

#### S2-05 · Jira omgeving…uhm..klaar maken? Ik weet niet veel, maar ik zet het er voor de zekerheid bij
**Task · 1 SP · Highest · DS2a · Due 6 okt** · Labels: `proces` `pr2`
**Waarom:** het board zelf zijn we nu al aan het inrichten; wat nog wel moet is vastleggen wanneer een ticket Ready/Done is, zodat iedereen hetzelfde bedoelt met "klaar" (PR2). De toolkeuze in het beslissingenlog zetten is S2-06.
- [ ] DoR/DoD en werkafspraken in projectbeschrijving — `0.5h`
  - Wat: de DoR, DoD en werkafspraken in de projectbeschrijving in Jira zetten. · Waarom: zo weet iedereen wanneer iets "klaar" is.

#### S2-06 · Toolkeuze Jira vastleggen in het beslissingenlog
**Task · 1 SP · Medium · DS2a · Due 9 okt** · Labels: `proces` `documentatie` `pr2`
**Waarom:** de onderbouwing staat al in Tools-Vergelijking-DTI.md (sectie "Beslissing": Jira + Confluence, 63/90, iedereen heeft er ervaring mee); moet alleen nog als beslissing in het beslissingenlog, met datum + wie besloten heeft.
- [ ] Beslissing uit de tools-vergelijking overnemen in het beslissingenlog (+ datum/namen invullen) — `0.5h`
  - Wat: de beslissing uit de tools-vergelijking (Jira + Confluence) in het beslissingenlog zetten, met datum en wie besloten heeft. · Waarom: beslissingen tellen alleen als ze vastgelegd zijn, met alternatieven + waarom.

#### S2-07 · Scrum-ceremonies DS2a
**Task · 2 SP · High · DS2a · Due 16 okt** · Labels: `proces` `pr2`
**Waarom:** stand-ups, planning en reviews tellen alleen als ze ZICHTBAAR zijn.
- [ ] Sprintplanning DS2a (incl. planning poker) — `6h`
  - Wat: samen de tickets voor DS2a kiezen, schatten (planning poker) en verdelen. · Waarom: taken plannen vanuit een gezamenlijk doel (PR2).
- [ ] Stand-ups wk 41–42 (4× 10 min × 4 p.) — `3h`
  - Wat: di + do 10 min bij het board: wat deed ik, wat ga ik doen, waar loop ik vast? · Waarom: problemen vroeg zien, en het laat zien dat we agile werken.
- [ ] Sprintreview + retro DS2a (vr 16 okt) (optioneel als we de tweede helft van een lange sprint ook willen retro-en) — `4h`
  - Wat: op 16 okt terugkijken: wat is af, wat is de waarde voor het doel, wat ging goed/fout? · Waarom: afsluiting van DS2a en input voor de planning van DS2b.
- [ ] Burndown/sprint report DS2a screenshotten → DR — `0.5h`
  - Wat: screenshot van de burndown + het sprint report van DS2a in de DR zetten. · Waarom: bewijs van de agile werkwijze (PR2).

#### S2-47 · Scrum-ceremonies DS2b
**Task · 2 SP · High · DS2b · Due 13 nov** · Labels: `proces` `pr2`
- [ ] Sprintplanning DS2b (ma 26 okt) — `4h`
- [ ] Stand-ups wk 44–46 (6× 10 min × 4 p.) — `4h`
- [ ] Retro DS2b (na stakeholderbijeenkomst 2, uiterlijk intervisie di 17 nov) — `4h`
- [ ] Burndown/sprint report DS2b screenshotten → DR — `0.5h`

---

### E3: Doelgroeponderzoek & concepttoets

*Waarom: uitzoeken wat de doelgroep weet, denkt en wil, en de drie concepten bij ze toetsen; de basis voor de conceptkeuze (deelvraag 2 + 3).*

#### S2-44 · Doelgroep bereiken: testpersonen en toetsmomenten regelen
**Task · 3 SP · Highest · DS2a · Due 9 okt** · Labels: `onderzoek` `stakeholder` `mbo` `havo-vwo` `propedeuse` `blocked-extern` `pr3`
**Waarom:** zonder doelgroep kunnen we niks toetsen = grootste risico van de eerste twee weken! Daarom een eigen ticket, zodat je op het board ziet of het geregeld is. Nodig voor de concepttoets (S2-10), de co-creatiesessie (S2-46) en de prototypetest (S2-28).
**Acceptatiecriteria:** overzicht wie / wanneer / waar / hoeveel personen; minimaal één afspraak met eerstejaars en één met scholieren vóór 15 okt.
- [ ] Excel schoolvoorlichtingen (Teams) doorlopen en aanhaken waar het kan — `1h`
  - Wat: in de Excel met schoolvoorlichtingen (Teams) kijken waar we kunnen aanhaken. · Waarom: echte scholieren in een echte setting.
- [ ] Eerstejaarsgroep(en) regelen via de opdrachtgever — `1h`
  - Wat: via de opdrachtgever een of meer eerstejaarsgroepen regelen. · Waarom: eerstejaars zijn makkelijk bereikbaar en ook doelgroep (keuzemoment).
- [ ] Eigen netwerk benaderen (oude school, MBO-contacten, broertjes/zusjes) — `1h`
  - Wat: mensen uit ons eigen netwerk benaderen (oude school, MBO-contacten, broertjes/zusjes). · Waarom: back-up als de schoolvoorlichtingen niet lukken.
- [ ] Overzicht testpersonen + momenten bijhouden (zonder persoonsgegevens) — `0.5h`
  - Wat: bijhouden wie/wanneer/waar/hoeveel, zonder namen of andere persoonsgegevens. · Waarom: overzicht voor het team, en nodig voor de privacy-afspraken.

#### S2-08 · Toetsplan opstellen
**Story · 3 SP · Highest · DS2a · Due 8 okt** · Labels: `onderzoek` `deelvraag-2` `deelvraag-3` `op2` `concept-algemeen`
**Waarom:** welk concept het beste werkt weten we nog NIET; wat wij en de opdrachtgever ervan vinden is alleen ons beeld. Eerst checken bij de doelgroep zelf!
**Acceptatiecriteria:** aannamelijst, vragen, methode, doelgroep + aantal deelnemers, analyse-aanpak en planning op papier; hele team heeft het gezien.
- [ ] Aannamelijst per concept (trein, AI-huisdier, biometrie): wat denkt de opdrachtgever / wat denken wij / wat moeten we bij de doelgroep toetsen — `2h`
  - Wat: per concept opschrijven wat de opdrachtgever denkt, wat wij denken en wat we bij de doelgroep willen checken. · Waarom: zo toetsen we aannames i.p.v. alleen meningen te verzamelen.
- [ ] Interviewguide (begrip van Data & AI vóór/na, reactie op de concepten, zelf iets maken) — `2h`
  - Wat: een vaste lijst interviewvragen (begrip van Data & AI vóór/na, reactie op de concepten, zin om zelf iets te maken). · Waarom: iedereen stelt dezelfde vragen = betrouwbaarder.
- [ ] Korte enquête (bv. 5 vragen, ook bruikbaar op open dag) — `2h`
  - Wat: een korte enquête (± 5 vragen) die ook op de open dag te gebruiken is. · Waarom: snel een breder beeld dan alleen interviews.
- [ ] Analyse-aanpak vastleggen (labelen + in thema's clusteren, per doelgroep vergelijken) — `1h`
  - Wat: vooraf afspreken hoe we de resultaten analyseren (labelen, in thema's clusteren, per doelgroep vergelijken). · Waarom: de rubric vraagt een analyse-aanpak, en zo kijken we achteraf niet alleen naar wat we wilden zien.

#### S2-09 · Low-fi toetsmateriaal maken voor alle drie de concepten
**Story · 3 SP · High · DS2a · Due 12 okt** · Labels: `ontwerp` `prototype` `concept-trein` `concept-aihuisdier` `concept-biometrie` `pr1`
**Waarom:** om echt te kunnen kiezen moeten de drie concepten op dezelfde manier getoetst worden (zelfde format, zelfde detail), anders is het geen eerlijke vergelijking.
- [ ] Storyboard trein (6–8 frames, zelfde format) — `2h`
  - Wat: storyboard van de trein (6–8 frames). · Waarom: om het concept eerlijk naast de andere twee te kunnen leggen.
- [ ] Storyboard AI-huisdier/decision tree builder (6–8 frames, zelfde format) — `2h`
  - Wat: storyboard van het AI-huisdier/de decision tree builder, in hetzelfde format. · Waarom: zelfde detail als de andere twee = eerlijke vergelijking.
- [ ] Storyboard biometrische data-poster (6–8 frames, zelfde format) — `2h`
  - Wat: storyboard van de biometrische data-poster, in hetzelfde format. · Waarom: zelfde detail als de andere twee = eerlijke vergelijking.

#### S2-10 · Doelgroeptest 1: concepttoets uitvoeren
**Story · 5 SP · Highest · DS2a · Due 15 okt** · Labels: `onderzoek` `test` `deelvraag-2` `deelvraag-3` `mbo` `havo-vwo` `propedeuse`
**Wat:** de storyboards van de drie concepten voorleggen aan eerstejaars en scholieren, met interview + enquête.
**Waarom:** dit is de data waarop we kiezen; zonder toets kiezen we op onderbuikgevoel.
**Acceptatiecriteria:** minimaal 2 doelgroepen gesproken (bv. ≥ 5 eerstejaars + ≥ 5 scholieren); toestemming geregeld; ruwe notities/opnames opgeslagen.
- [ ] Sessies uitvoeren (2 personen per sessie) — `8h`
  - Wat: toetssessies houden met de storyboards, interviewguide en enquête; altijd met z'n tweeën (één vraagt, één noteert). · Waarom: twee personen = betrouwbaardere notities.
- [ ] Notities uitwerken + foto's maken (met toestemming) — `3h`
  - Wat: notities dezelfde dag uitwerken en foto's maken (met toestemming). · Waarom: vers uitwerken = niks vergeten; foto's zijn nodig voor de DR.

#### S2-11 · Toetsresultaten analyseren
**Task · 5 SP · Highest · DS2a · Due 16 okt** · Labels: `onderzoek` `deelvraag-2` `deelvraag-3` `op2` `op3`
**Waarom:** van ruwe notities naar inzichten per doelgroep en per concept; input voor de beslismatrix en het beslismoment.
**Acceptatiecriteria:** gelabelde resultaten, top-inzichten per doelgroep, getoetste vs. niet-getoetste aannames, conclusie per concept.
- [ ] Labelen + in thema's clusteren (samen, op whiteboard/Miro/whatever) — `4h`
  - Wat: alle antwoorden labelen en samen in thema's clusteren (whiteboard/Miro). · Waarom: zo zien we patronen i.p.v. losse meningen.
- [ ] Vergelijking per doelgroep + aannamelijst bijwerken (getoetst/nog te toetsen) — `2h`
  - Wat: per doelgroep vergelijken, en bij elke aanname noteren: getoetst / nog te toetsen. · Waarom: laat zien wat we nu ECHT weten.
- [ ] Conclusie uitschrijven voor het beslismoment — `1.5h`
  - Wat: een korte conclusie per concept voor het beslismoment. · Waarom: input voor de beslismatrix (S2-13).

#### S2-12 · Persona's / empathy maps bijwerken
**Task · 3 SP · Medium · DS2a · Due 16 okt** · Labels: `ontwerp` `mbo` `havo-vwo` `propedeuse` `et3-communicatie`
**Wat:** per doelgroep (MBO, HAVO/VWO, propedeuse) een persona of empathy map op basis van wat we in de toets hoorden.
**Waarom:** duidelijk beeld van voor wie we ontwerpen (deelvraag 2), en handig om aan stakeholders te laten zien.
- [ ] Per doelgroep een persona of empathy map op basis van de toetsdata — `4h`
  - Wat: per doelgroep een persona of empathy map maken op basis van de toetsdata. · Waarom: voor wie ontwerpen we eigenlijk?
- [ ] Koppelen aan contactmoment (inspireren/informeren/activeren/committeren) — `1h`
  - Wat: per persona aangeven bij welk contactmoment en in welke fase (inspireren/informeren/activeren/committeren) die zit. · Waarom: koppeling met deelvraag 3.

#### S2-43 · Aangeleverde dataset analyseren
**Task · 5 SP · High · DS2a · Due 16 okt** · Labels: `onderzoek` `deelvraag-2` `ethiek` `et1-kennis` `et2-oordeel` `op1` `blocked-extern`
**Waarom:** de dataset van de opdrachtgever (instroomcijfers + keuzes van studenten, via Arnoud) laat zien waar het probleem ECHT zit: hoeveel studenten kiezen Data & AI, uit welke vooropleiding, en hoe zit dat t.o.v. de andere richtingen? Onderbouwt de aanleiding met cijfers i.p.v. alleen het beeld van de opdrachtgever; input voor deelvraag 2.
  * Dataset kan herleidbare gegevens bevatten, dus de afspraken uit het hoofdstuk ethiek gelden hier direct!
**Acceptatiecriteria:** dataset veilig opgeslagen (alleen projectgroep); analyse met 3–5 kernbevindingen; bevindingen in de aanleiding + bij deelvraag 2; afspraak over verwijderen na afloop vastgelegd.
- [ ] Dataset ontvangen + afspraken over opslag en toegang vastleggen — `1h`
  - Wat: de dataset ontvangen en afspreken waar hij staat en wie erbij kan (alleen de projectgroep). · Waarom: veilig omgaan met data van de opdrachtgever.
- [ ] Check op herleidbare gegevens en waar nodig anonimiseren — `1.5h`
  - Wat: checken of er herleidbare gegevens in zitten, en die waar nodig weghalen. · Waarom: privacy (zie het hoofdstuk ethiek).
- [ ] Beschrijvende analyse: instroom per richting, vooropleiding en jaar (Excel/Python) — `4h`
  - Wat: tellen en vergelijken: instroom per richting, vooropleiding en jaar (Excel/Python). · Waarom: laat zien waar het probleem echt zit.
- [ ] Kernbevindingen + grafiek(en) in het onderzoeksplan (aanleiding, deelvraag 2) — `2h`
  - Wat: 3–5 kernbevindingen + een grafiek in het onderzoeksplan zetten. · Waarom: onderbouwt de aanleiding met cijfers.
- [ ] Afspraak over verwijderen + bevestiging aan aanleverder vastleggen (uitvoeren na het project) — `0.5h`
  - Wat: vastleggen dat we de dataset na het project verwijderen en dat aan de aanleverder bevestigen. · Waarom: afspraak uit het onderzoeksplan.

---

### E4: Conceptkeuze

*Waarom: op 16 okt onderbouwd één concept kiezen (beslismatrix + toetsresultaten + haalbaarheid), met het waarom in het beslissingenlog. (ik gok 16 okt aangezien we ook al een prototype willen hebben)*

#### S2-13 · Beslismatrix concepten
**Task · 3 SP · Highest · DS2a · Due 16 okt** · Labels: `onderzoek` `deelvraag-4` `concept-algemeen` `op3`
**Waarom:** met een beslismatrix is achteraf te volgen WAAROM we een concept kozen, en kiezen we niet op gevoel (OP3, beslissingenlog).
**Criteria (voorstel, uit de feedback van de opdrachtgever):** bezoeker maakt/bouwt zelf iets · zelfstandig op te zetten door studenten/docenten · cross-over tussen ICT-richtingen · spreekt brede doelgroep aan (incl. meiden, niet alleen "nerds") · past bij contactmoment(en) · kosten/haalbaarheid · laat meer zien van AI dan alleen LLM's · reactie van de doelgroep (S2-11), etc.
- [ ] Criteria + gewichten samen vaststellen — `2h`
  - Wat: samen bepalen op welke criteria we de concepten scoren, en hoe zwaar elk criterium weegt. · Waarom: de criteria moeten vóór het scoren vastliggen, anders kies je ze (onbewust) bij je favoriet.
- [ ] Scoren (ieder apart, daarna bespreken) — `2h`
  - Wat: iedereen scoort eerst alleen, daarna bespreken we de verschillen. · Waarom: zo neemt niet één mening het hele team mee.
- [ ] Matrix + uitleg in het onderzoeksplan — `1h`
  - Wat: de matrix + uitleg in het onderzoeksplan zetten. · Waarom: de keuze moet te volgen zijn (OP3).

#### S2-14 · Conceptkeuze + terugkoppeling opdrachtgever
**Task · 2 SP · Highest · DS2a · Due 16 okt** · Labels: `stakeholder` `concept-algemeen` `pr1` `pr3`
**Waarom:** de keuze moet expliciet gemaakt én vastgelegd worden, en de opdrachtgever moet weten welk concept het wordt voordat we gaan bouwen.
**Acceptatiecriteria:** besluit in het beslissingenlog (welk concept / alternatieven / waarom / op basis van welke data); opdrachtgever via Teams op de hoogte.
- [ ] Besluitbespreking team — `2h`
  - Wat: met het hele team de keuze maken op basis van de matrix, de toetsresultaten en de quick scan. · Waarom: dit is HET beslismoment van DS2a.
- [ ] Beslissingenlog + korte update naar opdrachtgever — `1h`
  - Wat: de keuze in het beslissingenlog (concept / alternatieven / waarom / welke data) + een update naar de opdrachtgever. · Waarom: beslissing zichtbaar, en de opdrachtgever weet waar we naartoe gaan.

#### S2-15 · Afstemming met Infra/SD over bestaande opstellingen op open dagen
**Task · 2 SP · High · DS2a · Due 15 okt** · Labels: `stakeholder` `concept-algemeen` `open-dag` `pr3` `blocked-extern`
**Waarom:** Infra ('Hack je gek') en SD werven ook op de open dagen. Wat staat er al, waar is ruimte, en waar zit overlap met elk van onze concepten? (Feedback opdrachtgever: vooral de trein raakt aan 'Hack je gek'.) Kans: samenwerking/cross-over; risico: overlap/concurrentie om dezelfde bezoekers. Input voor de beslismatrix!
- [ ] Contactpersoon Infra/SD achterhalen + gesprek plannen — `0.5h`
  - Wat: uitzoeken wie bij Infra/SD de open-dag-opstellingen regelt, en een gesprek plannen. · Waarom: zij werven op dezelfde dagen als wij.
- [ ] Gesprek voeren (2 personen) + notulen — `2h`
  - Wat: het gesprek voeren met z'n tweeën en notuleren. · Waarom: weten wat er al staat, en waar ruimte/overlap is.
- [ ] Conflicterende/gedeelde belangen in de stakeholderanalyse zetten — `0.5h`
  - Wat: gedeelde en conflicterende belangen in de stakeholderanalyse zetten. · Waarom: conflicterende belangen zichtbaar maken = PR3 goed.

---

### E5: Gekozen concept uitwerken

*Waarom: het gekozen concept verder uitwerken. In DS2a alleen de co-creatiesessie plannen; de rest volgt in DS2b.*

* LET OP: de DS2b-tickets in E5, E6 en E7 zijn een schets met de trein als VOORBEELD. Na de conceptkeuze van 16 okt herschrijven we ze voor het gekozen concept (en label `concept-trein` wordt dan het label van dat concept).

#### S2-45 · Co-creatiesessie plannen
**Task · 2 SP · High · DS2a · Due 16 okt** · Labels: `ontwerp` `stakeholder` `deelvraag-4` `propedeuse` `havo-vwo` `pr3`
**Waarom:** bij co-creatie ontwerpen we SAMEN met de doelgroep, i.p.v. ze alleen onze ideeën te laten beoordelen. Past bij build-to-design, geeft betere eisen voor deelvraag 4 en laat zien dat we stakeholders actief betrekken (PR3). De sessie zelf is in week 44 (S2-46, DS2b), maar deelnemers moeten vóór de vakantie vastliggen.
  * Staat bij E5 omdat de uitkomst het concept vormgeeft, maar valt in DS2a!
**Acceptatiecriteria:** doel, vorm, deelnemers, datum en materialen liggen vast.
- [ ] Doel en vorm bepalen (bv. 45 min met 4–6 eerstejaars/scholieren: samen de 15-minuten-ervaring ontwerpen) — `1.5h`
  - Wat: bepalen wat we willen ophalen en hoe de sessie eruitziet (bv. 45 min, 4–6 deelnemers, samen de 15-minuten-ervaring ontwerpen). · Waarom: zonder duidelijk doel levert co-creatie weinig op.
- [ ] Deelnemers + datum vastleggen (via S2-44) — `1h`
  - Wat: deelnemers en datum (week 44) vastleggen, via S2-44. · Waarom: vóór de vakantie regelen, anders is het te laat.
- [ ] Draaiboek + materialen (storyboard-kaarten, schetsvellen) voorbereiden — `2h`
  - Wat: draaiboek + materialen maken (storyboard-kaarten, schetsvellen). · Waarom: na de vakantie is er weinig tijd, dus nu al voorbereiden.

#### S2-46 · Co-creatiesessie uitvoeren + uitwerken
**Story · 3 SP · High · DS2b · Due 30 okt** · Labels: `ontwerp` `onderzoek` `deelvraag-4` `concept-trein` `pr1` `pr3`
**Waarom:** de uitkomsten gaan direct naar het interactieontwerp (S2-18) en de requirements (S2-17).
**Acceptatiecriteria:** sessie gehouden; foto's van wat deelnemers maakten; inzichten vertaald naar ontwerpeisen.
- [ ] Sessie uitvoeren (2 begeleiders × 1 uur) — `2h`
- [ ] Uitwerken: inzichten clusteren → ontwerpeisen voor S2-17/S2-18 — `2h`
- [ ] Foto's van het materiaal opslaan (context/interactie/detail) — `0.5h`

#### S2-16 · Primair contactmoment + doelgroep voor prototype v1 kiezen
**Task · 2 SP · Highest · DS2b · Due 27 okt** · Labels: `ontwerp` `concept-trein` `pr1`
**Waarom:** een idee dat voor alle vier contactmomenten tegelijk moet werken wordt te vaag. Meest logisch: **open dag, ~15 min "iets te doen"** (daar kunnen we op 7 nov testen!). Schoolvoorlichting/proefstuderen = misschien variaties in sprint 3.
- [ ] Keuze + onderbouwing (met toetsresultaten) in het beslissingenlog — `1.5h`

#### S2-17 · Requirements & user stories gekozen concept
**Story · 3 SP · High · DS2b · Due 28 okt** · Labels: `ontwerp` `concept-trein` `op1`
**Acceptatiecriteria:** SMART-requirements + user stories (ITVES) in de backlog (zie §8), met MoSCoW-prioriteit.
- [ ] Requirements opstellen (incl. randvoorwaarden opdrachtgever: zelfstandig op te zetten, budget) — `2h`
- [ ] User stories uitschrijven en checken op ITVES — `2h`
- [ ] MoSCoW: wat moet in v1, wat is voor sprint 3 — `1h`

#### S2-18 · Interactieontwerp: de ervaring van 15 minuten
**Story · 5 SP · High · DS2b · Due 30 okt** · Labels: `ontwerp` `concept-trein` `open-dag` `pr1` `et3-communicatie`
**Waarom:** hier zit het "zelf iets maken"-deel (DESIGN REQUIREMENT van de opdrachtgever). Wat doet de scholier precies zelf (spoor leggen? sensor kiezen? de AI een regel/voorbeeld "leren"?), en wanneer snapt hij/zij wat Data & AI is?
- [ ] Customer journey open dag: aankomst → doen → begrijpen → meenemen — `3h`
- [ ] Het zelf-maken-deel uitwerken (2–3 varianten, kiezen) — `3h`
- [ ] Storyboard v2 op basis van toetsresultaten — `2h`

#### S2-19 · Wat is "de AI" in het gekozen concept?
**Task · 3 SP · High · DS2b · Due 30 okt** · Labels: `onderzoek` `concept-trein` `deelvraag-4` `et1-kennis` `et3-communicatie`
**Waarom:** de doelgroep denkt bij AI vooral aan LLM's of banenverlies. De trein moet laten zien wat AI met data doet, en niet alleen een vaste route-berekening zijn die we "AI" noemen.
  * Kritische vraag voor onszelf: is het echt AI/ML? En snapt een scholier dat in 15 min?
- [ ] Opties uitzoeken (bv. route leren uit data, objectherkenning op het spoor, voorspelling vertraging) — `3h`
- [ ] Keuze + uitleg voor een niet-specialist (1 alinea, scholierentaal) — `1.5h`
- [ ] Theoretisch kader aanvullen met de begrippen die we nu gebruiken — `1h`

#### S2-20 · Dashboard/visualisatie ontwerpen
**Story · 3 SP · Medium · DS2b · Due 3 nov** · Labels: `ontwerp` `prototype` `concept-trein`
- [ ] Wireframes dashboard (welke data, hoe zie je wat de AI beslist) — `3h`
- [ ] Snelle check bij 2–3 eerstejaars of medestudenten — `1h`

---

### E6: Haalbaarheid & prototype v1 bouwen

*Waarom: kunnen we het ook echt bouwen? In DS2a alleen de quick scan per concept; het bouwen zelf is DS2b.*

#### S2-21 · Technische quick scan per concept
**Task · 5 SP · Highest · DS2a · Due 14 okt** · Labels: `onderzoek` `prototype` `deelvraag-4` `concept-algemeen`
**Waarom:** haalbaarheid telt mee in de beslismatrix, dus we moeten het voor alle drie weten (niet alleen voor de favoriet). LES Prototypen (do 8 okt) hiervoor gebruiken!
- [ ] Trein: wat is nodig? (fysiek met Arduino/Raspberry Pi of virtueel in Unity) — `3h`
  - Wat: uitzoeken wat er nodig is voor de trein (fysiek met Arduino/Raspberry Pi, of virtueel in Unity). · Waarom: haalbaarheid telt mee in de beslismatrix.
- [ ] AI-huisdier: wat is nodig? (decision tree tool, virtuele keeper, evt. 3D-print/NFC) — `3h`
  - Wat: uitzoeken wat er nodig is voor het AI-huisdier (decision tree tool, virtuele keeper, evt. 3D-print/NFC). · Waarom: haalbaarheid telt mee in de beslismatrix.
- [ ] Biometrie: wat is nodig? (sensoren hartslag/zuurstof, live dashboard) — `3h`
  - Wat: uitzoeken wat er nodig is voor de biometrie (sensoren voor hartslag/zuurstof, live dashboard). · Waarom: haalbaarheid telt mee in de beslismatrix.
- [ ] Vergelijkingstabel (tijd, kosten, skills in team, opzetten door docent, "wow") — `2h`
  - Wat: de drie naast elkaar in een tabel: tijd, kosten, skills in het team, opzetten door een docent, "wow". · Waarom: maakt de vergelijking overzichtelijk.
- [ ] Expertgesprek FabLab/docent — `1h`
  - Wat: de quick scan voorleggen aan iemand van het FabLab of een docent. · Waarom: checken of onze inschatting realistisch is.

#### S2-22 · Materialen & budget regelen
**Task · 2 SP · High · DS2b · Due 27 okt** · Labels: `prototype` `stakeholder` `blocked-extern`
- [ ] Materiaallijst + kosten — `1.5h`
- [ ] HAN-resources aanvragen (Raspberry Pi's etc.) — `0.5h`
- [ ] Budgetverzoek naar opdrachtgever (met onderbouwing) — `1h`

#### S2-23 · Prototype v1 bouwen
**Story · 8 SP · Highest · DS2b · Due 5 nov** · Labels: `prototype` `concept-trein` `del-prototype` `pr1`
**Acceptatiecriteria:** een scholier kan de kerninteractie (zelf iets aanpassen → AI reageert → zichtbaar in dashboard) in ~15 min doorlopen. v1 mag lelijk zijn, de interactie moet werken!
* Sub-tasks hangen af van S2-21; hieronder beide varianten:
- [ ] Fysiek: spoor/trein opbouwen + sensoren aansluiten — `8h`
- [ ] Fysiek: microcontroller-code (data uitlezen, wissel/route aansturen) — `8h`
- [ ] *of* Virtueel: Unity-scène trein + spoor + interactie — `12h`
- [ ] AI-onderdeel (uit S2-19) implementeren, simpelste versie — `6h`
- [ ] Interne test met het team + bugfix-ronde — `3h`

* Uren: alleen de variant tellen die we kiezen (fysiek ≈ 25h, virtueel ≈ 21h).

#### S2-24 · Dashboard koppelen aan het prototype
**Story · 5 SP · High · DS2b · Due 5 nov** · Labels: `prototype` `concept-trein` `del-prototype`
- [ ] Datastroom prototype → dashboard — `4h`
- [ ] Dashboard bouwen op basis van wireframes (S2-20) — `5h`

#### S2-25 · Code & bestanden in GitHub, gekoppeld aan Jira
**Task · 1 SP · Medium · DS2b · Due 5 nov** · Labels: `prototype` `proces` `del-prototype`
- [ ] Map/repo voor prototypecode + commit-afspraak (`DTI-xx` in commit message) — `1h`

#### S2-26 · Opzet-instructie v0.1
**Task · 2 SP · Low · DS2b · Due 13 nov** · Labels: `documentatie` `del-prototype` `stretch`
**Waarom:** eis van de opdrachtgever (klein docententeam, moet zelfstandig op te zetten zijn) + onderdeel van het eind-deliverable "interactief prototype + instructiedocument".
- [ ] Stappen opzetten/afbreken + benodigdheden opschrijven — `2h`

---

### E7: Prototype testen

#### S2-27 · Testplan prototype v1
**Task · 3 SP · High · DS2b · Due 4 nov** · Labels: `test` `onderzoek` `op2` `deelvraag-5`
**Wat meten (voorstel):** snapt de scholier na afloop wat Data & AI is (vóór/na) · enthousiasme/interesse · duur · waar loopt men vast · kan iemand anders het opzetten/begeleiden? etc.
- [ ] Testvragen + observatieformulier — `2h`
- [ ] Korte vóór/na-vragenlijst — `1h`
- [ ] Rolverdeling op de testdag (begeleider, observator, fotograaf) — `0.5h`

#### S2-28 · Doelgroeptest 2: prototype testen op open dag Nijmegen (za 7 nov)
**Story · 5 SP · Highest · DS2b · Due 7 nov** · Labels: `test` `open-dag` `havo-vwo` `mbo` `concept-trein` `blocked-extern` `deelvraag-5`
**Let op:** nog NIET bevestigd dat we op de open dag mogen staan! Fallback: eerstejaarsgroep of schoolvoorlichting in week 45/46.
- [ ] Toestemming + plek regelen bij opdrachtgever (uiterlijk eind wk 44) — `1h`
- [ ] Opbouwen + testen op locatie — `3h`
- [ ] Testdag uitvoeren (bv. 3 personen × 4 uur) — `12h`
- [ ] Foto's/video (met toestemming), getagd — `1h`

#### S2-29 · Testresultaten analyseren + eisen sprint 3
**Task · 3 SP · Highest · DS2b · Due 11 nov** · Labels: `onderzoek` `test` `op3` `pr1` `deelvraag-5`
**Acceptatiecriteria:** inzichten, aangepaste aannames en een **herformuleerde focus/eisen voor designsprint 3** (= eigenlijk HET resultaat van deze sprint).
- [ ] Data verwerken + clusteren — `3h`
- [ ] Conclusies + nieuwe eisen voor sprint 3 — `2h`
- [ ] Productbiografie bijwerken: wat veranderde van storyboard → prototype v1, en waarom (PR1) — `1.5h`

---

### E8: Ethiek & privacy

*Waarom: afspraken over data, toestemming en minderjarigen, plus de ethische afweging per concept (ET2).*

#### S2-30 · Ethiek & privacy uitwerken in het onderzoeksplan
**Task · 3 SP · High · DS2a · Due 16 okt** · Labels: `onderzoek` `ethiek` `et2-oordeel` `op2`
**Waarom:** de afspraken over toestemming, opslag en bewaartermijnen staan in het onderzoeksplan nog open, en ethiek is een expliciet beoordelingspunt (ET2). Per concept verschilt het: welke data van (vaak minderjarige) scholieren verzamelen we, en waar blijft die?
  * Biometrie = gezondheidsdata (hartslag, zuurstof) van minderjarigen, ethisch het zwaarst! Telt mee in de beslismatrix.
- [ ] Hoofdstuk ethiek & privacy in het onderzoeksplan aanvullen (toestemming, opslag, bewaartermijn) — `1.5h`
  - Wat: in het hoofdstuk ethiek de open punten invullen: toestemming, opslag, bewaartermijn. · Waarom: staat nu nog op "wordt nog vastgesteld".
- [ ] Ethische afweging per concept uitschrijven (data, minderjarigen, beeldvorming "AI pakt banen af") — `2h`
  - Wat: per concept uitschrijven welke data het verzamelt en wat de risico's zijn (minderjarigen, beeldvorming over AI). · Waarom: ethiek telt mee in de beslismatrix, en biometrie is het zwaarst.

#### S2-50 · Ethiek aanvullen na LES Ethiek
**Task · 1 SP · Medium · DS2b · Due 30 okt** · Labels: `ethiek` `et2-oordeel` `op2`
- [ ] Na LES Ethiek (wk 44/45) het hoofdstuk ethiek aanvullen — `1h`

#### S2-31 · Toestemming voor tests & beeldmateriaal (zo nodig)
**Task · 2 SP · High · DS2a · Due 12 okt** · Labels: `documentatie` `et2-oordeel` `beeld`
**Wat:** een kort formulier voor deelname + foto/video, en afspraken over herkenbare gezichten.
**Waarom:** we testen met (soms minderjarige) scholieren en willen foto's gebruiken voor de deliverables; zonder toestemming mag dat niet (ET2).
- [ ] Kort toestemmingsformulier (deelname + foto/video), check met docent — `1.5h`
  - Wat: een kort formulier voor deelname + foto/video maken en laten checken door de docent. · Waarom: nodig vóór de eerste toets!

---

### E9: Stakeholders

*Waarom: stakeholders up-to-date houden en zichtbaar maken welke belangen er spelen (PR3).*

#### S2-32 · Stakeholderanalyse bijwerken
**Task · 2 SP · Medium · DS2a · Due 16 okt** · Labels: `stakeholder` `pr3`
**Waarom:** sinds sprint 1 zijn er nieuwe stakeholders bijgekomen (Infra/SD, open-dag-organisatie etc.), en de rubric wil zien dat we belangen + conflicten zichtbaar maken (PR3).
**Nieuwe/veranderde stakeholders om te checken:** Infra ('Hack je gek'), open-dag-organisatie, Arnoud (cijfers), Lectoraat iWDT, eerstejaars als testgroep, FabLab, etc.
- [ ] Analyse bijwerken (belang, houding, macht/invloed, conflicten) — `2h`
  - Wat: per stakeholder belang, houding, macht/invloed en conflicten bijwerken. · Waarom: de analyse is van sprint 1 en klopt niet meer helemaal.
- [ ] Per belangrijk onderzoeksresultaat noteren welke stakeholder het raakt (PR3) — `1h`
  - Wat: bij elk belangrijk onderzoeksresultaat noteren welke stakeholder het raakt. · Waarom: koppeling belangen ↔ onderzoeksresultaten = PR3 voldoende.

#### S2-33 · Stakeholderbijeenkomst 2 voorbereiden (= sprintreview)
**Story · 5 SP · Highest · DS2b · Due 12 nov** · Labels: `stakeholder` `pr3` `pr4` `et3-communicatie`
**Acceptatiecriteria:** presentatie met: wat getoetst, wat gekozen + waarom, prototype (demo), testresultaten, plan sprint 3. Individuele bijdragen gelabeld!
- [ ] Presentatie maken — `4h`
- [ ] Demo voorbereiden — `2h`
- [ ] Oefenen (hele team) — `4h`
- [ ] Bijeenkomst + notulen + feedback in feedbacklog — `5h`

#### S2-34 · Update aan opdrachtgever (DS2a)
**Task · 1 SP · Medium · DS2a · Due 16 okt** · Labels: `stakeholder` `pr3`
**Wat:** aan het eind van week 41 en 42 een korte update via Teams (wat gedaan, wat geleerd, wat volgt).
**Waarom:** de opdrachtgever verwacht dat wij zelf contact houden, niet alleen op de 4 geregelde momenten.
- [ ] Update via Teams (wk 41 + 42) — `1h`
  - Wat: in week 41 en 42 een korte update via Teams sturen. · Waarom: opdrachtgever op de hoogte houden.

#### S2-48 · Update aan opdrachtgever (DS2b)
**Task · 1 SP · Medium · DS2b · Due 13 nov** · Labels: `stakeholder` `pr3`
- [ ] Update via Teams (wk 45) — `0.5h`

---

### E10: Design Rationale & week-8-toets

*Waarom: de Design Rationale op orde voor de week-8-(toets?) (do 29 okt), en die valt direct na de vakantie!*

#### S2-35 · Design Rationale bijwerken t/m week 42
**Task · 5 SP · Highest · DS2a · Due 16 okt (vóór vakantie!)** · Labels: `documentatie` `del-designrationale` `pr1` `pr4`
**Waarom:** de week-8-toets is do 29 okt, en de eerste werkdag na de vakantie is maar 3 dagen eerder. Dus de DR moet vóór de vakantie grotendeels staan (HARD DEADLINE)!
- [ ] Per week (35–42) een blok: vraag, aanpak, resultaat, beslissing, met namen — `6h`
  - Wat: voor elke week (35–42) een blok: vraag, aanpak, resultaat, beslissing, en wie wat deed. · Waarom: de DR is per week en per iteratie opgebouwd.
- [ ] Koppeling aan activiteitenplanning/Jira (screenshots board) — `1h`
  - Wat: koppelen aan de planning/Jira, met screenshots van het board. · Waarom: de DR moet een directe relatie hebben met de activiteitenplanning.
- [ ] Visuele rode draad (tijdlijn) opzetten — `3h`
  - Wat: de rode draad visueel maken (tijdlijn). · Waarom: de DR is een VISUELE weergave van het proces.

#### S2-36 · Feedbacksessie week 44 voorbereiden
**Task · 3 SP · Highest · DS2b · Due 29 okt** · Labels: `pr4` `et3-communicatie` `del-designrationale`
- [ ] Presentatie (5–12 min) — `3h`
- [ ] Oefenen — `2h`

#### S2-37 t/m S2-40 · 3× peer review (één ticket per persoon)
**Task · 2 SP · Highest · DS2b · Due 29 okt** · Labels: `individueel` `pr2` `pr4`
* Dit ticket 4× aanmaken, één per teamlid, zodat ieders bijdrage apart zichtbaar is.
- [ ] Peer review 1 — `1h`
- [ ] Peer review 2 — `1h`
- [ ] Peer review 3 — `1h`
- [ ] Ontvangen feedback verwerken in eigen deel van de DR — `1.5h`
- [ ] Eigen reflectie designsprint 2: mijn rol, mijn keuzes en wat ik ervan leerde (PR4) — `1h`

#### S2-41 · Definitieve DR-presentatie
**Task · 3 SP · High · DS2b · Due 13 nov** · Labels: `del-designrationale` `pr4`
* Bij de docent checken wanneer deze precies ingeleverd moet worden (na de peer reviews).
- [ ] Feedback peer reviews + eigen reviews verwerken — `3h`
- [ ] DR aanvullen t/m week 46 — `2h`

---

### E11: Beeldmateriaal (doorlopend)

*Waarom: foto's/screenshots van tussenproducten verzamelen voor de DR, poster, 3 beelden en video (krijg je later nooit meer terug).*

#### S2-42 · Beeldmateriaal DS2a
**Task · 1 SP · Medium · DS2a · Due 16 okt** · Labels: `beeld` `del-beelden` `del-poster`
**Waarom:** foto's van tussenproducten krijg je later NOOIT meer terug, en we hebben ze nodig voor de DR, poster, 3 beelden en de video.
- [ ] Wk 41 + 42 elk ≥ 1 foto/screenshot (toetsmateriaal, concepttoets, beslismatrix), getagd *context / interactie / detail* — `1h`
  - Wat: in week 41 en 42 minstens één foto/screenshot per week (toetsmateriaal, toets, beslismatrix), getagd context/interactie/detail. · Waarom: tussenproducten krijg je later nooit meer terug.

#### S2-49 · Beeldmateriaal DS2b
**Task · 1 SP · Medium · DS2b · Due 13 nov** · Labels: `beeld` `del-beelden` `del-video` `del-poster`
- [ ] Wk 44–46 elk ≥ 1 foto/screenshot, getagd — `1h`
- [ ] Bouwproces trein filmen (korte clips voor de walkthrough) — `1h`
- [ ] Testdag: interactie-foto's/video (met toestemming) — `1h`

---

## 8. Product backlog: user stories (voorbeeld: trein)

* Voorbeeld voor als het de trein wordt! Na de conceptkeuze herschrijven voor het gekozen concept.

Deze stories gaan over het **product**, niet over ons onderzoeksproces; in de backlog als type Story met label `concept-trein`. Na S2-17 kiezen we welke in v1 komen, de rest gaat naar sprint 3. Prioriteit is nog voorlopig (hangt af van de toetsresultaten).

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

* ITVES-check per story bij het verfijnen (Independent, Testable, Valuable, Estimatable, Small); US-09 is nu te groot, moet nog opgeknipt worden.

---

## 9. Capaciteit & totaal

* De DS2a-Excel ([`Scrumboard-Sprint2a-DTI.xlsx`](./Scrumboard-Sprint2a-DTI.xlsx), tabblad Overzicht) rekent dit automatisch uit; aannames daar aanpassen.

```
beschikbare uren = (aantal personen) × (projecturen per persoon per week) × (aantal weken) × 0,8
```

0,8 = buffer voor ziekte, uitloop en dingen die we nu nog niet weten. Lessen tellen niet mee als projecturen.

**DS2a** (2 weken), met de aanname van 15 projecturen per persoon per week:

| | SP | Uren |
|---|---|---|
| Gepland in DS2a | 73 | 143 |
| Beschikbaar (4 × 15 × 2 × 0,8) | n.v.t. | 96 |
| **Verschil** | | **−47** |

**DS2b**: nog niet plannen. De voorlopige schets komt op ± 72 SP / 160 uur (inclusief de fysieke bouwvariant), tegen 144 uur beschikbaar (4 × 15 × 3 × 0,8). Na de go/no-go opnieuw schatten.

**DS2a is te vol!** Keuzes maken in de sprintplanning:
1. **Eerst het echte aantal uren vaststellen!** 15 uur p.p. per week is voorzichtig; een minor van 30 EC is ongeveer 40 uur studielast per week. Bij 25 projecturen p.p. hebben we 160 uur in DS2a, en dan past het.
2. **Doorschuiven naar DS2b** wat niet nodig is voor het beslismoment van 16 okt: S2-12 persona's, S2-43 dataset (hangt toch af van de opdrachtgever), S2-32 stakeholderanalyse.
3. **Kleiner maken:** S2-04 alleen 'Hack je gek' + de huidige workshop.

**Velocity:** nog geen velocity uit sprint 1 (er was geen board). Aan het eind van DS2a noteren hoeveel SP echt Done is = eerste referentie voor DS2b en sprint 3.

---

## 10. Risico's voor deze sprint

| Risico | Kans | Impact | Wat doen we eraan | Ticket |
|---|---|---|---|---|
| We kiezen op onderbuikgevoel/voorkeur i.p.v. op wat de doelgroep vindt | Middel | Hoog | Alle drie de concepten op dezelfde manier toetsen; beslismatrix (eerst ieder apart scoren) | S2-09, S2-13, S2-14 |
| Geen toetsmoment met scholieren in wk 41–42 | Middel | Hoog | Vroeg aanvragen via opdrachtgever; fallback eerstejaars of eigen netwerk (broertjes/zusjes, oude school) | S2-44, S2-10 |
| Week-8-toets valt direct na de vakantie | Hoog | Hoog | DR vóór 16 okt grotendeels af | S2-35 |
| Open dag 7 nov niet beschikbaar als testmoment | Middel | Middel | Uiterlijk eind wk 44 bevestigen; fallback eerstejaars | S2-28 |
| Gekozen concept te duur/te complex in ± 3 weken bouwtijd | Middel | Hoog | Quick scan per concept vóór het beslismoment; v1 mag simpeler (bv. virtueel i.p.v. fysiek) | S2-21, S2-22 |
| Overlap/conflict met Infra ('Hack je gek') | Laag | Middel | Vroeg gesprek; samenwerking als kans | S2-15 |
| "AI" in het concept is eigenlijk geen AI → doelgroep leert niks nieuws | Middel | Middel | Bewust kiezen wat de AI doet + hoe we dat laten zien | S2-19, US-03 |
| Jira wordt na 2 weken niet meer bijgehouden (zie de tools-vergelijking 😉) | Middel | Middel | Stand-ups vóór het board, DoD, "geen naam = niemand doet het" | S2-05, S2-07 |
| Data van minderjarigen in tests/prototype | Laag | Hoog | Geen persoonsgegevens verzamelen, toestemmingsformulier | S2-30, S2-31 |
