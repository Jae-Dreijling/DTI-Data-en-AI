// 
// uitgewerkt met AI-hulp.
// Alleen uitlezen en tekenen: de drie oorspronkelijke tabbladen zijn ongewijzigd.
// Automatische registratie: geen extra setup()- of draw()-aanroep nodig.

DashboardUitbreiding dashboardUitbreiding = new DashboardUitbreiding();

class RitDetail {
  Traject rit;
  int nummer, sessie, rondeNummer, beginBestemming;
  boolean bestemmingGewijzigd = false;
  IntList gepasseerd = new IntList();
  int laatsteSpoor = -1, laatsteEind = -1;
  RitDetail(Traject t, int n, int s) {
    rit = t; nummer = n; sessie = s; rondeNummer = ronde;
    beginBestemming = t.naar;
    gepasseerd.append(t.van);
  }
  void leesPad() {
    if (rit.klaar()) {
      voegKnoop(rit.naar);
      if (rit.naar != beginBestemming) bestemmingGewijzigd = true;
      return;
    }
    if (rit != trajectNu) return;
    if (stops.size() > 0 && stops.get(0) != beginBestemming) bestemmingGewijzigd = true;
    if (toestand == RIJDT || toestand == OBSTAKEL) {
      if (laatsteSpoor != spoorNu && laatsteSpoor >= 0) voegKnoop(laatsteEind);
      laatsteSpoor = spoorNu;
      Spoor s = sporen.get(spoorNu);
      laatsteEind = vooruit ? s.b : s.a;
    }
  }
  void voegKnoop(int k) {
    if (k >= 0 && (gepasseerd.size() == 0 || gepasseerd.get(gepasseerd.size()-1) != k)) gepasseerd.append(k);
  }
}

public class DashboardUitbreiding {
  int tab = 1; // 0 = bestaand overzicht, 1 = ritten, 2 = sporen, 3 = analyse
  int laatstFrame = -1, sessie = 1, volgendNummer = 1;
  int scrollRitten = 0;
  ArrayList<RitDetail> ritten = new ArrayList<RitDetail>();
  java.util.IdentityHashMap<Traject, RitDetail> index = new java.util.IdentityHashMap<Traject, RitDetail>();
  String[] tabs = {"Overzicht", "Ritten", "Sporen", "Analyse"};
  java.util.HashMap<Integer,String> afsluitRedenen = new java.util.HashMap<Integer,String>();
  DashboardAnalyse analyse = new DashboardAnalyse(this);
  final float TOLERANTIE = 0.5; // simulatieminuten

  DashboardUitbreiding() {
    registerMethod("draw", this);
    registerMethod("mouseEvent", this);
  }

  public void draw() {
    if (sporen.size() == 0) return;
    if (laatstFrame >= 0 && simFrames < laatstFrame) {
      sessie++;
      scrollRitten = 0;
      afsluitRedenen.clear();
    }
    laatstFrame = simFrames;
    for (Traject t : vorige) onthoud(t);
    for (Traject t : deze) onthoud(t);
    // Bewaar ook afgeronde rondes. Het spel zelf bewaart alleen deze/vorige.
    for (RitDetail d : ritten) d.leesPad();
    pushStyle();
    pushMatrix();
    resetMatrix();
    clip(W_NET, 0, width-W_NET, height);
    rectMode(CORNER);
    textAlign(LEFT, BASELINE);
    if (tab != 0) {
      noStroke(); fill(239, 243, 249); rect(W_NET, 0, width-W_NET, height);
    }
    kop();
    if (tab == 1) tekenRitten();
    else if (tab == 2) tekenNetwerk();
    else if (tab == 3) analyse.teken();
    noClip();
    popMatrix();
    popStyle();
  }

  void onthoud(Traject t) {
    if (!index.containsKey(t)) {
      RitDetail d = new RitDetail(t, volgendNummer++, sessie);
      index.put(t, d); ritten.add(d);
      // Begrens geheugen bij lang gebruik op een open dag.
      if (ritten.size() > 5000) {
        RitDetail oud = ritten.remove(0); index.remove(oud.rit);
      }
    }
  }

