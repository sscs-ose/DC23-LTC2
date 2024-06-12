# Copyright 2024 Chip USM - UTFSM
# Developed by: Aquiles Viza
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import pya
import cells
from cells import via_dev
from cells.via_generator import draw_via_dev
from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import (
    DPoint,
    DCellInstArray,
    DTrans,
    Trans,
    Vector,
    CellInstArray,
    Instance,
    Cell,
    Layout,
    DVector,
    DBox,
    DPath,
    Shapes,
    DCplxTrans,
    DText,
)

import math
from math import ceil, floor, sqrt


from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import DPoint, DCellInstArray, DTrans, DVector, DCplxTrans, Cell, Layout


def format_name(val) -> str:
    return str(hash(val)).replace("-", "_")


class ViaGenerator:
    """Abstraction over `via_dev` avoiding pcell gui"""

    def __init__(
        self,
        base_layer: str = "M1",
        metal_level: str = "M2",
        x_max: float = 1,
        y_max: float = 1,
        implant: str | None = None,
    ):
        self.pcell = via_dev()

        self.pcell.base_layer = base_layer
        self.pcell.metal_level = metal_level
        self.pcell.x_max = x_max
        self.pcell.y_max = y_max

        self.pcell.coerce_parameters_impl()

        if implant and implant in {"pplus", "nplus"}:
            self.implant = implant

        elif base_layer == "comp":
            self.implant = "pplus"

        else:
            self.implant = None

        hashed_description = format_name(
            f"{round(self.pcell.x_max, 4)}_{round(self.pcell.y_max, 4)}"
        )
        self.name = f"via_{base_layer}_{metal_level}_{hashed_description}"

        if self.implant:
            self.name = f"{self.name}-{self.implant}"

    def get_cell(self, cell: Cell) -> Cell:
        via_cell = cell.layout().cell(self.name)

        if via_cell is None:
            via_cell: Cell = cell.layout().create_cell(self.name)

            # Add vias

            via_instance: Cell = draw_via_dev(
                cell.layout(),
                x_max=self.pcell.x_max,
                y_max=self.pcell.y_max,
                metal_level=self.pcell.metal_level,
                base_layer=self.pcell.base_layer,
            )

            write_cells = CellInstArray(
                via_instance.cell_index(),
                Trans(-via_instance.bbox().p2 / 2),
                Vector(0, 0),
                Vector(0, 0),
                1,
                1,
            )

            via_cell.insert(write_cells)

            # Add implants pplus or nplus if required

            if self.implant:
                # PP.5di : Extension beyond COMP: For Outside DNWELL (i) For Pplus to NWELL space >= 0.43um for Pfield or LVPWELL tap. : 0.02µm
                # PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
                implant_min_gap = 0.16

                via_cell.shapes(KlayoutUtilities.get_layer(self.implant)).insert(
                    create_centered_box(
                        width=via_cell.dbbox().width() + implant_min_gap,
                        height=via_cell.dbbox().height() + implant_min_gap,
                    )
                )

            via_cell.flatten(-1)

        return via_cell

    def draw(self, cell: Cell, position: DPoint) -> Instance:
        """Accepts a position and draws the cell centered"""
        via_cell = self.get_cell(cell)

        return cell.insert(DCellInstArray(via_cell, DTrans(position)))


def _get_cell_view() -> pya.CellView:
    app: pya.Application = pya.Application.instance()

    app.set_config("grid-micron", "0.005")
    app.set_config("grid-style0", "lines")

    layout_view: pya.LayoutView = app.main_window().current_view()

    # Probando lo de matar layout view
    # Esto cierra el asunto, no vale
    # layout_view.destroy()
    # layout_view.

    if layout_view is None:
        print("There is any layout open... creating")

        tech = "gf180mcu"
        mode = 0
        app.main_window().create_layout(tech, mode)

        layout_view = app.main_window().current_view()

    cell_view = layout_view.active_cellview()

    if not cell_view.is_valid():
        # ? que hago
        pass

    return cell_view


