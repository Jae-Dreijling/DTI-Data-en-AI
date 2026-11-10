// Treinnetwerk: trein-prototype v2
// Autheur: Jae Dreijling
// Repeated code & design of train aided by chatgpt. 
// 3-11-2026
// Vier stations (A t/m D) met sporen rondom en een kruising (X) in het midden.
// De bezoeker kiest bij welke stations de trein stopt, sluit sporen af en legt obstakels op het spoor.
// De trein zoekt bij elke kruising en elk station opnieuw de snelste open route.
// Rechts een dashboard: dienstregeling (gepland vs. gemeten), reistijd per traject,
// en per onderdeel welk beroep met deze gegevens werkt.
//
// Bediening:
//   klik op een station          = stoppen / overslaan
//   klik op een spoor            = spoor open / dicht
//   rechtsklik (of shift + klik) = obstakel op het spoor leggen / weghalen
//   spatie = pauze, pijl omhoog/omlaag = sneller/langzamer, R = opnieuw beginnen

final int W_NET = 820;            // breedte van het netwerk, rechts staat het dashboard
final float CX = 410, CY = 325;   // midden van het netwerk (kruising X)
final float RX = 300, RY = 222;   // halve breedte en hoogte van de ring
final int X = 4;                  // knoopnummer van de kruising (0-3 zijn de stations)

final float NOMINAAL = 2.5;       // snelheid uit de dienstregeling, in pixels per frame
final int HALTE_MIN = 60;         // de trein staat minstens 60 frames (= 1 minuut) stil
final int HALTE_PLAN = 120;       // geplande stoptijd in de dienstregeling: 2 minuten
final int OPTREKKEN = 110;        // extra tijd voor optrekken en afremmen
final int OBSTAKEL_TIJD = 150;    // zo lang duurt het om een obstakel op te ruimen
final float OBSTAKEL_STRAF = 350; // zo zwaar weegt een obstakel bij het kiezen van de route
final int CAPACITEIT = 48;        // plaatsen in de 2 wagons
final float LOOPSNELHEID = 1.6;

final String[] CODE = {"A", "B", "C", "D"};
final String[] NAAM = {"Centraal", "Haven", "Campus", "Stadion"};

// toestanden van de trein
final int RIJDT = 0, HALTE = 1, OBSTAKEL = 2, GEEN_ROUTE = 3;

Station[] stations = new Station[4];
PVector[] knopen = new PVector[5];
ArrayList<Spoor> sporen = new ArrayList<Spoor>();
ArrayList<Obstakel> obstakels = new ArrayList<Obstakel>();

// trein
float snelheid = NOMINAAL;
boolean pauze = false;
int toestand;
int spoorNu = -1;        // spoor waar de trein nu over rijdt
boolean vooruit = true;  // rijdt hij van a naar b over dat spoor?
float dOp = 0;           // afgelegde afstand op dat spoor
int knoopNu = 0;         // knoop waar de trein staat (bij een halte of als er geen route is)
float factor = 0;        // optrekken en remmen: 0 = stil, 1 = volle snelheid
int timer = 0;
Obstakel obstakelNu = null;

// het spoor dat de locomotief heeft gereden, zodat de wagons hem precies kunnen volgen
ArrayList<PVector> spoorPunten = new ArrayList<PVector>();
FloatList spoorAfst = new FloatList();
float afgelegd = 0;
final float[] LENGTE = {72, 40, 58, 58};  // locomotief, kolenwagen, 2 personenwagons
float[] terugAfstand = new float[4];      // hoe ver elk deel achter de locomotief zit

// route
IntList stops = new IntList();   // stations die nog komen in deze ronde (eindigt altijd bij A)
int ordePos = 0;                 // laatst bezochte station in de volgorde A, B, C, D

// metingen
int simFrames = 0;               // tijd in de simulatie (staat stil bij pauze)
int ronde = 1;
ArrayList<Traject> deze = new ArrayList<Traject>();
ArrayList<Traject> vorige = new ArrayList<Traject>();
Traject trajectNu = null;
float geplandeAankomstVorige = 0;
float aankomstVorige = 0;

// reizigers
int passagiers = 12;
ArrayList<Reiziger> reizigers = new ArrayList<Reiziger>();
ArrayList<PVector> deuren = new ArrayList<PVector>();

ArrayList<Rookwolk> rook = new ArrayList<Rookwolk>();
PVector[] kolen = new PVector[14];

String melding = "";
int meldingTimer = 0;

void setup() {
  size(1280, 720);
  textFont(createFont("Arial", 14, true));
  for (int i = 0; i < kolen.length; i++) kolen[i] = new PVector(random(-14, 14), random(-8, 8));
  terugAfstand[0] = 0;
  for (int i = 1; i < 4; i++) terugAfstand[i] = terugAfstand[i - 1] + LENGTE[i - 1] / 2 + 6 + LENGTE[i] / 2;
  maakNetwerk();
  opnieuw();
}

