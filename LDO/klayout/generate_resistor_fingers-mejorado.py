import pya
import cells
from pprint import pprint

# Utilities
###########

def get_cell_information(cell: pya.Cell) -> None:
  """Gives some information of a cell instance"""
  print(f"{cell.name=}")
  print(f"{cell.prop_id=}")
  print(f"{cell.prop_id=}")
  print(f"{cell.dbbox()=}")
  print(f"{cell.basic_name()=}")
  print(f"{cell.display_title()=}")
  print(f"{cell.dump_mem_statistics()=}")


def get_pcell_information(instance):
  """Show some attributes from gf180mcu pcell"""
  for param in instance.get_parameters():
    #pprint(dir(param))
    print(f"{param.name}:")
    print(f"\thidden={param.hidden}")
    print(f"\tvalues={param.choice_values()}")
    print(f"\tdescription={param.description}")
    print(f"\tdefault={param.default}")
    print(f"\tdup={param.dup()}")
    #print(f"\t={param.}")


def clear_top_cell():
  """Removes all the cells in the hierarchy of the top cell"""
  layout_view = pya.Application.instance().main_window().current_view()
  if layout_view is None:
    print("There is any layout open")
    exit()

  cell_view: pya.CellView = layout_view.active_cellview()
  viewed_cell: pya.Cell= cell_view.cell

  if viewed_cell is None:
    print("Current cell is not setted (Ctrl-S over top cell)")
    exit()

  viewed_cell.clear()


# Decorators
############
cell_cache = dict()

def create_pcell(func):
  """Used to insert the layout object required by draw_* functions"""
  layout_view = pya.Application.instance().main_window().current_view()

  if layout_view is None:
    print("There is any layout open")
    exit()

  cell_view: pya.CellView = layout_view.active_cellview()
  layout: pya.Layout = cell_view.layout()
  viewed_cell: pya.Cell= cell_view.cell

  if viewed_cell is None:
    print("Current cell is not setted (Ctrl-S over top cell)")
    exit()

  global cell_cache
  def _wrapper(*args, **kwargs):
    arg_key = "_".join(args)
    kwarg_key = "_".join(f"{key}_{value}" for key,value in kwargs.items())
    cell_key = f"{func.__hash__()}-{arg_key}-{kwarg_key}"
    if not cell_key in cell_cache.keys():
      cell_cache[cell_key] = func(*args, layout=layout, **kwargs)
    else:
      print("match")
  
    pprint(cell_cache)
    return cell_cache[cell_key]

  return _wrapper


def create_pya(func):
  """func returns something that can be inserted in top cell"""
  layout_view: pya.LayoutView = pya.Application.instance().main_window().current_view()

  if layout_view is None:
    print("There is any layout open")
    exit()

  cell_view: pya.CellView = layout_view.active_cellview()
  layout: pya.Layout = cell_view.layout()
  viewed_cell: pya.Cell = cell_view.cell

  if viewed_cell is None:
    print("Current cell is not setted (Ctrl-S over top cell)")
    exit()

  global cell_cache
  def _wrapper(*args, **kwargs) -> pya.DCellInstArray:
    arg_key = "_".join(args)
    kwarg_key = "_".join(f"{key}_{value}" for key,value in kwargs.items())
    cell_key = f"{func.__hash__()}-{arg_key}-{kwarg_key}"

    if not cell_key in cell_cache.keys():
      cell_inst_array: pya.DCellInstArray = func(*args, layout=layout, **kwargs)
      viewed_cell.insert(cell_inst_array)
      #viewed_cell.flatten(1)

      cell_cache[cell_key] = cell_inst_array
    else:
      print("match")

    return cell_cache[cell_key]

  return _wrapper


def generate_pya(func):
  """Decorator. Abstracts the usage of klayout api when instantiating klayout elements"""
  layout_view: pya.LayoutView = pya.Application.instance().main_window().current_view()

  if layout_view is None:
    print("There is any layout open")
    exit()

  cell_view: pya.CellView = layout_view.active_cellview()
  layout: pya.Layout = cell_view.layout()
  viewed_cell: pya.Cell = cell_view.cell

  if viewed_cell is None:
    print("Current cell is not setted (Ctrl-S over top cell)")
    exit()

  # Some type playing
  DType = pya.DPath | pya.DBox
  def _wrapper(*args, **kwargs) -> tuple[tuple[int], DType]:
    layer_tuple, instance = func(*args, **kwargs)

    layer = layout.layer(*layer_tuple)
    viewed_cell.shapes(layer).insert(instance)
    return layer, instance

  return _wrapper


