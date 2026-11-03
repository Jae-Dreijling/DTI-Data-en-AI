# Scope en benodigdheden

**DTI-projectgroep – Data & AI – Voorstel voor drie prototypes**

| | |
|---|---|
| **Auteur(s)** | [aanvullen] |
| **Versie** | 2 (2-11-2026) |
| **Hoort bij** | Onderzoeksplan deelvraag 4 · Beslismatrix conceptkeuze · Beslissingenlog #11 en #13 |

> **Twee keuzes die nog bevestigd moeten worden:**
> 1. **AI-huisdier = beslisboom.** Dit document gaat uit van de beslisboom (v2 "Leer de AI raden"), omdat het onderzoek tot nu toe daarop gebaseerd is (Harmen 7-10: "transparant en realistisch"; doelgroeptest 15-10: "duidelijkst"; beslismatrix). Een versie met een taalmodel (LLM) staat als *optionele uitbreiding*. Kiezen we tóch voor een LLM als basis, dan dat met reden in het beslissingenlog zetten.
> 2. **Biometrie valt waarschijnlijk af** (beslismatrix 58%, ethiek en zelfmaak-element). Het concept staat hier nog, maar we werken het alleen verder uit als het team besluit ermee door te gaan.

---

## Voor alle drie

**Eisen** (uit het onderzoeksplan, de opdrachtgever en de beslismatrix):
- **Past in ±15 minuten** op een open dag: iets te zien én iets te doen.
- **Zelfmaak-element:** de bezoeker doet of maakt zelf iets, niet alleen kijken.
- **Zelfstandig op te zetten** door een docent of student zonder ons (HARD REQUIREMENT, docententeam van 4–10). Opzettijd maximaal [aanvullen, bv. 15] minuten.
- **Laat zien wat Data & AI is**, laagdrempelig en visueel, zonder "moeilijke wiskunde".
- **Geen persoonsgegevens:** geen namen, gegevens alleen tijdens de sessie, daarna verwijderd.

**Nodig voor alle drie:**
- Een korte deelnemersinstructie (1 A4 of 1 scherm).
- Een begeleidershandleiding: opzetten, opstarten, veelvoorkomende problemen, afbreken.
- Vaste evaluatievragen: het Google Form van de open dag (voor- en nameting, deelvraag 5), voor alle drie hetzelfde.
- Een observatieformulier voor het teamlid dat meekijkt (waar lopen bezoekers vast?).
- Uitleg over vrijwillige deelname en gegevensgebruik; toestemming voor foto's/video (SCRUM-113).

**Tijdens de test** kijken we of bezoekers begrijpen wat ze hebben gedaan en wat dat met Data & AI te maken heeft.

---

## 1 Trein