// alles terug naar het begin (toets R)
void opnieuw() {
  for (Station s : stations) s.stoppen = true;
  for (Spoor s : sporen) s.dicht = false;
  obstakels.clear();
  reizigers.clear();
  rook.clear();
  deze.clear();
  vorige.clear();
  trajectNu = null;
  obstakelNu = null;
  passagiers = 12;
  totaalIn = 0;
  totaalUit = 0;
  geschiedenis.clear();
  snelheid = NOMINAAL;
  simFrames = 0;
  ronde = 1;
  geplandeAankomstVorige = 0;
  aankomstVorige = 0;

  // locomotief staat bij A, de wagons staan erachter op het spoor van D naar A
  spoorPunten.clear();
  spoorAfst.clear();
  afgelegd = 0;
  Spoor s = sporen.get(3);
  for (float d = s.len - 330; d <= s.len; d += 3) kruimel(s.punt(d, true));
  kruimel(knopen[0]);
  spoorNu = 3;
  vooruit = true;
  dOp = s.len;

  for (int i = 0; i < 4; i++) {
    for (int k = 0; k < 4; k++) {
      Reiziger r = new Reiziger(i);
      r.pos.set(r.pad.get(0));
      r.pad.clear();
      r.fase = WACHT;
      reizigers.add(r);
    }
  }

  ordePos = 0;
  bouwStops();
  knoopNu = 0;
  toestand = HALTE;
  timer = 0;
  startHalte(0);
}

void draw() {
  background(120, 180, 100);  // gras

  if (!pauze) {
    simFrames++;
    meetBezetting();
  }

  tekenSporen();
  for (Station s : stations) s.teken();
  tekenObstakels();

  // posities van locomotief en wagons
  PVector[] pos = new PVector[4];
  float[] hoek = new float[4];
  for (int i = 0; i < 4; i++) {
    pos[i] = staart(terugAfstand[i]);
    PVector voor = staart(max(0, terugAfstand[i] - 8));
    PVector achter = staart(terugAfstand[i] + 8);
    hoek[i] = atan2(voor.y - achter.y, voor.x - achter.x);
  }
  for (int i = 3; i >= 0; i--) tekenWagon(pos[i], hoek[i], i);
  if (toestand == HALTE) tekenDeuren();

  updateReizigers();
  updateRook(pos[0], hoek[0]);

  if (!pauze) stap();

  tekenOnderbalk();
  tekenDashboard();

  if (meldingTimer > 0) meldingTimer--;
}

// ---------- netwerk ----------

class Station {
  int id;
  PVector pos, raak, buiten;   // plek, richting van het spoor, richting van het midden af
  boolean stoppen = true;

  Station(int id, float h) {
    this.id = id;
    pos = new PVector(CX + cos(h) * RX, CY + sin(h) * RY);
    raak = new PVector(-sin(h) * RX, cos(h) * RY).normalize();
    buiten = new PVector(cos(h) * RY, sin(h) * RX).normalize();
  }

  // punt op het perron: u langs het spoor, v van het spoor af
  PVector perron(float u, float v) {
    return PVector.add(pos, PVector.mult(raak, u)).add(PVector.mult(buiten, v));
  }

  boolean geraakt(float mx, float my) {
    PVector m = new PVector(mx, my);
    return PVector.dist(m, pos) < 30 || PVector.dist(m, perron(0, 42)) < 45;
  }

  void teken() {
    PVector a = perron(-90, 22), b = perron(90, 22), c = perron(90, 62), d = perron(-90, 62);
    noStroke();
    fill(0, 40);
    quad(a.x + 4, a.y + 4, b.x + 4, b.y + 4, c.x + 4, c.y + 4, d.x + 4, d.y + 4);
    fill(stoppen ? 190 : 150);
    quad(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);

    // tegels en gele veiligheidslijn
    stroke(stoppen ? 172 : 138);
    strokeWeight(1);
    for (float u = -70; u <= 70; u += 20) {
      PVector p = perron(u, 22), q = perron(u, 62);
      line(p.x, p.y, q.x, q.y);
    }
    stroke(240, 200, 40, stoppen ? 255 : 90);
    strokeWeight(3);
    PVector g1 = perron(-86, 28), g2 = perron(86, 28);
    line(g1.x, g1.y, g2.x, g2.y);

    // bordje met de letter
    PVector m = perron(0, 44);
    noStroke();
    fill(stoppen ? color(30, 50, 110) : color(120));
    ellipse(m.x, m.y, 30, 30);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(CODE[id], m.x, m.y - 1);

    // naam en status langs het perron (nooit op z'n kop)
    float r = atan2(raak.y, raak.x);
    if (r > HALF_PI || r < -HALF_PI) r += PI;
    PVector n1 = perron(-50, 44), n2 = perron(52, 44);
    pushMatrix();
    translate(n1.x, n1.y);
    rotate(r);
    fill(30, 50, 110);
    textSize(12);
    text(NAAM[id], 0, -1);
    popMatrix();
    pushMatrix();
    translate(n2.x, n2.y);
    rotate(r);
    textSize(11);
    if (stoppen) {
      fill(30, 130, 70);
      text("stopt", 0, -1);
    } else {
      fill(170, 40, 40);
      text("overslaan", 0, -1);
    }
    popMatrix();
    textAlign(LEFT, BASELINE);
  }
}

class Spoor {
  int a, b;
  ArrayList<PVector> pts = new ArrayList<PVector>();
  FloatList cum = new FloatList();
  float len;
  boolean dicht = false;
  ArrayList<PVector> links = new ArrayList<PVector>(), rechts = new ArrayList<PVector>();
  ArrayList<PVector[]> bielzen = new ArrayList<PVector[]>();

  Spoor(int a, int b) {
    this.a = a;
    this.b = b;
  }

