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

from cells.draw_fet import draw_nfet, draw_nfet_06v0_nvt, draw_pfet

from cells.fet import (
    nfet,
    nfet_06v0_nvt,
    pfet,
)

from pprint import pprint

from pya import (
    Application,
    LayoutView,
    CellView,
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

# Resistor design
#################


def create_centered_box(width: float, height: float) -> DBox:
    corner = DPoint(width / 2, height / 2)
    return DBox(-corner, corner)


class FetGenerator:
    def __init__(
        self,
        fet_type: str,
        deepnwell=0,
        pcmpgr=0,
        volt="3.3V",
        bulk="None",
        w_gate=0,
        l_gate=0,
        ld=0,
        nf=1,
        grw=0,
        gate_con_pos="top",
        con_bet_fin=1,
        sd_con_col=1,
        interdig=0,
        patt="",
        patt_lbl=0,
        lbl=0,
        sd_lbl=list(),
        g_lbl=list(),
        sub_lbl="",
    ):
        if fet_type == "nfet":
            self.pcell = nfet()
            self.draw_pcell = draw_nfet

        elif fet_type == "nfet_06v0_nvt":
            self.pcell = nfet_06v0_nvt()
            self.draw_pcell = draw_nfet_06v0_nvt

        elif fet_type == "pfet":
            self.pcell = pfet()
            self.draw_pcell = draw_pfet

        else:
            raise ValueError(f"Invalid fet type {fet_type}")

        self.fet_type = fet_type

        self.pcell.deepnwell = deepnwell
        self.pcell.pcmpgr = pcmpgr
        self.pcell.volt = volt
        self.pcell.bulk = bulk
        self.pcell.w_gate = w_gate
        self.pcell.l_gate = l_gate
        self.pcell.ld = ld
        self.pcell.nf = nf
        self.pcell.grw = grw
        self.pcell.gate_con_pos = gate_con_pos
        self.pcell.con_bet_fin = con_bet_fin
        self.pcell.sd_con_col = sd_con_col
        self.pcell.interdig = interdig
        self.pcell.patt = patt
        self.pcell.patt_lbl = patt_lbl
        self.pcell.lbl = lbl
        self.pcell.sd_lbl = sd_lbl
        self.pcell.g_lbl = g_lbl
        self.pcell.sub_lbl = sub_lbl

        self.pcell.coerce_parameters_impl()

        self.name = f"{fet_type}_{volt}_L{round(self.pcell.l_gate, 4)}_W{round(self.pcell.w_gate, 4)}_NF{self.pcell.nf}"

    def get_cell(self, top_cell: Cell) -> Cell:
        cell = top_cell.layout().cell(self.name)

        if cell is None:
            cell = top_cell.layout().create_cell(self.name)

            params = {
                "layout": top_cell.layout(),
                "l_gate": self.pcell.l_gate,
                "w_gate": self.pcell.w_gate,
                "sd_con_col": self.pcell.sd_con_col,
                "inter_sd_l": self.pcell.ld,
                "nf": self.pcell.nf,
                "grw": self.pcell.grw,
                "bulk": self.pcell.bulk,
                "volt": self.pcell.volt,
                "con_bet_fin": self.pcell.con_bet_fin,
                "gate_con_pos": self.pcell.gate_con_pos,
                "interdig": self.pcell.interdig,
                "patt": self.pcell.patt,
                "deepnwell": self.pcell.deepnwell,
                "pcmpgr": self.pcell.pcmpgr,
                "lbl": self.pcell.lbl,
                "sd_lbl": self.pcell.sd_lbl,
                "g_lbl": self.pcell.g_lbl,
                "sub_lbl": self.pcell.sub_lbl,
                "patt_lbl": self.pcell.patt_lbl,
            }

            if self.fet_type == "nfet_06v0_nvt":
                del params["volt"]
                del params["deepnwell"]
                del params["pcmpgr"]

            cell_content = self.draw_pcell(**params)

            cell_instance = CellInstArray(
                cell_content.cell_index(),
                Trans(),
                Vector(0, 0),
                Vector(0, 0),
                1,
                1,
            )
            cell.insert(cell_instance)
            # cell.flatten(1)

        return cell

    def draw(self, top_cell: Cell, position: DPoint) -> Instance:
        """Accepts a position and draws the cell centered"""
        # return top_cell.insert(
        #     DCellInstArray(self.get_cell(top_cell), DTrans(position))
        # )

        return top_cell.insert(
            CellInstArray(
                self.get_cell(top_cell),
                Trans(Point(0, 0)),
                Vector(0, 0),
                Vector(0, 0),
                1,
                1,
            )
        )


# The basic configuration I always use
######################################

app = Application.instance()

app.set_config("grid-micron", "0.005")
app.set_config("grid-style0", "lines")

layout_view: LayoutView = app.main_window().current_view()
if layout_view is None:
    print("There is any layout open... creating")

    tech = "gf180mcu"
    mode = 0
    app.main_window().create_layout(tech, mode)

    layout_view = app.main_window().current_view()
    layout_view.set_config("grid-micron", "0.005")

# Cell view can be pointing nothing
# If that's the case, a TOP cell is created and pointed

# cell_view is pointing to "TOP"
cell_view: CellView = layout_view.active_cellview()

# layout points to TOP cell layout.
# We can get cells referenced by TOP
layout: Layout = cell_view.layout()
layout.dbu = 0.005

if cell_view.cell is None:
    print("Current cell is not setted (Ctrl-S over top cell)")

    if layout.cell("TOP") is None:
        layout.create_cell("TOP")
        cell_view.set_cell_name("TOP")

# Direct reference to TOP cell.
viewed_cell: Cell = cell_view.cell


## This is the code under test
##############################

fet = FetGenerator(fet_type="nfet", w_gate=1.0, l_gate=0.5)
fet.draw(viewed_cell, DPoint())


"""
# Description of the problem

When instanciated from scripts each transistor D G or S connector (M1 square) has dimentions (0.38, 0.382).
The 0.002 extra in height cause DRC OFFGRID problems.


# Observations

1. It works when used manually

The pcell works only under two conditions:
- The pcell is instanciated manually
- The script has not been run

If script is run, and then the pcell is used it will have the extra 0.002.

2. The problem happens on the vias

Each transistor has `via_stack_` cells and those have the extra gap.


# Actions made to fix the problem

1. Grid 0.005. The layout grid is set to 0.005 before using the script and during execution.
When the script is run, the layout grid ends on 0.001. I have no idea why this happens.

2. Use of CellInstArray instead of DCellInstArray. The problem happens in both functions.
"""

# Fancy graphic configuration
#############################

# KlayoutUtilities.set_visual_configuration()
layout_view.add_missing_layers()
layout_view.zoom_fit()
