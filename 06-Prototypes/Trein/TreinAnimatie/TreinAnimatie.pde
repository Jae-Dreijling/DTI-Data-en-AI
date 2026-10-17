// Trein-animatie (concept 1, achtervang als de Arduino-auto er niet is)
// Een stoomlocomotief met kolenwagen en 2 wagons rijdt rond over een ovaal spoor.
// Onderaan staat een station: de trein stopt even en reizigers (zwarte bolletjes) stappen in en uit.
// Rechts staat een nep-website met live cijfers over de trein.
// Toetsen: spatie = pauze, pijl omhoog/omlaag = sneller/langzamer

float hoek = 0;          // waar de locomotief op het spoor staat (0 tot TWO_PI)
float snelheid = 2.5;    // pixels per frame
boolean pauze = false;

int aantalWagons = 2;
float tussenruimte = 6;  // ruimte tussen twee wagons (koppeling), in pixels

// lengte van elk soort wagon
float LENGTE_LOC = 72;
float LENGTE_KOLEN = 40;
float LENGTE_WAGON = 58;

// Spoor = ellips rond (spoorX, spoorY)
float spoorX = 400, spoorY = 250;
float spoorB, spoorH;   // halve breedte en halve hoogte

// Station: één perron onderaan het spoor
float PERRON_L = 270, PERRON_R = 530, PERRON_BOVEN = 438, PERRON_ONDER = 498;
int STOP_TIJD = 60;       // minstens 1 seconde stilstaan
int CAPACITEIT = 48;      // plaatsen in de 2 wagons
float LOOPSNELHEID = 1.6;

boolean gestopt = false;
int stopTimer = 0;
float volgendeStop = HALF_PI;  // hoek waar het midden van de wagons moet stilstaan (onderaan)
float factor = 1;              // optrekken en remmen: 0 = stil, 1 = volle snelheid
float afstandTotHalte = 0;     // in pixels

// cijfers voor het dashboard
int passagiers = 12;
int totaalIn = 0, totaalUit = 0;
FloatList geschiedenis = new FloatList();  // bezetting door de tijd, voor het grafiekje
int MAX_PUNTEN = 120;

ArrayList<Reiziger> reizigers = new ArrayList<Reiziger>();
ArrayList<PVector> deuren = new ArrayList<PVector>();

ArrayList<Rookwolk> rook = new ArrayList<Rookwolk>();
PVector[] kolen = new PVector[14];  // klontjes kolen, 1 keer gekozen zodat ze niet flikkeren

void setup() {
  size(1200, 560);
  spoorB = 300;
  spoorH = 170;
  for (int i = 0; i < kolen.length; i++) {
    kolen[i] = new PVector(random(-14, 14), random(-8, 8));
  }
  // een paar mensen staan al te wachten
  for (int i = 0; i < 5; i++) {
    Reiziger r = new Reiziger();
    r.pos.set(r.doel);
    r.fase = WACHT;
    reizigers.add(r);
  }
}

void draw() {
  background(120, 180, 100);  // gras
  tekenSpoor();
  tekenStation();

  // posities uitrekenen: locomotief voorop, de rest steeds een stukje erachter
  int aantal = aantalWagons + 2;  // locomotief + kolenwagen + wagons
  float[] hoeken = new float[aantal];
  hoeken[0] = hoek;
  for (int i = 1; i < aantal; i++) {
    float afstand = lengte(i - 1) / 2 + tussenruimte + lengte(i) / 2;
    hoeken[i] = hoekTerug(hoeken[i - 1], afstand);
  }

  // achteraan beginnen, zodat de locomotief bovenop ligt
  for (int i = aantal - 1; i >= 0; i--) {
    tekenWagon(hoeken[i], i);
  }
  if (gestopt) tekenDeuren();

  updateReizigers();
  updateRook(hoeken[0]);

  if (!pauze) {
    rijden(hoeken);
    if (frameCount % 10 == 0) {
      geschiedenis.append(passagiers);
      if (geschiedenis.size() > MAX_PUNTEN) geschiedenis.remove(0);
    }
  }

  fill(255);
  textSize(14);
  text("snelheid: " + nf(snelheid, 1, 1) + "   (pijltjes = sneller/langzamer, spatie = pauze)", 15, height - 15);

  tekenDashboard();
}

