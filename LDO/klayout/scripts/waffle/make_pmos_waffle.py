import pya
import cells
from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import DPoint, DCellInstArray, DTrans, Cell, Layout, DVector, DBox, DPath

from math import ceil, floor

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
  layermap: pya.LayerMap = layout.read(gds_path)
  updated_topcells: set(int) = {i for i in k.layout.each_top_cell()}

  new_topcells = updated_topcells - existing_topcells

  # Map from cell indexes to cell names
  new_cell_names = list(k.layout.cell(i) for i in new_topcells)

  return new_cell_names


@KlayoutUtilities.inject_top_layout
def draw_pmos_central_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_a, *_ = read_gds(waffle_params["cell_a"])
    cell_b, *_ = read_gds(waffle_params["cell_b"])

    m = waffle_params["m"]
    n = floor(m/2)

    dx = DPoint( cell_a.dbbox().width(), 0)
    dy = DPoint( 0, cell_a.dbbox().height())

    array_A1 = DCellInstArray(
        cell_a, 
        DTrans(-cell_a.dbbox().p1),
        dx * 2,
        dy * 2,
        n,
        n
    )

    array_A2 = DCellInstArray(
        cell_a,
        DTrans(-cell_a.dbbox().p1 + dx + dy),
        dx * 2,
        dy * 2,
        n,
        n
    )

    array_B1 = DCellInstArray(
        cell_b,
        DTrans(-cell_b.dbbox().p1 + dx),
        dx * 2,
        dy * 2,
        n,
        n
    )

    array_B2 = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 + dy),
        dx * 2,
        dy * 2,
        n,
        n
    )

    top.insert(array_A1)
    top.insert(array_A2)

    top.insert(array_B1)
    top.insert(array_B2)


@KlayoutUtilities.inject_top_layout
def draw_pmos_left_bottom_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_a, *_ = read_gds(waffle_params["cell_c"])
    cell_b, *_ = read_gds(waffle_params["cell_d"])

    m = waffle_params["m"]
    n = floor(m/2)

    dx = DPoint( cell_a.dbbox().width(), 0)
    dy = DPoint( 0, cell_a.dbbox().height())   

    # Left
    array_A1 = DCellInstArray(
        cell_a, 
        DTrans(-cell_a.dbbox().p1 - dx + dy),
        dx * 2,
        dy * 2,
        0,
        n
    )

    array_B1 = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 - dx),
        dx * 2,
        dy * 2,
        0,
        n
    )

    top.insert(array_A1)
    top.insert(array_B1)

    array_A2 = DCellInstArray(
        cell_a, 
        DTrans(-cell_a.dbbox().p1 + dx - dy),
        dx * 2,
        dy * 2,
        n,
        0
    )

    array_B2 = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 - dy),
        dx * 2,
        dy * 2,
        n,
        0
    )

    top.insert(array_A2)
    top.insert(array_B2)


@KlayoutUtilities.inject_top_layout
def draw_pmos_right_top_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_a, *_ = read_gds(waffle_params["cell_e"])
    cell_b, *_ = read_gds(waffle_params["cell_f"])

    m = waffle_params["m"]
    n = floor(m/2)

    dx = DPoint( cell_a.dbbox().width(), 0)
    dy = DPoint( 0, cell_a.dbbox().height())   

    # Left
    array_A1 = DCellInstArray(
        cell_a, 
        DTrans(-cell_a.dbbox().p1 + dx*m),
        dx * 2,
        dy * 2,
        0,
        n
    )

    array_B1 = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 + dx*m + dy),
        dx * 2,
        dy * 2,
        0,
        n
    )

    top.insert(array_A1)
    top.insert(array_B1)

    array_A2 = DCellInstArray(
        cell_a, 
        DTrans(-cell_a.dbbox().p1 + dy*m),
        dx * 2,
        dy * 2,
        n,
        0
    )

    array_B2 = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 + dy*m + dx),
        dx * 2,
        dy * 2,
        n,
        0
    )

    top.insert(array_A2)
    top.insert(array_B2)


@KlayoutUtilities.inject_top_layout
def draw_pmos_corners_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_a, *_ = read_gds(waffle_params["cell_g"])
    cell_b, *_ = read_gds(waffle_params["cell_h"])
    cell_c, *_ = read_gds(waffle_params["cell_i"])
    cell_d, *_ = read_gds(waffle_params["cell_j"])
    
    m = waffle_params["m"]
    n = floor(m/2)

    dx = DPoint( cell_a.dbbox().width(), 0)
    dy = DPoint( 0, cell_a.dbbox().height())   

    # Left
    array_A = DCellInstArray(
        cell_a,
        DTrans(-cell_a.dbbox().p1 - dx - dy))

    array_B = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 + dx*m - dy)
    )

    array_C = DCellInstArray(
        cell_c, 
        DTrans(-cell_c.dbbox().p1 + dx*m + dy*m),
    )

    array_D = DCellInstArray(
        cell_d, 
        DTrans(-cell_d.dbbox().p1 - dx + dy*m)
    )

    top.insert(array_A)
    top.insert(array_B)
    top.insert(array_C)
    top.insert(array_D)

@KlayoutUtilities.inject_top_layout
def draw_pmos_waffle(x=0, y=0, top: Cell = None, layout: Layout = None):
    
    waffle_params = {
      "x": 0,
      "y": 0,
      "m": 8,
      "cell_a": "dummyA",
      "cell_b": "dummyB",
      "cell_c": "dummyC",
      "cell_d": "dummyD",
      "cell_e": "dummyE",
      "cell_f": "dummyF",
      "cell_g": "dummyG",
      "cell_h": "dummyH",
      "cell_i": "dummyI",
      "cell_j": "dummyJ",
    }

    draw_pmos_central_layout(waffle_params)
    draw_pmos_left_bottom_layout(waffle_params)
    draw_pmos_right_top_layout(waffle_params)
    draw_pmos_corners_layout(waffle_params)

    return top

KlayoutUtilities.clear()

draw_pmos_waffle()

KlayoutUtilities.set_visual_configuration()

# LayerMap
# Reading a GDS returns a LayerMap object.

# physical layer:
# - stream or separated layers in CAD file.
# - Each physical layer is represented witg layer and datatype number or name.

# logical layer: 
# - Layers persent on a Layout object.
# - Each logical layer is represented with an integer index.

# A LayerMap represents a mapping of physical laayers to logical layers.