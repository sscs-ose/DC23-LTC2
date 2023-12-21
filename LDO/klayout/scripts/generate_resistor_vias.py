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

  def _wrapper(*args, **kwargs):
    return func(*args, layout=layout, **kwargs)

  return _wrapper


def insert_pya(func):
  """func returns something that can be inserted in top cell"""
  mw = pya.Application.instance().main_window()
  layout_view = mw.current_view()

  if layout_view is None:
    print("There is any layout open")
    exit()

  cell_view: pya.CellView = layout_view.active_cellview()
  viewed_cell: pya.Cell= cell_view.cell

  if viewed_cell is None:
    print("Current cell is not setted (Ctrl-S over top cell)")
    exit()

  def _wrapper(*args, **kwargs):
    cell_inst_array: pya.DCellInstArray = func(*args, **kwargs)
    viewed_cell.insert(cell_inst_array)

    return cell_inst_array

  return _wrapper


# Cell creation
###############

## This is totally file specific

@create_pcell
def create_via_cell(layout: pya.Layout = None) -> pya.Cell:
  via_draw: pya.Cell = cells.via_generator.draw_via_dev(
    layout,
    base_layer="M1",
    metal_level="M2",
    x_min=0,
    y_min=0,
    x_max=1,
    y_max=1,
  )

  # This removes the new cell hierarchy
  via_draw.flatten(1)

  return via_draw


@insert_pya
def insert_via_array() -> pya.DCellInstArray:
  via_cell = create_via_cell()

  # This lines 
  via_array = pya.DCellInstArray(
    via_cell,
    pya.Trans(pya.Point(0, 0)),
    pya.Vector(3, 0),
    pya.Vector(0, 3),
    2,
    2,
  )

  return via_array


clear_top_cell()
insert_via_array()