  // lengtes, rails en bielzen alvast uitrekenen
  void klaar() {
    cum.clear();
    float s = 0;
    cum.append(0);
    for (int i = 1; i < pts.size(); i++) {
      s += PVector.dist(pts.get(i - 1), pts.get(i));
      cum.append(s);
    }
    len = s;
    for (int i = 0; i < pts.size(); i++) {
      PVector r = richtingBij(i);
      PVector n = new PVector(-r.y, r.x);
      links.add(PVector.add(pts.get(i), PVector.mult(n, 9)));
      rechts.add(PVector.sub(pts.get(i), PVector.mult(n, 9)));
    }
    for (float d = 6; d < len; d += 12) {
      PVector p = punt(d, true);
      PVector r = PVector.sub(punt(d + 1, true), punt(d - 1, true)).normalize();
      PVector n = new PVector(-r.y, r.x).mult(14);
      bielzen.add(new PVector[] {PVector.add(p, n), PVector.sub(p, n)});
    }
  }

  PVector richtingBij(int i) {
    int i0 = max(0, i - 1), i1 = min(pts.size() - 1, i + 1);
    return PVector.sub(pts.get(i1), pts.get(i0)).normalize();
  }

  // punt op afstand d, gemeten vanaf het begin van de rijrichting
  PVector punt(float d, boolean vooruit) {
    if (!vooruit) d = len - d;
    d = constrain(d, 0, len);
    int lo = 0, hi = pts.size() - 1;
    while (hi - lo > 1) {
      int m = (lo + hi) / 2;
      if (cum.get(m) <= d) lo = m;
      else hi = m;
    }
    float seg = cum.get(hi) - cum.get(lo);
    float t = seg == 0 ? 0 : (d - cum.get(lo)) / seg;
    return PVector.lerp(pts.get(lo), pts.get(hi), t);
  }

  int ander(int n) {
    return n == a ? b : a;
  }

  // dichtstbijzijnde punt: afstand tot de muis en plek langs het spoor (gemeten vanaf a)
  float[] dichtstbij(float mx, float my) {
    float beste = 1e9, plek = 0;
    for (int i = 0; i < pts.size(); i++) {
      float d = dist(mx, my, pts.get(i).x, pts.get(i).y);
      if (d < beste) {
        beste = d;
        plek = cum.get(i);
      }
    }
    return new float[] {beste, plek};
  }

  int aantalObstakels() {
    int n = 0;
    for (Obstakel o : obstakels) if (sporen.get(o.spoor) == this) n++;
    return n;
  }
}

class Obstakel {
  int spoor;
  float d;  // plek langs het spoor, gemeten vanaf a
  Obstakel(int spoor, float d) {
    this.spoor = spoor;
    this.d = d;
  }
  PVector pos() {
    return sporen.get(spoor).punt(d, true);
  }
}

void maakNetwerk() {
  float[] h = {-HALF_PI, 0, HALF_PI, PI};
  for (int i = 0; i < 4; i++) {
    stations[i] = new Station(i, h[i]);
    knopen[i] = stations[i].pos;
  }
  knopen[X] = new PVector(CX, CY);

  // sporen 0-3: de ring (A-B, B-C, C-D, D-A)
  for (int i = 0; i < 4; i++) {
    Spoor s = new Spoor(i, (i + 1) % 4);
    int n = 160;
    for (int k = 0; k <= n; k++) {
      float a = lerp(h[i], h[i] + HALF_PI, k / float(n));
      s.pts.add(new PVector(CX + cos(a) * RX, CY + sin(a) * RY));
    }
    s.klaar();
    sporen.add(s);
  }
  // sporen 4-7: van elk station naar de kruising in het midden
  for (int i = 0; i < 4; i++) {
    Spoor s = new Spoor(i, X);
    int n = int(PVector.dist(knopen[i], knopen[X]) / 3);
    for (int k = 0; k <= n; k++) s.pts.add(PVector.lerp(knopen[i], knopen[X], k / float(n)));
    s.klaar();
    sporen.add(s);
  }
}

void tekenSporen() {
  noFill();
  // grind
  for (Spoor s : sporen) {
    stroke(150, 140, 120, s.dicht ? 90 : 255);
    strokeWeight(30);
    beginShape();
    for (PVector p : s.pts) vertex(p.x, p.y);
    endShape();
  }
  // bielzen
  for (Spoor s : sporen) {
    stroke(110, 80, 50, s.dicht ? 70 : 255);
    strokeWeight(5);
    for (PVector[] b : s.bielzen) line(b[0].x, b[0].y, b[1].x, b[1].y);
  }
  // rails
  for (Spoor s : sporen) {
    stroke(90, s.dicht ? 70 : 255);
    strokeWeight(3);
    beginShape();
    for (PVector p : s.links) vertex(p.x, p.y);
    endShape();
    beginShape();
    for (PVector p : s.rechts) vertex(p.x, p.y);
    endShape();
  }
  // afgesloten sporen: rood-wit hek in het midden
  for (Spoor s : sporen) {
    if (!s.dicht) continue;
    PVector p = s.punt(s.len / 2, true);
    PVector r = PVector.sub(s.punt(s.len / 2 + 1, true), s.punt(s.len / 2 - 1, true));
    pushMatrix();
    translate(p.x, p.y);
    rotate(atan2(r.y, r.x) + HALF_PI);
    rectMode(CENTER);
    noStroke();
    for (int k = -2; k <= 2; k++) {
      fill(k % 2 == 0 ? color(220, 40, 40) : color(255));
      rect(k * 8, 0, 8, 8);
    }
    stroke(60);
    strokeWeight(2);
    line(-22, 6, -22, 14);
    line(22, 6, 22, 14);
    popMatrix();
  }
  // kruising
  noStroke();
  fill(90);
  ellipse(CX, CY, 10, 10);
}

