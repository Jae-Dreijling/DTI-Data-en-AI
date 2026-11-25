# Schets: hoe de visuele beslisboom van 'Leer de AI raden' eruit kan zien.
# Vragen = kaartjes, groen = ja, rood = nee, bladeren = pixelart-dieren.
# Geel = het pad dat de AI deze ronde volgde; gestippeld = net bijgeleerd (de boom groeit).
# Draaien: python maak_beslisboom_schets.py

import math
import os
from PIL import Image, ImageDraw, ImageFont

MAP = os.path.dirname(os.path.abspath(__file__))
PIX = os.path.join(MAP, "..", "pixelart")
W, H = 1600, 1000
ACHTER = (245, 240, 230)
DONKER = (40, 36, 40)
JA = (60, 170, 80)
NEE = (215, 65, 55)
PAD = (250, 200, 40)
GRIJS = (150, 150, 150)


def font(grootte, vet=True):
    naam = "seguisb.ttf" if vet else "segoeui.ttf"
    try:
        return ImageFont.truetype("C:/Windows/Fonts/" + naam, grootte)
    except OSError:
        return ImageFont.truetype("C:/Windows/Fonts/arialbd.ttf", grootte)


# ---- de boom: (id, soort, tekst, x, y)
KNOPEN = {
    "vacht":   ("vraag", "Heeft het vacht?", 800, 135),
    "blaft":   ("vraag", "Kan het blaffen?", 420, 320),
    "water":   ("vraag", "Leeft het in het water?", 1180, 320),
    "Hond":    ("dier", "Hond", 220, 560),
    "groot":   ("vraag", "Is het groter dan jij?", 610, 520),
    "Goudvis": ("dier", "Goudvis", 990, 560),
    "vliegt":  ("vraag", "Kan het vliegen?", 1350, 520),
    "Paard":   ("dier", "Paard", 470, 780),
    "Kat":     ("dier", "Kat", 750, 780),
    "Parkiet": ("dier", "Parkiet", 1220, 780),
    "Slang":   ("dier", "Slang", 1470, 780),
}
# (van, naar, ja/nee)
TAKKEN = [
    ("vacht", "blaft", "ja"), ("vacht", "water", "nee"),
    ("blaft", "Hond", "ja"), ("blaft", "groot", "nee"),
    ("water", "Goudvis", "ja"), ("water", "vliegt", "nee"),
    ("groot", "Paard", "ja"), ("groot", "Kat", "nee"),
    ("vliegt", "Parkiet", "ja"), ("vliegt", "Slang", "nee"),
]
GEKOZEN = [("vacht", "blaft"), ("blaft", "groot"), ("groot", "Kat")]   # pad van deze ronde
NIEUW = {("water", "vliegt"), ("vliegt", "Parkiet"), ("vliegt", "Slang")}  # net bijgeleerd

img = Image.new("RGB", (W, H), ACHTER)
d = ImageDraw.Draw(img)


def maat(knoop):
    soort, tekst, x, y = KNOPEN[knoop]
    if soort == "vraag":
        b = d.textlength(tekst, font=font(26)) + 48
        return x - b / 2, y - 34, x + b / 2, y + 34
    return x - 70, y - 70, x + 70, y + 92


def stippel(a, b, kleur, breed, stuk=16):
    lengte = math.dist(a, b)
    n = int(lengte // stuk)
    for i in range(0, n, 2):
        p = (a[0] + (b[0] - a[0]) * i / n, a[1] + (b[1] - a[1]) * i / n)
        q = (a[0] + (b[0] - a[0]) * (i + 1) / n, a[1] + (b[1] - a[1]) * (i + 1) / n)
        d.line([p, q], fill=kleur, width=breed)


# ---- takken
for van, naar, antwoord in TAKKEN:
    a = (KNOPEN[van][2], maat(van)[3])
    b = (KNOPEN[naar][2], maat(naar)[1])
    kleur = JA if antwoord == "ja" else NEE
    if (van, naar) in GEKOZEN:
        d.line([a, b], fill=PAD, width=22)
    if (van, naar) in NIEUW:
        stippel(a, b, kleur, 7)
    else:
        d.line([a, b], fill=kleur, width=7)
    # label ja/nee op het midden
    m = ((a[0] + b[0]) / 2, (a[1] + b[1]) / 2)
    f = font(22)
    tw = d.textlength(antwoord, font=f)
    d.rounded_rectangle([m[0] - tw / 2 - 12, m[1] - 18, m[0] + tw / 2 + 12, m[1] + 18], radius=18, fill=kleur)
    d.text(m, antwoord, font=f, fill="white", anchor="mm")

# ---- knopen
for knoop, (soort, tekst, x, y) in KNOPEN.items():
    x0, y0, x1, y1 = maat(knoop)
    op_pad = any(knoop in t for t in GEKOZEN)
    nieuw = any(knoop == t[1] for t in NIEUW)
    if soort == "vraag":
        if op_pad:
            d.rounded_rectangle([x0 - 7, y0 - 7, x1 + 7, y1 + 7], radius=22, fill=PAD)
        d.rounded_rectangle([x0, y0, x1, y1], radius=16, fill="white", outline=DONKER, width=4)
        d.text((x, y), tekst, font=font(26), fill=DONKER, anchor="mm")
    else:
        if op_pad:
            d.rounded_rectangle([x0 - 7, y0 - 7, x1 + 7, y1 + 7], radius=22, fill=PAD)
        d.rounded_rectangle([x0, y0, x1, y1], radius=16, fill="white", outline=DONKER, width=4)
        dier = Image.open(os.path.join(PIX, tekst.lower() + ".png")).resize((112, 112), Image.NEAREST)
        img.paste(dier, (int(x - 56), int(y0 + 8)), dier)
        d.text((x, y1 - 22), tekst, font=font(24), fill=DONKER, anchor="mm")
    if nieuw:
        f = font(18)
        d.rounded_rectangle([x1 - 70, y0 - 16, x1 + 20, y0 + 14], radius=14, fill=(90, 120, 230))
        d.text((x1 - 25, y0 - 1), "nieuw!", font=f, fill="white", anchor="mm")

# ---- titel + uitleg
d.text((40, 30), "Leer de AI raden: zo groeit de beslisboom", font=font(34), fill=DONKER)
d.text((40, 74), "schets / voorbeeld", font=font(22, vet=False), fill=GRIJS)
d.text((1560, 40), "De AI denkt: is het een Kat?", font=font(26), fill=DONKER, anchor="ra")

y = 930
items = [(JA, "ja", "lijn"), (NEE, "nee", "lijn"), (PAD, "pad van deze ronde", "dik"), (NEE, "net bijgeleerd (de boom groeit)", "stippel")]
x = 40
for kleur, tekst, soort in items:
    if soort == "stippel":
        stippel((x, y), (x + 50, y), GRIJS, 7, 8)
    else:
        d.line([(x, y), (x + 50, y)], fill=kleur, width=18 if soort == "dik" else 7)
    d.text((x + 62, y), tekst, font=font(22, vet=False), fill=DONKER, anchor="lm")
    x += 62 + d.textlength(tekst, font=font(22, vet=False)) + 60

uit = os.path.join(MAP, "beslisboom-schets.png")
img.save(uit)
print(uit)