  void kop() {
    float x = W_NET, w = width-W_NET;
    noStroke(); fill(22, 34, 53); rect(x,0,w,52);
    fill(255); textSize(18); text("TreinMonitor",x+16,25);
    fill(175,199,224);textSize(10);
    text("SIMULATIE  |  "+klok(simFrames)+"  |  sessie "+sessie+(pauze ? "  |  PAUZE" : ""),x+16,42);
    fill(239,243,249); rect(x,52,w,44);
    float tw=(w-24)/4;
    for (int i=0;i<4;i++) {
      fill(tab==i ? color(36,95,169) : color(222,230,241));
      rect(x+12+i*tw,59,tw-4,29,5);
      fill(tab==i ? color(255) : color(48,63,85));textSize(11);textAlign(CENTER,CENTER);
      text(tabs[i],x+12+i*tw+(tw-4)/2,73);
    }
    textAlign(LEFT,BASELINE);
  }

  void paneel(float y,float h,String titel) {
    noStroke();fill(255);rect(W_NET+12,y,width-W_NET-24,h,7);
    fill(70,88,112);textSize(11);text(titel,W_NET+24,y+20);
  }
  String node(int k) {return k==X ? "X" : (k>=0 && k<CODE.length ? CODE[k] : "?");}
  String nodes(IntList lijst) {
    StringList s=new StringList();for(int i=0;i<lijst.size();i++)s.append(node(lijst.get(i)));return s.join(" > ");
  }
  String spoorLabel(int e) {Spoor s=sporen.get(e);return node(s.a)+" - "+node(s.b);}
  String afsluitReden(int e) {return afsluitRedenen.containsKey(e) ? afsluitRedenen.get(e) : "Handmatige afsluiting";}
  float minuten(float frames) {return frames/60.0;}
  String minTekst(float v) {return nf(v,0,1)+" min";}
  String verschil(float v) {return (v>0 ? "+" : "")+nf(v,0,1);}
  int kleur(float delta) {return delta>TOLERANTIE ? color(201,64,55) : delta < -TOLERANTIE ? color(34,129,172) : color(39,148,91);}
  String klasse(float delta) {return delta>TOLERANTIE ? "VERTRAAGD" : delta < -TOLERANTIE ? "VROEGER" : "OP TIJD";}

  IntList verwachteKnopen() {
    IntList k=new IntList();
    if(stops.size()==0)return k;
    int doel=stops.get(0), begin=knoopNu, verboden=spoorNu;
    if(toestand==RIJDT || toestand==OBSTAKEL) {
      Spoor s=sporen.get(spoorNu);begin=vooruit ? s.b : s.a;
      k.append(vooruit ? s.a : s.b);k.append(begin);
    } else k.append(begin);
    if(begin==doel)return k;
    IntList rest=route(begin,doel,verboden,true);
    if(rest==null)return k;
    for(int i=0;i<rest.size();i++){begin=sporen.get(rest.get(i)).ander(begin);k.append(begin);}
    return k;
  }

  float verwachtAankomst() {
    if(trajectNu==null || stops.size()==0 || toestand==GEEN_ROUTE)return -1;
    int doel=stops.get(0), begin=knoopNu;
    float frames=0;
    if(toestand==RIJDT || toestand==OBSTAKEL) {
      Spoor s=sporen.get(spoorNu);begin=vooruit ? s.b : s.a;
      frames+=max(0,s.len-dOp)/max(.1,snelheid);
      for(Obstakel o:obstakels) if(o.spoor==spoorNu) {
        float od=vooruit ? o.d : s.len-o.d;
        if(o==obstakelNu)frames+=max(0,OBSTAKEL_TIJD-timer);
        else if(od>=dOp)frames+=OBSTAKEL_TIJD;
      }
      // Benadering voor optrekken/remmen; geen gemeten aankomsttijd.
      frames+=OPTREKKEN;
    }
    if(begin!=doel) {
      IntList rest=route(begin,doel,spoorNu,true);
      if(rest==null)return -1;
      for(int i=0;i<rest.size();i++){
        Spoor s=sporen.get(rest.get(i));frames+=s.len/max(.1,snelheid)+s.aantalObstakels()*OBSTAKEL_TIJD;
      }
    }
    return simFrames+frames;
  }