// Trein vooruit laten rijden, remmen voor het station en daar even stilstaan
void rijden(float[] hoeken) {
  float midden = (hoeken[2] + hoeken[hoeken.length - 1]) / 2;  // midden van de personenwagons

  if (gestopt) {
    stopTimer++;
    if (stopTimer >= STOP_TIJD && !iemandBezig()) {
      gestopt = false;
      volgendeStop += TWO_PI;  // volgende ronde weer stoppen
      factor = 0;
    }
    return;
  }

  afstandTotHalte = (volgendeStop - midden) * spoorSnelheid(midden);
  if (afstandTotHalte <= 0) {
    gestopt = true;
    stopTimer = 0;
    startHalte(hoeken);
    return;
  }

  // de laatste 120 pixels voor het station afremmen, na het vertrek rustig optrekken
  float doel = constrain(afstandTotHalte / 120, 0.2, 1);
  factor = min(factor + 0.015, doel);

  // delen door de lokale snelheid: zo rijdt de trein overal even hard
  hoek += snelheid * factor / spoorSnelheid(hoek);
}

int rondes() {
  return floor(hoek / TWO_PI);
}

float lengte(int i) {
  if (i == 0) return LENGTE_LOC;
  if (i == 1) return LENGTE_KOLEN;
  return LENGTE_WAGON;
}

// Punt op het spoor bij een bepaalde hoek
PVector puntOpSpoor(float h) {
  return new PVector(spoorX + cos(h) * spoorB, spoorY + sin(h) * spoorH);
}

// Richting van het spoor bij die hoek, zodat de trein meedraait in de bocht
float richting(float h) {
  return atan2(cos(h) * spoorH, -sin(h) * spoorB);
}

// Hoeveel pixels je aflegt per stukje hoek (een ellips is niet overal even "snel")
float spoorSnelheid(float h) {
  return dist(0, 0, sin(h) * spoorB, cos(h) * spoorH);
}

// Loop vanaf hoek h een aantal pixels terug over het spoor
float hoekTerug(float h, float afstand) {
  float afgelegd = 0;
  while (afgelegd < afstand) {
    h -= 0.002;
    afgelegd += 0.002 * spoorSnelheid(h);
  }
  return h;
}

void tekenSpoor() {
  noFill();

  // grind onder het spoor
  stroke(150, 140, 120);
  strokeWeight(34);
  ellipse(spoorX, spoorY, spoorB * 2, spoorH * 2);

  // bielzen (dwarsliggers)
  stroke(110, 80, 50);
  strokeWeight(5);
  for (float h = 0; h < TWO_PI; h += 0.05) {
    PVector p = puntOpSpoor(h);
    pushMatrix();
    translate(p.x, p.y);
    rotate(richting(h));
    line(0, -15, 0, 15);
    popMatrix();
  }

  // twee rails
  stroke(90);
  strokeWeight(3);
  ellipse(spoorX, spoorY, (spoorB - 10) * 2, (spoorH - 10) * 2);
  ellipse(spoorX, spoorY, (spoorB + 10) * 2, (spoorH + 10) * 2);
}

// soort: 0 = locomotief, 1 = kolenwagen, 2+ = wagon
void tekenWagon(float h, int soort) {
  PVector p = puntOpSpoor(h);
  float l = lengte(soort);

  pushMatrix();
  translate(p.x, p.y);
  rotate(richting(h));
  rectMode(CENTER);

  // schaduw
  noStroke();
  fill(0, 50);
  rect(3, 4, l, 30, 6);

  // wielen (steken net uit aan de zijkant)
  fill(25);
  for (float x = -l/2 + 10; x <= l/2 - 8; x += (soort == 0 ? 16 : l - 18)) {
    rect(x, -15, 10, 5, 2);
    rect(x, 15, 10, 5, 2);
  }

  // koppeling naar achteren
  fill(60);
  rect(-l/2 - 3, 0, 6, 4);

  stroke(30);
  strokeWeight(1.5);

  if (soort == 0) {
    tekenLocomotief();
  } else if (soort == 1) {
    tekenKolenwagen();
  } else {
    tekenPersonenwagon();
  }

  popMatrix();
}

