# Alles in Processing

1. Pak deze ZIP uit.
2. Open `TreinAnimatie/TreinAnimatie.pde` in Processing 4, Java-modus.
3. Klik op Run. Er zijn geen extra libraries of andere programma's nodig.

De oorspronkelijke bestanden TreinAnimatie.pde, Dashboard.pde en Metingen.pde zijn ongewijzigd. Alleen DashboardExtra.pde en DashboardAnalyse.pde zijn toegevoegd als nieuwe code-tabbladen. De naam van de sketchmap komt overeen met het hoofdbestand.

Rechts in het bestaande venster staan vier pagina's:

- **Overzicht:** het oorspronkelijke dashboard met passagiers, snelheid en bezetting.
- **Ritten:** actuele rittekst, verwachte route, geplande en gemeten reistijden, aankomsttijden en afwijkingen. Gebruik het muiswiel boven deze pagina voor oudere ritten.
- **Sporen:** open en gesloten verbindingen en obstakels. Klik links op een spoor voor open/dicht. Rechtsklik links voor een obstakel. Klik op een afgesloten rij rechts om de reden te kiezen: handmatige afsluiting, bouw of onderhoud. De reden is een label; de bestaande bediening blijft de afsluiting regelen.
- **Analyse:** aantallen ritten die op tijd, vroeger of later aankomen, percentage op tijd, gemiddelde afwijking en een grafiek van de laatste 12 aankomstverschillen.

Alle grafieken, gegevens en teksten worden in Processing berekend en getekend. Er is geen Power BI-project, externe viewer of CSV-koppeling nodig.

## Metingen

De grafieken worden gevuld met de bestaande simulatiegegevens, na de eerste aankomst. Een sterretje bij een aankomsttijd betekent een schatting. De gemeten reistijd is aankomst min vertrek. Het aankomstverschil is werkelijke aankomst min geplande aankomst; een late start kan daardoor ook bij een normale reistijd een late aankomst geven.

De tolerantie voor op tijd is plus of min 0,5 simulatieminuut. De simulatie rekent 60 frames als een minuut, ongeveer een echte seconde bij 60 fps. Een gewijzigde bestemming wordt als niet vergelijkbaar gemarkeerd. X is de kruising.

Spatie pauzeert. Pijl omhoog/omlaag wijzigt de snelheid. R start opnieuw zoals voorheen en begint een nieuwe rapportagesessie. De grafieken tonen de huidige sessie. In het geheugen blijven maximaal 5000 ritten bewaard; bij afsluiten verdwijnen deze gegevens.

## Controle

De oorspronkelijke drie bestanden zijn byte voor byte behouden. De toegevoegde code is gecontroleerd met een Java-compatibiliteitslaag, simulatiescenario's en weergaven van de vier pagina's. Processing zelf is in deze omgeving niet geïnstalleerd; er is hier dus geen volledige IDE-test uitgevoerd.
