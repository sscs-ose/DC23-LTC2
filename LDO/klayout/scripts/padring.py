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

from pathlib import Path
import yaml

from pprint import pprint

from klayout_utilities import KlayoutUtilities

from pya import (
    Cell,
    DCellInstArray,
    DPoint,
    DTrans,
    DVector,
    DCplxTrans,
)

import os


class Padring:
    def __init__(self, top_cell: Cell, cell_sources: list[str | Path]):
        """
        TODO: Maybe the logic that reads gds should be external.
        TODO: Aliases could be given as arguments
        TODO: Eventually we could use a toml, yaml file to describe the padring.
        - DONE aliases
        - DONE sections
        - DONE top, bottom, left, right descriptions
        - list of source gds
        - gap
        - A description of cell sizing, to tell if padring closes.
        """
        # Dimensions

        # Observational measure
        self.gap = DVector(0.16, 0)

        # Padring cell stuff

        self.name = f"padring"
        self.cell = top_cell.layout().create_cell(self.name)

        # Loading cell

        for cell_source in cell_sources:
            cell_source = Path(cell_source)
            if not cell_source.exists():
                raise ValueError(f"Source {cell_source} don't exists")

            top_cell.layout().read(cell_source)

        # This could be filled with an argument.
        # Maybe from an external file.
        self.mapping = dict()

        # Almost Always, the corner is an exception.
        # All cells have the same height. (Except corner)
        # All cells has a little "gap" to the left when see bbox (Except Corner)
        # All cells have base (0, 0) on bottom left corner plus the gap.

    def read_yaml(self, file: Path):
        with open(file) as f:
            content = yaml.load(f, Loader=yaml.CLoader)

        if "name" in content.keys():
            self.cell.layout().rename_cell(self.cell.cell_index(), content["name"])

        if "aliases" in content.keys():
            aliases = content["aliases"]
            pprint(aliases)

            for alias, cellname in aliases.items():
                self.register_alias(alias, cellname)

        if "sections" in content.keys():
            sections = content["sections"]
            pprint(sections)

            for section, cells in sections.items():
                self.register_section(section, cells)
                print(f"{section}: {cells}")

        sides = content["sides"]
        self.draw(sides["bottom"], sides["right"], sides["top"], sides["left"])

    def get_cell(self, cellalias: str = None) -> Cell:
        """Get an alias from cell mapping dictionary. By default gives padring cell"""
        if cellalias is None:
            return self.cell

        if cellalias not in self.mapping.keys():
            raise ValueError(f"{cellalias} is not a cell")

        return self.mapping[cellalias]

    def register_section(self, name, sections):
        """To avoid repetition of"""
        if self.cell.layout().cell(name) or name in self.mapping.keys():
            return

        section = self.cell.layout().create_cell(name)

        base = DPoint()

        for padname in sections:
            pad = self.get_cell(padname)

            section.insert(DCellInstArray(pad, DTrans(base)))
            base += DVector(pad.dbbox().right, 0) - self.gap

        self.mapping[name] = section

    def register_alias(self, name, cellname):
        """
        Defines a string that represents a subsection of any side.

        """
        if self.cell.layout().cell(name):
            print(f"Alias {name} exists as cell")
            return

        if name in self.mapping.keys():
            print(f"Alias {name} already registered")

        cell = self.cell.layout().cell(cellname)
        if not cell:
            raise ValueError(f"Cell {cellname} doesn't exists")

        self.mapping[name] = cell

    def delete_cell(self, cellname):
        """TODO: This should be done externally"""
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
        base += DVector(corner.dbbox().right, 0) - self.gap

        # Add pads, fillers and breaks
        for padname in bottom_list:
            pad = self.get_cell(padname)

            padring_side.insert(DCellInstArray(pad, DTrans(base)))
            base += DVector(pad.dbbox().right, 0) - self.gap

        return padring_side

    def draw(self, bottom_pads, right_pads, top_pads, left_pads):
        """Pads should be described in anti clockwise manner starting from bottom."""
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
            side_box.p2 + DVector(side_box.height(), -side_box.height()) - 2 * self.gap
        ) * DCplxTrans(1, rotation, False, DVector())


def main_raw():

    KlayoutUtilities.clear()

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
        "default_brk",
        "dvss",
        "default_spacing_dvdd",
        "default_spacing_asig",
        "default_spacing_asig",
        "default_spacing_dvss",
        "default_spacing",
    ]

    # padring_gen.draw(bottom_pads, right_pads, bottom_pads, bottom_pads)
    padring_gen.draw(bottom_pads, right_pads, top_pads, left_pads)

    interest_cell = None

    # interest_cell = "fill10"
    # interest_cell = "default_spacing"

    top.insert(DCellInstArray(padring_gen.get_cell(interest_cell), DTrans()))

    KlayoutUtilities.set_visual_configuration()


def main_yaml():
    KlayoutUtilities.clear()

    top = KlayoutUtilities().viewed_cell

    # We can have multiple gds sources to pads.
    cell_sources = {
        f"{os.environ['PDK_ROOT']}/gf180mcuD/libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds"
    }

    padring_gen = Padring(top, cell_sources)

    # It's convenient to delete all cells that are not going to be used

    # padring_gen.delete_cell("gf180mcu_fd_io__bi_24t")
    # padring_gen.delete_cell("gf180mcu_fd_io__brk2")
    # padring_gen.delete_cell("gf180mcu_fd_io__fill1")
    # padring_gen.delete_cell("gf180mcu_fd_io__fillnc")
    # padring_gen.delete_cell("gf180mcu_fd_io__in_s")
    padring_gen.delete_cell("(UNNAMED)")

    filename = "MY_RING_PAD.yaml"
    filename = "PADRING_LTC2_V1.yaml"
    padring_gen.read_yaml(filename)


    interest_cell = None
    # interest_cell = "fill10"
    # interest_cell = "default_spacing"

    top.insert(DCellInstArray(padring_gen.get_cell(interest_cell), DTrans()))

    KlayoutUtilities.set_visual_configuration()

main_yaml()