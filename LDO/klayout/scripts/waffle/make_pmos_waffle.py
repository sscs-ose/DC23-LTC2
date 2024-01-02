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
  layermap: pya.LayerMap = layout.read(gds_path)
  updated_topcells: set(int) = {i for i in k.layout.each_top_cell()}

  new_topcells = updated_topcells - existing_topcells

  # Map from cell indexes to cell names
  new_cell_names = list(k.layout.cell(i) for i in new_topcells)

  return new_cell_names


@KlayoutUtilities.inject_top_layout
def draw_pmos_central_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_source_in, *_ = read_gds(waffle_params["source_in"])
    cell_drain_in, *_ = read_gds(waffle_params["drain_in"])

    n = waffle_params["n"]

    d = cell_source_in.dbbox().width()

    dx = DPoint( d - waffle_params["dx_overlap"], 0)
    dy = DPoint( 0, d - waffle_params["dy_overlap"])

    array_A1 = DCellInstArray(
        cell_source_in, 
        DTrans(- cell_source_in.dbbox().p1),
        dx * 2,
        dy * 2,
        n,
        n
    )

    array_A2 = DCellInstArray(
        cell_source_in,
        DTrans(-cell_source_in.dbbox().p1 + dx + dy),
        dx * 2,
        dy * 2,
        n,
        n
    )

    array_B1 = DCellInstArray(
        cell_drain_in,
        DTrans(-cell_drain_in.dbbox().p1 + dx),
        dx * 2,
        dy * 2,
        n,
        n
    )

    array_B2 = DCellInstArray(
        cell_drain_in, 
        DTrans(-cell_drain_in.dbbox().p1 + dy),
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
def draw_pmos_left_top_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_source_lt, *_ = read_gds(waffle_params["source_lt"])
    cell_drain_lt, *_ = read_gds(waffle_params["drain_lt"])

    n = waffle_params["n"]
    d = cell_source_lt.dbbox().height()

    source_base = -cell_source_lt.dbbox().p1 - DPoint(cell_source_lt.dbbox().width() - d, 0)
    drain_base = -cell_drain_lt.dbbox().p1 - DPoint(cell_drain_lt.dbbox().width() - d, 0)
    

    dx = DPoint( d - waffle_params["dx_overlap"], 0)
    dy = DPoint( 0, d - waffle_params["dy_overlap"])

    # Left
    array_A1 = DCellInstArray(
        cell_source_lt, 
        DTrans(source_base - dx + dy),
        dx * 2,
        dy * 2,
        0,
        n
    )

    array_B1 = DCellInstArray(
        cell_drain_lt, 
        DTrans(drain_base - dx),
        dx * 2,
        dy * 2,
        0,
        n
    )

    top.insert(array_A1)
    top.insert(array_B1)

    array_A2 = DCellInstArray(
        cell_source_lt, 
        DTrans(source_base + dy*2*n),
        dx * 2,
        dy * 2,
        n,
        0
    )

    array_B2 = DCellInstArray(
        cell_drain_lt, 
        DTrans(drain_base + dx + dy*2*n),
        dx * 2,
        dy * 2,
        n,
        0
    )

    top.insert(array_A2)
    top.insert(array_B2)



@KlayoutUtilities.inject_top_layout
def draw_pmos_right_bottom_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_a, *_ = read_gds(waffle_params["cell_e"])
    cell_b, *_ = read_gds(waffle_params["cell_f"])

    n = waffle_params["n"]

    dx = DPoint( cell_a.dbbox().width(), 0)
    dy = DPoint( 0, cell_a.dbbox().height())   

    # Left
    array_A1 = DCellInstArray(
        cell_a, 
        DTrans(-cell_a.dbbox().p1 + dx*2*n),
        dx * 2,
        dy * 2,
        0,
        n
    )

    array_B1 = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 + dx*2*n + dy),
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
def draw_pmos_corners_layout(waffle_params, top: Cell = None, layout: Layout = None):
    cell_a, *_ = read_gds(waffle_params["cell_g"])
    cell_b, *_ = read_gds(waffle_params["cell_h"])
    cell_c, *_ = read_gds(waffle_params["cell_i"])
    cell_d, *_ = read_gds(waffle_params["cell_j"])

    n = waffle_params["n"]

    dx = DPoint( cell_a.dbbox().width(), 0)
    dy = DPoint( 0, cell_a.dbbox().height())   

    # Left
    array_A = DCellInstArray(
        cell_a,
        DTrans(-cell_a.dbbox().p1 - dx - dy))

    array_B = DCellInstArray(
        cell_b, 
        DTrans(-cell_b.dbbox().p1 + dx*2*n - dy)
    )

    array_C = DCellInstArray(
        cell_c, 
        DTrans(-cell_c.dbbox().p1 + dx*2*n + dy*2*n),
    )

    array_D = DCellInstArray(
        cell_d, 
        DTrans(-cell_d.dbbox().p1 - dx + dy*2*n)
    )

    top.insert(array_A)
    top.insert(array_B)
    top.insert(array_C)
    top.insert(array_D)