void tekenLocomotief() {
  // onderstel
  fill(150, 25, 25);
  rect(0, 0, LENGTE_LOC, 28, 4);

  // ketel (de lange ronde buis)
  fill(45);
  rect(10, 0, 44, 20, 10);
  stroke(110);
  line(-10, -5, 30, -5);  // glimlijn
  stroke(200, 160, 60);
  for (int x = -4; x <= 24; x += 14) {
    line(x, -10, x, 10);  // koperen banden
  }

  // stoomdom en schoorsteen
  stroke(30);
  fill(200, 160, 60);
  ellipse(6, 0, 10, 10);
  fill(20);
  ellipse(25, 0, 12, 12);
  fill(70);
  ellipse(25, 0, 6, 6);

  // cabine met dak
  fill(170, 30, 30);
  rect(-24, 0, 22, 30, 3);
  fill(110, 20, 20);
  rect(-24, 0, 16, 24, 3);

  // buffers en koplamp
  fill(60);
  ellipse(LENGTE_LOC/2 + 1, -9, 5, 5);
  ellipse(LENGTE_LOC/2 + 1, 9, 5, 5);
  fill(255, 230, 100);
  ellipse(LENGTE_LOC/2 - 2, 0, 7, 7);
}

void tekenKolenwagen() {
  fill(50);
  rect(0, 0, LENGTE_KOLEN, 28, 4);
  // kolen
  noStroke();
  fill(25);
  rect(0, 0, LENGTE_KOLEN - 8, 20, 3);
  fill(70);
  for (PVector k : kolen) {
    ellipse(k.x, k.y, 4, 4);
  }
}

void tekenPersonenwagon() {
  fill(35, 85, 160);
  rect(0, 0, LENGTE_WAGON, 28, 5);
  // dak
  fill(60, 115, 190);
  rect(0, 0, LENGTE_WAGON - 8, 14, 4);
  // ventilatoren op het dak
  fill(200);
  for (int x = -18; x <= 18; x += 12) {
    ellipse(x, 0, 5, 5);
  }
  // gele streep langs de zijkant
  stroke(230, 190, 60);
  strokeWeight(2);
  line(-LENGTE_WAGON/2 + 4, -11, LENGTE_WAGON/2 - 4, -11);
  line(-LENGTE_WAGON/2 + 4, 11, LENGTE_WAGON/2 - 4, 11);
}

// ---------- rook uit de schoorsteen ----------

class Rookwolk {
  float x, y, grootte, doorzicht;

  Rookwolk(float x, float y) {
    this.x = x;
    this.y = y;
    grootte = 8;
    doorzicht = 180;
  }

  void update() {
    x += random(-0.4, 0.4);
    y -= 0.5;          // stijgt een beetje op
    grootte += 0.5;
    doorzicht -= 3;
  }

  void teken() {
    noStroke();
    fill(230, doorzicht);
    ellipse(x, y, grootte, grootte);
  }
}

void updateRook(float locHoek) {
  // nieuwe wolk bij de schoorsteen (25 pixels voor het midden van de locomotief)
  if (!pauze && frameCount % 4 == 0) {
    PVector p = puntOpSpoor(locHoek);
    PVector schoorsteen = PVector.fromAngle(richting(locHoek)).mult(25);
    rook.add(new Rookwolk(p.x + schoorsteen.x, p.y + schoorsteen.y));
  }

  for (int i = rook.size() - 1; i >= 0; i--) {
    Rookwolk r = rook.get(i);
    if (!pauze) r.update();
    r.teken();
    if (r.doorzicht <= 0) rook.remove(i);
  }
}

// ---------- station ----------

void tekenStation() {
  rectMode(CORNER);
  float b = PERRON_R - PERRON_L;
  float h = PERRON_ONDER - PERRON_BOVEN;

  // perron met schaduw en tegels
  noStroke();
  fill(0, 40);
  rect(PERRON_L + 4, PERRON_BOVEN + 4, b, h, 3);
  fill(190);
  rect(PERRON_L, PERRON_BOVEN, b, h, 3);
  stroke(172);
  strokeWeight(1);
  for (float x = PERRON_L + 20; x < PERRON_R; x += 20) {
    line(x, PERRON_BOVEN, x, PERRON_ONDER);
  }

  // gele veiligheidslijn langs de rand
  stroke(240, 200, 40);
  strokeWeight(3);
  line(PERRON_L + 4, PERRON_BOVEN + 7, PERRON_R - 4, PERRON_BOVEN + 7);

  // naambord
  noStroke();
  fill(30, 50, 110);
  rect(spoorX - 62, PERRON_ONDER + 6, 124, 20, 3);
  fill(255);
  textSize(12);
  textAlign(CENTER, CENTER);
  text("Station Centraal", spoorX, PERRON_ONDER + 15);
  textAlign(LEFT, BASELINE);
}

