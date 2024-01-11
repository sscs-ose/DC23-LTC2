import pya
from pya import Cell, Layout, DCplxTrans
import cells
from pprint import pprint
from pathlib import Path

class KlayoutUtilities:
  _instances = {}
  _load_options = pya.LoadLayoutOptions()



  def __init__(self):
    self.cell_cache = dict()

    self.app: pya.Application = pya.Application.instance()

    self.app.set_config("grid-micron", "0.005")
    #self.app.set_config("grid-micron", "0.001")
    self.app.set_config("grid-style0", "lines")
    

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

    # print(f"{func=}")
    # print(f"{args=}")
    # print(f"{kwargs=}")

    func_key = func.__hash__()
    arg_key = "_".join(str(arg) for arg in args)
    kwarg_key = "_".join(f"{key}_{str(value)}" for key,value in kwargs.items())

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
  def clear():
      """Removes all the cells in the hierarchy of the top cell"""
      k = KlayoutUtilities()

      # GOTO topcell TOP before remove everything
      k.cell_view.cell_name = "TOP"

      # To clean the top cell, we have to strategies:
      # Delete subcells
      k.layout.prune_subcells(k.viewed_cell.cell_index(), -1)

      # Flatten
      #k.viewed_cell.flatten(-1, prune=True)

      for topcell_idx in k.layout.each_top_cell():
      
          topcell = k.layout.cell(topcell_idx)
          if topcell.name in {"TOP", k.viewed_cell}:
              continue

          k.layout.prune_cell(topcell, -1)

      # This always happens
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
    #k.cell_view.set_cell_name("TOP")
    k.layout_view.add_missing_layers()
    k.layout_view.zoom_fit()


  @staticmethod
  def get_layer(name: str):
    layer_tuple: tuple = cells.layers_def.layer[name]
    return KlayoutUtilities().layout.layer(*layer_tuple)


  @staticmethod
  def read_gds(gds: Path | str):
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

    layout = KlayoutUtilities().layout

    existing_topcells: set[int] = {i for i in layout.each_top_cell()}
    layermap: pya.LayerMap = layout.read(gds_path, KlayoutUtilities._load_options)
    updated_topcells: set[int] = {i for i in layout.each_top_cell()}

    new_topcells = updated_topcells - existing_topcells

    # Returning cell indexes
    #return list(i for i in new_topcells)

    # Returning cell names
    #return list(layout.cell(i).name for i in new_topcells)

    # Returning cells
    return list(layout.cell(i) for i in new_topcells)


  @staticmethod
  def set_load_mapping(mapping):
    lm = pya.LayerMap()

    for layer_source_tuple, layer_target_tuple in mapping.items():
      source_layer_info = pya.LayerInfo(*layer_source_tuple)

      if layer_target_tuple is None:
        continue

      if lm.is_mapped(source_layer_info):
        print(f"Layer {source_layer_info} is already mapped!!")
        continue

      target_layer = KlayoutUtilities().layout.layer(*layer_target_tuple)

      lm.map(source_layer_info, target_layer)

    KlayoutUtilities._load_options.layer_map = lm


  @staticmethod  
  def recursive_remove_layer(cell: Cell, layer_tuple: tuple[int]):
    layer_index = cell.layout().layer(*layer_tuple)
    cell.shapes(layer_index).clear()

    for subcell in cell.each_child_cell():
      KlayoutUtilities.recursive_remove_layer(cell.layout().cell(subcell), layer_tuple)


  @staticmethod
  def sky130_gf180_mapping():
    return dict({
      (64, 20): cells.layers_def.layer["nwell"],    # N-well region
      (66, 20): cells.layers_def.layer["poly2"],    # Polysilicon
      (93, 44): cells.layers_def.layer["nplus"],    # N+ source/drain implant
      (94, 20): cells.layers_def.layer["pplus"],    # P+ source/drain implant

      (66, 44): cells.layers_def.layer["contact"],  # Contact to local interconnect
      (67, 44): cells.layers_def.layer["via1"],     # Contact from local interconnect to metal1
      (68, 44): cells.layers_def.layer["via2"],     # Contact from metal 1 to metal 2
      (69, 44): cells.layers_def.layer["via3"],     # Contact from metal 2 to metal 3
      (70, 44): cells.layers_def.layer["via4"],     # Contact from metal 3 to metal 4
      (71, 44): cells.layers_def.layer["via5"],     # Contact from metal 4 to metal 5

      (67, 20): cells.layers_def.layer["metal1"],   # Local interconnect
      (68, 20): cells.layers_def.layer["metal2"],   # Metal1
      (69, 20): cells.layers_def.layer["metal3"],   # Metal 2
      (70, 20): cells.layers_def.layer["metal4"],   # Metal 3
      (71, 20): cells.layers_def.layer["metal5"],   # Metal 4
      (72, 20): cells.layers_def.layer["metaltop"], # Metal 5

      (65, 20): cells.layers_def.layer["comp"],     # Active (diffusion) area (type opposite of well/substrate underneath)
      (65, 44): cells.layers_def.layer["comp"],     # Active (diffusion) area (type equal to the well/substrate underneath) (i.e., N+ and P+)
      (75, 20): cells.layers_def.layer["dualgate"], # High voltage (5.0V) thick oxide gate regions
      (95, 20): None                                # Nitride poly cut (under licon1 areas)
    })

  @staticmethod  
  def recursive_transform_layer_shapes(cell: Cell, transformation: DCplxTrans, layer_index: int):
      cell_shapes = cell.shapes(layer_index)

      cell_shapes.transform(transformation)

      for subcell in cell.each_child_cell():
          KlayoutUtilities.recursive_transform_layer_shapes(cell.layout().cell(subcell), transformation, layer_index)

  @staticmethod  
  def recursive_transform_shapes(cell: Cell, transformation: DCplxTrans):
      for layer_index in range(cell.layout().layers()):
          KlayoutUtilities.recursive_transform_layer_shapes(cell, transformation, layer_index)