  String ritTekst() {
    if(pauze)return "Simulatie gepauzeerd. De trein en de simulatieklok staan stil.";
    if(toestand==HALTE)return "Trein staat bij station "+node(knoopNu)+" ("+NAAM[knoopNu]+"). Reizigers stappen in en uit.";
    if(toestand==GEEN_ROUTE)return "Geen open route vanaf "+node(knoopNu)+" naar station "+(stops.size()>0 ? node(stops.get(0)) : "?")+". Open een spoor om verder te rijden.";
    String van=trajectNu!=null ? node(trajectNu.van) : "?";
    String naar=stops.size()>0 ? node(stops.get(0)) : "?";
    String via=nodes(verwachteKnopen());
    return "Trein is onderweg van station "+van+" naar station "+naar+". Verwachte route: "+via+"."+(toestand==OBSTAKEL ? " De trein wacht nu bij een obstakel." : "");
  }

  ArrayList<RitDetail> sessieRitten() {
    ArrayList<RitDetail> r=new ArrayList<RitDetail>();
    for(RitDetail d:ritten)if(d.sessie==sessie)r.add(d);return r;
  }

  void tekenRitten() {
    float x=W_NET+24,w=width-W_NET-48;
    paneel(100,115,"ACTUELE RIT EN ROUTE");
    fill(30,48,72);textSize(12);text(ritTekst(),x,130,w,62);
    textSize(10);fill(115,128,146);
    text("X = kruising  |  1 echte seconde = 1 simulatieminuut",x,200);

    paneel(224,172,"REISTIJD PER TRAJECT  |  gepland / gemeten");
    ArrayList<RitDetail> klaar=new ArrayList<RitDetail>();
    for(RitDetail d:sessieRitten())if(d.rit.klaar() && !d.bestemmingGewijzigd)klaar.add(d);
    int begin=max(0,klaar.size()-4);float schaal=1;
    for(int i=begin;i<klaar.size();i++)schaal=max(schaal,max(minuten(klaar.get(i).rit.geplandeReistijd),klaar.get(i).rit.reistijd()));
    float bw=w-157;
    if(klaar.size()==0){fill(110,125,144);textSize(12);text("De grafiek verschijnt na de eerste aankomst.",x,275,w,40);}
    for(int i=begin;i<klaar.size();i++){
      RitDetail d=klaar.get(i);Traject t=d.rit;float y=257+(i-begin)*28;
      fill(45,65,90);textSize(10);text("#"+d.nummer+" "+node(t.van)+" > "+node(t.naar),x,y+10);
      fill(183,195,213);rect(x+80,y,bw*minuten(t.geplandeReistijd)/schaal,7,2);
      fill(kleur(t.reistijd()-minuten(t.geplandeReistijd)));rect(x+80,y+10,bw*t.reistijd()/schaal,7,2);
      fill(70,85,105);text(nf(minuten(t.geplandeReistijd),0,1)+" / "+nf(t.reistijd(),0,1),x+w-64,y+12);
    }
    fill(120,133,151);textSize(9);text("Grijs: gepland  |  kleur: gemeten  |  waarden in simulatieminuten",x,383);

    paneel(405,208,"DIENSTREGELING  |  aankomst en afwijking");
    fill(115,128,147);textSize(9);
    text("RIT",x,443);text("PLAN",x+100,443);text("WERK / ETA",x+160,443);text("VERSCHIL",x+w-69,443);
    ArrayList<RitDetail> sr=sessieRitten();
    scrollRitten=constrain(scrollRitten,0,max(0,sr.size()-5));
    int einde=max(0,sr.size()-scrollRitten),start=max(0,einde-5);
    for(int i=start;i<einde;i++){
      RitDetail d=sr.get(i);Traject t=d.rit;float y=465+(i-start)*25;
      stroke(236,240,246);line(x,y+8,x+w,y+8);noStroke();
      fill(35,52,74);textSize(10);text("#"+d.nummer+" "+node(t.van)+" > "+node(t.klaar()?t.naar:(stops.size()>0?stops.get(0):t.naar)),x,y);
      if(d.bestemmingGewijzigd){fill(177,115,29);text("Bestemming gewijzigd - niet vergelijkbaar",x+100,y);continue;}
      text(klok(t.geplandAankomst),x+100,y);
      float eta=t.klaar()?t.aankomst:(t==trajectNu?verwachtAankomst():-1);
      text(eta>=0 ? klok(eta)+(t.klaar()?"":" *") : "--",x+160,y);
      if(eta>=0){float delta=minuten(eta-t.geplandAankomst);fill(kleur(delta));text(verschil(delta)+(t.klaar()?"":" *"),x+w-69,y);}
    }
    fill(115,128,147);textSize(9);text("* Schatting, geen meting. Muiswiel: oudere ritten.",x,602);

    paneel(622,84,"OORZAAK EN INTERPRETATIE");
    String oorzaak=trajectNu!=null ? trajectNu.oorzaak() : (sr.size()>0 ? sr.get(sr.size()-1).rit.oorzaak() : "Nog geen rit gemeten");
    fill(40,58,81);textSize(11);text("Geregistreerde factoren: "+oorzaak,x,650,w,28);
    fill(115,128,147);textSize(9);text("Op tijd: binnen +/- 0,5 simulatieminuut van het rooster.",x,692);
  }

