// Metingen per traject (gepland vs. gemeten), bijgehouden door het spel.
// Het spel vult: deze (trajecten van de huidige ronde), vorige (vorige ronde) en trajectNu (lopend traject).
// Het dashboard mag deze gegevens gebruiken en tonen.
// Autheur: (maryam neerzetten als je eraan zit!)
// (ruimte for refs of ai)
// (datum)

// ---------- metingen ----------

class Traject {
  int van, naar;
  float geplandeAfstand, geplandeReistijd, geplandVertrek, geplandAankomst;
  float vertrek, aankomst = -1, afstand = 0, stoptijd;
  boolean obstakel = false, dicht = false, langzaam = false;

  boolean klaar() {
    return aankomst >= 0;
  }
  float reistijd() {
    return ((klaar() ? aankomst : simFrames) - vertrek) / 60.0;
  }
  float vertraging() {
    return ((klaar() ? aankomst : simFrames) - geplandAankomst) / 60.0;
  }
  // waardoor de trein te laat (of te vroeg) is
  String oorzaak() {
    StringList o = new StringList();
    if (obstakel) o.append("obstakel");
    if (dicht) o.append("spoor dicht");
    if (afstand > geplandeAfstand * 1.05 + 20) o.append("omweg");
    if (stoptijd > HALTE_PLAN + 60) o.append("druk perron");
    if (langzaam) o.append("lage snelheid");
    if (o.size() == 0 && round(vertraging()) > 0) o.append("eerdere vertraging");
    if (o.size() == 0) return "-";
    return o.join(", ");
  }
}

String klok(float frames) {
  int m = 600 + floor(frames / 60);  // de simulatie begint om 10:00, 1 seconde = 1 minuut
  return nf((m / 60) % 24, 2) + ":" + nf(m % 60, 2);
}
