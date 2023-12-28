import pya
from pprint import pprint

app = pya.Application.instance()
mw: pya.MainWindow = pya.MainWindow.instance()

if mw.current_view() is None:
  print("Create a layout")

  # With this, there is going to be a view without a layout
  view = mw.create_view()

  mw.create_layout("gf180mcu", 2) 
  exit()
exit()
#menu_items_methods = [item for item in dir(mw) if item.startswith("cm_")]



#mw.message("evaluado", 1000)

menu = mw.menu()
menu.insert_menu("end", "therial", "test real")


# Define reload resistor pcell
reload_action = pya.Action()
reload_action.title="Reload my pcell"
reload_action.on_menu_opening = lambda : mw.message("reloaded resistor pcell", 1000)

menu.insert_item("therial.end", "reload res", reload_action)

# - insert_item
# Inserta un item antes del indicado en el path.
# El objeto Action referencia un handler que implenenta tanto acción como apariencia.

# - insert_menu
# Inserta un submenu.

# - insert_separator
# Es obvio.

#menu.insert_item(
#  path="",
#  name="test"
#  action=
#)