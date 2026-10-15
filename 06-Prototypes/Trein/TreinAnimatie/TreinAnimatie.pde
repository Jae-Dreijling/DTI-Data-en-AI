// Trein-animatie (concept 1, achtervang als de Arduino-auto er niet is)
// Een stoomlocomotief met kolenwagen en 2 wagons rijdt rond over een ovaal spoor.
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

// Spoor = ellips rond het midden
float spoorB, spoorH;   // halve breedte en halve hoogte

ArrayList<Rookwolk> rook = new ArrayList<Rookwolk>();
PVector[] kolen = new PVector[14];  // klontjes kolen, 1 keer gekozen zodat ze niet flikkeren

void setup() {
  size(800, 500);
  spoorB = 300;
  spoorH = 170;
  for (int i = 0; i < kolen.length; i++) {
    kolen[i] = new PVector(random(-14, 14), random(-8, 8));
  }
}

void draw() {
  background(120, 180, 100);  // gras
  tekenSpoor();

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

  updateRook(hoeken[0]);

  if (!pauze) {
    // delen door de lokale snelheid: zo rijdt de trein overal even hard
    hoek += snelheid / spoorSnelheid(hoek);
  }

  fill(255);
  textSize(14);
  text("snelheid: " + nf(snelheid, 1, 1) + "   (pijltjes = sneller/langzamer, spatie = pauze)", 15, height - 15);
}

float lengte(int i) {
  if (i == 0) return LENGTE_LOC;
  if (i == 1) return LENGTE_KOLEN;
  return LENGTE_WAGON;
}

// Punt op het spoor bij een bepaalde hoek
PVector puntOpSpoor(float h) {
  return new PVector(width/2 + cos(h) * spoorB, height/2 + sin(h) * spoorH);
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
  ellipse(width/2, height/2, spoorB * 2, spoorH * 2);

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
  ellipse(width/2, height/2, (spoorB - 10) * 2, (spoorH - 10) * 2);
  ellipse(width/2, height/2, (spoorB + 10) * 2, (spoorH + 10) * 2);
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

void keyPressed() {
  if (key == ' ') {
    pauze = !pauze;
  } else if (keyCode == UP) {
    snelheid = min(snelheid + 0.5, 8);
  } else if (keyCode == DOWN) {
    snelheid = max(snelheid - 0.5, 0.5);
  }
}
