// Extra code-tabblad: alle analyses worden rechtstreeks in Processing getekend.
// Maryam / DTI, 4 november 2026; uitgewerkt met AI-hulp.
class DashboardAnalyse {
  DashboardUitbreiding d;
  DashboardAnalyse(DashboardUitbreiding dashboard) { d=dashboard; }

  void teken() {
    float x=W_NET+24, w=width-W_NET-48;
    ArrayList<RitDetail> gemeten=new ArrayList<RitDetail>();
    int vroeg=0, opTijd=0, laat=0;
    float totaalVerschil=0;
    for(RitDetail r:d.sessieRitten()) {
      if(!r.rit.klaar() || r.bestemmingGewijzigd)continue;
      gemeten.add(r);
      float v=r.rit.vertraging();totaalVerschil+=v;
      if(v>d.TOLERANTIE)laat++;
      else if(v < -d.TOLERANTIE)vroeg++;
      else opTijd++;
    }
    int n=gemeten.size();
    d.paneel(100,95,"RESULTATEN VAN DEZE SESSIE");
    fill(32,51,77);textSize(25);text(n+(n==1?" rit gemeten":" ritten gemeten"),x,148);
    fill(111,126,146);textSize(11);
    text(n>0?round(100.0*opTijd/n)+"% op tijd  |  gemiddeld "+d.verschil(totaalVerschil/n)+" min":"Laat de trein eerst bij een station aankomen.",x,177);

    d.paneel(205,145,"VROEGER OF LATER DAN DE DIENSTREGELING");
    String[] labels={"Vroeger","Op tijd","Vertraagd"};
    int[] aantallen={vroeg,opTijd,laat};
    int[] kleuren={color(34,129,172),color(39,148,91),color(201,64,55)};
    float bw=w-125;
    for(int i=0;i<3;i++){
      float y=244+i*31;
      fill(55,73,96);textSize(11);text(labels[i],x,y+10);
      noStroke();fill(234,239,246);rect(x+84,y,bw,16,3);
      fill(kleuren[i]);rect(x+84,y,n>0?bw*aantallen[i]/float(n):0,16,3);
      fill(55,73,96);text(str(aantallen[i]),x+w-22,y+12);
    }

    d.paneel(360,200,"AANKOMSTVERSCHIL VAN DE LAATSTE 12 RITTEN");
    float gx=x+30,gw=w-45,cy=455,half=55;
    float maxV=1;
    int begin=max(0,n-12);
    for(int i=begin;i<n;i++)maxV=max(maxV,abs(gemeten.get(i).rit.vertraging()));
    stroke(207,217,232);strokeWeight(1);line(gx,cy,gx+gw,cy);noStroke();
    fill(115,128,147);textSize(9);text("0",x+12,cy+3);
    text("+"+nf(maxV,0,1),x,cy-half+3);text("-"+nf(maxV,0,1),x,cy+half+3);
    int count=n-begin;
    if(count==0){textSize(11);text("Nog geen afgeronde ritten.",gx+12,cy-12);}
    for(int i=begin;i<n;i++){
      RitDetail r=gemeten.get(i);float v=r.rit.vertraging();
      float step=gw/max(1,count),bx=gx+(i-begin)*step+4,bh=abs(v)/maxV*half;
      fill(d.kleur(v));rect(bx,v>=0?cy-bh:cy,max(3,step-8),max(2,bh),2);
      fill(115,128,147);textSize(8);textAlign(CENTER,BASELINE);text("#"+r.nummer,bx+max(3,step-8)/2,cy+half+17);textAlign(LEFT,BASELINE);
    }
    fill(115,128,147);textSize(9);text("Boven nul = later. Onder nul = vroeger. Eenheid: sim-minuten.",x,546);

    d.paneel(570,136,"WAT ZIE JE IN DE DATA?");
    String uitleg=n==0?"Verander links de snelheid of plaats een obstakel. Na aankomst zie je het effect op deze pagina.":
      "Van "+n+" gemeten ritten kwamen er "+opTijd+" op tijd, "+vroeg+" vroeger en "+laat+" later aan. Vergelijk dit met de oorzaken en reistijden op het tabblad Ritten.";
    fill(40,58,81);textSize(12);text(uitleg,x,601,w,59);
    fill(115,128,147);textSize(10);text("Op tijd = binnen +/- 0,5 simulatieminuut.\nLopende ritten en gewijzigde bestemmingen tellen niet mee.",x,666,w,30);
  }
}
