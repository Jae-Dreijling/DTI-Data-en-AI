# Super simpele pixelart (16x16) van de dieren uit het thema 'Huisdieren'.
# Elk dier is een raster van letters; elke letter is een kleur, '.' is doorzichtig.
# Draaien: python maak_pixelart.py  -> maakt per dier een PNG + een overzicht.

import os
from PIL import Image

KLEUREN = {
    "k": (40, 36, 40),      # rand / ogen
    "w": (255, 255, 255),   # wit
    "p": (244, 160, 176),   # roze (neus, oren)
    "o": (240, 150, 50),    # oranje
    "O": (196, 110, 30),    # donkeroranje
    "b": (150, 100, 60),    # bruin
    "B": (105, 66, 36),     # donkerbruin
    "l": (225, 195, 150),   # lichtbruin / beige
    "g": (170, 170, 175),   # grijs
    "G": (120, 120, 128),   # donkergrijs
    "y": (250, 215, 60),    # geel
    "r": (225, 60, 50),     # rood
    "c": (70, 140, 230),    # blauw
    "n": (90, 190, 80),     # groen
    "N": (50, 130, 50),     # donkergroen
}

DIEREN = {
"Kat": [
    "................",
    ".....k.....k....",
    ".....kk...kk....",
    ".....kpkkkkpk...",
    ".....kooOOook...",
    "....kookookook..",
    "....koooppoook..",
    "....koowwwwookk.",
    "....koowwwwookok",
    "....koowwwwookok",
    "....kOoowwooOkok",
    "...kooowwwwooook",
    "...koowwoowwoook",
    "...kkkkkkkkkkkk.",
    "................",
    "................",
],
"Hond": [
    "................",
    "................",
    "......kkkkkk....",
    ".....kbbbbbbk...",
    "...kkbbbbbbbbkk.",
    "..kBBbkbbbbkbBBk",
    "..kBBbbbbbbbbBBk",
    "..kBBbbllllbbBBk",
    "...kBbllkkllbBk.",
    "....kbllppllbk..",
    ".....kbbbbbbk...",
    "....kbbllllbbk..",
    "....kbbllllbbk..",
    "....kbllkkllbk..",
    "....kkkkkkkkkk..",
    "................",
],
"Paard": [
    "................",
    "...........kk...",
    "..........kBbkk.",
    ".........kBbbbbk",
    ".........kBbkbbk",
    "........kBbbbbbk",
    "........kBbbbkk.",
    ".......kBbbbbk..",
    "..kk..kBbbbbk...",
    ".kBBkkbbbbbbk...",
    ".kBkbbbbbbbbk...",
    "kBk.kbbbbbbbk...",
    "kk..kbbbbbbbk...",
    "....kbkkkkkbk...",
    "....kbk...kbk...",
    "....kkk...kkk...",
],
"Hamster": [
    "................",
    "................",
    "................",
    "................",
    "......kk..kk....",
    ".....kppkkppk...",
    "....kllllllllk..",
    "...kllkllllkllk.",
    "...klllllpllllk.",
    "...kwwlllllllwk.",
    "...kwwwlllllwwk.",
    "....klllllllllk.",
    "....kwwwwwwwwk..",
    ".....kpkkkkpk...",
    "......k....k....",
    "................",
],
"Konijn": [
    "................",
    "..........kk.kk.",
    ".........kpkkpk.",
    ".........kpkkpk.",
    ".........kgkkgk.",
    "..........kggk..",
    ".........kggggk.",
    ".........kgkggk.",
    "..kk.....kgggpk.",
    ".kwwk..kkkggggk.",
    ".kwwkkkggggggk..",
    "..kkgggggggggk..",
    "...kgggggggggk..",
    "...kggk..kggkk..",
    "...kkkk..kkkk...",
    "................",
],
"Parkiet": [
    "................",
    "................",
    "........kkk.....",
    ".......kyyyk....",
    "......kyyykyk...",
    "......kyyyyyrk..",
    "......knyyyyk...",
    ".....knnnnnk....",
    "....knnNnnnk....",
    "....knNnNnnk....",
    "....knnnnnnk....",
    ".....knnnnk.....",
    "......kkkk......",
    ".....kcck.......",
    "....kcck........",
    "....kkk.........",
],
"Papegaai": [
    "................",
    ".......kkkk.....",
    "......krrrrk....",
    ".....krrrwkrk...",
    ".....krrrwwkyk..",
    ".....krrrrrkyyk.",
    ".....krrrrrkyk..",
    "....krrrrrrkk...",
    "....kcyrrrrk....",
    "...kccyyrrrk....",
    "...kcccyrrrk....",
    "...kcccyrrk.....",
    "....kccyrk......",
    ".....kcckk......",
    ".....kcck.......",
    "......kk........",
],
"Goudvis": [
    "................",
    "................",
    "................",
    "........kkk.....",
    ".......kooOk....",
    "..kk..kooooookk.",
    ".koOkkooooooooOk",
    ".kooOooooooowkok",
    ".kooOooooooookkk",
    ".koOkkoooooooopk",
    "..kk..kooooookk.",
    ".......kooOk....",
    "........kkk.....",
    "................",
    "................",
    "................",
],
"Schildpad": [
    "................",
    "................",
    "................",
    "................",
    "................",
    "....kkkkkkk.....",
    "...kNnNnNnNk.kk.",
    "..kNnNNnNNnNknnk",
    ".kNNnNnNNnNNnnkk",
    ".kkkkkkkkkkkknnk",
    "..knnk...knnkkk.",
    "..kkkk...kkkk...",
    "................",
    "................",
    "................",
    "................",
],
"Slang": [
    "................",
    "................",
    "................",
    "..........kkk...",
    ".........knnnk..",
    ".........knkNnk.",
    ".........knnnnkr",
    "..........knnk..",
    "....kkkkkkknnk..",
    "...knnNnnNnnk...",
    "..knNkkkkkkkk...",
    "..knnk..........",
    "...knNkkkkkkkk..",
    "....knnNnnNnnnk.",
    ".....kkkkkkkkkk.",
    "................",
],
}

MAP = os.path.dirname(os.path.abspath(__file__))
GROOT = 16  # elke pixel wordt 16x16 -> plaatje van 256x256


def maak(naam, rijen):
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    for y, rij in enumerate(rijen[:16]):
        for x, letter in enumerate(rij[:16]):
            if letter != ".":
                img.putpixel((x, y), (*KLEUREN[letter], 255))
    return img


plaatjes = {}
for naam, rijen in DIEREN.items():
    img = maak(naam, rijen)
    plaatjes[naam] = img
    img.resize((16 * GROOT, 16 * GROOT), Image.NEAREST).save(os.path.join(MAP, naam.lower() + ".png"))

# overzicht: alle dieren naast elkaar op een lichte achtergrond
kol, marge = 5, 24
cel = 16 * 10
rijen_n = (len(plaatjes) + kol - 1) // kol
blad = Image.new("RGB", (kol * (cel + marge) + marge, rijen_n * (cel + marge) + marge), (245, 240, 230))
for i, (naam, img) in enumerate(plaatjes.items()):
    x = marge + (i % kol) * (cel + marge)
    y = marge + (i // kol) * (cel + marge)
    groot = img.resize((cel, cel), Image.NEAREST)
    blad.paste(groot, (x, y), groot)
blad.save(os.path.join(MAP, "overzicht.png"))
print("klaar:", ", ".join(plaatjes))