// open deuren oplichten zolang de trein stilstaat
void tekenDeuren() {
  rectMode(CENTER);
  noStroke();
  fill(255, 230, 150);
  for (PVector d : deuren) {
    rect(d.x, d.y - 3, 10, 4, 1);
  }
}

// Trein staat net stil: deuren bepalen, mensen laten uitstappen en de wachtenden laten instappen
void startHalte(float[] hoeken) {
  deuren.clear();
  for (int i = 2; i < hoeken.length; i++) {
    float h = hoeken[i];
    PVector p = puntOpSpoor(h);
    PVector langs = PVector.fromAngle(richting(h));
    PVector buiten = new PVector(cos(h) * spoorH, sin(h) * spoorB).normalize();  // van het spoor af, naar het perron
    for (int k = -1; k <= 1; k += 2) {
      deuren.add(PVector.add(p, PVector.mult(langs, k * 16)).add(PVector.mult(buiten, 17)));
    }
  }

  int uit = int(passagiers * random(0.2, 0.5));
  for (int i = 0; i < uit; i++) {
    reizigers.add(new Reiziger(deuren.get(int(random(deuren.size()))), i * 5));
  }

  int plaats = CAPACITEIT - passagiers + uit;
  int n = 0;
  for (Reiziger r : reizigers) {
    if ((r.fase == WACHT || r.fase == AANKOMST) && n < plaats) {
      r.instappen(dichtsteDeur(r.pos), n * 4);
      n++;
    }
  }
}

PVector dichtsteDeur(PVector pos) {
  PVector beste = deuren.get(0);
  for (PVector d : deuren) {
    if (PVector.dist(pos, d) < PVector.dist(pos, beste)) beste = d;
  }
  return beste;
}

// zolang er nog iemand in- of uitstapt mag de trein niet vertrekken
boolean iemandBezig() {
  for (Reiziger r : reizigers) {
    if (r.fase == IN || (r.fase == UIT && r.inTrein)) return true;
  }
  return false;
}

int aantalWachtend() {
  int n = 0;
  for (Reiziger r : reizigers) {
    if (r.fase == WACHT || r.fase == AANKOMST) n++;
  }
  return n;
}