def delete_topcells() -> Cell:
    cell_view = _get_cell_view()
    layout: Layout = cell_view.layout()

    for top_cell in layout.top_cells():
        top_cell.prune_subcells(-1)
        layout.delete_cell(top_cell.cell_index())

    layout.clear()


def delete_cell_by_name(layout: Layout, cell_name: str):
    if layout is None:
        return

    cell = layout.cell(cell_name)

    if not cell:
        print(f"cell {cell_name} don't exists")
        return

    cell.prune_subcells(-1)
    layout.delete_cell(cell.cell_index())


def get_topcell() -> Cell:
    cell_view = _get_cell_view()
    layout: Layout = cell_view.layout()

    if layout.cells() == 0 or cell_view.cell is None:
        layout.create_cell("TOP")
        cell = cell_view.set_cell_name("TOP")

    else:
        cell = layout.top_cells()[0]

    return cell


def get_gds_information(filepath: Path):
    new_layout: Layout = Layout.new()
    new_layout.read(filepath)

    if len(new_layout.top_cells()) == 0:
        print("GDS doesn't contain cells")
        return

    print(f"File:      {filepath.resolve()}")
    print(f"Top cells: {[i.cell_index() for i in new_layout.top_cells()]}")
    print(f"Cells:     {[i for i in new_layout.each_cell_top_down()]}")

    new_layout.clear()
    new_layout.destroy()


def load_gds(layout: Layout, filepath: Path):
    if not filepath.exists():
        print(f"file {filepath.resolve()} doesn't exist")
        return

    options = pya.LoadLayoutOptions()

    # AddToCell     Add content to existing cell
    # OverwriteCell The old cell is overwritten entirely (including child cells which are not used otherwise)
    # RenameCell    The new cell will be renamed to become unique
    # SkipNewCell   The new cell is skipped entirely (including child cells which are not used otherwise)

    options.cell_conflict_resolution = (
        pya.LoadLayoutOptions.CellConflictResolution.RenameCell
    )
    options.cif_dbu = 0.005
    options.dxf_dbu = 0.005
    options.mag_dbu = 0.005

    options.warn_level = 100

    layout.read(filepath, options)


# Reading GDS is just broken.
def deprecated_read():
    top: Cell = get_topcell()
    print(top.name)

    if top is None:
        print("Top cell doesn't exist")
        exit()

    get_gds_information(Path("cm_pmos/layout/cm_pmos.gds"))
    get_gds_information(Path("diff_pair/layout/diff_pair.gds"))
    get_gds_information(Path("out_pmos/layout/out_pmos.gds"))
    get_gds_information(Path("ota_res/layout/ota_res.gds"))
    get_gds_information(Path("cm_nmos/layout/cm_nmos.gds"))

    load_gds(top.layout(), Path("cm_pmos/layout/cm_pmos.gds"))
    load_gds(top.layout(), Path("diff_pair/layout/diff_pair.gds"))
    load_gds(top.layout(), Path("out_pmos/layout/out_pmos.gds"))
    load_gds(top.layout(), Path("ota_res/layout/ota_res.gds"))
    load_gds(top.layout(), Path("cm_nmos/layout/cm_nmos.gds"))


def clean_cell(cell: Cell):
    # Remove instances and shapes
    cell.clear_insts()
    cell.clear_shapes()


def create_centered_box(width: float, height: float) -> DBox:
    corner = DPoint(width / 2, height / 2)
    return DBox(-corner, corner)


