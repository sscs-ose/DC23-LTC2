import pya
import cells
from cells.via_generator import draw_via_dev
from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import (
    DPoint,
    DCellInstArray,
    DTrans,
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

from math import ceil, floor, sqrt

from enum import Enum


def is_perfect_square(n: int):
    n_root = round(sqrt(n))

    if n == n_root**2:
        return True

    return False


class FetWaffleLayout:
    """This class should be able to create waffle cells and position them on the layout"""

    def __init__(self, m: int = 0, waffle_cells: dict[str, Cell] = None, overlap=5.5):
        self.l = 0.5
        self.w = 4.38

        _, self.m = FetWaffleLayout.approximate_m(m)
        print(
            f"[FetWaffleLayout] Possible multiplicities: {FetWaffleLayout.approximate_m(m)}"
        )

        if self.m <= 24:
            self.m = 24
            self.n = 4
        else:
            self.n = (1 + round(sqrt(1 + 2 * self.m))) // 2

        # This should never happen... but happens
        if self.n % 2 != 0:
            raise (ValueError(f"{self.n} is not a valid value for n when m={self.m}"))

        self.n_internal = self.n - 2
        """Number of source_in and frame_in frames. doesn't include corner frames"""

        print(f"[FetWaffleLayout] Using m={self.m} and n={self.n}")

        if waffle_cells is None:
            self.source_in, *_ = KlayoutUtilities.read_gds("pmos_source_in")
            self.drain_in, *_ = KlayoutUtilities.read_gds("pmos_drain_in")
            self.source_lt, *_ = KlayoutUtilities.read_gds("pmos_source_frame_lt")
            self.drain_lt, *_ = KlayoutUtilities.read_gds("pmos_drain_frame_lt")
            self.source_rb, *_ = KlayoutUtilities.read_gds("pmos_source_frame_rb")
            self.drain_rb, *_ = KlayoutUtilities.read_gds("pmos_drain_frame_rb")
            self.corner_lb, *_ = KlayoutUtilities.read_gds("pmos_waffle_corners_lb")
            self.corner_lt, *_ = KlayoutUtilities.read_gds("pmos_waffle_corners_lt")
            self.corner_rb, *_ = KlayoutUtilities.read_gds("pmos_waffle_corners_rb")
            self.corner_rt, *_ = KlayoutUtilities.read_gds("pmos_waffle_corners_rt")

        else:
            self.source_in = waffle_cells["pmos_source_in"]
            self.drain_in = waffle_cells["pmos_drain_in"]
            self.source_lt = waffle_cells["pmos_source_frame_lt"]
            self.drain_lt = waffle_cells["pmos_drain_frame_lt"]
            self.source_rb = waffle_cells["pmos_source_frame_rb"]
            self.drain_rb = waffle_cells["pmos_drain_frame_rb"]
            self.corner_lb = waffle_cells["pmos_waffle_corners_lb"]
            self.corner_lt = waffle_cells["pmos_waffle_corners_lt"]
            self.corner_rb = waffle_cells["pmos_waffle_corners_rb"]
            self.corner_rt = waffle_cells["pmos_waffle_corners_rt"]

        # Each cell is a square.
        # The bounding box of each cell is bigger than the actual cell size.
        # That's why we have to overlap the shapes.
        self.box_size = self.source_in.dbbox().width()
        self.dx = DPoint(self.box_size - overlap, 0)
        self.dy = DPoint(0, self.box_size - overlap)

        # We are working on a new cell
        self.layout: Layout = KlayoutUtilities().layout
        self.cell: Cell = self.layout.create_cell(f"waffle_{self.m}")

        self.center = DTrans((self.n_internal - 1) / 2 * (self.dx + self.dy))

        # Guard ring parameters
        self.int_gr_thickness = 3
        self.int_gr_separation = 4.75 + 1 / 2 * self.int_gr_thickness
        self.int_gr_length = (
            self.n_internal + 1
        ) * self.dx.x + 2 * self.int_gr_separation

        self.ext_gr_thickness = 40
        self.ext_gr_separation = 12.75 + 1 / 2 * self.ext_gr_thickness
        self.ext_gr_length = (
            self.n_internal + 1
        ) * self.dx.x + 2 * self.ext_gr_separation

    def draw(self, add_guard_ring=True):
        self.draw_central_layout()
        self.draw_left_top_layout()
        self.draw_right_bottom_layout()
        self.draw_corners_layout()
        self.draw_gate_mesh()

        if add_guard_ring:
            self.draw_internal_guard_ring()
            self.draw_internal_guard_ring_via()
            self.draw_external_guard_ring_track_1()
            self.draw_external_guard_ring_track_2()
            self.draw_external_guard_ring_track_3()

    def get_cell(self):
        return self.cell

    def draw_central_layout(self):
        center_base = (self.dx + self.dy) / 2
        center_base -= (self.dx + self.dy) * (self.n_internal // 2)
        """Centering in two steps: 1) move to bottom left corner. 2) move to center"""
        # center_base = DVector()

        array_A1 = DCellInstArray(
            self.source_in,
            DTrans(center_base),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            self.n_internal // 2,
        )

        array_A2 = DCellInstArray(
            self.source_in,
            DTrans(center_base + self.dx + self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            self.n_internal // 2,
        )

        array_B1 = DCellInstArray(
            self.drain_in,
            DTrans(center_base + self.dx),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            self.n_internal // 2,
        )

        array_B2 = DCellInstArray(
            self.drain_in,
            DTrans(center_base + self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            self.n_internal // 2,
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_A2)
        self.cell.insert(array_B1)
        self.cell.insert(array_B2)

    def draw_left_top_layout(self):
        center_base = (self.dx + self.dy) / 2
        center_base -= (self.dx + self.dy) * (self.n_internal // 2)

        array_A1 = DCellInstArray(
            self.source_lt,
            DTrans(center_base - self.dx + self.dy),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n_internal // 2,
        )

        array_B1 = DCellInstArray(
            self.drain_lt,
            DTrans(center_base - self.dx),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n_internal // 2,
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_B1)

        array_A2 = DCellInstArray(
            self.source_lt,
            DCplxTrans.new(1, 270, True, center_base + self.dy * self.n_internal),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            0,
        )

        array_B2 = DCellInstArray(
            self.drain_lt,
            DCplxTrans.new(
                1, 270, True, center_base + self.dx + self.dy * self.n_internal
            ),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            0,
        )

        self.cell.insert(array_A2)
        self.cell.insert(array_B2)

    def draw_right_bottom_layout(self):
        center_base = (self.dx + self.dy) / 2
        center_base -= (self.dx + self.dy) * (self.n_internal // 2)

        array_A1 = DCellInstArray(
            self.source_rb,
            DTrans(center_base + self.dx * self.n_internal),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n_internal // 2,
        )

        array_B1 = DCellInstArray(
            self.drain_rb,
            DTrans(center_base + self.dx * self.n_internal + self.dy),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n_internal // 2,
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_B1)

        array_A2 = DCellInstArray(
            self.source_rb,
            DCplxTrans.new(1, 270, True, center_base + self.dx - self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            0,
        )

        array_B2 = DCellInstArray(
            self.drain_rb,
            DCplxTrans.new(1, 270, True, center_base - self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n_internal // 2,
            0,
        )

        self.cell.insert(array_A2)
        self.cell.insert(array_B2)

    def draw_corners_layout(self):
        # The base is the center, so this logic should be reinterpreted
        #  lt  |  rt
        # -----------
        #  lb  |  rb

        center_base = (self.dx + self.dy) / 2
        center_base -= (self.dx + self.dy) * (self.n_internal // 2)

        self.cell.insert(
            DCellInstArray(self.corner_lb, DTrans(center_base - self.dx - self.dy))
        )
        self.cell.insert(
            DCellInstArray(
                self.corner_lt,
                DTrans(center_base - self.dx + self.dy * self.n_internal),
            )
        )
        self.cell.insert(
            DCellInstArray(
                self.corner_rb,
                DTrans(center_base + self.dx * self.n_internal - self.dy),
            )
        )
        self.cell.insert(
            DCellInstArray(
                self.corner_rt,
                DTrans(
                    center_base + self.dx * self.n_internal + self.dy * self.n_internal
                ),
            )
        )

    def draw_internal_guard_ring(self):
        """Internal guard ring is composed by COMP, NPLUS, CONTACTS, METAL1, VIA1, METAL2"""
        # The center will be located in the exterior corner of the junction
        # It's different from the usual approach, but will be more simple to draw

        thickness = self.int_gr_thickness
        length = self.int_gr_length

        via_params = via_filter_parameters(
            {
                "x_max": length,
                "y_max": thickness,
                "base_layer": "comp",
                "metal_level": "M2",
                "implant": "n+",
            }
        )

        gr_name = f"internal-guardring-{self.dx.x}-{thickness}-{length}"
        gr_cell = self.cell.layout().cell(gr_name)

        if not gr_cell:
            gr_cell = self.cell.layout().create_cell(gr_name)

            top = DCplxTrans(1, 0, False, DVector(thickness / 2, length / 2))
            bottom = DCplxTrans(1, 0, False, DVector(-thickness / 2, -length / 2))
            left = DCplxTrans(1, 90, False, DVector(-length / 2, thickness / 2))
            right = DCplxTrans(1, 90, False, DVector(length / 2, -thickness / 2))

            via_cell = create_via_cell(gr_cell, params=via_params)

            gr_cell.insert(DCellInstArray(via_cell, top))
            gr_cell.insert(DCellInstArray(via_cell, bottom))
            gr_cell.insert(DCellInstArray(via_cell, left))
            gr_cell.insert(DCellInstArray(via_cell, right))

            # NWELL Layer
            #############
            # DF.4d_LV : Min. (Nwell overlap of NCOMP) outside DNWELL. : 0.12µm
            nwell_gap = 1
            nwell_corner = (
                1
                / 2
                * DPoint(
                    length + thickness + 2 * nwell_gap,
                    length + thickness + 2 * nwell_gap,
                )
            )
            nwell_box = DBox(-nwell_corner, nwell_corner)
            gr_cell.shapes(KlayoutUtilities.get_layer("nwell")).insert(nwell_box)

        self.cell.insert(DCellInstArray(gr_cell, DTrans()))

    def draw_internal_guard_ring_via(self):
        thickness = self.int_gr_thickness
        length = self.int_gr_length

        # M3.2a : min. metal3 spacing : 0.28µm
        min_metal_spacing = 0.28
        metal_spacing_gap = 0.02

        # Via width
        via_max_width = 4.52
        via_width = via_max_width - 2 * (min_metal_spacing + metal_spacing_gap)

        via_height = thickness - 2 * (min_metal_spacing + metal_spacing_gap)

        gr_via_params = via_filter_parameters(
            {
                "x_max": via_width,
                "y_max": via_height,
                "base_layer": "M2",
                "metal_level": "M5",
            }
        )
        gr_via_cell = create_via_cell(self.cell, params=gr_via_params)

        observed_distance_dx = DVector(7.87, 0)
        observed_distance_dy = DVector(0, 7.87)

        diagonal_vector = DVector(length, length)

        bottom_left = -diagonal_vector / 2
        top_right = bottom_left + diagonal_vector

        # Bottom
        self.cell.insert(
            DCellInstArray(
                gr_via_cell,
                DCplxTrans(1, 0, False, bottom_left + observed_distance_dx),
                2 * self.dx,
                DPoint(0, 0),
                self.n_internal // 2 + 1,
                0,
            )
        )

        # Left
        self.cell.insert(
            DCellInstArray(
                gr_via_cell,
                DCplxTrans(1, 90, False, bottom_left + observed_distance_dy),
                DPoint(0, 0),
                2 * self.dy,
                0,
                self.n_internal // 2 + 1,
            )
        )

        # Top
        self.cell.insert(
            DCellInstArray(
                gr_via_cell,
                DCplxTrans(1, 0, False, top_right - observed_distance_dx),
                -2 * self.dx,
                DPoint(0, 0),
                self.n_internal // 2 + 1,
                0,
            )
        )

        # Right
        self.cell.insert(
            DCellInstArray(
                gr_via_cell,
                DCplxTrans(1, 90, False, top_right - observed_distance_dy),
                DPoint(0, 0),
                -2 * self.dy,
                0,
                self.n_internal // 2 + 1,
            )
        )

    def draw_external_guard_ring_track_1(self):
        """Internal guard ring is composed by COMP, NPLUS, CONTACTS, METAL1, VIA1, METAL2"""
        # The center will be located in the exterior corner of the junction
        # It's different from the usual approach, but will be more simple to draw

        thickness = self.ext_gr_thickness
        length = self.ext_gr_length

        via_params = via_filter_parameters(
            {
                "x_max": length,
                "y_max": thickness,
                "base_layer": "comp",
                "metal_level": "M2",
                "implant": "p+",
            }
        )

        gr_name = f"external-guardring-trck-1-{self.dx.x}-{thickness}-{length}"
        gr_cell = self.cell.layout().cell(gr_name)

        if not gr_cell:
            gr_cell = self.cell.layout().create_cell(gr_name)

            top = DCplxTrans(1, 0, False, DVector(thickness / 2, length / 2))
            bottom = DCplxTrans(1, 0, False, DVector(-thickness / 2, -length / 2))
            left = DCplxTrans(1, 90, False, DVector(-length / 2, thickness / 2))
            right = DCplxTrans(1, 90, False, DVector(length / 2, -thickness / 2))

            via_cell = create_via_cell(gr_cell, params=via_params)

            gr_cell.insert(DCellInstArray(via_cell, top))
            gr_cell.insert(DCellInstArray(via_cell, bottom))
            gr_cell.insert(DCellInstArray(via_cell, left))
            gr_cell.insert(DCellInstArray(via_cell, right))

            # NWELL Layer
            #############
            # ORIGINAL DESIGN DOESN'T HAVE NWELL ON EXTERNAL GUARDRING
            # DF.4d_LV : Min. (Nwell overlap of NCOMP) outside DNWELL. : 0.12µm
            # nwell_gap = 1
            # nwell_corner = (
            #     1
            #     / 2
            #     * DPoint(
            #         length + thickness + 2 * nwell_gap,
            #         length + thickness + 2 * nwell_gap,
            #     )
            # )
            # nwell_box = DBox(-nwell_corner, nwell_corner)
            # gr_cell.shapes(KlayoutUtilities.get_layer("nwell")).insert(nwell_box)

        self.cell.insert(DCellInstArray(gr_cell, DTrans()))

    def draw_external_guard_ring_track_2(self):
        """Internal guard ring is composed by COMP, NPLUS, CONTACTS, METAL1, VIA1, METAL2"""
        # The center will be located in the exterior corner of the junction
        # It's different from the usual approach, but will be more simple to draw

        thickness = self.ext_gr_thickness
        length = self.ext_gr_length
        shortened_emtpy_size = 50

        gr_name = f"external-guardring-trck-2-{self.dx.x}-{thickness}-{length}"
        gr_cell = self.cell.layout().cell(gr_name)

        if not gr_cell:
            gr_cell = self.cell.layout().create_cell(gr_name)

            shorter_vias = via_filter_parameters(
                {
                    "x_max": length - shortened_emtpy_size,
                    "y_max": thickness,
                    "base_layer": "M2",
                    "metal_level": "M3",
                }
            )

            right_via = via_filter_parameters(
                {
                    "x_max": thickness,
                    "y_max": length - thickness,  # It's always just centering
                    "base_layer": "M2",
                    "metal_level": "M3",
                }
            )

            top_via = via_filter_parameters(
                {
                    "x_max": length,
                    "y_max": thickness,
                    "base_layer": "M2",
                    "metal_level": "M3",
                }
            )

            top = DCplxTrans(1, 0, False, DVector(thickness / 2, length / 2))
            bottom = DCplxTrans(
                1,
                0,
                False,
                DVector((shortened_emtpy_size + thickness) / 2, -length / 2),
            )
            left = DCplxTrans(
                1,
                90,
                False,
                DVector(-length / 2, (shortened_emtpy_size + thickness) / 2),
            )
            right = DCplxTrans(1, 0, False, DVector(length / 2, 0))

            gr_cell.insert(
                DCellInstArray(create_via_cell(gr_cell, params=top_via), top)
            )
            gr_cell.insert(
                DCellInstArray(create_via_cell(gr_cell, params=right_via), right)
            )
            gr_cell.insert(
                DCellInstArray(create_via_cell(gr_cell, params=shorter_vias), bottom)
            )
            gr_cell.insert(
                DCellInstArray(create_via_cell(gr_cell, params=shorter_vias), left)
            )

            text_pw = DText(
                "PW",
                DTrans(DVector(length + thickness / 2, length + thickness / 2) / 2),
            )
            gr_cell.shapes(KlayoutUtilities.get_layer("metal3_label")).insert(text_pw)

        self.cell.insert(DCellInstArray(gr_cell, DTrans()))

    def generate_external_guard_ring_track_3_box(
        self, gr_name, length, thickness, shortened_emtpy_size
    ):
        gr_side_name = f"{gr_name}-box"

        gr_side_cell = self.cell.layout().cell(gr_side_name)

        if gr_side_cell:
            return gr_side_cell

        gr_side_cell = self.cell.layout().create_cell(gr_side_name)

        gr_corner = DPoint((length - shortened_emtpy_size) / 2, thickness / 2)

        gr_box = DBox(-gr_corner, gr_corner)
        gr_side_cell.shapes(KlayoutUtilities.get_layer("metal4")).insert(gr_box)
        gr_side_cell.shapes(KlayoutUtilities.get_layer("metal5")).insert(gr_box)

        return gr_side_cell

    def draw_external_guard_ring_track_3(self):
        """This guard ring doesn't contain vias, Is just connection in metal 4, 5 and top"""

        thickness = self.ext_gr_thickness // 4  # Its 10
        # Remove big thickness from this value
        # It's convenient that nodes overlap, that's why i'm not putting 1/2
        length = self.ext_gr_length - 1 / 2 * self.ext_gr_thickness
        shortened_emtpy_size = 20

        gr_name = f"external-guardring-trck-3-{self.dx.x}-{thickness}-{length}"
        gr_cell = self.cell.layout().cell(gr_name)

        if not gr_cell:
            gr_cell = self.cell.layout().create_cell(gr_name)

            gr_side_cell = self.generate_external_guard_ring_track_3_box(
                gr_name, length, thickness, shortened_emtpy_size
            )

            top = DCplxTrans(1, 0, False, DVector(-thickness, (length - thickness) / 2))
            left = DCplxTrans(
                1,
                90,
                False,
                DVector(-(length - thickness) / 2, shortened_emtpy_size / 2),
            )

            bottom = DCplxTrans(
                1, 0, False, DVector(thickness, -(length - thickness) / 2)
            )
            right = DCplxTrans(
                1,
                90,
                False,
                DVector((length - thickness) / 2, -shortened_emtpy_size / 2),
            )

            gr_cell.insert(DCellInstArray(gr_side_cell, top))
            gr_cell.insert(DCellInstArray(gr_side_cell, left))
            gr_cell.insert(DCellInstArray(gr_side_cell, bottom))
            gr_cell.insert(DCellInstArray(gr_side_cell, right))

            # Adding labels
            text_offset = DVector(thickness, -thickness)
            text_s = DText("S", DTrans(bottom.disp + right.disp - text_offset))
            text_d = DText("D", DTrans(top.disp + left.disp + text_offset))
            # text = DText("S", DTrans())
            gr_cell.shapes(KlayoutUtilities.get_layer("metal5_label")).insert(text_s)
            gr_cell.shapes(KlayoutUtilities.get_layer("metal5_label")).insert(text_d)

        self.cell.insert(DCellInstArray(gr_cell, DTrans()))

    def draw_gate_mesh(self):
        interconnect_thickness = self.l
        ring_thickness = 2.25

        separation: float = self.dx.x
        """Each interconnect box has this distance of empty space."""

        mesh_size: float = separation * self.n + ring_thickness - interconnect_thickness
        """Both interconnection and ring boxes has the same length"""

        mesh_name = f"gate_mesh-{self.dx.x}-{interconnect_thickness}-{ring_thickness}"
        mesh = self.cell.layout().cell(mesh_name)

        if not mesh:
            mesh = self.cell.layout().create_cell(mesh_name)

            interconnect_name = f"interconnect-{mesh_name}"
            interconnect = self.cell.layout().create_cell(interconnect_name)
            interconnect.shapes(KlayoutUtilities.get_layer("metal3")).insert(
                create_centered_box(
                    width=mesh_size + ring_thickness, height=interconnect_thickness
                )
            )

            mesh.insert(
                DCellInstArray(
                    interconnect,
                    DCplxTrans(1, 0, False, -self.dy * (self.n // 2 - 1)),
                    DVector(separation, 0),
                    DVector(0, separation),
                    0,
                    self.n - 1,
                )
            )

            mesh.insert(
                DCellInstArray(
                    interconnect,
                    DCplxTrans(1, 90, False, -self.dx * (self.n // 2 - 1)),
                    DVector(separation, 0),
                    DVector(0, separation),
                    self.n - 1,
                    0,
                )
            )

            ring_name = f"ring-{mesh_name}"
            ring = self.cell.layout().create_cell(ring_name)
            ring.shapes(KlayoutUtilities.get_layer("metal3")).insert(
                create_centered_box(
                    width=mesh_size + ring_thickness, height=ring_thickness
                )
            )

            mesh.insert(
                DCellInstArray(
                    ring,
                    DCplxTrans(1, 0, False, -DVector(0, mesh_size / 2)),
                    DVector(mesh_size, 0),
                    DVector(0, mesh_size),
                    0,
                    2,
                )
            )

            mesh.insert(
                DCellInstArray(
                    ring,
                    DCplxTrans(1, 90, False, -DVector(mesh_size / 2, 0)),
                    DVector(mesh_size, 0),
                    DVector(0, mesh_size),
                    2,
                    0,
                )
            )

            text_g = DText("G", DTrans())
            mesh.shapes(KlayoutUtilities.get_layer("metal3_label")).insert(text_g)

            mesh.flatten(-1)

        self.cell.insert(DCellInstArray(mesh, DVector()))

    @staticmethod
    def approximate_m(m: int) -> tuple[int, int]:
        """Given a target multiplicity, returns most approximate upper and lower bounds valid for waffle topology"""
        get_m = lambda n: 2 * n * (n - 1)

        if is_perfect_square(1 + 2 * m):
            n_twice = 1 + round(sqrt(1 + 2 * m))
        else:
            n_twice = 1 + ceil(sqrt(1 + 2 * m))

        n = ceil(n_twice / 2)

        if n % 2 != 0:
            n += 1

        return get_m(n - 2), get_m(n)

    @staticmethod
    def recursive_m_exploration(until, m=0):
        if until == 0:
            return
        m_low, m_top = FetWaffleLayout.approximate_m(m)
        n = int((1 + int(sqrt(1 + 2 * m))) / 2)
        print(f"{m_low = } {n = } {m_top = }")
        FetWaffleLayout.recursive_m_exploration(until=until - 1, m=m_top + 1)


def create_centered_box(width: float, height: float) -> DBox:
    corner = DPoint(width / 2, height / 2)
    return DBox(-corner, corner)


def via_filter_parameters(params: dict):
    """
    x_max       float
    y_max       float
    base_layer  [comp, poly]
    metal_level
    implant:    ["p+", "n+"]
    """
    via_size = 0.26
    via_enc = 0.07
    mt_min = 0.75

    if params["metal_level"] == "Mtop":
        if params["x_max"] < mt_min:
            params["x_max"] = mt_min

        if params["y_max"] < mt_min:
            params["y_max"] = mt_min

    else:
        if params["x_max"] < (via_size + (2 * via_enc)):
            params["x_max"] = via_size + (2 * via_enc)

        if params["y_max"] < (via_size + (2 * via_enc)):
            params["y_max"] = via_size + (2 * via_enc)

    if params["base_layer"] == "comp" and "implant" not in params.keys():
        params["implant"] = "p+"

    if not "labels" in params.keys():
        params["labels"] = dict()

    return params


def create_via_cell(cell: Cell, position: DPoint = None, params: dict = dict()):
    params = via_filter_parameters(params)

    via_name = f'via-{params["base_layer"]}-{params["metal_level"]}-{round(params["x_max"], 4)}-{round(params["y_max"], 4)}'
    if "implant" in params.keys():
        via_name = f"{via_name}-{params['implant']}"

    labels_name = ""
    for label, layer_list in params["labels"].items():
        labels_name = f"{labels_name}-{label}~{ '~'.join(layer_list)}"

    if len(labels_name) > 0:
        via_name = f"{via_name}{labels_name}"

    via_cell = cell.layout().cell(via_name)
    if via_cell is None:
        via_cell = cell.layout().create_cell(via_name)
        print(f"[create_via_cell] {via_name}")

        via_instance: Cell = draw_via_dev(
            via_cell.layout(),
            x_max=params["x_max"],
            y_max=params["y_max"],
            base_layer=params["base_layer"],
            metal_level=params["metal_level"],
        )

        inst = DCellInstArray(via_instance, DTrans(0, 0))

        via_cell.insert(inst)
        via_cell.flatten(-1)

        # DRC Error fixing
        ##################
        # COMP should be extended to avoid this little corners

        # PL.5a_LV : Space from field Poly2 to unrelated COMP Spacer from field Poly2 to Guard-ring. : 0.1µm
        # PL.5b_LV : Space from field Poly2 to related COMP. : 0.1µm
        # This extention is adding DRC problems
        # # comp_corner = DPoint(
        # #     self.source_proximity_x.x + via_connection_width/2,
        # #     via_cell.dbbox().p2.y,
        # )
        # comp_box = DBox(-comp_corner, comp_corner)
        # via_cell.shapes(KlayoutUtilities.get_layer("comp")).insert(comp_box)

        # PP.5di : Extension beyond COMP: For Outside DNWELL (i) For Pplus to NWELL space >= 0.43um for Pfield or LVPWELL tap. : 0.02µm
        # PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
        implant_min_gap = 0.16

        if "implant" in params.keys():
            implant_layer = "nplus" if params["implant"] == "n+" else "pplus"

            # This is inserted with (0, 0) on the corner
            implant_box = DBox(
                DPoint(-implant_min_gap, -implant_min_gap),
                DPoint(
                    via_cell.dbbox().width() + implant_min_gap,
                    via_cell.dbbox().height() + implant_min_gap,
                ),
            )

            via_cell.shapes(KlayoutUtilities.get_layer(implant_layer)).insert(
                implant_box
            )

        via_offset = -via_cell.dbbox().p1 - 1 / 2 * (
            via_cell.dbbox().p2 - via_cell.dbbox().p1
        )
        KlayoutUtilities.recursive_transform_shapes(
            via_cell, DCplxTrans(1, 0, False, via_offset)
        )

        for label, layer_list in params["labels"].items():
            for layer in layer_list:
                text = DText(label, DTrans())
                via_cell.shapes(KlayoutUtilities.get_layer(layer)).insert(text)

    if position:
        cell.insert(DCellInstArray(via_cell, DTrans(position)))

    return via_cell


class PortPmosFrame:
    def __init__(
        self, gds_path, dx: DVector, dy: DVector, center: DVector, l=0.5, w=4.38
    ):
        # This class should not be used with other cells.
        # It's only for port a specific cell.

        self.l = l
        self.w = w

        KlayoutUtilities.set_load_mapping(KlayoutUtilities.sky130_gf180_mapping())
        self.cell, *_ = KlayoutUtilities.read_gds(gds_path)

        self.dx = dx
        self.dy = dy

        KlayoutUtilities.recursive_transform_shapes(
            self.cell, DCplxTrans(1, 0, False, -center)
        )

        # Separation between source/drain vias with poly
        self.drc_via_overlap = 0.05
        self.via_poly_gap = 0.1  # PL.5b_LV
        self.via_poly_proximity_x = self.dx - DVector(
            self.l + self.drc_via_overlap + self.via_poly_gap, 0
        )
        self.via_poly_proximity_y = self.dy - DVector(
            0, self.l + self.drc_via_overlap + self.via_poly_gap
        )

        # Separation and thickness of corners
        self.corner_thickness = 3.0
        self.corner_separation = 4.75

    class PolyType(Enum):
        COVERED = "covered"
        RAW = "raw"

    def get_cell(self):
        return self.cell

    def remove_all_layers(self):
        for layer_tuple in cells.layers_def.layer.values():
            KlayoutUtilities.recursive_remove_layer(self.cell, layer_tuple)

        KlayoutUtilities.recursive_remove_layer(self.cell, (95, 20))

    def remove_layers(self):
        # LAYERS THAT SHOULD BE REMOVED (always uncommented)
        ####################################################

        # # Always remove this sky130 layer
        KlayoutUtilities.recursive_remove_layer(self.cell, (95, 20))

        # USING 3V3 DEVICES, NOT 5V
        # This layer is not removed from transation because it will be useful in other cases.
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["dualgate"]
        )

        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["poly2"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["via5"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["via4"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["via3"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["via2"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["via1"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["contact"]
        )

        # LAYERS THAT SHOULD NOT BE REMOVED (always commented)
        ######################################################

        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal4"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal5"])

        # See if this is problematic
        ############################
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["metal1"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["metal2"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["metal3"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["metaltop"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["comp"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["nwell"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["pplus"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["nplus"]
        )
        KlayoutUtilities.recursive_remove_layer(
            self.cell, cells.layers_def.layer["dnwell"]
        )

        if self.frame_type == "source_in":
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal1"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal2"]
            )

            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["comp"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["nwell"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["pplus"]
            )
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "drain_in":
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal1"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal2"]
            )

            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["comp"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["nwell"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["pplus"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["nplus"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["dnwell"]
            )

        elif self.frame_type == "source_lt":
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["comp"]
            )
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "drain_lt":
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal1"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal2"]
            )

            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["comp"]
            )
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "source_rb":
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal1"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal2"]
            )

            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["comp"]
            )
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "drain_rb":
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal1"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal2"]
            )

            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["comp"]
            )
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "corner_lb":
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal1"]
            )
            KlayoutUtilities.recursive_remove_layer(
                self.cell, cells.layers_def.layer["metal2"]
            )

            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])
            return

        elif self.frame_type == "corner_lt":
            return

        elif self.frame_type == "corner_rb":
            return

        elif self.frame_type == "corner_rt":
            return

    def draw_gates(self):
        gate_params = via_filter_parameters(
            {
                "x_max": self.l,
                "y_max": self.l,
                "base_layer": "poly2",
                "metal_level": "M3",
            }
        )

        top_left = -self.dx + self.dy
        top_right = self.dx + self.dy
        bottom_left = -(top_right)
        bottom_right = -(top_left)

        # Always top left
        create_via_cell(self.cell, top_left, gate_params)

        if self.frame_type in {"source_rb", "drain_rb", "corner_rt", "corner_rb"}:
            create_via_cell(self.cell, top_right, gate_params)

        if self.frame_type in {"corner_lb", "corner_rb"}:
            create_via_cell(self.cell, bottom_left, gate_params)

        if self.frame_type in {"corner_rb"}:
            create_via_cell(self.cell, bottom_right, gate_params)

    def generate_poly(self, type: PolyType) -> Cell:
        poly_name = f"poly_{type.value}_{self.w}_{self.l}"
        poly_cell = self.cell.layout().cell(poly_name)
        if not poly_cell is None:
            return poly_cell

        print(f"[generate_poly] {poly_name}")

        poly_cell = self.cell.layout().create_cell(poly_name)

        # POLY2 layer
        #############
        poly_corner = DPoint(self.dx.x, self.l / 2)
        poly_box = DBox(-poly_corner, poly_corner)

        poly_cell.shapes(KlayoutUtilities.get_layer("poly2")).insert(poly_box)

        if type == PortPmosFrame.PolyType.COVERED:
            # COMP layer
            ############
            # DF.6_MV : Min. COMP extend beyond gate (it also means source/drain overhang). : 0.4µm

            gap_between_poly_comp = 0.4
            comp_corner = DPoint(self.w / 2, self.l / 2 + gap_between_poly_comp)
            comp_box: DBox = DBox(-comp_corner, comp_corner)
            poly_cell.shapes(KlayoutUtilities.get_layer("comp")).insert(comp_box)

            # PPLUS Layer
            #############
            # PP.5a : Overlap of P-channel gate. : 0.23µm
            p_channel_overlap = 0.23

            # PP.5di
            # PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
            # PP.5dii : Extension beyond COMP: For Outside DNWELL (ii) For Pplus to NWELL space < 0.43um for Pfield or LVPWELL tap. : 0.16µm
            pplus_comp_min_gap = 0.16

            pplus_corner = comp_corner + DPoint(p_channel_overlap, pplus_comp_min_gap)
            pplus_box = DBox(-pplus_corner, pplus_corner)

            poly_cell.shapes(KlayoutUtilities.get_layer("pplus")).insert(pplus_box)

        return poly_cell

    def draw_covered_poly(self):
        top = False
        bottom = False  # Always
        left = False
        right = False

        if self.frame_type in {
            "source_in",
            "drain_in",
            "source_lt",
            "drain_lt",
            "source_rb",
            "drain_rb",
            "corner_lb",
            "corner_rb",
        }:
            top = True

        if self.frame_type in {
            "source_in",
            "drain_in",
            "source_rb",
            "drain_rb",
            "corner_rt",
            "corner_rb",
        }:
            left = True

        if self.frame_type in {"corner_lb"}:
            right = True

        if not (top or bottom or left or right):
            return

        poly_cell = self.generate_poly(PortPmosFrame.PolyType.COVERED)

        if top:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 0, False, self.dy))
            )
        if bottom:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 0, False, -self.dy))
            )
        if left:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 90, False, -self.dx))
            )
        if right:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 90, False, self.dx))
            )

    def draw_raw_poly(self):
        top = False
        bottom = False
        left = False
        right = False

        if self.frame_type in {"corner_lt", "corner_rt"}:
            top = True

        if self.frame_type in {"corner_lb", "corner_rb"}:
            bottom = True

        if self.frame_type in {"corner_lt", "corner_lb", "drain_lt", "source_lt"}:
            left = True

        if self.frame_type in {"corner_rt", "corner_rb", "drain_rb", "source_rb"}:
            right = True

        if not (top or bottom or left or right):
            return

        poly_cell = self.generate_poly(PortPmosFrame.PolyType.RAW)

        if top:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 0, False, self.dy))
            )
        if bottom:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 0, False, -self.dy))
            )
        if left:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 90, False, -self.dx))
            )
        if right:
            self.cell.insert(
                DCellInstArray(poly_cell, DCplxTrans(1, 90, False, self.dx))
            )

    def draw_poly_contacts(self):
        top = False
        bottom = False
        left = False
        right = False

        via_connection_length = 2 * self.via_poly_proximity_x.x
        via_parameters = via_filter_parameters(
            {
                "x_max": via_connection_length,
                "y_max": 0,
                "base_layer": "comp",
                "metal_level": "M2",
                "implant": "p+",
            }
        )

        if self.frame_type in {"source_in", "drain_in"}:
            top = True
            bottom = True
            right = True
            left = True

        elif self.frame_type in {"source_lt", "drain_lt"}:
            top = True
            bottom = True
            right = True

        elif self.frame_type in {"source_rb", "drain_rb"}:
            top = True
            bottom = True
            left = True

        elif self.frame_type in {"corner_lb"}:
            top = True
            right = True

        elif self.frame_type in {"corner_lt"}:
            bottom = True
            right = True

        elif self.frame_type in {"corner_rb"}:
            top = True
            left = True

        elif self.frame_type in {"corner_rt"}:
            bottom = True
            left = True

        if not (top or bottom or left or right):
            return

        via_cell = create_via_cell(self.cell, params=via_parameters)

        # DRC Error fixing
        ##################
        # COMP should be extended to avoid this little corners

        # PL.5a_LV : Space from field Poly2 to unrelated COMP Spacer from field Poly2 to Guard-ring. : 0.1µm
        # PL.5b_LV : Space from field Poly2 to related COMP. : 0.1µm
        # This extention is adding DRC problems
        # # comp_corner = DPoint(
        # #     self.source_proximity_x.x + via_connection_width/2,
        # #     via_cell.dbbox().p2.y,
        # )
        # comp_box = DBox(-comp_corner, comp_corner)
        # via_cell.shapes(KlayoutUtilities.get_layer("comp")).insert(comp_box)

        # PP.5di : Extension beyond COMP: For Outside DNWELL (i) For Pplus to NWELL space >= 0.43um for Pfield or LVPWELL tap. : 0.02µm
        # PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm

        # TODO: REVIEW THISSSS
        # pplus_comp_min_gap = 0.16
        # pplus_corner = via_cell.dbbox().p2 + DPoint(pplus_comp_min_gap, pplus_comp_min_gap)
        # pplus_box = DBox(-pplus_corner, pplus_corner)

        # via_cell.shapes(KlayoutUtilities.get_layer("pplus")).insert(pplus_box)

        if top:
            self.cell.insert(
                DCellInstArray(
                    via_cell, DCplxTrans(1, 0, False, self.via_poly_proximity_y)
                )
            )
        if bottom:
            self.cell.insert(
                DCellInstArray(
                    via_cell, DCplxTrans(1, 0, False, -self.via_poly_proximity_y)
                )
            )
        if left:
            self.cell.insert(
                DCellInstArray(
                    via_cell, DCplxTrans(1, 90, False, -self.via_poly_proximity_x)
                )
            )
        if right:
            self.cell.insert(
                DCellInstArray(
                    via_cell, DCplxTrans(1, 90, False, self.via_poly_proximity_x)
                )
            )

    def draw_via_stack(self):
        track_1_params = via_filter_parameters(
            {
                "x_max": 3,
                "y_max": 3,
                "base_layer": "comp",
                "metal_level": "M3",
                "implant": "n+",
            }
        )

        track_2_params = via_filter_parameters(
            {
                "x_max": 1.5,
                "y_max": 1.5,
                "base_layer": "M3",
                "metal_level": "M5",
            }
        )

        if self.frame_type in {
            "drain_in",
            "drain_lt",
            "drain_rb",
            "corner_lt",
            "corner_rb",
        }:
            del track_1_params["implant"]
            track_1_params["base_layer"] = "M2"

        if not (track_1_params or track_2_params):
            return

        if track_1_params:
            track_1_via_cell = create_via_cell(self.cell, params=track_1_params)
            self.cell.insert(DCellInstArray(track_1_via_cell, DTrans(DPoint())))

        if track_2_params:
            track_2_via_cell = create_via_cell(self.cell, params=track_2_params)

            track_2_separation = DPoint(
                -track_2_via_cell.dbbox().width() / 2,
                track_2_via_cell.dbbox().height() / 2,
            )

            self.cell.insert(
                DCellInstArray(track_2_via_cell, DTrans(-track_2_separation))
            )
            self.cell.insert(
                DCellInstArray(track_2_via_cell, DTrans(track_2_separation))
            )

    def draw_big_box(self, layer: str, dimentions: DPoint):
        box = DBox(DPoint(), dimentions) * DTrans(-dimentions / 2)
        self.cell.shapes(KlayoutUtilities.get_layer(layer)).insert(box)

    def draw_frame(self, frame_type):
        self.frame_type = frame_type

        self.remove_layers()
        # self.remove_all_layers()

        self.draw_gates()
        self.draw_covered_poly()
        self.draw_raw_poly()

        self.draw_poly_contacts()
        self.draw_via_stack()

        self.draw_big_box("nwell", 4 * DPoint(self.dx.x, self.dy.y))
        self.draw_big_box(
            "metal2", 2 * DPoint(self.via_poly_proximity_x + self.via_poly_proximity_y)
        )
        if self.frame_type in {"source_in", "source_rb", "corner_lb", "source_lt"}:
            self.draw_big_box(
                "metal1",
                2 * DPoint(self.via_poly_proximity_x + self.via_poly_proximity_y),
            )

        pass


