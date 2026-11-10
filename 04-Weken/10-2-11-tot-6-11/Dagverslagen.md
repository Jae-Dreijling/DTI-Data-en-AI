# Week 45 — Dagverslagen

**Periode:** 2 nov–6 nov 2026 · **Lesweek:** OW1-9 · **Mijlpaal:** n.v.t.

**Dinsdag (VT):** Interviewen & coderen of Ethiek  
**Donderdag:** LES Prototypen (vervolg) · LES bedrijfsprocessen

> Vul dit aan het eind van elke werkdag in (±10 min). Zie [`Dagelijkse-Documentatiecheck-DTI.md`](../../01-Project/Dagelijkse-Documentatiecheck-DTI.md) Deel 1 voor de volledige triggerlijst per categorie. Geen werkdag gehad op een van onderstaande dagen? Laat het blok leeg of verwijder het. Extra dag gewerkt (bv. in het weekend)? Kopieer een blok erbij.

---

## Dag: 2-11-2026 (ma) · Week 45 · Sprint 2 (DS2b)

**Aanwezig / wie deed wat:**
- Maryam Yousufzai: ‘te_doen_prototypes’ (scope en benodigdheden voor de drie prototypes) opgezet; enquête-Excel bijgewerkt
- Jae Dreijling: scope-document nagelopen en herschreven; vragenlijst voor de open dag uitgewerkt (must vs. nice to have per deelvraag)

**Vraag waar we vandaag aan werkten:** Wat moeten de prototypes op de open dag kunnen, en welke vragen stellen we de bezoekers?
**Aanpak:** Scope per prototype getoetst aan het onderzoeksplan, de beslismatrix en de eisen van de opdrachtgever (15 minuten, zelfmaak-element, zelfstandig op te zetten). Vragenlijst opgebouwd vanuit de vijf deelvragen, met een voor- en nameting (deelvraag 5).
**Resultaat:** Scope en benodigdheden v2 (in Teams als te_doen_prototypes). Vragenlijst: verplichte vragen per deelvraag (opleiding, kennis vóór/na, ‘lijkt het iets voor jou’ vóór/na, zelf iets gemaakt, uitleg AI, banen, waarom wel/niet, wat doe je liefst op een open dag, hoe leuk) en optionele vragen.
**Conclusie:** Het AI-huisdier in de scope beschreef een taalmodel (LLM), terwijl ons onderzoek over de beslisboom gaat; de scope is aangepast naar de beslisboom met een LLM als optionele uitbreiding. De trein had nog geen zelfmaak-element en geen AI-deel in de scope.
**Nieuwe vraag:** Kunnen we de trein vóór de open dag uitbreiden met meerdere stations en obstakels?

**Beslissingen:** AI-huisdier blijft een beslisboom (v2). Alternatief: taalmodel via een API. Waarom: transparant (advies Harmen), geen kosten, geen persoonsgegevens naar een externe dienst.
**Feedback ontvangen:** (geen)
**Contact met stakeholders:** (geen)
**Ethiek/risico's gezien:** Vragenlijst: geen namen, school of exacte leeftijd; e-mailadressen niet verzamelen (instelling in Google Forms).
**Bronnen toegevoegd:** (geen)
**Beeld opgeslagen:** (geen)

**Mijn reflectie (1–3 zinnen):** Door de vragenlijst per deelvraag op te bouwen, past elke vraag bij het onderzoeksplan; dat kan ik in de DR laten zien.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---

## Dag: 3-11-2026 (di) · Week 45 · Sprint 2 (DS2b)

**Aanwezig / wie deed wat:**
- Jae Dreijling: Sprint 2b-scrumboard (Excel + Jira-import) opgesteld; trein-prototype v2 gebouwd: netwerk met vier stations, stations overslaan, sporen afsluiten, obstakels, dashboard met dienstregeling en beroepen; in- en uitstappen via het gangpad
- Maryam Yousufzai: te_doen_prototypes in Teams bijgewerkt

