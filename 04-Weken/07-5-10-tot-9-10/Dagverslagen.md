# Week 41 — Dagverslagen

**Periode:** 5 okt–9 okt 2026 · **Lesweek:** OW1-6 · **Mijlpaal:** 🎯 Designsprint 2 start

**Dinsdag (VT):** Begeleiding voltijdgroep  
**Donderdag:** LES Prototypen (Blender, Unity, Vibe-Coding, Arduino) / Fablab · "Digitale innovatie & transformatie, wat is dat?"

> Vul dit aan het eind van elke werkdag in (±10 min). Zie [`Dagelijkse-Documentatiecheck-DTI.md`](../../01-Project/Dagelijkse-Documentatiecheck-DTI.md) Deel 1 voor de volledige triggerlijst per categorie. Geen werkdag gehad op een van onderstaande dagen? Laat het blok leeg of verwijder het. Extra dag gewerkt (bv. in het weekend)? Kopieer een blok erbij.

---

## Dag: 5-10-2026 (ma) · Week 41 · Sprint [nr]

**Aanwezig / wie deed wat:**
- [naam]: [bijdrage]

**Vraag waar we vandaag aan werkten:** (welke deelvraag, bv. A1)
**Aanpak:** (methode + waarom deze)
**Resultaat:** (wat kwam eruit; link naar foto/bestand)
**Conclusie:** (wat betekent het voor het ontwerp/plan)
**Nieuwe vraag:**

**Beslissingen:** (wat / alternatieven / waarom / op basis van)
**Feedback ontvangen:** (van wie / wat / wat doen we ermee of waarom parkeren)
**Contact met stakeholders:** (wie / kern / actiepunten)
**Ethiek/risico's gezien:**
**Bronnen toegevoegd:**
**Beeld opgeslagen:** (bestandsnamen)

**Mijn reflectie (1–3 zinnen):** wat deed ik, waarom zo, wat leer ik ervan?

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---

## Dag: 6-10-2026 (di) · Week 41 · Sprint 2 (DS2a)

**Aanwezig / wie deed wat:**
- Jae Dreijling: sprint 2a-Excel bijgewerkt (ook een variant zonder ceremonies, met prototype-tickets), repo opnieuw ingedeeld, AI-huisdier v2 (website "Leer de AI raden") gebouwd
- Bart Ressing: AI-huisdier v1 (Java-consolequiz met een vaste beslisboom) gebouwd
- Team: begeleiding voltijdgroep; onderzoeksplan versie 1 als afgerond gezet (Jira SCRUM-8)

**Vraag waar we vandaag aan werkten:** Hoe ziet de kerninteractie van het AI-huisdier eruit, en voelt de bezoeker zich daarbij de maker?
**Aanpak:** Twee versies van het AI-huisdier naast elkaar. v1: de leerling beantwoordt drie vragen en een vaste beslisboom kiest een huisdier. v2: omgedraaid, de AI raadt met ja/nee-vragen en als hij het fout heeft, leert de leerling hem bij. Zo bouwt de leerling zelf de beslisboom.
**Resultaat:** [AI-huisdier prototype](../../06-Prototypes/AI-Huisdier/README.md): v1 (Java) en v2 (website, werkt in de browser, ook op tablet/telefoon). v2 toont de groeiende beslisboom en de Python-code die de AI "zelf schrijft", heeft meerdere thema's (huisdier, vervoermiddel, eten) en niveaus per contactmoment. Repo-indeling 01–06 met afspraken in de [README](../../README.md).
**Conclusie:** In v1 gebruikt de leerling de beslisboom maar bouwt hij niets: geen zelfmaak-element. In v2 maakt de leerling de AI slimmer, wat aansluit bij de eis van de opdrachtgever.
**Nieuwe vraag:** Snappen scholieren wat de AI doet, en worden ze er nieuwsgierig van naar Data & AI?