void tekenObstakels() {
  for (Obstakel o : obstakels) {
    PVector p = o.pos();
    // pionnetje
    noStroke();
    fill(0, 50);
    ellipse(p.x + 3, p.y + 4, 22, 10);
    fill(245, 130, 30);
    triangle(p.x - 10, p.y + 6, p.x + 10, p.y + 6, p.x, p.y - 16);
    fill(255);
    quad(p.x - 5, p.y - 3, p.x + 5, p.y - 3, p.x + 3.5, p.y - 7, p.x - 3.5, p.y - 7);
    // wordt opgeruimd: voortgangsring
    if (o == obstakelNu && toestand == OBSTAKEL) {
      noFill();
      stroke(255);
      strokeWeight(3);
      arc(p.x, p.y - 4, 34, 34, -HALF_PI, -HALF_PI + TWO_PI * timer / OBSTAKEL_TIJD);
    }
  }
}

// ---------- route ----------

// IntList met de sporen van de kortste route, of null als er geen route is.
// metGevolgen = false: de dienstregeling (alles open, geen obstakels).
IntList route(int van, int naar, int verbodenEerste, boolean metGevolgen) {
  float[] afst = new float[5];
  int[] via = new int[5];
  boolean[] klaar = new boolean[5];
  for (int i = 0; i < 5; i++) {
    afst[i] = 1e9;
    via[i] = -1;
  }
  afst[van] = 0;
  for (int rondje = 0; rondje < 5; rondje++) {
    int u = -1;
    for (int i = 0; i < 5; i++) if (!klaar[i] && (u == -1 || afst[i] < afst[u])) u = i;
    if (u == -1 || afst[u] >= 1e9) break;
    klaar[u] = true;
    for (int e = 0; e < sporen.size(); e++) {
      Spoor s = sporen.get(e);
      if (s.a != u && s.b != u) continue;
      if (u == van && e == verbodenEerste) continue;
      if (metGevolgen && s.dicht) continue;
      float kosten = s.len + (metGevolgen ? s.aantalObstakels() * OBSTAKEL_STRAF : 0);
      int w = s.ander(u);
      if (afst[u] + kosten < afst[w]) {
        afst[w] = afst[u] + kosten;
        via[w] = e;
      }
    }
  }
  if (via[naar] == -1) return null;
  IntList r = new IntList();
  int k = naar;
  while (k != van) {
    int e = via[k];
    r.append(e);
    k = sporen.get(e).ander(k);
  }
  r.reverse();
  return r;
}

float routeLengte(IntList r) {
  float l = 0;
  for (int i = 0; i < r.size(); i++) l += sporen.get(r.get(i)).len;
  return l;
}

// stations die nog komen in deze ronde, in de volgorde A, B, C, D, en terug naar A
void bouwStops() {
  stops.clear();
  for (int i = ordePos + 1; i < 4; i++) if (stations[i].stoppen) stops.append(i);
  stops.append(0);
}

// vanaf een knoop het eerste spoor van de route kiezen.
// Een trein kan niet keren: terug over het spoor waar hij net vandaan kwam mag niet.
boolean vertrekVan(int knoop, float rest) {
  IntList r = route(knoop, stops.get(0), spoorNu, true);
  if (r == null || r.size() == 0) {
    toestand = GEEN_ROUTE;
    knoopNu = knoop;
    factor = 0;
    if (trajectNu != null) trajectNu.dicht = true;
    zeg("Geen route naar " + CODE[stops.get(0)] + " (de trein kan niet keren): zet een spoor weer open");
    return false;
  }
  int e = r.get(0);
  spoorNu = e;
  vooruit = sporen.get(e).a == knoop;
  dOp = min(rest, sporen.get(e).len);
  toestand = RIJDT;
  return true;
}

// ---------- rijden ----------

void stap() {
  if (toestand == HALTE) {
    timer++;
    if (timer >= HALTE_MIN && !iemandBezig()) vertrek();
    return;
  }
  if (toestand == OBSTAKEL) {
    timer++;
    if (timer >= OBSTAKEL_TIJD) {
      obstakels.remove(obstakelNu);
      obstakelNu = null;
      toestand = RIJDT;
      factor = 0;
    }
    return;
  }
  if (toestand == GEEN_ROUTE) {
    if (simFrames % 30 == 0) vertrekVan(knoopNu, 0);
    return;
  }

  Spoor s = sporen.get(spoorNu);
  int eind = vooruit ? s.b : s.a;

  // eerstvolgende obstakel op dit spoor
  Obstakel voor = null;
  float stopBij = 1e9;
  for (Obstakel o : obstakels) {
    if (o.spoor != spoorNu) continue;
    float od = vooruit ? o.d : s.len - o.d;
    if (od > dOp - 1 && od - 50 < stopBij) {
      stopBij = max(od - 50, dOp);
      voor = o;
    }
  }

  // remmen voor een obstakel of het volgende station
  float remAfstand = 1e9;
  if (voor != null) remAfstand = stopBij - dOp;
  else if (eind == stops.get(0)) remAfstand = s.len - dOp;
  float doel = constrain(remAfstand / 120, 0.2, 1);
  factor = min(factor + 0.015, doel);

  float stapje = snelheid * factor;
  if (trajectNu != null) {
    trajectNu.afstand += stapje;
    if (snelheid < NOMINAAL - 0.01) trajectNu.langzaam = true;
  }

  if (voor != null && dOp + stapje >= stopBij) {
    dOp = stopBij;
    kruimel(s.punt(dOp, vooruit));
    toestand = OBSTAKEL;
    obstakelNu = voor;
    timer = 0;
    if (trajectNu != null) trajectNu.obstakel = true;
    zeg("Obstakel op het spoor: de trein wacht tot het is opgeruimd");
    return;
  }

  if (dOp + stapje >= s.len) {
    float rest = dOp + stapje - s.len;
    dOp = s.len;
    kruimel(s.punt(dOp, vooruit));
    aangekomen(eind, rest);
  } else {
    dOp += stapje;
    kruimel(s.punt(dOp, vooruit));
  }
}

