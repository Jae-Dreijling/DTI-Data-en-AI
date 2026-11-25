# Simpele trein + rails in Blender, gebouwd zoals een beginner het doet:
# alleen standaardvormen (kubus, cilinder) en een paar modifiers.
#
# Gebruik: open Blender > tabblad Scripting > open dit bestand > Run Script.
# Of vanaf de terminal (maakt ook trein.blend + een preview-plaatje):
#   blender -b --python maak_trein.py -- <map-om-in-op-te-slaan>

import bpy
import math
import os
import sys

STRAAL = 6.0       # straal van het rondje spoor
SPOOR = 0.5        # afstand tussen de twee rails
RAIL_TOP = 0.09    # bovenkant van de rails (dwarsliggers 0.04 + rail 0.05)

# ---------- leeg beginnen ----------
bpy.ops.object.select_all(action="SELECT")
bpy.ops.object.delete()
for blok in (bpy.data.meshes, bpy.data.materials, bpy.data.curves):
    for item in list(blok):
        blok.remove(item)


def materiaal(naam, kleur, metaal=0.0, ruw=0.6):
    m = bpy.data.materials.new(naam)
    m.use_nodes = True
    bsdf = m.node_tree.nodes.get("Principled BSDF")
    bsdf.inputs["Base Color"].default_value = (*kleur, 1)
    bsdf.inputs["Metallic"].default_value = metaal
    bsdf.inputs["Roughness"].default_value = ruw
    return m


def geef(obj, mat):
    obj.data.materials.append(mat)
    return obj


def kubus(naam, maat, plek, mat):
    bpy.ops.mesh.primitive_cube_add(size=1, location=plek)
    o = bpy.context.object
    o.name = naam
    o.scale = maat
    bpy.ops.object.transform_apply(scale=True)
    return geef(o, mat)


def cilinder(naam, straal, lengte, plek, draai, mat, hoeken=24):
    bpy.ops.mesh.primitive_cylinder_add(vertices=hoeken, radius=straal, depth=lengte, location=plek, rotation=draai)
    o = bpy.context.object
    o.name = naam
    bpy.ops.object.shade_smooth()
    return geef(o, mat)


GRIJS = materiaal("Rail_metaal", (0.45, 0.45, 0.48), metaal=1.0, ruw=0.35)
HOUT = materiaal("Dwarsligger_hout", (0.30, 0.18, 0.09))
GRAS = materiaal("Gras", (0.20, 0.45, 0.15), ruw=0.9)
GROEN = materiaal("Trein_groen", (0.05, 0.35, 0.20), ruw=0.4)
ROOD = materiaal("Trein_rood", (0.70, 0.08, 0.08), ruw=0.4)
ZWART = materiaal("Trein_zwart", (0.03, 0.03, 0.03), ruw=0.5)
GEEL = materiaal("Trein_geel", (0.95, 0.75, 0.10), metaal=0.6, ruw=0.3)

# ---------- grond ----------
bpy.ops.mesh.primitive_plane_add(size=30, location=(0, 0, 0))
bpy.context.object.name = "Grond"
geef(bpy.context.object, GRAS)

# ---------- spoor: een cirkel als pad ----------
bpy.ops.curve.primitive_bezier_circle_add(radius=STRAAL, location=(0, 0, 0))
pad = bpy.context.object
pad.name = "Spoor_pad"   # hier gaat de trein straks overheen rijden


def langs_pad(obj, tussenruimte):
    """kopieer het blokje rondom (Array) en buig het over de cirkel (Curve)"""
    arr = obj.modifiers.new("Array", "ARRAY")
    arr.fit_type = "FIT_CURVE"
    arr.curve = pad
    arr.relative_offset_displace = (tussenruimte, 0, 0)
    krom = obj.modifiers.new("Curve", "CURVE")
    krom.object = pad
    krom.deform_axis = "POS_X"


# dwarsliggers (hout): elke 3 blokjes lengte één
ligger = kubus("Dwarsliggers", (0.12, 0.85, 0.04), (0, 0, 0.02), HOUT)
langs_pad(ligger, 3.0)

# twee rails (metaal), links en rechts van het midden
for naam, y in (("Rail_binnen", -SPOOR / 2), ("Rail_buiten", SPOOR / 2)):
    rail = kubus(naam, (0.25, 0.05, 0.05), (0, y, 0.065), GRIJS)
    langs_pad(rail, 1.0)

# ---------- trein ----------
# alles hangt aan één leeg object 'Trein', zodat je straks alleen dat hoeft te bewegen
bpy.ops.object.empty_add(type="PLAIN_AXES", location=(0, 0, 0))
trein = bpy.context.object
trein.name = "Trein"
onderdelen = []

WIEL_R = 0.15
wiel_z = RAIL_TOP + WIEL_R
for i, x in enumerate((-0.5, 0.0, 0.5)):
    for kant, y in (("L", SPOOR / 2), ("R", -SPOOR / 2)):
        onderdelen.append(cilinder(f"Wiel_{i + 1}{kant}", WIEL_R, 0.06, (x, y, wiel_z), (math.pi / 2, 0, 0), ZWART))