**Beslissingen:** AI-huisdier v2 omgedraaid: de AI raadt, de leerling leert hem bij. Alternatief: v1 (vaste quiz). Waarom: v1 mist het zelfmaak-element. Thema's naast huisdieren (vervoermiddel, eten) voor een bredere doelgroep (feedback opdrachtgever 23-9).
**Feedback ontvangen:** (geen)
**Contact met stakeholders:** (geen)
**Ethiek/risico's gezien:** Leerlingen kunnen onzin of rare woorden invoeren, die in de boom blijven tot iemand het geheugen wist. Een "fout" antwoord leert de AI iets fouts; dat is meteen een gesprek over slechte data → slechte AI.
**Bronnen toegevoegd:** Bootstrap (opmaak v2)
**Beeld opgeslagen:** (geen)

**Mijn reflectie (1–3 zinnen):** Door v1 te bekijken zag ik dat een quiz de leerling laat kiezen maar niets laat bouwen. Het omdraaien van de rollen kostte weinig extra code en maakt het concept veel sterker.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---

## Dag: 7-10-2026 (wo) · Week 41 · Sprint 2 (DS2a)

**Aanwezig / wie deed wat:**
- Team (Bart, Jae, Karlijn, Maryam): gesprek met een gast van het lectoraat / Master Applied Data Science (online, Teams), daarna teamoverleg
- Team: mails verstuurd naar Joost Kraaijenveld (ESD), Bart Okups + Elisa, en Rick
- Jae Dreijling: Jira-import (tickets sprint 2a)
- Karlijn van der Meer: Jira-bord ingericht (keuze zonder sub-tasks)

**Vraag waar we vandaag aan werkten:** Wat kunnen we leren van eerdere wervingsactiviteiten van het lectoraat, en wat vindt een expert van onze drie concepten?
**Aanpak:** Expertgesprek: eerst eerdere activiteiten van het lectoraat laten toelichten ('Hansy Pie'-bier, swarm-optimization-demo, CoderDojo), daarna de drie concepten gepitcht en feedback gevraagd. Daarna intern overleg over de prototypes, testmomenten, mails en het Plan van Aanpak.
**Resultaat:** [Notulen 7-10](7-10-2026-meeting-oude-wervingmateriaal.md). Trein: AI-deel ophangen aan het Traveling Salesman Problem. AI-huisdier: decision tree is transparant en realistisch, geen reinforcement learning. Biometrie: sterke koppeling met echte toepassingen, maar compact en snel houden. Tickets sprint 2a staan in Jira.
**Conclusie:** AI niet presenteren als "programmeren + statistiek", dat schrikt af: laagdrempelig en visueel werkt beter (zoals Scratch bij CoderDojo). Het lectoraat meet geen directe instroom; wij willen dat wel (voor- en nameting).
**Nieuwe vraag:** Hoe laten we bij de trein zien wat een geoptimaliseerde route oplevert ten opzichte van een niet-geoptimaliseerde?