def draw_pmos_waffle_approximate_m(m: int) -> tuple[int, int]:
    """Given a target multiplicity, returns most approximate upper and lower bounds valid for waffle topology"""
    temp =      1+2*m
    sqrt_temp = int(sqrt(temp))

    # Get real or approximate n
    if temp == sqrt_temp**2:
        # Multiplicity m can be obtained exactly
        n = int( (1 + int(sqrt(1+2*m)) ) / 2 )

        if n % 2 == 0:
            n_top = n
            n_bottom = n

        else:
            # Value is even
            n_top = n + 1
            n_bottom = n -1

    else:
        # Multiplicity m can't be obtained exactly
        # n is approximated to upper bound
        n = (1 + sqrt(1+2*m) ) / 2
        n_top = ceil(n)
        n_bottom = floor(n)

        if n_top % 2 == 0:
            # if n_top is even, n_bottom is odd
            n_bottom -= 1
        else:
            n_top += 1

    get_m = lambda n: 2 * n * (n-1)

    return get_m(n_bottom), get_m(n_top)


def recursive_m_exploration(until, m=0):
    if until == 0:
        return
    _, m = draw_pmos_waffle_approximate_m(m)
    print(f"{m = }")
    recursive_m_exploration(until=until-1, m=m+1)


@KlayoutUtilities.inject_top_layout
def draw_pmos_waffle(x=0, y=0, m=60, top: Cell = None, layout: Layout = None):
    # Supossition: Always using m_top as m
    _, m = draw_pmos_waffle_approximate_m(m)

    print(f"Using multiplicity {m}")

    waffle_params = {
      "x": x,
      "y": y,
      "m": m,
      "n": int( (1 + int(sqrt(1+2*m)) ) / 2 ),
      "dx_overlap": 0.4,
      "dy_overlap": 0.4,
      "source_in": "pmos_source_in",       # "dummyA",
      "drain_in": "pmos_drain_in",        # "dummyB",
      "source_lt": "pmos_source_frame_lt", # "dummyC",
      "drain_lt": "pmos_drain_frame_lt",  # "dummyD",
      "cell_e": "pmos_source_frame_rb", # "dummyE",
      "cell_f": "pmos_drain_frame_rb",  # "dummyF",
      "cell_g": "pmos_waffle_corners",  # "dummyG",
      "cell_h": "" "dummyH",
      "cell_i": "" "dummyI",
      "cell_j": "" "dummyJ",
    }

    draw_pmos_central_layout(waffle_params)
    draw_pmos_left_top_layout(waffle_params)
    #draw_pmos_right_bottom_layout(waffle_params)
    #draw_pmos_corners_layout(waffle_params)

    return top

#draw_pmos_waffle_approximate_m(23)

KlayoutUtilities.clear()

draw_pmos_waffle(m=0)

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