def main_waffle(should_port=True, m=0):
    KlayoutUtilities.clear()

    overlap = 0.4
    guard_ring = False

    default_params = {
        "dx": DVector(2.75, 0),
        "dy": DVector(0, 2.75),
        "center": DVector(0.25, -0.25) + DVector(2.75, 2.75),
    }

    source_in = PortPmosFrame(gds_path="pmos_source_in", **default_params)
    drain_in = PortPmosFrame(gds_path="pmos_drain_in", **default_params)
    source_lt = PortPmosFrame(gds_path="pmos_source_frame_lt", **default_params)
    drain_lt = PortPmosFrame(gds_path="pmos_drain_frame_lt", **default_params)
    source_rb = PortPmosFrame(gds_path="pmos_source_frame_rb", **default_params)
    drain_rb = PortPmosFrame(gds_path="pmos_drain_frame_rb", **default_params)
    default_params["center"] = DVector(-2.50, -3.00)
    corner_lb = PortPmosFrame(gds_path="pmos_waffle_corners_lb", **default_params)
    default_params["center"] = DVector(3.00, -3.00)
    corner_rb = PortPmosFrame(gds_path="pmos_waffle_corners_rb", **default_params)
    default_params["center"] = DVector(3.00, 2.50)
    corner_rt = PortPmosFrame(gds_path="pmos_waffle_corners_rt", **default_params)
    default_params["center"] = DVector(-2.50, 2.50)
    corner_lt = PortPmosFrame(gds_path="pmos_waffle_corners_lt", **default_params)

    if should_port:
        source_in.draw_frame("source_in")
        drain_in.draw_frame("drain_in")
        source_lt.draw_frame("source_lt")
        drain_lt.draw_frame("drain_lt")
        source_rb.draw_frame("source_rb")
        drain_rb.draw_frame("drain_rb")
        corner_lb.draw_frame("corner_lb")
        corner_rb.draw_frame("corner_rb")
        corner_rt.draw_frame("corner_rt")
        corner_lt.draw_frame("corner_lt")
        overlap = 5.5
    guard_ring = True

    waffle_cells = {
        "pmos_source_in": source_in.get_cell(),
        "pmos_drain_in": drain_in.get_cell(),
        "pmos_source_frame_lt": source_lt.get_cell(),
        "pmos_drain_frame_lt": drain_lt.get_cell(),
        "pmos_source_frame_rb": source_rb.get_cell(),
        "pmos_drain_frame_rb": drain_rb.get_cell(),
        "pmos_waffle_corners_lb": corner_lb.get_cell(),
        "pmos_waffle_corners_lt": corner_lt.get_cell(),
        "pmos_waffle_corners_rb": corner_rb.get_cell(),
        "pmos_waffle_corners_rt": corner_rt.get_cell(),
    }

    top = KlayoutUtilities().viewed_cell

    waffle = FetWaffleLayout(m=m, waffle_cells=waffle_cells, overlap=overlap)
    waffle.draw(guard_ring)
    top.insert(DCellInstArray(waffle.get_cell(), DTrans(DPoint())))

    # KlayoutUtilities().cell_view.cell_name = "via-comp-M2-4.2-0.4"
    # KlayoutUtilities().cell_view.cell_name = "gate_mesh-5.5-0.5-2.25"

    KlayoutUtilities.set_visual_configuration()