void aangekomen(int knoop, float rest) {
  knoopNu = knoop;
  if (knoop == stops.get(0)) {
    stops.remove(0);
    // traject afsluiten
    if (trajectNu != null) {
      trajectNu.naar = knoop;
      trajectNu.aankomst = simFrames;
      geplandeAankomstVorige = trajectNu.geplandAankomst;
      trajectNu = null;
    }
    aankomstVorige = simFrames;
    if (knoop == 0) {
      // ronde klaar; de nieuwe ronde begint weer volgens de dienstregeling
      geplandeAankomstVorige = simFrames;
      if (deze.size() > 0) {
        vorige = deze;
        deze = new ArrayList<Traject>();
        ronde++;
      }
      ordePos = 0;
      bouwStops();
    } else {
      ordePos = knoop;
    }
    toestand = HALTE;
    timer = 0;
    factor = 0;
    startHalte(knoop);
  } else {
    // station overslaan of over de kruising: gewoon doorrijden
    vertrekVan(knoop, rest);
  }
}

void vertrek() {
  int van = knoopNu;
  int naar = stops.get(0);
  Traject t = new Traject();
  t.van = van;
  t.naar = naar;
  IntList plan = route(van, naar, -1, false);
  t.geplandeAfstand = plan == null ? 0 : routeLengte(plan);
  t.geplandeReistijd = t.geplandeAfstand / NOMINAAL + OPTREKKEN;
  t.geplandVertrek = geplandeAankomstVorige + HALTE_PLAN;
  t.geplandAankomst = t.geplandVertrek + t.geplandeReistijd;
  t.vertrek = simFrames;
  t.stoptijd = simFrames - aankomstVorige;
  deze.add(t);
  trajectNu = t;
  deuren.clear();
  factor = 0;
  vertrekVan(van, 0);
}

// ---------- spoor van de locomotief bijhouden ----------

void kruimel(PVector p) {
  int n = spoorPunten.size();
  if (n > 0) {
    float d = PVector.dist(p, spoorPunten.get(n - 1));
    if (d < 0.01) return;
    afgelegd += d;
  }
  spoorPunten.add(p.copy());
  spoorAfst.append(afgelegd);
  if (spoorPunten.size() > 4000) {
    spoorPunten = new ArrayList<PVector>(spoorPunten.subList(2000, spoorPunten.size()));
    FloatList nieuw = new FloatList();
    for (int i = 2000; i < spoorAfst.size(); i++) nieuw.append(spoorAfst.get(i));
    spoorAfst = nieuw;
  }
}

// punt een stuk achter de locomotief, precies op het spoor dat hij gereden heeft
PVector staart(float terug) {
  float s = afgelegd - terug;
  int n = spoorPunten.size();
  if (s >= spoorAfst.get(n - 1)) return spoorPunten.get(n - 1).copy();
  if (s <= spoorAfst.get(0)) return spoorPunten.get(0).copy();
  int lo = 0, hi = n - 1;
  while (hi - lo > 1) {
    int m = (lo + hi) / 2;
    if (spoorAfst.get(m) <= s) lo = m;
    else hi = m;
  }
  float seg = spoorAfst.get(hi) - spoorAfst.get(lo);
  return PVector.lerp(spoorPunten.get(lo), spoorPunten.get(hi), (s - spoorAfst.get(lo)) / seg);
}

// ---------- trein tekenen ----------

// soort: 0 = locomotief, 1 = kolenwagen, 2+ = wagon
void tekenWagon(PVector p, float r, int soort) {
  float l = LENGTE[soort];
  pushMatrix();
  translate(p.x, p.y);
  rotate(r);
  rectMode(CENTER);

  noStroke();
  fill(0, 50);
  rect(3, 4, l, 30, 6);

  fill(25);
  for (float x = -l/2 + 10; x <= l/2 - 8; x += (soort == 0 ? 16 : l - 18)) {
    rect(x, -15, 10, 5, 2);
    rect(x, 15, 10, 5, 2);
  }
  fill(60);
  rect(-l/2 - 3, 0, 6, 4);

  stroke(30);
  strokeWeight(1.5);
  if (soort == 0) tekenLocomotief();
  else if (soort == 1) tekenKolenwagen();
  else tekenPersonenwagon();
  popMatrix();
}

