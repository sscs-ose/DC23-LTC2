import pya
import cells
from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import DPoint, DCellInstArray, DTrans, Cell, Layout, DVector, DBox, DPath

import math
from math import ceil, floor, sqrt

# PMOS Waffle Design
#############

@KlayoutUtilities.inject_top_layout
def read_gds(gds: Path | str, top: Cell = None, layout: Layout = None):
  "Based on gf180mcu draw_bjt pcell."
  gds_path = Path(gds).resolve()

  if gds_path.suffix == "":
    gds_path = Path(f"{gds_path}.gds")

  if not gds_path.exists():
    print(f"GDS {gds} don't exists")
    return None

  # I haven't figured it out how to get cells from the LayerMap returned by
  # layout.read(gds_path). So that's why is compared the cells before and after.

  # Rely on "KlayoutUtilities.clear()" for avoid troubles if gds is already
  # loaded.

  k = KlayoutUtilities()

  existing_topcells: set(int) = {i for i in k.layout.each_top_cell()}
  layermap: pya.LayerMap = layout.read(str(gds_path))
  updated_topcells: set(int) = {i for i in k.layout.each_top_cell()}

  new_topcells = updated_topcells - existing_topcells

  # Map from cell indexes to cell names
  new_cell_names = list(k.layout.cell(i) for i in new_topcells)

  return new_cell_names


def translate_layers():
    # Each layer is represented by an int
    layout: Layout = KlayoutUtilities().viewed_cell.layout()

    layout.swap_layers(layout.layer(64, 20), KlayoutUtilities.get_layer("nwell"))    # N-well region
    layout.swap_layers(layout.layer(66, 20), KlayoutUtilities.get_layer("poly2"))    # Polysilicon
    layout.swap_layers(layout.layer(93, 44), KlayoutUtilities.get_layer("nplus"))    # N+ source/drain implant
    layout.swap_layers(layout.layer(94, 20), KlayoutUtilities.get_layer("pplus"))    # P+ source/drain implant

    layout.swap_layers(layout.layer(66, 44), KlayoutUtilities.get_layer("contact"))  # Contact to local interconnect
    layout.swap_layers(layout.layer(67, 44), KlayoutUtilities.get_layer("via1"))     # Contact from local interconnect to metal1
    layout.swap_layers(layout.layer(68, 44), KlayoutUtilities.get_layer("via2"))     # Contact from metal 1 to metal 2
    layout.swap_layers(layout.layer(69, 44), KlayoutUtilities.get_layer("via3"))     # Contact from metal 2 to metal 3
    layout.swap_layers(layout.layer(70, 44), KlayoutUtilities.get_layer("via4"))     # Contact from metal 3 to metal 4
    layout.swap_layers(layout.layer(71, 44), KlayoutUtilities.get_layer("via5"))     # Contact from metal 4 to metal 5

    layout.swap_layers(layout.layer(67, 20), KlayoutUtilities.get_layer("metal1"))   # Local interconnect
    layout.swap_layers(layout.layer(68, 20), KlayoutUtilities.get_layer("metal2"))   # Metal1
    layout.swap_layers(layout.layer(69, 20), KlayoutUtilities.get_layer("metal3"))   # Metal 2
    layout.swap_layers(layout.layer(70, 20), KlayoutUtilities.get_layer("metal4"))   # Metal 3
    layout.swap_layers(layout.layer(71, 20), KlayoutUtilities.get_layer("metal5"))   # Metal 4
    layout.swap_layers(layout.layer(72, 20), KlayoutUtilities.get_layer("metaltop")) # Metal 5

    layout.swap_layers(layout.layer(65, 20), KlayoutUtilities.get_layer("comp")) # Active (diffusion) area (type opposite of well/substrate underneath)
    layout.swap_layers(layout.layer(65, 44), KlayoutUtilities.get_layer("comp")) # Active (diffusion) area (type equal to the well/substrate underneath) (i.e., N+ and P+)
    layout.swap_layers(layout.layer(75, 20), KlayoutUtilities.get_layer("dualgate")) # High voltage (5.0V) thick oxide gate regions
    layout.swap_layers(layout.layer(95, 20), None) # Nitride poly cut (under licon1 areas)


# def delete_sky130_layers():
#     k = KlayoutUtilities()
#     layout = k.viewed_cell.layout()

#     layout.delete_layer(layout.layer(64, 20))
#     layout.delete_layer(layout.layer(66, 20))
#     layout.delete_layer(layout.layer(93, 44))
#     layout.delete_layer(layout.layer(94, 20))
#     layout.delete_layer(layout.layer(66, 44))
#     layout.delete_layer(layout.layer(67, 44))
#     layout.delete_layer(layout.layer(68, 44))
#     layout.delete_layer(layout.layer(69, 44))
#     layout.delete_layer(layout.layer(70, 44))
#     layout.delete_layer(layout.layer(71, 44))
#     layout.delete_layer(layout.layer(67, 20))
#     layout.delete_layer(layout.layer(68, 20))
#     layout.delete_layer(layout.layer(69, 20))
#     layout.delete_layer(layout.layer(70, 20))
#     layout.delete_layer(layout.layer(71, 20))
#     layout.delete_layer(layout.layer(72, 20))
    #layout.delete_layer(layout.layer(65, 20))
    #layout.delete_layer(layout.layer(65, 44))
    #layout.delete_layer(layout.layer(75, 20))
    #layout.delete_layer(layout.layer(95, 20))