onderdelen += [
    kubus("Onderstel", (1.6, 0.6, 0.12), (0, 0, 0.36), ZWART),
    cilinder("Ketel", 0.26, 1.0, (0.28, 0, 0.68), (0, math.pi / 2, 0), GROEN),
    cilinder("Schoorsteen", 0.08, 0.35, (0.62, 0, 1.05), (0, 0, 0), ZWART),
    cilinder("Schoorsteen_rand", 0.11, 0.06, (0.62, 0, 1.23), (0, 0, 0), ZWART),
    cilinder("Koepel", 0.10, 0.12, (0.20, 0, 0.96), (0, 0, 0), GEEL),
    kubus("Cabine", (0.55, 0.62, 0.62), (-0.48, 0, 0.73), ROOD),
    kubus("Dak", (0.68, 0.72, 0.06), (-0.48, 0, 1.07), ZWART),
    kubus("Raam_L", (0.25, 0.02, 0.2), (-0.48, 0.315, 0.85), ZWART),
    kubus("Raam_R", (0.25, 0.02, 0.2), (-0.48, -0.315, 0.85), ZWART),
    cilinder("Lamp", 0.07, 0.06, (0.80, 0, 0.62), (0, math.pi / 2, 0), GEEL),
    kubus("Buffer_voor", (0.06, 0.6, 0.1), (0.83, 0, 0.36), ROOD),
]

for o in onderdelen:
    o.parent = trein

# ---------- rijden: de trein volgt het pad (Follow Path) ----------
RONDE = 96  # frames voor één rondje (96 frames = 4 seconden bij 24 fps)
pad.data.use_path = True
pad.data.path_duration = RONDE
volg = trein.constraints.new("FOLLOW_PATH")
volg.target = pad
volg.use_curve_follow = True      # trein draait mee met de bocht
volg.forward_axis = "FORWARD_X"   # de voorkant van de trein is +X
volg.up_axis = "UP_Z"
# 'Animate Path' met de hand: begin van het pad op frame 1, einde op frame RONDE + 1
pad.data.eval_time = 0
pad.data.keyframe_insert("eval_time", frame=1)
pad.data.eval_time = RONDE
pad.data.keyframe_insert("eval_time", frame=RONDE + 1)
ad = pad.data.animation_data
kanalen = ad.action.fcurves if hasattr(ad.action, "fcurves") else [c for l in ad.action.layers for s in l.strips for b in s.channelbags for c in b.fcurves]
for kanaal in kanalen:
    for punt in kanaal.keyframe_points:
        punt.interpolation = "LINEAR"   # constante snelheid, geen optrekken/afremmen
scene = bpy.context.scene
scene.frame_start, scene.frame_end = 1, RONDE

# ---------- licht + camera ----------
bpy.ops.object.light_add(type="SUN", location=(5, -5, 10), rotation=(math.radians(45), 0, math.radians(30)))
bpy.context.object.data.energy = 3.5

# camera kijkt naar een leeg puntje midden in de trein
bpy.ops.object.empty_add(type="SPHERE", radius=0.1, location=(0, 0, 0.65))
doel = bpy.context.object
doel.name = "Camera_doel"
doel.parent = trein   # rijdt mee, dus de camera blijft de trein volgen
bpy.ops.object.camera_add(location=(3.4, -STRAAL - 3.4, 2.4))
cam = bpy.context.object
richt = cam.constraints.new("TRACK_TO")
richt.target = doel
scene = bpy.context.scene
scene.camera = cam

wereld = bpy.data.worlds.get("World") or bpy.data.worlds.new("World")
scene.world = wereld
wereld.use_nodes = True
wereld.node_tree.nodes["Background"].inputs["Color"].default_value = (0.6, 0.75, 0.9, 1)

# ---------- opslaan + preview (alleen vanaf de terminal) ----------
if "--" in sys.argv:
    uit = sys.argv[sys.argv.index("--") + 1]
    os.makedirs(uit, exist_ok=True)
    for engine in ("BLENDER_EEVEE", "BLENDER_EEVEE_NEXT", "BLENDER_WORKBENCH"):
        try:
            scene.render.engine = engine
            break
        except TypeError:
            pass
    scene.render.resolution_x, scene.render.resolution_y = 1280, 720
    scene.view_settings.view_transform = "Standard"
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(uit, "trein.blend"))
    scene.render.filepath = os.path.join(uit, "preview_dichtbij.png")
    bpy.ops.render.render(write_still=True)
    # tweede camera: van boven, het hele rondje
    bpy.ops.object.camera_add(location=(0, -13, 14), rotation=(math.radians(43), 0, 0))
    boven = bpy.context.object
    boven.name = "Camera_overzicht"
    boven.data.lens = 30
    scene.camera = boven
    scene.render.filepath = os.path.join(uit, "preview_overzicht.png")
    bpy.ops.render.render(write_still=True)
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(uit, "trein.blend"))
    # animatie: alle frames van één rondje als PNG (voor de GIF)
    if "--animatie" in sys.argv:
        scene.render.resolution_x, scene.render.resolution_y = 640, 360
        scene.render.image_settings.file_format = "PNG"
        scene.render.filepath = os.path.join(uit, "frames", "frame_")
        bpy.ops.render.render(animation=True)
