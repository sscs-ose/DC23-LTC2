import cells
from cells.via_generator import draw_via_dev
from cells.vias_gen import via_dev
from cells.draw_res import (
    draw_metal_res,
    draw_nplus_res,
    draw_pplus_res,
    draw_npolyf_res,
    draw_ppolyf_res,
    draw_ppolyf_u_high_Rs_res,
    draw_well_res,
)

from pathlib import Path

from cells.res import (
    metal_resistor,
    nplus_s_resistor,
    pplus_s_resistor,
    nplus_u_resistor,
    pplus_u_resistor,
    nwell_resistor,
    pwell_resistor,
    npolyf_s_resistor,
    ppolyf_s_resistor,
    npolyf_u_resistor,
    ppolyf_u_resistor,
    ppolyf_u_high_Rs_resistor,
)

from pprint import pprint

from klayout_utilities import KlayoutUtilities

from pya import (
    Cell,
    Instance,
    Layout,
    CellInstArray,
    DCellInstArray,
    Point,
    DPoint,
    Trans,
    DTrans,
    Vector,
    DVector,
    DCplxTrans,
    DBox,
    DText,
    DPath,
)


class GdsFile:
    def __init__(self, path: Path, cells: list):
        pass


import os


class Padring:
    def __init__(self, top_cell: Cell, cell_sources: list):
        # Dimensions

        self.dx = DVector(500, 0)
        self.dy = DVector(0, 500)

        self.gap = 0.16

        # Padring cell stuff

        self.name = f"padring"
        self.cell = top_cell.layout().create_cell(self.name)

        cell = self.cell

        # Loading cell

        for cell_source in cell_sources:
            cell_source = Path(cell_source)
            if not cell_source.exists():
                raise ValueError(f"Source {cell_source} don't exists")

            cell.layout().read(cell_source)

        # This could be filled with an argument.
        # Maybe from an external file.
        self.mapping = dict()

        # Almost Always, the corner is an exception.
        # All cells have the same height. (Except corner)
        # All cells has a little "gap" to the left when see bbox (Except Corner)
        # All cells have base (0, 0) on bottom left corner plus the gap.

    def get_cell(self, cellname: str) -> Cell:
        if cellname not in self.mapping.keys():
            raise ValueError(f"{cellname} is not a cell")

        return self.mapping[cellname]

    def get_padring(self):
        return self.cell

    def draw_corners(self):
        corner = self.get_cell("cor")

        self.cell.insert(
            DCellInstArray(corner, DCplxTrans(1, 0, False, -self.dx - self.dy))
        )
        self.cell.insert(
            DCellInstArray(corner, DCplxTrans(1, 90, False, self.dx - self.dy))
        )
        self.cell.insert(
            DCellInstArray(corner, DCplxTrans(1, 180, False, self.dx + self.dy))
        )
        self.cell.insert(
            DCellInstArray(corner, DCplxTrans(1, 270, False, -self.dx + self.dy))
        )

    def register_section(self, name, sections):
        if self.cell.layout().cell(name) or name in self.mapping.keys():
            return

        section = self.cell.layout().create_cell(name)

        base = DPoint()

        for padname in sections:
            pad = self.get_cell(padname)

            section.insert(DCellInstArray(pad, DTrans(base)))
            base += DVector(pad.dbbox().right, 0)

        self.mapping[name] = section

    def register_alias(self, name, cellname):
        if self.cell.layout().cell(name):
            print(f"Alias {name} exists as cell")
            return

        if name in self.mapping.keys():
            print(f"Alias {name} already registered")

        cell = self.cell.layout().cell(cellname)
        if not cell:
            print(f"Cell {cellname} doesn't exists")
            return

        self.mapping[name] = cell

    def delete_cell(self, cellname):
        cell = self.cell.layout().cell(cellname)
        if not cell:
            raise ValueError(f"cell {cellname} don't exists")

        cell.prune_subcells(-1)
        self.cell.layout().delete_cell(cell.cell_index())

    def generate_side(self, bottom_list):
        padring_side_name = f"padring_side_{'_'.join(i for i in bottom_list)}"

        padring_side = self.cell.layout().cell(padring_side_name)
        if padring_side:
            return padring_side

        padring_side = self.cell.layout().create_cell(padring_side_name)

        base = DPoint()

        # Add Corner
        corner = self.get_cell("cor")

        padring_side.insert(DCellInstArray(corner, DTrans(base)))
        base += DVector(corner.dbbox().right, 0)

        # Add pads, fillers and breaks
        for padname in bottom_list:
            pad = self.get_cell(padname)

            padring_side.insert(DCellInstArray(pad, DTrans(base)))
            base += DVector(pad.dbbox().right, 0)

        return padring_side

    def draw(self, bottom_pads, right_pads, top_pads, left_pads):
        self.padring_base = DVector()

        if bottom_pads:
            self._put_side(self.generate_side(bottom_pads), 0)
        if right_pads:
            self._put_side(self.generate_side(right_pads), 90)
        if top_pads:
            self._put_side(self.generate_side(top_pads), 180)
        if left_pads:
            self._put_side(self.generate_side(left_pads), 270)

        self.padring_base = DVector()

    def _put_side(self, side_cell: Cell, rotation: float):
        side_box = side_cell.dbbox()
        self.cell.insert(
            DCellInstArray(side_cell, DCplxTrans(1, rotation, False, self.padring_base))
        )
        self.padring_base += (
            side_box.p2 + DVector(side_box.height(), -side_box.height())
        ) * DCplxTrans(1, rotation, False, DVector())