  void tekenNetwerk() {
    float x=W_NET+24,w=width-W_NET-48;
    paneel(100,104,"BESCHIKBAARHEID VAN HET SPOOR");
    int dicht=0,gehinderd=0;for(Spoor s:sporen){if(s.dicht)dicht++;if(s.aantalObstakels()>0)gehinderd++;}
    fill(31,53,80);textSize(24);text(dicht+" dicht   /   "+gehinderd+" met obstakel",x,151);
    fill(110,126,145);textSize(10);text("Een obstakel veroorzaakt hinder; het spoor kan nog open zijn.",x,179,w,20);
    paneel(214,337,"SPOORSTATUS  |  directe uitlezing uit de simulatie");
    fill(110,126,145);textSize(10);text("VERBINDING",x,257);text("STATUS",x+106,257);text("OBSTAKELS",x+w-83,257);
    for(int i=0;i<sporen.size();i++){
      Spoor s=sporen.get(i);float y=281+i*32;
      stroke(232,237,244);line(x,y+19,x+w,y+19);noStroke();
      fill(40,58,81);textSize(12);text(spoorLabel(i),x,y);
      fill(s.dicht?color(195,61,54):s.aantalObstakels()>0?color(191,127,31):color(35,144,92));
      text(s.dicht?"AFGESLOTEN":s.aantalObstakels()>0?"HINDER":"OPEN",x+106,y);
      fill(55,73,94);text(str(s.aantalObstakels()),x+w-50,y);
      if(s.dicht){textSize(9);fill(120,130,146);text(afsluitReden(i),x+106,y+12);}
    }
    fill(115,128,147);textSize(9);text("Klik een afgesloten rij: handmatig / bouw / onderhoud.",x,540);
    paneel(561,145,"WAT BETEKENT DIT VOOR DE RIT?");
    fill(40,58,81);textSize(12);text(ritTekst(),x,590,w,65);
    fill(115,128,147);textSize(10);text("Klik links op een spoor om het te sluiten/openen.\nRechtsklik: obstakel. De reden rechts is een label;\nbouw en onderhoud sluiten niets automatisch af.",x,658,w,44);
  }

  public void mouseEvent(processing.event.MouseEvent e) {
    if(e.getX()<W_NET)return;
    if(e.getAction()==processing.event.MouseEvent.WHEEL && tab==1){scrollRitten+=e.getCount();return;}
    if(e.getAction()!=processing.event.MouseEvent.PRESS)return;
    float tw=(width-W_NET-24)/4.0;
    if(e.getY()>=59 && e.getY()<=88){int i=int((e.getX()-W_NET-12)/tw);if(i>=0&&i<4)tab=i;return;}
    if(tab==2 && e.getY()>=267 && e.getY()<523){
      int i=int((e.getY()-267)/32);
      if(i>=0 && i<sporen.size() && sporen.get(i).dicht){
        String r=afsluitReden(i);
        afsluitRedenen.put(i,r.equals("Handmatige afsluiting")?"Bouwwerkzaamheden":r.equals("Bouwwerkzaamheden")?"Onderhoud":"Handmatige afsluiting");
      }
      return;
    }
  }
}