void tekenLocomotief() {
  float l = LENGTE[0];
  fill(150, 25, 25);
  rect(0, 0, l, 28, 4);
  fill(45);
  rect(10, 0, 44, 20, 10);
  stroke(110);
  line(-10, -5, 30, -5);
  stroke(200, 160, 60);
  for (int x = -4; x <= 24; x += 14) line(x, -10, x, 10);
  stroke(30);
  fill(200, 160, 60);
  ellipse(6, 0, 10, 10);
  fill(20);
  ellipse(25, 0, 12, 12);
  fill(70);
  ellipse(25, 0, 6, 6);
  fill(170, 30, 30);
  rect(-24, 0, 22, 30, 3);
  fill(110, 20, 20);
  rect(-24, 0, 16, 24, 3);
  fill(60);
  ellipse(l/2 + 1, -9, 5, 5);
  ellipse(l/2 + 1, 9, 5, 5);
  fill(255, 230, 100);
  ellipse(l/2 - 2, 0, 7, 7);
}

void tekenKolenwagen() {
  float l = LENGTE[1];
  fill(50);
  rect(0, 0, l, 28, 4);
  noStroke();
  fill(25);
  rect(0, 0, l - 8, 20, 3);
  fill(70);
  for (PVector k : kolen) ellipse(k.x, k.y, 4, 4);
}

void tekenPersonenwagon() {
  float l = LENGTE[2];
  fill(35, 85, 160);
  rect(0, 0, l, 28, 5);
  fill(60, 115, 190);
  rect(0, 0, l - 8, 14, 4);
  fill(200);
  for (int x = -18; x <= 18; x += 12) ellipse(x, 0, 5, 5);
  stroke(230, 190, 60);
  strokeWeight(2);
  line(-l/2 + 4, -11, l/2 - 4, -11);
  line(-l/2 + 4, 11, l/2 - 4, 11);
}

// ---------- rook ----------

class Rookwolk {
  float x, y, grootte = 8, doorzicht = 180;
  Rookwolk(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void update() {
    x += random(-0.4, 0.4);
    y -= 0.5;
    grootte += 0.5;
    doorzicht -= 3;
  }
  void teken() {
    noStroke();
    fill(230, doorzicht);
    ellipse(x, y, grootte, grootte);
  }
}

void updateRook(PVector loc, float r) {
  if (!pauze && frameCount % 4 == 0) {
    PVector schoorsteen = PVector.fromAngle(r).mult(25);
    rook.add(new Rookwolk(loc.x + schoorsteen.x, loc.y + schoorsteen.y));
  }
  for (int i = rook.size() - 1; i >= 0; i--) {
    Rookwolk w = rook.get(i);
    if (!pauze) w.update();
    w.teken();
    if (w.doorzicht <= 0) rook.remove(i);
  }
}

// ---------- halte en reizigers ----------

// deuren van deze halte: de plek op het perron, de deur aan de zijkant van de trein,
// en hoe ver die deur achter de locomotief zit (voor het looppad door de trein)
FloatList deurS = new FloatList();
ArrayList<PVector> deurPerron = new ArrayList<PVector>();

void tekenDeuren() {
  rectMode(CENTER);
  noStroke();
  fill(255, 230, 150);
  for (PVector d : deuren) rect(d.x, d.y, 8, 8, 2);
}

float treinEind() {
  return terugAfstand[3] + LENGTE[3] / 2;
}

// staat dit stuk van de trein (afstand achter de locomotief) langs het perron?
boolean langsPerron(Station s, float d) {
  PVector p = PVector.sub(staart(d), s.pos);
  float u = p.dot(s.raak), v = p.dot(s.buiten);
  return abs(u) <= 84 && v > -30 && v < 12;
}

void voegDeurToe(Station s, float d) {
  PVector p = staart(d);
  PVector langs = PVector.sub(staart(d - 8), staart(d + 8)).normalize();
  PVector zij = new PVector(-langs.y, langs.x);
  if (PVector.sub(s.perron(0, 42), p).dot(zij) < 0) zij.mult(-1);
  deuren.add(PVector.add(p, PVector.mult(zij, 15)));
  deurS.append(d);
  PVector q = PVector.sub(p, s.pos);
  deurPerron.add(s.perron(constrain(q.dot(s.raak), -84, 84), 28));
}

// trein staat net stil bij een station: deuren bepalen, mensen laten uit- en instappen
void startHalte(int st) {
  Station s = stations[st];
  deuren.clear();
  deurS.clear();
  deurPerron.clear();

  // alleen deuren van de personenwagons die langs het perron staan
  for (int i = 2; i < 4; i++) {
    for (int k = -1; k <= 1; k += 2) {
      float d = terugAfstand[i] + k * 16;
      if (langsPerron(s, d)) voegDeurToe(s, d);
    }
  }
  // staat er geen personenwagon langs het perron? dan in- en uitstappen via het achterste
  // stuk trein dat er wel langs staat, en door de trein naar achteren lopen
  if (deurS.size() == 0) {
    float achterste = 0;
    for (float d = 0; d <= treinEind(); d += 2) if (langsPerron(s, d)) achterste = d;
    voegDeurToe(s, achterste);
  }

  int uit = int(passagiers * random(0.2, 0.5));
  for (int i = 0; i < uit; i++) reizigers.add(new Reiziger(st, i * 5));

  int plaats = CAPACITEIT - passagiers + uit;
  int n = 0;
  for (Reiziger r : reizigers) {
    if (r.station == st && (r.fase == WACHT || r.fase == AANKOMST) && n < plaats) {
      r.instappen(dichtsteDeur(r.pos), uit * 5 + n * 4);
      n++;
    }
  }
}

int dichtsteDeur(PVector pos) {
  int beste = 0;
  for (int i = 0; i < deurPerron.size(); i++) {
    if (PVector.dist(pos, deurPerron.get(i)) < PVector.dist(pos, deurPerron.get(beste))) beste = i;
  }
  return beste;
}

// deur die het dichtst bij een zitplek in de trein zit
int deurBijZitplek(float zit) {
  int beste = 0;
  for (int i = 0; i < deurS.size(); i++) {
    if (abs(deurS.get(i) - zit) < abs(deurS.get(beste) - zit)) beste = i;
  }
  return beste;
}

// willekeurige zitplek in een van de personenwagons
float zitplek() {
  int w = random(1) < 0.5 ? 2 : 3;
  return terugAfstand[w] + random(-22, 22);
}

// looppad over het midden van de trein (in één lijn door het gangpad)
ArrayList<PVector> gangpad(float van, float naar) {
  ArrayList<PVector> r = new ArrayList<PVector>();
  int n = max(1, ceil(abs(naar - van) / 6));
  for (int k = 1; k <= n; k++) r.add(staart(lerp(van, naar, k / float(n))));
  return r;
}

// zolang er nog iemand in- of uitstapt mag de trein niet vertrekken
boolean iemandBezig() {
  for (Reiziger r : reizigers) {
    if (r.fase == IN || r.fase == UIT) return true;
  }
  return false;
}

int aantalWachtend(int st) {
  int n = 0;
  for (Reiziger r : reizigers) if (r.station == st && (r.fase == WACHT || r.fase == AANKOMST)) n++;
  return n;
}

int aantalWachtend() {
  int n = 0;
  for (int i = 0; i < 4; i++) n += aantalWachtend(i);
  return n;
}

void updateReizigers() {
  // af en toe komt er iemand nieuw het perron op
  if (!pauze) {
    for (int i = 0; i < 4; i++) {
      boolean treinHier = toestand == HALTE && knoopNu == i;
      if (!treinHier && random(1) < 0.006 && aantalWachtend(i) < 14) reizigers.add(new Reiziger(i));
    }
  }
  for (int i = reizigers.size() - 1; i >= 0; i--) {
    Reiziger r = reizigers.get(i);
    if (!pauze && r.update()) {
      reizigers.remove(i);
      continue;
    }
    r.teken();
  }
}

final int AANKOMST = 0;  // loopt het perron op
final int WACHT = 1;     // staat te wachten
final int IN = 2;        // loopt naar de deur en door de trein naar een zitplek
final int UIT = 3;       // loopt door de trein naar de deur en stapt uit
final int WEG = 4;       // loopt van het perron af

class Reiziger {
  int station;
  PVector pos;
  ArrayList<PVector> pad = new ArrayList<PVector>();  // punten die nog gelopen moeten worden
  int bereikt = 0;      // hoeveel punten van het pad al gehaald zijn
  int wisselBij = -1;   // bij dit punt stapt iemand de trein in of uit
  int fase;
  int wachttijd = 0;
  boolean inTrein = false;   // zit al (onzichtbaar)
  boolean opTrein = false;   // loopt door het gangpad (klein, bovenop de trein)
  float doorzicht = 255;
  float stapjes = random(TWO_PI);

