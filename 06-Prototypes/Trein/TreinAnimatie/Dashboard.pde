// ---------- dashboard (nep-website rechts) ----------
// Dit tabblad is het dashboard: hier mag je vrij aan werken zonder het spel (TreinAnimatie) te raken.
// Gegevens uit het spel die je kunt gebruiken:
//   ronde, passagiers, CAPACITEIT, aantalWachtend(), aantalWachtend(station), snelheid, factor,
//   toestand (RIJDT / HALTE / OBSTAKEL / GEEN_ROUTE), pauze, knoopNu, stops, totaalIn, totaalUit,
//   geschiedenis (bezetting door de tijd), en per traject de metingen in deze/vorige (zie Metingen).

FloatList geschiedenis = new FloatList();  // bezetting door de tijd, voor het grafiekje
int MAX_PUNTEN = 120;
int totaalIn = 0, totaalUit = 0;

// wordt elk frame vanuit draw() aangeroepen (niet tijdens pauze)
void meetBezetting() {
  if (frameCount % 10 == 0) {
    geschiedenis.append(passagiers);
    if (geschiedenis.size() > MAX_PUNTEN) geschiedenis.remove(0);
  }
}

void tekenDashboard() {
  pushStyle();
  float x0 = W_NET;
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
  boolean staatStil = toestand != RIJDT || pauze;
  int kmu = staatStil ? 0 : round(snelheid * factor * 20);

  kaart(k1, 100, kb, kh, "Rondes gereden", str(ronde - 1), "sinds de start");
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

  kaart(k1, 186, kb, kh, "Wachtend op perrons", str(aantalWachtend()), "alle stations");
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
  } else if (toestand == HALTE) {
    fill(230, 150, 30);
    status = "Halteert in station " + CODE[knoopNu] + " (" + NAAM[knoopNu] + ")";
    extra = "in- en uitstappen";
  } else if (toestand == OBSTAKEL) {
    fill(230, 150, 30);
    status = "Wacht op het spoor";
    extra = "obstakel wordt opgeruimd";
  } else if (toestand == GEEN_ROUTE) {
    fill(200, 50, 50);
    status = "Staat stil";
    extra = "geen open route";
  } else {
    fill(40, 170, 90);
    status = "Onderweg";
    extra = "volgende halte: " + CODE[stops.get(0)] + " (" + NAAM[stops.get(0)] + ")";
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
