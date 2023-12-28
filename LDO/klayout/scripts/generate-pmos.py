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

    # cell_view is pointing to "TOP"
    self.cell_view: pya.CellView = self.layout_view.active_cellview()

    # layout points to TOP cell layout.
    # We can get cells referenced by TOP
    self.layout: pya.Layout = self.cell_view.layout()

    if self.cell_view.cell is None:
      print("Current cell is not setted (Ctrl-S over top cell)")

      if self.layout.cell("TOP") is None:
        self.layout.create_cell("TOP")
        self.cell_view.set_cell_name("TOP")

    # Direct reference to TOP cell.
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
  def inject_top_layout(func):
    """Decorator. Injects top cell and the layout"""
    k = KlayoutUtilities()

    def _wrapper(*args, **kwargs):
      cell, _ = k.register(func, *args, layout=k.layout, top=k.viewed_cell, **kwargs)

      return cell
    
    return _wrapper
  
  @staticmethod
  def default_pmos_parameters():    
    fet_3p3_l = float(0.28)
    fet_3p3_w = float(0.22)
    fet_w_con = float(0.36)
    fet_w_con_bulk = 0.42
    fet_5_6_w = 0.3

    nfet_05v0_l = 0.6
    nfet_06v0_l = 0.7

    pfet_05v0_l = 0.5
    pfet_06v0_l = 0.55

    nfet_nat_l = 1.8
    nfet_nat_w = 0.8
    fet_grw = 0.38
    fet_ld = 0.52

    ldfet_l_min = 0.6
    ldfet_l_max = 20
    ldfet_w_min = 4
    ldfet_w_max = 50

    return dict({
      "layout": None,                 # layout
      "deepnwell": 0,                 # Deep NWELL
      "pcmpgr": 0,                    # Deep NWELL Guard Ring
      "volt": "3.3V",                 # Operating Voltage (3.3V 5V 6V)
      "bulk": "None",                 # Bulk Type (None, Bulk Tie, Guard Ring)
      "w_gate": fet_3p3_w,            # Width
      "l_gate": fet_3p3_l,            # Length
      "inter_sd_l": fet_ld,           # Diffusion Length
      "nf": 1,                        # Number of Fingers
      "grw": fet_grw,                 # Guard Ring Width
      "gate_con_pos": "alternating",  # Gate Contact Position (top bottom alternating)
      "con_bet_fin": 1,               # Contact Between Fingers
      "sd_con_col": 1,                # Diffusion Contacts Columns
      "interdig": 0,                  # Interdigitation
      "patt": "",                     # Pattern in case of Interdigitation
      "patt_lbl": 0,                  # Interdigitation pattern label
      "lbl": 0,                       # Labels
      "sd_lbl": list(),               # Pattern of Source/Drain Labels
      "g_lbl": list(),                # Patterns of Gate Labels
      "sub_lbl": "",                  # Substrate Label
    })


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


  @staticmethod
  def get_layer(name: str):
    layer_tuple: tuple = cells.layers_def.layer[name]
    return KlayoutUtilities().layout.layer(*layer_tuple)

# PMOS design
#############


@KlayoutUtilities.inject_top_layout
def generate_pmos(top: pya.Cell, layout: pya.Layout = None):

  pmos_params: dict = KlayoutUtilities.default_pmos_parameters()
  pmos_params["layout"] = layout
  pmos_params["nf"] = 5
  pmos_params["l_gate"] = 0.7
  pmos_params["w_gate"] = 1 # nf 5
  pmos_params["gate_con_pos"] = "top"
  pmos_params["bulk"] = "Bulk Tie"
  pmos_params["con_bet_fin"] = 0 # Without contacts between fingers

  pmos: pya.Cell = cells.draw_fet.draw_pfet(
    **pmos_params
  )
  pmos.flatten(1)

  pmos_inst = pya.DCellInstArray(
    pmos,
    pya.Trans(pya.Point(0, 0)),
    pya.Vector(0, 0),
    pya.Vector(0, 0),
    1,
    1,
  )

  top.insert(pmos_inst)

  return pmos_inst

KlayoutUtilities.clear()

generate_pmos()

KlayoutUtilities.set_visual_configuration()