def scale_shapes(cell: Cell, scale: float = 1.0):
    layer_view: pya.LayoutView = pya.LayoutView.current()
    for layer_data in layer_view.each_layer():
        layer_idx = layer_data.id()
        cell_shapes = cell.shapes(layer_idx)

        cell_shapes.transform(pya.DCplxTrans(scale))


def fix_vias_2(cell: Cell):
    delta: dict[str, float] = {
        "contact": 0.11,
        "via1": 0.13,
        "via2": 0.13,
        "via3": 0.13,
        "via4": 0.13,
        "via5": 0.13,
    }

    layer_view: pya.LayoutView = pya.LayoutView.current()
    for layer_data in layer_view.each_layer():
        #pprint(dir(layer_data))
        pprint(layer_data.name)
        pprint(layer_data.layer_index())
        #layer_idx = layer_data.id()
        #print(layer_idx)
        #cell_shapes = cell.shapes(layer_idx)


        #return



def fix_vias(cell: Cell):
    """Iterates over all vias in the Shapes instance, and replaces them with correct size boxes"""

    delta: dict[str, float] = {
        "contact": 0.11,
        "via1": 0.13,
        "via2": 0.13,
        "via3": 0.13,
        "via4": 0.13,
        "via5": 0.13,
    }

    for via_name in delta.keys():
        via_layer = KlayoutUtilities.get_layer(via_name)
        via_shapes = cell.shapes(via_layer)

        print(via_layer)
        print(via_shapes)

        for via in via_shapes.each(via_shapes.SBoxes):
            # print(f"{type(via) = }")
            # print(f"{via.box_dcenter = }")
            
            print("fixing via")

            via_shapes.replace(via, DBox(
                via.box_dcenter.x - delta[via_name],
                via.box_dcenter.y - delta[via_name],
                via.box_dcenter.x + delta[via_name],
                via.box_dcenter.y + delta[via_name],
            ))


def show_types_of_shapes(shapes: pya.Shapes):
    if any(shapes.each(shapes.SBoxes)):       print("- Has Boxes")
    if any(shapes.each(shapes.SEdgePairs)):   print("- Has EdgePairs")
    if any(shapes.each(shapes.SEdges)):       print("- Has Edges")
    if any(shapes.each(shapes.SPaths)):       print("- Has Boxes")
    if any(shapes.each(shapes.SPoints)):      print("- Has Points")
    if any(shapes.each(shapes.SPolygons)):    print("- Has Polygons")
    if any(shapes.each(shapes.SProperties)):  print("- Has Properties")
    if any(shapes.each(shapes.SRegions)):     print("- Has Regions")
    if any(shapes.each(shapes.STexts)):       print("- Has Texts")
    if any(shapes.each(shapes.SUserObjects)): print("- Has SUserObjects")


@KlayoutUtilities.inject_top_layout
def port_cell(cellname: str, position: DPoint = DPoint(0, 0), scale=1.0, top: Cell = None, layout: Layout = None):

    read_gds(cellname)

    cell: Cell = layout.cell(cellname)

    scale_shapes(layout.cell(cellname), scale)
    #fix_vias(layout.cell(cellname))
    #fix_vias_2(layout.cell(cellname))

    inst = DCellInstArray(
        layout.cell(cellname),
        DTrans(-cell.dbbox().p1 + position * scale),
        DVector(30,0),
        DVector(0,10),
        1,
        1,
    )

    instance: pya.Instance = top.insert(inst)

    return instance


def merge_layers():
   # https://www.klayout.de/forum/discussion/1766/merging-two-polygons-in-a-layer
   # Maybe it's necesary to join adjacent shapes into one cell
   # This talks about a "region", I'm not sure how that fits into drc
   pass


KlayoutUtilities.clear()


scale = 2.0

port_cell("pmos_source_in",       scale=scale, position=DPoint(0, 0))
port_cell("pmos_drain_in",        scale=scale)#, position=DPoint(0, 20))
port_cell("pmos_source_frame_lt", scale=scale, position=DPoint(10, 0))
port_cell("pmos_drain_frame_lt",  scale=scale, position=DPoint(10, 20))
port_cell("pmos_source_frame_rb", scale=scale, position=DPoint(30, 0))
port_cell("pmos_drain_frame_rb",  scale=scale, position=DPoint(30, 20))
port_cell("pmos_waffle_corners",  scale=scale, position=DPoint(50, 0))


KlayoutUtilities().viewed_cell.flatten(-1)

translate_layers()

fix_vias(KlayoutUtilities().viewed_cell)

#delete_sky130_layers()

KlayoutUtilities.set_visual_configuration()