  // nieuwe reiziger die vanaf een uiteinde het perron op loopt
  Reiziger(int st) {
    station = st;
    Station s = stations[st];
    pos = s.perron(random(1) < 0.5 ? -86 : 86, random(36, 56));
    pad.add(s.perron(random(-75, 75), random(36, 56)));
    fase = AANKOMST;
  }

  // reiziger die uitstapt: van de zitplek door het gangpad naar de deur, dan het perron op
  Reiziger(int st, int vertraging) {
    station = st;
    Station s = stations[st];
    float zit = zitplek();
    int d = deurBijZitplek(zit);
    pos = staart(zit);
    pad = gangpad(zit, deurS.get(d));
    pad.add(deuren.get(d).copy());
    wisselBij = pad.size();
    pad.add(deurPerron.get(d).copy());
    float u = PVector.sub(deurPerron.get(d), s.pos).dot(s.raak);
    pad.add(s.perron(constrain(u + random(-30, 30), -75, 75), random(36, 56)));
    fase = UIT;
    inTrein = true;
    opTrein = true;
    wachttijd = vertraging;
  }

  // van het perron naar de deur, dan door het gangpad naar een zitplek
  void instappen(int d, int vertraging) {
    pad.clear();
    bereikt = 0;
    pad.add(deurPerron.get(d).copy());
    pad.add(deuren.get(d).copy());
    wisselBij = 2;
    pad.addAll(gangpad(deurS.get(d), zitplek()));
    fase = IN;
    wachttijd = vertraging;
  }

  // true als de reiziger weg is (gaan zitten of van het perron af)
  boolean update() {
    if (wachttijd > 0) {
      wachttijd--;
      return false;
    }
    if (fase == UIT && inTrein) {
      inTrein = false;
      passagiers--;
      totaalUit++;
    }
    if (pad.size() > 0) {
      if (stap(pad.get(0))) {
        pad.remove(0);
        bereikt++;
        if (bereikt == wisselBij) opTrein = !opTrein;
      }
      return false;
    }
    if (fase == AANKOMST) {
      fase = WACHT;
    } else if (fase == IN) {
      passagiers++;
      totaalIn++;
      return true;
    } else if (fase == UIT) {
      fase = WEG;
      pad.add(stations[station].perron(random(1) < 0.5 ? -95 : 95, random(36, 56)));
    } else if (fase == WEG) {
      doorzicht -= 25;
      return doorzicht <= 0;
    }
    return false;
  }

