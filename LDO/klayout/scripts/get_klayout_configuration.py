import pya
app = pya.Application.instance()

current_config = {key: app.get_config(key) for key in app.get_config_names()}

from pprint import pprint
pprint(current_config)