**Beslissingen:** (1) Trein: AI-deel wordt route-optimalisatie (TSP), geoptimaliseerd en niet-geoptimaliseerd naast elkaar. Alternatief: AI past de spoorroute aan, of alleen sensordata op een dashboard. (2) AI-huisdier: beide versies (Bart: logica-engine, Jae: HTML in Akinator-stijl) voorleggen bij de doelgroeptest. (3) Trein-prototype: Arduino-robotauto lenen bij Joost Kraaijenveld; achtervang: ASCII-animatie of simulatie in Processing. (4) Unity-workshop laten verplaatsen naar 29-10 (wacht op antwoord). (5) Plan van Aanpak volgens Scribbr-template met HAN-logo, afbakening en Gantt-planning. (6) Designsprint 2 in twee helften (Jae, voorstel). (7) In Jira geen sub-tasks (Karlijn, voorstel). Alles in het [beslissingenlog](Feedback-en-beslissingenlog-DTI.xlsx) (#9–15).
**Feedback ontvangen:** Van de gast van het lectoraat (naam nog aanvullen), zie Resultaat. Overgenomen, behalve reinforcement learning: geparkeerd als verdieping voor thuis (feedbacklog #29–36).
**Contact met stakeholders:** Gast lectoraat (zie boven). Joost Kraaijenveld: Arduino-voertuig lenen. Bart Okups + Elisa: Unity-workshop verplaatsen. Rick: testpersonen werven. Charl heeft curriculumdocumenten gedeeld (adviesrapport hoofdfase Data & AI, hoofdrapportage v1), die lezen we dit weekend.
**Ethiek/risico's gezien:** Angst dat AI banen overneemt: vergelijking met Photoshop (verving ontwerpers niet, maakte de sector groter). Bier valt af als voorbeeld voor minderjarigen op open dagen.
**Bronnen toegevoegd:** [Notulen 7-10](7-10-2026-meeting-oude-wervingmateriaal.md); adviesrapport hoofdfase Data & AI en hoofdrapportage v1 (via Charl)
**Beeld opgeslagen:** (geen)

**Mijn reflectie (1–3 zinnen):** Het expertgesprek gaf voor elk concept iets concreets, vooral voor de trein, waar we nog geen goed AI-deel hadden. Ook nuttig: de gast liet zien dat een concept vooral moet prikkelen, niet alles uitleggen.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [x] Beslissingenlog [x] Feedbacklog [ ] Stakeholderanalyse [x] Bronnenlijst [ ] Beeldmap

---

## Dag: 8-10-2026 (do) · Week 41 · Sprint 2 (DS2a)

**Aanwezig / wie deed wat:**
- Jae Dreijling: notulen 7-10 uitgewerkt, feedback- en beslissingenlog opgezet, Jira-import-CSV gemaakt
- Team: LES Prototypen (Blender, Unity, Vibe-Coding, Arduino) / FabLab

**Vraag waar we vandaag aan werkten:** Hoe maken we alle feedback en beslissingen tot nu toe zichtbaar op één plek?
**Aanpak:** Eén Excel met twee tabbladen: een feedbacklog (van wie, wat doen we ermee, Jira-ticket, status) en een beslissingenlog (alternatieven, waarom, op basis van, wie besloot). Alle feedback van 17-9, 23-9, 1-10 en 7-10 per punt als eigen regel ingevoerd, met een legenda.
**Resultaat:** [Feedback- en beslissingenlog](Feedback-en-beslissingenlog-DTI.xlsx): 36 feedbackpunten en 15 beslissingen. [Notulen 7-10](7-10-2026-meeting-oude-wervingmateriaal.md). [Jira-import](Scrum/Scrumboard-Sprint2a-jira-import.csv).
**Conclusie:** Een aantal beslissingen staat nog op "Voorstel" of "Nog uitzoeken" (o.a. hoe we van 48 ideeën naar 3 concepten kwamen) en een paar cellen missen nog namen; dat moet het team samen nalopen.
**Nieuwe vraag:** Op welke criteria gingen we van 48 ideeën naar de hoofdconcepten?

**Beslissingen:** Feedback en beslissingen bijhouden in één Excel met vaste kolommen; elk punt met een reactie (overgenomen / anders / geparkeerd / bevestigt aanpak). Akkoord van het team per regel nog nodig.
**Feedback ontvangen:** (geen nieuwe)
**Contact met stakeholders:** (geen)
**Ethiek/risico's gezien:** (geen)
**Bronnen toegevoegd:** (geen)
**Beeld opgeslagen:** (geen)

**Mijn reflectie (1–3 zinnen):** Door alles in één log te zetten zag ik hoeveel feedback we al hadden gekregen zonder zichtbare reactie. Het log maakt het makkelijk om in de Design Rationale te laten zien hoe feedback ons werk veranderde.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [x] Beslissingenlog [x] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---

## Dag: 9-10-2026 (vr) · Week 41 · Sprint [nr]

**Aanwezig / wie deed wat:**
- [naam]: [bijdrage]

**Vraag waar we vandaag aan werkten:** (welke deelvraag, bv. A1)
**Aanpak:** (methode + waarom deze)
**Resultaat:** (wat kwam eruit; link naar foto/bestand)
**Conclusie:** (wat betekent het voor het ontwerp/plan)
**Nieuwe vraag:**

**Beslissingen:** (wat / alternatieven / waarom / op basis van)
**Feedback ontvangen:** (van wie / wat / wat doen we ermee of waarom parkeren)
**Contact met stakeholders:** (wie / kern / actiepunten)
**Ethiek/risico's gezien:**
**Bronnen toegevoegd:**
**Beeld opgeslagen:** (bestandsnamen)

**Mijn reflectie (1–3 zinnen):** wat deed ik, waarom zo, wat leer ik ervan?

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---