void updateReizigers() {
  // af en toe komt er iemand nieuw het perron op
  if (!pauze && !gestopt && random(1) < 0.012 && aantalWachtend() < 14) {
    reizigers.add(new Reiziger());
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

// ---------- reizigers ----------

final int AANKOMST = 0;  // loopt het perron op
final int WACHT = 1;     // staat te wachten
final int IN = 2;        // loopt naar een deur
final int UIT = 3;       // stapt uit, loopt het perron op
final int WEG = 4;       // loopt van het perron af

class Reiziger {
  PVector pos, doel;
  int fase;
  int wachttijd = 0;      // even wachten voor je begint te lopen (zo stapt niet iedereen tegelijk)
  boolean inTrein = false;
  float doorzicht = 255;
  float stapjes = random(TWO_PI);

  // nieuwe reiziger die vanaf een uiteinde het perron op loopt
  Reiziger() {
    float x = random(1) < 0.5 ? PERRON_L + 6 : PERRON_R - 6;
    pos = new PVector(x, random(PERRON_BOVEN + 16, PERRON_ONDER - 8));
    doel = new PVector(random(PERRON_L + 20, PERRON_R - 20), random(PERRON_BOVEN + 16, PERRON_ONDER - 8));
    fase = AANKOMST;
  }

  // reiziger die uitstapt bij een deur
  Reiziger(PVector deur, int vertraging) {
    pos = deur.copy();
    doel = new PVector(deur.x + random(-15, 15), random(PERRON_BOVEN + 18, PERRON_ONDER - 10));
    fase = UIT;
    inTrein = true;
    wachttijd = vertraging;
  }

  void instappen(PVector deur, int vertraging) {
    fase = IN;
    doel = deur.copy();
    wachttijd = vertraging;
  }

  // geeft true terug als de reiziger weg is (ingestapt of van het perron af)
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

    if (stap()) {
      if (fase == AANKOMST) {
        fase = WACHT;
      } else if (fase == IN) {
        passagiers++;
        totaalIn++;
        return true;
      } else if (fase == UIT) {
        // naar het dichtstbijzijnde uiteinde van het perron
        fase = WEG;
        float x = pos.x < spoorX ? PERRON_L - 8 : PERRON_R + 8;
        doel = new PVector(x, pos.y);
      } else if (fase == WEG) {
        doorzicht -= 25;
        return doorzicht <= 0;
      }
    }
    return false;
  }

  // een stapje naar het doel, true als je er bent
  boolean stap() {
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
    boolean loopt = fase != WACHT && !pos.equals(doel);
    float wiebel = loopt ? sin(frameCount * 0.5 + stapjes) * 0.8 : 0;
    noStroke();
    fill(0, 40 * doorzicht / 255);
    ellipse(pos.x + 1.5, pos.y + 2, 9, 9);
    fill(15, doorzicht);
    ellipse(pos.x, pos.y + wiebel, 9, 9);
  }
}

// ---------- dashboard (nep-website rechts) ----------

void tekenDashboard() {
  pushStyle();
  float x0 = 800;
  float w = width - x0;
  rectMode(CORNER);
  textAlign(LEFT, BASELINE);
  noStroke();

  // pagina
  fill(238, 241, 246);
  rect(x0, 0, w, height);

  // browserbalk met de drie knopjes en een adresbalk
  fill(52, 56, 64);
  rect(x0, 0, w, 36);
  fill(255, 95, 87);
  ellipse(x0 + 16, 18, 11, 11);
  fill(255, 189, 46);
  ellipse(x0 + 32, 18, 11, 11);
  fill(40, 200, 64);
  ellipse(x0 + 48, 18, 11, 11);
  fill(80, 85, 95);
  rect(x0 + 66, 8, w - 80, 20, 10);
  fill(205);
  textSize(11);
  text("treinmonitor.local/dashboard", x0 + 80, 22);

  // kop met knipperend LIVE-lampje
  fill(25, 30, 40);
  textSize(20);
  text("TreinMonitor", x0 + 16, 66);
  fill(220, 40, 40, (frameCount / 30) % 2 == 0 ? 255 : 70);
  ellipse(x0 + w - 56, 60, 8, 8);
  fill(220, 40, 40);
  textSize(11);
  text("LIVE", x0 + w - 48, 64);
  fill(120, 125, 135);
  text("Laatste update: " + nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2), x0 + 16, 84);

  // kaartjes met cijfers, 2 kolommen
  float kb = (w - 16 * 2 - 10) / 2;  // breedte van een kaartje
  float kh = 78;
  float k1 = x0 + 16, k2 = k1 + kb + 10;
  boolean staatStil = gestopt || pauze;
  int kmu = staatStil ? 0 : round(snelheid * factor * 20);

  kaart(k1, 100, kb, kh, "Rondes gereden", str(rondes()), "sinds de start");
  kaart(k2, 100, kb, kh, "Passagiers aan boord", passagiers + "", null);
  // bezettingsbalkje
  float bezet = passagiers / float(CAPACITEIT);
  fill(225, 228, 235);
  rect(k2 + 12, 100 + 60, kb - 24, 6, 3);
  if (bezet > 0.8) fill(230, 120, 40);
  else fill(40, 160, 90);
  rect(k2 + 12, 100 + 60, (kb - 24) * bezet, 6, 3);
  fill(120, 125, 135);
  textSize(11);
  textAlign(RIGHT, BASELINE);
  text("/ " + CAPACITEIT, k2 + kb - 12, 100 + 50);
  textAlign(LEFT, BASELINE);

  kaart(k1, 186, kb, kh, "Wachtend op perron", str(aantalWachtend()), "Station Centraal");
  kaart(k2, 186, kb, kh, "Snelheid", kmu + " km/u", "ingesteld: " + round(snelheid * 20) + " km/u");
  kaart(k1, 272, kb, kh, "Ingestapt", str(totaalIn), "vandaag");
  kaart(k2, 272, kb, kh, "Uitgestapt", str(totaalUit), "vandaag");

  // statusbalk
  float sb = w - 32;
  fill(0, 18);
  rect(k1 + 1, 362, sb, 40, 8);
  fill(255);
  rect(k1, 360, sb, 40, 8);
  String status, extra;
  if (pauze) {
    fill(150);
    status = "Gepauzeerd";
    extra = "";
  } else if (gestopt) {
    fill(230, 150, 30);
    status = "Halteert in Station Centraal";
    extra = "in- en uitstappen";
  } else {
    fill(40, 170, 90);
    status = "Onderweg";
    extra = "volgende halte: " + max(0, round(afstandTotHalte / 10)) + " m";
  }
  ellipse(k1 + 18, 380, 10, 10);
  fill(25, 30, 40);
  textSize(13);
  text(status, k1 + 32, 385);
  fill(120, 125, 135);
  textSize(11);
  textAlign(RIGHT, BASELINE);
  text(extra, k1 + sb - 12, 384);
  textAlign(LEFT, BASELINE);

  tekenGrafiek(k1, 410, sb, height - 410 - 16);
  popStyle();
}