**Doel:** gegevens van een trein verzamelen, analyseren en gebruiken om de trein te besturen, en laten zien wat AI toevoegt door een geoptimaliseerde route te vergelijken met een niet-geoptimaliseerde (beslissingenlog #11).

### Binnen de scope
- 4 stations met één trein.
- Starten, stoppen en snelheid aanpassen via een laptop.
- Passages, reistijden en aankomsttijden meten.
- Gegevens tonen in een dashboard; geplande en gemeten aankomst vergelijken.
- Onderzoeken waardoor vertraging ontstaat en uitleggen wat een dataspecialist hiermee doet.
- **AI-deel:** een algoritme berekent de beste volgorde of route langs de stations. Die zetten we naast een niet-geoptimaliseerde route, zodat je in de metingen ziet wat de optimalisatie oplevert (Traveling Salesman Problem, advies Harmen 7-10).
- **Zelfmaak-element:** de bezoeker kiest welke stations bezocht moeten worden en plaatst een obstakel of vertraging; daarna voorspelt de bezoeker welke route sneller is en controleert dat in de metingen.

### Buiten de scope
- Een volledig netwerk met meerdere treinen.
- Een automatisch gegenereerde complete dienstregeling.
- Koppelingen met vervoerders of meerdere spoorbeheerders.
- Een zelfgetraind model voor routeplanning (we gebruiken een bestaand algoritme).
- Een uitgebreide fysieke opstelling.
- Een volledige Unity-wereld.

### Uitvoering en achtervang
| Optie | Wat | Status |
|---|---|---|
| A | Fysieke trein op rails met sensoren en wissels | Te bouwen; materiaal en budget nodig |
| B | Leenrobot van Joost (Hackerbot, Raspberry Pi) die een route rijdt; logdata als meetgegevens | Te lenen vanaf week 44; Linux-laptop nodig |
| C | Simulatie in Processing op een laptop | Af (achtervang, beslissingenlog #13) |

> Voor de open dag van 7-8 november: [aanvullen: welke optie]. Kies een optie die op tijd af is; de rest kan in designsprint 3.

### Benodigdheden
| Onderdeel | Benodigdheden |
|---|---|
| Hardware | Laptop, trein met rails, geschikte voeding, Arduino of vergelijkbare microcontroller, motordriver, kabels en aansluitmateriaal. **Wissels met servo** als de trein echt een andere route moet kunnen rijden; anders tonen we de route alleen op het dashboard. |
| Sensoren | Bijvoorbeeld twee sensoren per station voor passages en reistijd. Motorbesturing loopt via de motordriver, niet rechtstreeks via een Arduino-pin. |
| Code | Microcontrollercode voor sensoren, snelheid en wissels. Laptopprogramma (bijvoorbeeld Python) voor ontvangen, opslaan, besturen en de routeberekening. |
| Dashboard en data | Grafiek van reistijden, geplande versus werkelijke aankomst, en de geoptimaliseerde versus niet-geoptimaliseerde route. Opslag in een **CSV-bestand of SQLite**. |
| Printers | Optioneel: 3D-printer voor sensorhouders (stations) en onderdelen van de omgeving. |
| Kosten | [aanvullen: schatting] · via budget opdrachtgever |
| Opzetten | Rails neerleggen, laptop aansluiten, programma starten: [aanvullen] minuten. Let op afstemming met 'Hekje Gek' van Infra. |
| Activiteit (±15 min) | De bezoeker kiest bijvoorbeeld de stations A, C en D en plaatst een vertraging bij B. De computer berekent de beste route; de trein rijdt eerst de niet-geoptimaliseerde en dan de geoptimaliseerde route. Wat is in de metingen te zien? |

---

## 2 Biometrie *(alleen als het team doorgaat met dit concept)*

**Doel:** ontdekken hoe lichaamsgegevens worden gemeten, gecontroleerd en geanalyseerd.

### Binnen de scope
- Eén of twee meetwaarden verzamelen, afhankelijk van de sensor, bijvoorbeeld hartslag met een vingersensor.
- Meetwaarden en grafieken tonen; meerdere metingen vergelijken.
- Onbruikbare metingen herkennen.
- Uitleggen hoe gegevens van een sensor in een dashboard terechtkomen en wat een dataspecialist controleert.
- **Zelfmaak-element:** de bezoeker meet zichzelf in twee situaties (bijvoorbeeld in rust en na 10 keer opstaan), voorspelt vooraf het verschil en stelt zelf de grens in waarboven een meting "onbruikbaar" is.
- **AI-deel:** [aanvullen: bijvoorbeeld een eenvoudig model dat voorspelt of een meting bruikbaar is, of dat herkent of iemand in rust is]. Zonder AI-deel is dit vooral een *Data*-showcase; dat eerlijk benoemen.
- Optioneel: vergelijken met onderbouwde referentiewaarden, met uitleg over de meetomstandigheden en beperkingen.

### Buiten de scope
- Bepalen of iemand gezond of ongezond is; diagnoses of behandeladvies.
- Herkenning via vingerafdrukken.
- Opslag van meetgegevens na de sessie of een persoonlijke meetgeschiedenis.
- Een smartwatch of lichaamsscanner.
- Een zelfgetraind medisch AI-model.

### Ethiek en privacy
- Hartslag is een **gezondheidsgegeven** (bijzondere persoonsgegevens, AVG), en veel bezoekers zijn minderjarig.
- Meten alleen vrijwillig, na uitleg.
- Geen namen of andere gegevens koppelen aan een meting.
- Metingen staan alleen tijdens de sessie op de laptop en worden daarna verwijderd.
- Op het scherm geen oordeel als "gezond" of "ongezond".

### Benodigdheden
| Onderdeel | Benodigdheden |
|---|---|
| Hardware | Laptop en geschikte vingersensor. Een hartslagsensor is iets anders dan een vingerafdrukscanner. |
| Aansluiting | Afhankelijk van de sensor: Arduino, USB-aansluiting, kabels en voeding. |
| Meetcode | Sensor uitlezen, meettijd registreren en ongeldige metingen herkennen. |
| Analysecode | Metingen vergelijken, bijvoorbeeld gemiddelde en spreiding berekenen. |
| Dashboard | Actuele meetwaarde, grafiek en begrijpelijke uitleg. |
| Referentiedata | Alleen nodig bij vergelijking met referentiewaarden. Bron en meetomstandigheden moeten duidelijk zijn. |
| Kosten | [aanvullen: schatting] · via budget opdrachtgever |
| Opzetten | Sensor aansluiten, laptop starten: [aanvullen] minuten. |
| Praktisch | Reinigingsmateriaal voor de sensor; uitleg over vrijwillige deelname en gegevensgebruik bij de opstelling. |

---

## 3 AI-huisdier

**Doel:** een AI-huisdier maken door de AI zelf iets te leren, en zien hoe een beslisboom werkt.

### Binnen de scope
- De AI raadt aan welk huisdier (of vervoermiddel of eten) de bezoeker denkt, met ja/nee-vragen.
- Zit de AI fout, dan leert de bezoeker hem bij: wat was het, en welke vraag maakt het verschil?
- De nieuwe vraag verschijnt meteen in de beslisboom én als Python-code die de AI "zelf schrijft".
- Opnieuw testen: raadt de AI het nu wel?
- Uitleggen dat dit een **beslisboom** is, een echte vorm van AI, en dat slechte antwoorden ook een slechte AI opleveren ("slechte data → slechte AI").
- **Zelfmaak-element:** de bezoeker bouwt zelf de beslisboom.
- **Niveaus:** open dag (een paar rondes spelen), schoolvoorlichting (wie verslaat de AI?), proefstuderen (zelf een thema of startvraag maken in de code).
- **Inclusief:** verschillende thema's (huisdieren, vervoermiddelen, eten), zodat het niet alleen dieren of "nerdy" onderwerpen zijn.

### Buiten de scope
- Een eigen taalmodel trainen.
- Reinforcement learning (te complex voor 15 minuten, advies Harmen 7-10; eventueel later als verdieping voor thuis).
- Een volledige Tamagotchi met honger, slaap, ziekte en groei.
- Een uitgebreide 3D-wereld; geanimeerde afbeeldingen en spraak.
- Accounts en het bewaren van gegevens tussen bezoekers op verschillende apparaten.
- Multiplayer, een online dierenwinkel of betaalfuncties.
- Een fysieke robot.

### Optionele uitbreiding: AI-petkeeper met een taalmodel
Een AI-petkeeper die korte begeleiding geeft, of een huisdier met naam, persoonlijkheid en gedragsregels dat via een bestaand taalmodel reageert. Deelnemers sturen dan een bestaand AI-model aan (*instructies aanpassen*); het model wordt niet opnieuw getraind. **Alleen als:** er budget is voor de API, er internet is op de locatie, en bezoekers geen persoonlijke gegevens naar een externe dienst sturen (AVG, minderjarigen). Nodig: API-key buiten de broncode, afgesproken gebruiksbudget, JSON-verwerking met afhandeling van fouten en wachttijd.

### Benodigdheden
| Onderdeel | Benodigdheden |
|---|---|
| Hardware | Laptop of tablet. Internet is alleen nodig voor de opmaak (Bootstrap); zonder internet werkt het spel nog, maar zonder opmaak. |
| Basiscode | AI-huisdier **v2 "Leer de AI raden"** (`06-Prototypes/AI-Huisdier/v2-web/index.html`) als startpunt. |
| Aanvullende code | Afwerking van de interface: maken, testen, aanpassen, opnieuw beginnen ("geheugen wissen"). |
| Opslag | Wat de AI leert blijft per thema bewaard op dát apparaat (browser), zonder persoonsgegevens. Een docent kan het geheugen wissen. |
| Vormgeving | Eenvoudige webinterface met de beslisboom en de Python-code naast het spel. |
| Printers | Geen printer nodig. Optioneel: 3D-printer voor figuurtjes om mee te nemen. |
| Kosten | Geen (zonder de optionele uitbreiding). |
| Opzetten | Bestand openen in de browser: ±2 minuten. |
| Testsituaties | 2–3 vaste situaties voor de test, bijvoorbeeld: (1) de AI raadt goed, (2) de AI raadt fout en de bezoeker leert hem bij, (3) de bezoeker geeft een "fout" antwoord en ziet wat er met de boom gebeurt. |

**Afbakening:** de bezoeker bouwt een beslisboom; er wordt geen model getraind met grote hoeveelheden data.