  boolean stap(PVector doel) {
    PVector d = PVector.sub(doel, pos);
    if (d.mag() <= LOOPSNELHEID) {
      pos.set(doel);
      return true;
    }
    pos.add(d.setMag(LOOPSNELHEID));
    return false;
  }

  void teken() {
    if (inTrein) return;
    boolean loopt = pad.size() > 0 && wachttijd == 0;
    float wiebel = loopt ? sin(frameCount * 0.5 + stapjes) * 0.8 : 0;
    noStroke();
    if (opTrein) {
      // in het gangpad: iets kleiner, bovenop de trein
      fill(15, doorzicht);
      ellipse(pos.x, pos.y + wiebel * 0.5, 7, 7);
      return;
    }
    fill(0, 40 * doorzicht / 255);
    ellipse(pos.x + 1.5, pos.y + 2, 9, 9);
    fill(15, doorzicht);
    ellipse(pos.x, pos.y + wiebel, 9, 9);
  }
}

// ---------- bediening ----------

void zeg(String s) {
  melding = s;
  meldingTimer = 240;
}

void mousePressed() {
  if (mouseX >= W_NET || mouseY > 640) return;
  boolean obstakelKlik = mouseButton == RIGHT || (keyPressed && keyCode == SHIFT);

  // station: stoppen of overslaan
  if (!obstakelKlik) {
    for (Station s : stations) {
      if (!s.geraakt(mouseX, mouseY)) continue;
      if (s.id == 0) {
        zeg("A is het begin- en eindstation: daar stopt de trein altijd");
        return;
      }
      if (s.stoppen) {
        int andere = 0;
        for (int i = 1; i < 4; i++) if (stations[i].stoppen && i != s.id) andere++;
        if (andere == 0) {
          zeg("De trein moet bij minstens één ander station dan A stoppen");
          return;
        }
      }
      s.stoppen = !s.stoppen;
      bouwStops();
      zeg("Station " + CODE[s.id] + (s.stoppen ? ": de trein stopt hier weer" : ": de trein rijdt hier voorbij"));
      return;
    }
  }

  // dichtstbijzijnde spoor (niet vlak bij een station of de kruising)
  int beste = -1;
  float besteAfst = 16, plek = 0;
  for (int e = 0; e < sporen.size(); e++) {
    float[] d = sporen.get(e).dichtstbij(mouseX, mouseY);
    if (d[0] < besteAfst) {
      besteAfst = d[0];
      beste = e;
      plek = d[1];
    }
  }
  if (beste == -1) return;
  Spoor s = sporen.get(beste);
  if (plek < 40 || plek > s.len - 40) {
    zeg("Klik iets verder van het station of de kruising af");
    return;
  }

  if (obstakelKlik) {
    for (Obstakel o : obstakels) {
      if (o.spoor == beste && abs(o.d - plek) < 30) {
        if (o == obstakelNu) {
          zeg("Dit obstakel wordt al opgeruimd");
          return;
        }
        obstakels.remove(o);
        zeg("Obstakel weggehaald");
        return;
      }
    }
    if (beste == spoorNu && toestand == RIJDT) {
      float treinPlek = vooruit ? dOp : s.len - dOp;
      if (abs(treinPlek - plek) < 90) {
        zeg("Te dicht bij de trein");
        return;
      }
    }
    obstakels.add(new Obstakel(beste, plek));
    zeg("Obstakel gelegd: de route en de reistijd veranderen mee");
    return;
  }

  // spoor open of dicht
  if (!s.dicht && beste == spoorNu && toestand != HALTE && toestand != GEEN_ROUTE) {
    zeg("De trein rijdt nu over dit spoor; probeer het zo nog eens");
    return;
  }
  s.dicht = !s.dicht;
  zeg(s.dicht ? "Spoor afgesloten: de trein zoekt een andere route" : "Spoor weer open");
}

void keyPressed() {
  if (key == ' ') pauze = !pauze;
  else if (key == 'r' || key == 'R') opnieuw();
  else if (keyCode == UP) snelheid = min(snelheid + 0.5, 8);
  else if (keyCode == DOWN) snelheid = max(snelheid - 0.5, 0.5);
}

// ---------- onderbalk (links) ----------

void tekenOnderbalk() {
  pushStyle();
  noStroke();
  fill(25, 35, 45, 230);
  rectMode(CORNER);
  rect(0, 640, W_NET, 80);

  // geplande route vanaf hier
  StringList r = new StringList();
  int van = (toestand == RIJDT || toestand == OBSTAKEL) ? -1 : knoopNu;
  if (van >= 0) r.append(van == X ? "X" : CODE[van]);
  for (int i = 0; i < stops.size(); i++) r.append(CODE[stops.get(i)]);
  fill(255);
  textSize(14);
  textAlign(LEFT, BASELINE);
  text("Ronde " + ronde + " · nog te gaan: " + r.join(" → "), 14, 662);
  fill(160, 200, 255);
  textSize(11);
  text("AI-specialist: laat de computer bij elke kruising de snelste open route kiezen", 14, 680);

  fill(200);
  textSize(11);
  text("Klik station = stoppen/overslaan · klik spoor = open/dicht · rechtsklik spoor = obstakel · spatie = pauze · ↑↓ = snelheid · R = opnieuw", 14, 700);

  if (meldingTimer > 0) {
    fill(255, 220, 90, min(255, meldingTimer * 6));
    textSize(12);
    text(melding, 14, 716);
  }
  popStyle();
}