def main_specific(frame: str):
    KlayoutUtilities.clear()

    default_params = {
        "dx": DVector(2.75, 0),
        "dy": DVector(0, 2.75),
        "center": DVector(0.25, -0.25) + DVector(2.75, 2.75),
    }

    frame_gds_map = {
        "source_in": "pmos_source_in",
        "drain_in": "pmos_drain_in",
        "source_lt": "pmos_source_frame_lt",
        "drain_lt": "pmos_drain_frame_lt",
        "source_rb": "pmos_source_frame_rb",
        "drain_rb": "pmos_drain_frame_rb",
        "corner_lb": "pmos_waffle_corners_lb",
        "corner_lt": "pmos_waffle_corners_lt",
        "corner_rb": "pmos_waffle_corners_rb",
        "corner_rt": "pmos_waffle_corners_rt",
        "12x12": "pmos_12x12.gds",
        "26x26": "waffle-26x26.gds",
    }

    frame_params_update_map = {
        "source_in": lambda params: params,
        "drain_in": lambda params: params,
        "source_lt": lambda params: params,
        "drain_lt": lambda params: params,
        "source_rb": lambda params: params,
        "drain_rb": lambda params: params,
        "corner_lb": lambda params: params.update({"center": DVector(-2.50, -3.00)}),
        "corner_lt": lambda params: params.update({"center": DVector(-2.50, 2.50)}),
        "corner_rb": lambda params: params.update({"center": DVector(3.00, -3.00)}),
        "corner_rt": lambda params: params.update({"center": DVector(3.00, 2.50)}),
        "12x12": lambda params: params,
        "26x26": lambda params: params,
    }

    frame_params_update_map[frame](default_params)
    port = PortPmosFrame(gds_path=frame_gds_map[frame], **default_params)
    # port.draw_frame(frame)

    top = KlayoutUtilities().viewed_cell
    top.insert(DCellInstArray(port.get_cell(), DTrans(0, 0)))

    KlayoutUtilities.set_visual_configuration()


if __name__ == "__main__":
    FetWaffleLayout.recursive_m_exploration(10)
    # frame = "source_in"
    # frame = "drain_in"
    # frame = "source_lt"
    # frame = "drain_lt"
    # frame = "source_rb"
    # frame = "drain_rb"
    # frame = "corner_lb"
    # frame = "corner_lt"
    # frame = "corner_rb"
    # frame = "corner_rt"
    # frame = "12x12"
    # frame = "26x26"
    # main_specific(frame)

    # main_waffle(should_port=False)
    main_waffle(should_port=True, m=8000 / 4.38)
    # main_waffle(should_port=True, m=24)
