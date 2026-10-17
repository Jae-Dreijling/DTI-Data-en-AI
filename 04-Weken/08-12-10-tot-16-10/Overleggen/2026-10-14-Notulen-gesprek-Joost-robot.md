# Notulen: gesprek Joost Kraaijenveld over een leenrobot

**Datum:** 14-10-2026 (wo) · Week 42 · Sprint 2 (DS2a)  
**Type overleg:** Kort interview / afstemming hardware  
**Aanwezig:** Joost Kraaijenveld (docent ESD), Jae Dreijling (notulist)  
**Aanleiding:** Beslissing #13 uit het beslissingenlog (7-10): voor het trein-concept een rijdend voertuig lenen bij Joost. Doel van het gesprek: is er een robot die we kunnen gebruiken voor demo's en om mee te werken totdat we een eigen model hebben?

---

### 1. De robot

* **Wat het is:** Een robot op twee wielen, gebouwd als een soort robotstofzuiger (Hackerbot / Roomba-achtig). Er zitten veel sensoren op, waaronder sensoren die bijhouden hoeveel de wielen draaien en hoeveel afstand er is afgelegd.
* **Aansturing:** Er draait een Linux-machine op (Raspberry Pi) die via wifi werkt. Met een script kun je de robot van alles laten doen: rechtuit laten rijden, pirouettes, een route laten rijden of een dansje laten doen.
* **Logbestanden:** De robot geeft logbestanden. Dat zijn **zeer grote JSON-bestanden** met heel veel informatie, waarvan maar een klein deel nuttig is ("ergens staat een getalletje erin").
* **Volgens Joost** denkt de opdrachtgever dat zo'n robot ook helpt om vrouwen/meiden aan te spreken. Kort samengevat: je kunt er veel mee.

---

### 2. Wat het oplevert voor Data & AI

* **Logdata opschonen:** De juiste gegevens uit de JSON halen en alle overbodige informatie weggooien. Daarna van die gegevens de gereden route plotten.
* **Betekenis geven aan de getallen:** Eerst de JSON onderzoeken om te snappen wat elk veld betekent. De truc is weten hoeveel cm/mm één encodertik is; dan kun je encoderwaarden omrekenen naar afgelegde centimeters. Volgens Joost "typisch Data & AI".
* **Voorspellen en meten:** Het script is eigenlijk een voorspelling van wat de robot gaat doen. Vergelijk dat met wat de sensoren echt meten:
  1. Voorspel/schat de route of afstand (op basis van het script).
  2. Laat de robot het script uitvoeren en meet het resultaat in de logdata.
  3. Vergelijk voorspelling en meting.
  4. Verbeter met die vergelijking de volgende voorspelling.
* **Koppeling met ons project:** Dit past bij het trein-concept (voertuig dat data verzamelt + route), en bij het idee een geoptimaliseerde route naast een niet-geoptimaliseerde te zetten (Traveling Salesman Problem, beslissing van 7-10).

---

### 3. Beschikbaarheid & planning

* **De robot is nog niet af.** Joost is nog bezig de verbinding te maken (laptop → Raspberry Pi → robot) en hoopte dat op 14-10 vóór 12:00 klaar te hebben. Op het moment van het gesprek kon hij er zelf nog niet bij.
* **Open dag:** De robot moet zaterdag/zondag (17–18 okt) zelf draaien op de open dag.
* **Lenen:** We mogen de robot lenen voor het project, en mogelijk ook de logbestanden.
* **Verwachting:** Ongeveer tussen 14-10 en vrijdag 16-10 leverbaar. Volgende week (week 43) is het vakantie, dus **vanaf week 44 (26-10)** kunnen we ermee experimenteren.
* **Andere robots:** Er zijn geen andere robots van dit type. Eén is gebrickt (doet niks, nauwelijks sensordata). Er is er nog één waar sensordata uitkomt, maar Joost weet niet of die werkt.

---

### 4. Technische randvoorwaarden

* **Wifi-verbinding nodig:** Om de robot te laten rijden moet een laptop via wifi verbonden zijn met de robot.
* **Linux-laptop:** Met een Linux-laptop is dat makkelijk te regelen; Joost kan dan waarschijnlijk een snelle procedure doen. Anders is er een access point nodig.
* **Windows:** Joost weet niet of het met Windows werkt en gaat dat ook niet uitzoeken. → wij moeten zorgen voor een Linux-laptop (of een access point).

---

### 5. Alternatieven (achtervang)

* **BOE-Bots** bij de leenplek: Arduino-robotjes. Waarschijnlijk hebben ze die, maar dat is niet zeker; even navragen. Let op: mogelijk zitten er geen ingebouwde sensoren op, dus minder of geen data.
* **Robotjes via Richard** (mogelijk): navragen.
* **Zelf een Arduino-autootje** regelen voor nu.
* Bestaande achtervang: de [trein-animatie in Processing](../../../06-Prototypes/Trein/TreinAnimatie/TreinAnimatie.pde) (af op 15-10).

---

### 6. Actiepunten

| Actie | Wie | Wanneer | Status |
| :--- | :--- | :--- | :--- |
| Navragen of de robot klaar is na de open dag en afspreken wanneer we hem ophalen | Jae | Vóór de vakantie (16-10) | Open |
| Linux-laptop regelen (of access point) voor de wifi-verbinding | Team | Vóór week 44 | Open |
| Voorbeeld-logbestand (JSON) opvragen, om de structuur alvast te onderzoeken | Jae | Vóór week 44 | Open |
| Navragen of de leenplek BOE-Bots heeft (en of er sensoren op zitten) | Team | Vóór week 44 | Open |
| Navragen bij Richard of er robotjes beschikbaar zijn | Team | Vóór week 44 | Open |
| Uitzoeken hoeveel cm/mm één encodertik is | Team | Zodra we de robot hebben | Open |
| Bij de opdrachtgever navragen wat bedoeld wordt met "helpt bij vrouwen/meiden" | Team | Volgend overleg | Open |