**Vraag waar we vandaag aan werkten:** Hoe laat de trein zien wat data en AI doen, met een zelfmaak-element voor de bezoeker?
**Aanpak:** Prototype in Processing uitgebreid met de onderdelen uit te_doen_prototypes: de bezoeker verandert het netwerk (station overslaan, spoor dicht, obstakel) en ziet de gevolgen in de metingen. Getest met een testscript (klikken zoals een bezoeker, schermafbeeldingen, metingen per traject).
**Resultaat:** Trein-prototype v2 (06-Prototypes/Trein): bij vrije baan rijdt elk traject precies op schema; een afgesloten spoor geeft een omweg, een obstakel of doodlopend spoor geeft vertraging met de oorzaak in het dashboard. Sprint 2b-board met epics voor conceptkeuze, trein, AI-huisdier, open dag, stakeholderbijeenkomst 2 en documentatie.
**Conclusie:** De route-keuze (snelste open route) werkt; de AI-vergelijking (geoptimaliseerd vs. niet-geoptimaliseerd, beslissing #11) zit er nog niet in.
**Nieuwe vraag:** Wie bouwt het dashboard verder, en hoe verdelen we het werk aan één prototype?

**Beslissingen:** Trein blijft digitaal (Processing) voor de open dag. Alternatief: robot van Joost of rails. Waarom: op tijd af en zelfstandig op te zetten. [aanvullen: in beslissingenlog]
**Feedback ontvangen:** (geen)
**Contact met stakeholders:** (geen)
**Ethiek/risico's gezien:** (geen)
**Bronnen toegevoegd:** Processing (processing.org)
**Beeld opgeslagen:** Schermafbeeldingen van de testruns

**Mijn reflectie (1–3 zinnen):** Met een testscript kon ik scenario's herhalen in plaats van steeds zelf te klikken; daardoor vond ik fouten in de berekening van de geplande tijd die ik anders niet had gezien.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---

## Dag: 4-11-2026 (wo) · Week 45 · Sprint 2 (DS2b)

**Aanwezig / wie deed wat:**
- Jae Dreijling: trein-prototype opgesplitst in tabbladen (spel / dashboard / metingen), oorspronkelijk dashboard teruggezet
- Maryam Yousufzai: dashboard uitgebreid met de tabbladen Ritten, Sporen en Analyse (TreinMonitor, versie 3)

**Vraag waar we vandaag aan werkten:** Hoe werken we met twee mensen tegelijk aan één prototype?
**Aanpak:** Spel en dashboard gescheiden in aparte Processing-tabbladen, met een lijst van de gegevens die het dashboard uit het spel kan gebruiken.
**Resultaat:** TreinAnimatie.pde (spel, Jae), Dashboard.pde en Metingen.pde (data, Maryam). Maryam leverde versie 3 met vier pagina's: Overzicht, Ritten, Sporen en Analyse.
**Conclusie:** Door de opsplitsing kunnen we tegelijk werken zonder elkaars code te overschrijven.
**Nieuwe vraag:** Wat moeten bezoekers op de open dag precies doen met beide prototypes?

**Beslissingen:** Taakverdeling trein: Jae het spel, Maryam het dashboard en de data-analyse.
**Feedback ontvangen:** (geen)
**Contact met stakeholders:** (geen)
**Ethiek/risico's gezien:** (geen)
**Bronnen toegevoegd:** (geen)
**Beeld opgeslagen:** (geen)

**Mijn reflectie (1–3 zinnen):** Werken aan één bestand met twee mensen gaat snel mis; afspreken wie welk deel doet, en dat in de code laten zien, voorkwam dat.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---

## Dag: 5-11-2026 (do) · Week 45 · Sprint [nr]

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

## Dag: 6-11-2026 (vr) · Week 45 · Sprint 2 (DS2b)

**Aanwezig / wie deed wat:**
- Jae Dreijling: handleidingen voor bezoekers gemaakt voor het treinspel en ‘Leer de AI raden’ (A4, met schermafbeeldingen en pijlen), QR-code naar de vragenlijst toegevoegd
- Bart Ressing: handleiding treinspel nagelopen

**Vraag waar we vandaag aan werkten:** Hoe zorgen we dat bezoekers het prototype zelfstandig kunnen gebruiken (eis: zelfstandig op te zetten, docententeam is klein)?
**Aanpak:** Per prototype één A4 met genummerde stappen, schermafbeeldingen met pijlen en een kader ‘Wat heeft dit met Data & AI te maken?’, plus de QR-code naar de vragenlijst.
**Resultaat:** Handleiding-Treinspel en Handleiding-Leer-de-AI-raden (Teams > Documentatie > Open dag).
**Conclusie:** De handleidingen leggen ook de link naar beroepen (data-analist, AI-specialist); dat was het grootste gat uit de enquête van 15-10.
**Nieuwe vraag:** Gebruiken bezoekers de handleiding, of hebben ze vooral uitleg van ons nodig?

**Beslissingen:** (geen)
**Feedback ontvangen:** (geen)
**Contact met stakeholders:** (geen)
**Ethiek/risico's gezien:** Vragenlijst is optioneel en anoniem.
**Bronnen toegevoegd:** (geen)
**Beeld opgeslagen:** Handleidingen met schermafbeeldingen

**Mijn reflectie (1–3 zinnen):** In het kader van het AI-huisdier wilde ik eerst zeggen dat een taalmodel een gigantische beslisboom is, maar dat klopt technisch niet. Ik heb het vergeleken op schaal (een paar vragen tegenover meer dan 100 miljard ‘knopjes’), zodat het klopt en toch prikkelt.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---

## Dag: 7-11-2026 (za) · Week 45 · Sprint 2 (extra dag: open dag Nijmegen)

**Aanwezig / wie deed wat:**
- Jae Dreijling: prototypes getest met bezoekers op de open dag, gesprek met de opdrachtgever, notities gemaakt
- [aanvullen: wie waren er nog bij de stand?]

**Vraag waar we vandaag aan werkten:** Helpen de prototypes bezoekers ontdekken of Data & AI bij hen past (deelvraag 5), en wat vindt de opdrachtgever ervan?
**Aanpak:** Het treinspel en ‘Leer de AI raden’ op de open dag laten gebruiken met de handleidingen en de QR-code naar de vragenlijst; observeren hoe lang bezoekers blijven en wat ze leuk vinden; gesprek met Jorg Janssen (opdrachtgever) om 14:00.
**Resultaat:** Zie [Notities open dag Nijmegen 7-11-2026](NEW-TEAMS/Meetings/Open%20dag/2026-11-07-Notities-open-dag-Nijmegen.docx). Kort: opdrachtgever verrassend positief over de trein; docenten zien het als goed vervolg; studenten bleven het langst bij de trein; saboteren van de trein vonden ze het leukst; tip voor het AI-huisdier: visueler maken.
**Conclusie:** De trein werkt als ‘iets te zien’ en houdt bezoekers het langst vast. Het saboteren is een zelfmaak-element dat werkt. Het AI-huisdier is duidelijk, maar moet visueler.
**Nieuwe vraag:** Hoe maken we de beslisboom van het AI-huisdier visueel (animatie), en welke extra storingen voegen we toe aan de trein?

**Beslissingen:** [aanvullen: na bespreking in het team]
**Feedback ontvangen:** Van Jorg Janssen (opdrachtgever): trein leuk, ‘verrassend positief’, leuker dan hij dacht. Tip voor het AI-huisdier: meer visueel (wolkjes, een geanimeerde boom). Docenten: goed vervolg. Zie de notities.
**Contact met stakeholders:** Jorg Janssen (opdrachtgever), om 14:00 bij de stand. Docenten van de opleiding.
**Ethiek/risico's gezien:** Vragenlijst anoniem en optioneel; [aanvullen: foto's alleen met toestemming gemaakt?]
**Bronnen toegevoegd:** Notities open dag (Teams > Meetings > Open dag)
**Beeld opgeslagen:** [aanvullen: foto's/video van de stand]

**Mijn reflectie (1–3 zinnen):** Het was spannend om de prototypes voor het eerst echt te laten zien, en de reactie van Jorg was positiever dan verwacht. Dat studenten het saboteren het leukst vonden, had ik niet zien aankomen; juist dat soort observaties krijg je alleen door te testen.

**Bijgewerkt vandaag:** [ ] Onderzoeksplan (+ versiebeheer) [ ] Beslissingenlog [ ] Feedbacklog [ ] Stakeholderanalyse [ ] Bronnenlijst [ ] Beeldmap

---