class Design:
    def __init__(self, ota_cell: Cell):
        if ota_cell is None:
            raise ValueError("Ota cell should exists")
        self.cell: Cell = ota_cell

    def clean(self):
        self.cell.clear_insts()
        self.cell.clear_shapes()

    def insert_cell(self, cell_name: str, transformation: DCplxTrans | DTrans):
        layout: Layout = self.cell.layout()
        target_cell: Cell = layout.cell(cell_name)

        if target_cell is None:
            print(f"Top cell {cell_name} doesn't exists")
            return

        self.cell.insert(DCellInstArray(target_cell, transformation))

    def insert_path(self, layer: str, width: float, points: list[DPoint]):
        path = DPath(points, width)
        shapes: Shapes = self.cell.shapes(KlayoutUtilities.get_layer(layer))

        shapes.insert(path)

    def insert_box(self, layer: str, width: float, height: float, center: DPoint):
        box = DBox(width, height) * DTrans(center)
        shapes: Shapes = self.cell.shapes(KlayoutUtilities.get_layer(layer))

        shapes.insert(box)

    def insert_via(
        self, base: str, top: str, width: float, height: float, center: DPoint
    ):
        via_gen = ViaGenerator(
            base_layer=base, metal_level=top, x_max=width, y_max=height
        )
        # via_cell: Cell = via_gen.get_cell(self.cell)
        via_gen.get_cell(self.cell)

        print(f"Via name: {via_gen.name}")

        self.insert_cell(via_gen.name, DTrans(center))

    def insert_label(self, layer: str, text: str, position: DPoint):
        if not layer.endswith("label"):
            print(f"{layer} Not a label")
            return

        label: DText = DText(text, DTrans(position))
        shapes: Shapes = self.cell.shapes(KlayoutUtilities.get_layer(layer))

        shapes.insert(label)

        # self.cell.insert(via)


class Ota(Design):

    def power_grid(self):
        self.insert_box("metal5", 5.00000, 72.75500, DPoint(-8.05000, 11.65250))
        self.insert_box("metal4", 33.28000, 5.00000, DPoint(11.09000, -6.20500))
        # self.insert_via("M1", "M2", 5, 5, DPoint(0, 0))

    def placement(self):
        dx = 10
        self.insert_cell("cm_nmos", DCplxTrans(1, 0, 0, DPoint(0, 0)))
        self.insert_cell("diff_pair", DCplxTrans(1, 0, 0, DPoint(17.8, 9.070)))
        self.insert_cell("cm_pmos", DCplxTrans(1, 0, 0, DPoint(4 * dx, 0)))
        self.insert_cell("ota_res", DCplxTrans(1, 0, 0, DPoint(6 * dx, 0)))
        self.insert_cell("out_pmos", DCplxTrans(1, 0, 0, DPoint(8 * dx, 0)))

    def internal_routing(self):
        # Connection between cm_nmos and diff_pair
        self.insert_box("metal2", 6.62000, 1.10000, DPoint(16.33000, 18.93500))
        # self.insert_via("metal1", "metal2", 1, 1, DPoint(0, 0))

    def pins(self):
        # iref pin
        self.insert_box("metal3", 13.74000, 1.87000, DPoint(-2.57000, 13.58500))
        self.insert_label("metal3_label", "iref", DPoint(-2.57000, 13.58500))

    def draw(self):
        self.power_grid()
        self.placement()
        self.internal_routing()
        self.pins()


def main():
    # delete_topcells()

    top: Cell = get_topcell()

    if top is None:
        print("Top cell doesn't exist")
        exit()

    print(f"Top cell name: {top.name}")
    ota = Ota(top)

    ota.clean()
    ota.draw()

    ## Testing
    # ViaGenerator("metal1", "metal2", 1, 1)


def main_via():
    delete_topcells()

    top: Cell = get_topcell()

    ota: Ota = Ota(top)

    ota.insert_via(1, 2, 3, 4, center=DPoint())


def main_force_implicit_rescaling():
    top: Cell = get_topcell()

    if top is None:
        print("Top cell doesn't exist")
        exit()

    print(f"Top cell name: {top.name}")

    temp = via_dev()
    temp.base_layer = "M1"
    temp.metal_level = "M2"
    temp.x_max = 1.1
    temp.y_max = 1.1

    temp.coerce_parameters_impl()

    via_instance: Cell = draw_via_dev(
        top.layout(),
        x_max=temp.x_max,
        y_max=temp.y_max,
        metal_level=temp.metal_level,
        base_layer=temp.base_layer,
    )


if __name__ == "__main__":

    # main_via()

    # main_force_implicit_rescaling()

    main()
