# AI Huisdier (prototype, concept 2)

Prototype voor **concept 2: AI-huisdier / decision tree builder** uit het [Onderzoeksplan](../../02-Onderzoeksplan/Onderzoeksplan.md).

| Versie | Map | Idee | Status |
|---|---|---|---|
| v1 | [`v1-java/`](v1-java/) | Huisdierenquiz: leerling beantwoordt 3 vragen, een vaste beslisboom kiest een huisdier | Eerste schets van een teamgenoot. Leerling *gebruikt* de boom maar bouwt niks (geen zelfmaak-element) |
| v2 | [`v2-web/`](v2-web/) | **Omgedraaid:** de AI raadt met ja/nee-vragen; zit hij fout, dan leert de leerling hem bij. De leerling bouwt zo zelf de beslisboom | Huidige versie |

---

## v2: Leer de AI raden (website)

**Starten:** dubbelklik op [`v2-web/index.html`](v2-web/index.html). Dan opent hij in de browser. Geen installatie nodig, wel internet: de opmaak komt van [Bootstrap](https://getbootstrap.com/) via een CDN-link (zonder internet werkt het spel nog, maar zonder opmaak). Werkt ook op een tablet of telefoon.

**Zo werkt het:**
1. De leerling denkt aan een huisdier (of vervoermiddel / eten, kies het thema bovenaan).
2. De AI stelt ja/nee-vragen en doet een gok, en legt uit **waarom** ("ik volgde jouw antwoorden door mijn boom").
3. Fout? Dan leert de leerling de AI: *wat was het* en *welke vraag maakt het verschil?*
4. De nieuwe vraag verschijnt meteen **groen** in de beslisboom én in de **Python-code** die de AI "zelf schrijft".
5. Volgende ronde: de AI raadt het nu wél. De leerling heeft de AI dus zelf iets geleerd.

**Wat dit toetst bij de doelgroep** (zelfde drie vragen als bij trein en biometrie):
- Had je het gevoel dat je zelf iets gemaakt hebt?
- Kun je uitleggen wat de AI deed?
- Word je hier nieuwsgierig van naar Data & AI?

**Niveaus (zelfde prototype, andere diepte):**
| Moment | Wat doet de leerling |
|---|---|
| Open dag (±15 min) | Een paar rondes spelen, de AI iets nieuws leren, kijken hoe de boom en code groeien |
| Schoolvoorlichting | Wie verslaat de AI? Als groep een thema zo slim mogelijk maken |
| Proefstuderen (±1 u 15) | `index.html` openen in een editor, bij `THEMA'S` een eigen thema of startvraag maken |

**Voor docenten:** wat de AI leert blijft bewaard op dát apparaat (per thema), dus hij wordt slimmer met elke bezoeker. **Geheugen wissen** zet een thema terug naar de startvraag.

**Bekende beperkingen (bewust, het is een eerste prototype):**
- Leerlingen kunnen onzin of rare woorden invoeren; die komen in de boom tot iemand het geheugen wist.
- Antwoordt een leerling een vraag "fout" (bv. *Kan het zwemmen?* bij een hond), dan leert de AI iets fouts. Dat is eigenlijk een mooi gesprek over *slechte data → slechte AI*.
- Geheugen is per apparaat, niet gedeeld tussen laptops.

---

## v1: AI Huisdier Generator (Java, console)

Nodig: **JDK 17+** en in VS Code de extensie [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack).

- **VS Code:** *File → Open Folder…* → kies `v1-java/` (niet de hele repo), open `src/App.java`, druk **F5**. Het programma draait in de terminal.
- **Zonder VS Code:** in `v1-java/`: `java -Dstdout.encoding=UTF-8 src/App.java`

Bekende bugs in v1: het verrassingshuisdier krijgt de naam van het vorige huisdier (`petName` i.p.v. `randomName`), een letter invoeren laat het programma crashen, een keuze buiten de opties geeft altijd Cavia, en de kat-tekening heeft een `\` te veel.

<details>
<summary>Beslisboom van v1</summary>

| Soort dier | Leefruimte | Rustig | Speels | Sociaal | Maakt niet uit |
|---|---|---|---|---|---|
| Zoogdier | Klein | Hamster | Cavia | Rat | Hamster |
| Zoogdier | Gemiddeld | Konijn | Kat | Kat | Konijn |
| Zoogdier | Groot | Konijn | Hond | Hond | Kat |
| Vogel | (maakt niet uit) | Kanarie | Parkiet | Papegaai | Parkiet |
| Vis | (maakt niet uit) | Betta vis | Guppy | Goudvis | Guppy |
| Maakt niet uit | Klein | Hamster | Cavia | Kat | Kat |
| Maakt niet uit | Gemiddeld | Konijn | Kat | Hond | Hond |
| Maakt niet uit | Groot | Hond | Hond | Hond | Hond |

</details>
