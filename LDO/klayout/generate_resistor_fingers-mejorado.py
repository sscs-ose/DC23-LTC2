import pya
import cells
from pprint import pprint

class KlayoutUtilities:
  _instances = {}

  def __init__(self):
    self.cell_cache = dict()

    self.app: pya.Application = pya.Application.instance()

    self.layout_view: pya.LayoutView = self.app.main_window().current_view()
    if self.layout_view is None:
      print("There is any layout open... creating")

      tech="gf180mcu"
      mode=0
      self.app.main_window().create_layout(tech, mode)

      self.layout_view = self.app.main_window().current_view()

    # Cell view can be pointing nothing
    # If that's the case, a TOP cell is created and pointed

    self.cell_view: pya.CellView = self.layout_view.active_cellview()
    self.layout: pya.Layout = self.cell_view.layout()

    if self.cell_view.cell is None:
      print("Current cell is not setted (Ctrl-S over top cell)")

      if self.layout.cell("TOP") is None:
        self.layout.create_cell("TOP")
        self.cell_view.set_cell_name("TOP")

    self.viewed_cell: pya.Cell= self.cell_view.cell

  def __call__(cls, *args, **kwargs):
    """Always returns the same KlayoutUtilities instance"""
    if cls not in cls._instances:
      instance = super().__call__(*args, **kwargs)
      cls._instances[cls] = instance

    return cls._instances[cls]


  @staticmethod
  def register(func, *args, **kwargs):
    """Assuming that func is a pure function, the register avoid cell duplication"""
    k = KlayoutUtilities()

    func_key = func.__hash__()
    arg_key = "_".join(args)
    kwarg_key = "_".join(f"{key}_{value}" for key,value in kwargs.items())

    cell_key = f"{func_key}-{arg_key}-{kwarg_key}"

    registered = True
    if not cell_key in k.cell_cache.keys():
      k.cell_cache[cell_key] = func(*args, **kwargs)
      registered = False

    # else:
    #   print("match")

    return k.cell_cache[cell_key], registered


  @staticmethod
  def create_pcell(func):
    k = KlayoutUtilities()

    def _wrapper(*args, **kwargs):
      cell, registered = k.register(func, *args, layout=k.layout, **kwargs)

      if not registered:
        pass

      return cell

    return _wrapper


  @staticmethod
  def create_pya(func, split=False):
    """func returns something that can be inserted in top cell"""
    k = KlayoutUtilities()

    def _wrapper(*args, **kwargs) -> pya.DCellInstArray:
      cell_inst_array, registered = k.register(func, *args, layout=k.layout, **kwargs)

      if not registered:
        k.viewed_cell.insert(cell_inst_array)

      return cell_inst_array

    return _wrapper


  @staticmethod
  def generate_pya(func):
    """Decorator. Abstracts the usage of klayout api when instantiating klayout elements"""
    k = KlayoutUtilities()

    # Some type playing
    def _wrapper(*args, **kwargs):
      layer_tuple, instance = func(*args, **kwargs)

      layer = k.layout.layer(*layer_tuple)
      k.viewed_cell.shapes(layer).insert(instance)
      return layer, instance

    return _wrapper


  @staticmethod
  def clear():
    """Removes all the cells in the hierarchy of the top cell"""
    k = KlayoutUtilities()

    k.viewed_cell.clear()
    k.cell_cache.clear()


  @staticmethod
  def get_cell_information(cell: pya.Cell) -> None:
    """Gives some information of a cell instance"""
    print(f"{cell.name=}")
    print(f"{cell.prop_id=}")
    print(f"{cell.prop_id=}")
    print(f"{cell.dbbox()=}")
    print(f"{cell.basic_name()=}")
    print(f"{cell.display_title()=}")
    print(f"{cell.dump_mem_statistics()=}")


  @staticmethod
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


  @staticmethod
  def get_configuration():
    k = KlayoutUtilities()

    app: pya.Application = k.app

    for config in app.get_config_names():
      print(f"{config:<25} {app.get_config(config)}")


  @staticmethod
  def set_recommended_configuration():
    k = KlayoutUtilities()
    app: pya.Application = k.app

    recommended = {
      #"something": 10,
    }

    for config, value in recommended.items():
      print(f"{config:<25} {app.get_config(config)}")
      app.set_config(config, value)

    app.commit_config()


  @staticmethod
  def set_visual_configuration():
    k = KlayoutUtilities()
    k.cell_view.set_cell_name("TOP")
    k.layout_view.add_missing_layers()
    k.layout_view.zoom_fit()


# Resistor design
#################

@KlayoutUtilities.create_pya
def generate_resistor(layout: pya.Layout = None):
  """Generates the resistor to be used in a common centroid resistor"""

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


@KlayoutUtilities.generate_pya
def generate_resistor_bulk_connection():
  first = pya.DPoint(-1.7, 51.5)
  last  = pya.DPoint(-1.7, 0.5)
  metal1_width = 0.3 # min 0.23

  path = pya.DPath([first, last], metal1_width)

  layer_tuple: tuple = cells.layers_def.layer["metal1"]

  return layer_tuple, path


@KlayoutUtilities.create_pcell
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


@KlayoutUtilities.create_pya
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


@KlayoutUtilities.create_pya
def insert_resistor_inner_routing_vias(layout: pya.Layout) -> pya.DCellInstArray:
  via_cell: pya.Cell = generate_m1_m2_via()


  # https://www.klayout.de/doc/manual/create_variants.html
  # https://www.klayout.de/forum/discussion/1814/making-a-cell-variant-using-the-script

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


@KlayoutUtilities.create_pya
def insert_resistor_outer_routing_vias(layout: pya.Layout) -> pya.DCellInstArray:
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


KlayoutUtilities.clear()

# The process should be done in a specific order
# 1. Generate inner and outer vias
insert_resistor_inner_routing_vias()
insert_resistor_outer_routing_vias()


# We stop here. With manual handling one has to turn the vias into
# variations
# Edit > Selection > Make Cell Variants
# Then run the following functions
exit()

# 1. Generate resistor fingers
# 1. Generate bulk connection
# 1. Generate resistor vias
generate_resistor()
generate_resistor_bulk_connection()
insert_resistor_core_vias()

KlayoutUtilities.set_visual_configuration()