import pya
import cells
from pprint import pprint

def pcell_see_interesting_attributes(instance):
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


def generate_pcell(func):
  """Decorator. Abstracts the usage of klayout api when instantiating gf180mcu pcells"""
  layout_view = pya.Application.instance().main_window().current_view()
  cell_view: pya.CellView = layout_view.active_cellview()
  layout: pya.Layout = cell_view.layout()
  viewed_cell: pya.Cell= cell_view.cell
  
  def _wrapper(*args, **kwargs):
    instance = func(*args, **kwargs)
    instance.coerce_parameters(layout, None)
    instance.cell = viewed_cell
    instance.produce_impl()
    
    return instance

  return _wrapper


def generate_pya(func):
  """Decorator. Abstracts the usage of klayout api when instantiating klayout elements"""
  layout_view: pya.LayoutView = pya.Application.instance().main_window().current_view()
  cell_view: pya.CellView = layout_view.active_cellview()
  layout: pya.Layout = cell_view.layout()
  viewed_cell: pya.Cell = cell_view.cell

  # Some type playing
  DType = pya.DPath | pya.DBox
  def _wrapper(*args, **kwargs) -> tuple[tuple[int], DType]:
    layer_tuple, instance = func(*args, **kwargs)

    layer = layout.layer(*layer_tuple)
    viewed_cell.shapes(layer).insert(instance)
    return layer, instance

  return _wrapper


def generate_pya_2(func):
  """Decorator. Abstracts the usage of klayout api when instantiating klayout elements"""
  layout_view: pya.LayoutView = pya.Application.instance().main_window().current_view()
  cell_view: pya.CellView = layout_view.active_cellview()
  layout: pya.Layout = cell_view.layout()
  viewed_cell: pya.Cell = cell_view.cell

  def _wrapper(*args, **kwargs) -> pya.DCellInstArray:
    instance: pya.DCellInstArray = func(*args, **kwargs)

    viewed_cell.insert(instance)
    #viewed_cell.flatten(1)
    
    return instance

  return _wrapper


# Original functions
####################

# def make_resistor():
#   """DEPRECATED: Is not using the decorator, so it exposes internal klayout API"""
#   layout_view = pya.Application.instance().main_window().current_view()
#   cell_view = layout_view.active_cellview()
#   layout = cell_view.layout()
#   viewed_cell = cell_view.cell

#   instance = cells.ppolyf_u_resistor()
#   instance.cell = viewed_cell

#   instance.coerce_parameters(layout, None)
#   instance.l_res = 20
#   instance.w_res = 1

#   instance.lbl=1
#   instance.r0_lbl=""
#   instance.r1_lbl=""
#   instance.sub_lbl=1

#   instance.x_spacing = 0
#   instance.y_spacing = 3

#   #instance.array_x = 1
#   #instance.array_y = 1

#   instance.produce_impl()


#@generate_pya
# def generate_resistor_bulk_connection():
#   layout_view: pya.LayoutView = pya.Application.instance().main_window().current_view()
#   cell_view: pya.CellView = layout_view.active_cellview()
#   layout: pya.Layout = cell_view.layout()
#   viewed_cell: pya.Cell = cell_view.cell


#   first = pya.DPoint(-1.7, 51.5)
#   last  = pya.DPoint(-1.7, 0.5)
#   path = pya.DPath([first, last], 1.0)

  
#   layer_tuple: tuple = cells.layers_def.layer["metal1"]

#   layer = layout.layer(*layer_tuple)
#   viewed_cell.shapes(layer).insert(path)


def clear_generated_cells():
  """Restart cell, removing all polygons and pcells instantiated in the current layout view"""
  layout_view = pya.Application.instance().main_window().current_view()
  cell_view = layout_view.active_cellview()
  cell = cell_view.cell

  cell.clear()


@generate_pcell
def generate_resistor():
  """Generates a resistor to be used in a common centroid resistor"""
  instance = cells.ppolyf_u_resistor()

  instance.l_res = 20
  instance.w_res = 1

  instance.lbl=1
  instance.r0_lbl=""
  instance.r1_lbl=""
  instance.sub_lbl=1

  # Min space bewteen resistors: 0.4 um
  instance.x_spacing = 0

  #instance.y_spacing = 2 # Minimum valid
  instance.y_spacing = 3 # -1.6

  instance.array_x = 1
  instance.array_y = 18

  return instance


@generate_pcell
def generate_resistor_m1_m2_vias():
  """Generates the vias to make M2 horizontal routes"""
  via_m1_m2 = cells.via_dev()

  via_m1_m2.base_layer = "M1"
  via_m1_m2.metal_level = "M2"

  via_m1_m2.x_min = 0
  via_m1_m2.y_min = 0

  via_m1_m2.x_max = 1
  via_m1_m2.y_max = 1

  return via_m1_m2

@generate_pya_2
def generate_resistor_via_array():
  via = generate_resistor_m1_m2_vias()
  via_layout: pya.Layout = via.layout
  via_cell: pya.Cell = via.cell

  via_dx = pya.DVector(1, 0)
  via_yx = pya.DVector(0, 1)

  inst_array = pya.CellInstArray(
    via.cell,
    pya.Trans(pya.Point(0, 0)),
    pya.DVector(100, 0),
    pya.DVector(0, 100),
    3,
    3,
  )

  return inst_array


@generate_pya
def generate_resistor_bulk_connection():
  first = pya.DPoint(-1.7, 51.5)
  last  = pya.DPoint(-1.7, 0.5)
  metal1_width = 0.3 # min 0.23

  path = pya.DPath([first, last], metal1_width)

  layer_tuple: tuple = cells.layers_def.layer["metal1"]

  return layer_tuple, path


# Some recommendations
######################

# Drawable pya classes
# Instances with D use microns instead of database units
# Some definitions are not clarified in the code. They should be in documenation.
# - DBox             | rectangular shape with floating point coordinates
# - DCellInstArray  | Single or array cell instance
# - DCplxTrans       | Complex transformation with magnification, mirroring, rotation, displacement
# - DEdge            | Connection between points. Are not usually used
# - DEdgePair        | Used mainly in DRC to indicate violations in edges
# - DPath            | Sequence of lines forming. Can have round edges
# - DPoint           | Point with floating-point coordinates.
# - DPolygon         | Polygon class. Has a outer hull and can have holes
# - DSimplePolygon   | Outher hull only.
# - DText            | Text object
# - DTRans           | Simple transformation. rotations in 90°, mirroring
# - DVector          | Vector with floating-point coordinates. There are not geometrical objects

# metal1: vertical
# metal2: horizontal

# min metal1 width:    0.23
# min metal1 distance: 0.23
# min metal1 area:     0.1444

# min metal2 width:    0.28
# min metal2 distance: 0.28
# min metal2 area:     0.1444

clear_generated_cells()
#generate_resistor()
generate_resistor_bulk_connection()

#generate_resistor_m1_m2_vias()



#generate_resistor_via_array()