# Resistor design
#################

@create_pya
def generate_resistor(layout: pya.Layout = None):
  """Generates the resistor to be used in a common centroid resistor"""

  # Create resistor core
  ######################

  res_core: pya.Cell = cells.draw_res.draw_ppolyf_res(
    layout = layout,
    l_res = 20,
    w_res = 1,
    res_type = "ppolyf_u",
    deepnwell = 0,
    pcmpgr = 0,
    lbl = 1,
    r0_lbl = "",
    r1_lbl = "",
    sub_lbl = 1,
  )

  #res_core.flatten(1)

  # Create resistor array
  #######################
  
  # Min space bewteen resistors: 0.4 um
  res_x_spacing = 0

  #res_y_spacing = 2 # Minimum valid
  res_y_spacing = 3 # -1.6

  res = pya.DCellInstArray(
    res_core,
    pya.Trans(pya.Point(0, 0)),
    pya.Vector(res_x_spacing, 0),
    pya.Vector(0, res_y_spacing),
    1,
    18,
  )

  return res


@generate_pya
def generate_resistor_bulk_connection():
  first = pya.DPoint(-1.7, 51.5)
  last  = pya.DPoint(-1.7, 0.5)
  metal1_width = 0.3 # min 0.23

  path = pya.DPath([first, last], metal1_width)

  layer_tuple: tuple = cells.layers_def.layer["metal1"]

  return layer_tuple, path


@create_pcell
def generate_m1_m2_via(layout: pya.Layout):
  via_cell: pya.Cell = cells.via_generator.draw_via_dev(
    layout,
    base_layer="M1",
    metal_level="M2",
    x_min=0,
    y_min=0,
    x_max=1,
    y_max=1,
  )

  # This removes the new cell hierarchy
  #via_cell.flatten(1)
  return via_cell


@create_pya
def insert_resistor_core_vias(layout: pya.Layout) -> pya.DCellInstArray:
  via_cell: pya.Cell = generate_m1_m2_via()

  # Array setting
  
  start = pya.DPoint(-0.83, 0)
  
  # Separation between centers: 20.66
  # 
  x_space = 20.66
  y_space = 3
  
  via_array = pya.DCellInstArray(
    via_cell,
    pya.DTrans(start),
    pya.DVector(x_space, 0),
    pya.DVector(0, y_space),
    2,
    18
  )

  return via_array


@create_pya
def insert_resistor_inner_routing_vias(layout: pya.Layout) -> pya.DCellInstArray:
  via_cell: pya.Cell = generate_m1_m2_via()

  # Array setting
  extension_x = 3

  start_x = -0.83 - extension_x
  start_y = 0
  
  x_space = 20.66 + 2 * extension_x
  y_space = 3
  
  via_array = pya.DCellInstArray(
    via_cell,
    pya.DTrans(pya.DPoint(start_x, start_y)),
    pya.DVector(x_space, 0),
    pya.DVector(0, y_space),
    2,
    18
  )

  return via_array


@create_pya
def insert_resistor_inner_outer_vias(layout: pya.Layout) -> pya.DCellInstArray:
  via_cell: pya.Cell = generate_m1_m2_via()

  # Array setting
  extension_x = 3+2

  start_x = -0.83 - extension_x
  start_y = 0
  
  x_space = 20.66 + 2 * extension_x
  y_space = 3
  
  via_array = pya.DCellInstArray(
    via_cell,
    pya.DTrans(pya.DPoint(start_x, start_y)),
    pya.DVector(x_space, 0),
    pya.DVector(0, y_space),
    2,
    18
  )

  return via_array



clear_top_cell()
generate_resistor()
generate_resistor_bulk_connection()
insert_resistor_core_vias()
insert_resistor_inner_routing_vias()
insert_resistor_inner_outer_vias()