KlayoutUtilities.clear()

"""
Tengo que:

1. Hacer un mapa de alias a nombres de celda
1. Leer el gds. Dar soporte a tener un gds con múltiples celdas

"""

top = KlayoutUtilities().viewed_cell

# We can have multiple gds sources to pads.
cell_sources = {
    f"{os.environ['PDK_ROOT']}/gf180mcuD/libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds"
}

padring_gen = Padring(top, cell_sources)


# It's convenient to delete all cells that are not going to be used

padring_gen.delete_cell("gf180mcu_fd_io__bi_24t")
padring_gen.delete_cell("gf180mcu_fd_io__brk2")
padring_gen.delete_cell("gf180mcu_fd_io__fill1")
padring_gen.delete_cell("gf180mcu_fd_io__fillnc")
padring_gen.delete_cell("gf180mcu_fd_io__in_s")
padring_gen.delete_cell("(UNNAMED)")

# When defining sections, better use short aliases instead of full cellname

padring_gen.register_alias("asig", "gf180mcu_fd_io__asig_5p0")
padring_gen.register_alias("bi_t", "gf180mcu_fd_io__bi_t")
padring_gen.register_alias("brk5", "gf180mcu_fd_io__brk5")
padring_gen.register_alias("cor", "gf180mcu_fd_io__cor")
padring_gen.register_alias("dvdd", "gf180mcu_fd_io__dvdd")
padring_gen.register_alias("dvss", "gf180mcu_fd_io__dvss")
padring_gen.register_alias("fill10", "gf180mcu_fd_io__fill10")
padring_gen.register_alias("fill5", "gf180mcu_fd_io__fill5")
padring_gen.register_alias("in_c", "gf180mcu_fd_io__in_c")
# padring_gen.register_alias("bi_24t", "gf180mcu_fd_io__bi_24t")
# padring_gen.register_alias("brk2", "gf180mcu_fd_io__brk2")
# padring_gen.register_alias("fill1", "gf180mcu_fd_io__fill1")
# padring_gen.register_alias("fillnc", "gf180mcu_fd_io__fillnc")
# padring_gen.register_alias("in_s", "gf180mcu_fd_io__in_s")

# Sections allows another abstraction layer on the design

padring_gen.register_section("default_spacing", ["fill10", "fill10", "fill5"])
padring_gen.register_section("default_brk", ["fill10", "fill10", "brk5"])
padring_gen.register_section("fill75", 15 * ["fill5"])
padring_gen.register_section("default_spacing_fill75", ["default_spacing", "fill75"])
padring_gen.register_section("default_spacing_asig", ["default_spacing", "asig"])
padring_gen.register_section("default_spacing_dvss", ["default_spacing", "dvss"])
padring_gen.register_section("default_spacing_dvdd", ["default_spacing", "dvdd"])
padring_gen.register_section("default_spacing_in_c", ["default_spacing", "in_c"])
padring_gen.register_section("default_spacing_bi_t", ["default_spacing", "bi_t"])

bottom_pads = [
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_dvss",
    "default_spacing_asig",
    "default_spacing_dvss",
    "default_brk",
    "in_c",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_dvdd",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_dvss",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_dvdd",
    "default_spacing_in_c",
]


right_pads = [
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_in_c",
    "default_spacing_dvss",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_dvss",
    "default_brk",
    "fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_dvss",
    "default_spacing_asig",
    "default_spacing_dvss",
    "default_spacing",
]

top_pads = [
    "default_spacing_fill75",
    "default_spacing_dvdd",
    "default_spacing_fill75",
    "default_spacing_fill75",
    "default_spacing_asig",
    "default_spacing_dvss",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_dvss",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_dvss",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_dvdd",
    "default_brk",
    "in_c",
    "default_spacing_in_c",
    "default_brk",
    "dvdd",
    "default_spacing_dvss",
    "default_spacing_bi_t",
]
left_pads = [
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_dvdd",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_dvss",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_dvdd",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_bi_t",
    "default_spacing_dvss",
    "default_spacing_dvdd",
    "default_spacing_asig",
    "default_spacing_asig",
    "default_spacing_dvss",
]

# padring_gen.draw(bottom_pads, right_pads, bottom_pads, bottom_pads)
padring_gen.draw(bottom_pads, right_pads, top_pads, left_pads)

top.insert(DCellInstArray(padring_gen.cell, DTrans()))

KlayoutUtilities.set_visual_configuration()