void kaart(float x, float y, float w, float h, String label, String waarde, String extra) {
  noStroke();
  fill(0, 18);
  rect(x + 1, y + 2, w, h, 8);
  fill(255);
  rect(x, y, w, h, 8);
  fill(120, 125, 135);
  textSize(10);
  text(label.toUpperCase(), x + 12, y + 20);
  fill(25, 30, 40);
  textSize(26);
  text(waarde, x + 12, y + 50);
  if (extra != null) {
    fill(120, 125, 135);
    textSize(11);
    text(extra, x + 12, y + h - 10);
  }
}

// lijngrafiek van de bezetting over de laatste 20 seconden
void tekenGrafiek(float x, float y, float w, float h) {
  noStroke();
  fill(0, 18);
  rect(x + 1, y + 2, w, h, 8);
  fill(255);
  rect(x, y, w, h, 8);
  fill(120, 125, 135);
  textSize(10);
  text("BEZETTING - LAATSTE 20 SECONDEN", x + 12, y + 20);

  float gx = x + 30, gy = y + 32, gb = w - 42, gh = h - 44;

  // hulplijnen bij 0, de helft en vol
  textAlign(RIGHT, CENTER);
  textSize(9);
  for (int i = 0; i <= 2; i++) {
    float ly = gy + gh - gh * i / 2;
    stroke(232);
    strokeWeight(1);
    line(gx, ly, gx + gb, ly);
    fill(150);
    text(CAPACITEIT * i / 2, gx - 6, ly);
  }
  textAlign(LEFT, BASELINE);

  int n = geschiedenis.size();
  if (n < 2) return;
  float stapX = gb / (MAX_PUNTEN - 1);

  // gevulde vlak onder de lijn
  noStroke();
  fill(50, 110, 220, 40);
  beginShape();
  vertex(gx, gy + gh);
  for (int i = 0; i < n; i++) {
    vertex(gx + i * stapX, gy + gh - gh * geschiedenis.get(i) / CAPACITEIT);
  }
  vertex(gx + (n - 1) * stapX, gy + gh);
  endShape(CLOSE);

  // de lijn zelf
  noFill();
  stroke(50, 110, 220);
  strokeWeight(2);
  beginShape();
  for (int i = 0; i < n; i++) {
    vertex(gx + i * stapX, gy + gh - gh * geschiedenis.get(i) / CAPACITEIT);
  }
  endShape();

  // stip op de laatste waarde
  noStroke();
  fill(50, 110, 220);
  ellipse(gx + (n - 1) * stapX, gy + gh - gh * geschiedenis.get(n - 1) / CAPACITEIT, 6, 6);
}

void keyPressed() {
  if (key == ' ') {
    pauze = !pauze;
  } else if (keyCode == UP) {
    snelheid = min(snelheid + 0.5, 8);
  } else if (keyCode == DOWN) {
    snelheid = max(snelheid - 0.5, 0.5);
  }
}
