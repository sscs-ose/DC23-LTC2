import pya
import cells
from cells.via_generator import draw_via_dev
from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities #, FetWaffleLayout
from pya import DPoint, DCellInstArray, DTrans, Cell, Layout, DVector, DBox, DPath, Shapes, DCplxTrans

import math
from math import ceil, floor, sqrt


from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import DPoint, DCellInstArray, DTrans, DVector, DCplxTrans, Cell, Layout

from math import ceil, floor, sqrt

from enum import Enum

class FetWaffleLayout:
    """This class should be able to create waffle cells and position them on the layout"""
    def __init__(self, m: int = 0, waffle_cells: dict[str, Cell]= None, overlap=5.5):

        self.x_offset=0
        self.y_offset=0

        _, self.m = FetWaffleLayout.approximate_m(m)
        self.n = int( (1 + int(sqrt(1+2*m)) ) / 2 )

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
        self.dx = DPoint( self.box_size - overlap, 0)
        self.dy = DPoint( 0, self.box_size - overlap)

        # We are working on a new cell
        self.layout: Layout = KlayoutUtilities().layout
        self.cell: Cell = self.layout.create_cell(f"waffle_{self.m}")


    def draw(self):
        self.draw_central_layout()
        self.draw_left_top_layout()
        self.draw_right_bottom_layout()
        self.draw_corners_layout()

        self.draw_internal_guard_ring(thickness=3, separation=4.75)


    def get_cell(self):
        return self.cell


    def draw_central_layout(self):
        array_A1 = DCellInstArray(
            self.source_in, 
            DTrans(),
            self.dx * 2,
            self.dy * 2,
            self.n,
            self.n
        )

        array_A2 = DCellInstArray(
            self.source_in,
            DTrans(self.dx + self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n,
            self.n
        )

        array_B1 = DCellInstArray(
            self.drain_in,
            DTrans(self.dx),
            self.dx * 2,
            self.dy * 2,
            self.n,
            self.n
        )

        array_B2 = DCellInstArray(
            self.drain_in, 
            DTrans(self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n,
            self.n
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_A2)
        self.cell.insert(array_B1)
        self.cell.insert(array_B2)


    def draw_left_top_layout(self):
        array_A1 = DCellInstArray(
            self.source_lt, 
            DTrans(- self.dx + self.dy),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        array_B1 = DCellInstArray(
            self.drain_lt, 
            DTrans(- self.dx),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_B1)

        array_A2 = DCellInstArray(
            self.source_lt,
            DCplxTrans.new(1, 270, True, self.dy*2*self.n),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        array_B2 = DCellInstArray(
            self.drain_lt,
            DCplxTrans.new(1, 270, True, self.dx + self.dy*2*self.n),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        self.cell.insert(array_A2)
        self.cell.insert(array_B2)


    def draw_right_bottom_layout(self):
        array_A1 = DCellInstArray(
            self.source_rb, 
            DTrans(self.dx*2*self.n),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        array_B1 = DCellInstArray(
            self.drain_rb, 
            DTrans(self.dx*2*self.n + self.dy),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_B1)

        array_A2 = DCellInstArray(
            self.source_rb, 
            DCplxTrans.new(1, 270, True, self.dx - self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        array_B2 = DCellInstArray(
            self.drain_rb, 
            DCplxTrans.new(1, 270, True, - self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        self.cell.insert(array_A2)
        self.cell.insert(array_B2)


    def draw_corners_layout(self):
        # The base is the center, so this logic should be reinterpreted
        #  lt  |  rt
        # -----------
        #  lb  |  rb

        self.cell.insert(DCellInstArray(self.corner_lb, DTrans(- self.dx - self.dy)))
        self.cell.insert(DCellInstArray(self.corner_lt, DTrans(- self.dx + self.dy*2*self.n)))
        self.cell.insert(DCellInstArray(self.corner_rb, DTrans(  self.dx*2*self.n - self.dy)))
        self.cell.insert(DCellInstArray(self.corner_rt, DTrans(  self.dx*2*self.n + self.dy*2*self.n)))


    def draw_internal_guard_ring(self, thickness: float, separation: float):
        """Internal guard ring is composed by COMP, NPLUS, CONTACTS, METAL1, VIA1, METAL2"""
        # The center will be located in the exterior corner of the junction
        # It's different from the usual approach, but will be more simple to draw

        distance = (self.n + 2)*self.dx.x + 2*separation + thickness
        via_params = via_filter_parameters({
            "x_max": (self.n + 2)*self.dx.x + 2*separation + thickness,
            "y_max": thickness,
            "base_layer": "comp",
            "metal_level": "M2",
            "implant": "n+"
        })

        gr_name = f"guardring-{self.dx.x}-{thickness}-{separation}"
        gr_cell = self.cell.layout().cell(gr_name)

        if not gr_cell:
            gr_cell = self.cell.layout().create_cell(gr_name)

            top = DCplxTrans(1, 0, False, DVector(thickness/2, distance/2))
            bottom = DCplxTrans(1, 0, False, DVector(-thickness/2, -distance/2))
            left = DCplxTrans(1, 90, False, DVector(-distance/2, thickness/2))
            right = DCplxTrans(1, 90, False, DVector(distance/2, -thickness/2))

            via_cell = create_via_cell(gr_cell, params=via_params)

            gr_cell.insert(DCellInstArray(via_cell, top))
            gr_cell.insert(DCellInstArray(via_cell, bottom))
            gr_cell.insert(DCellInstArray(via_cell, left))
            gr_cell.insert(DCellInstArray(via_cell, right))

            gr_cell.flatten(-1)

        position = DTrans(
            (self.n // 2 + 0.5) * self.dx.x,
            (self.n // 2 + 0.5) * self.dy.y
        )

        self.cell.insert(DCellInstArray(gr_cell, DTrans(position)))


    def generate_external_guard_ring(self, thickness: float, separation: float) -> Cell:
        pass


    def generate_interior_guard_ring_via(self, gr_cell: Cell, position):
        gr_via_params = via_filter_parameters({
            "x_max": 2.5,
            "y_max": 4.0,
            "base_layer": "M2",
            "metal_level": "M5",
        })
        # gr_via_cell = create_via_cell(gr_cell, params=gr_via_params)

        # DCellInstArray()

        # gr_cell.insert(DCellInstArray(gr_via_cell, DTrans(position)))


    def draw_corners(self):
        if not self.frame_type.startswith("corner_"):
            return

        thickness = self.corner_thickness
        separation = self.corner_separation

        corner_cell = self.generate_corner(thickness, separation)

        if self.frame_type.endswith("lb"):
            self.cell.insert(DCellInstArray(corner_cell, DCplxTrans(1, 0, False, DVector(
                - thickness - separation,
                - thickness - separation
            ))))

        elif self.frame_type.endswith("rb"):
            self.cell.insert(DCellInstArray(corner_cell, DCplxTrans(1, 0, False, DVector(
                - thickness - separation,
                - thickness - separation
            ))))

        elif self.frame_type.endswith("rt"):
            self.cell.insert(DCellInstArray(corner_cell, DCplxTrans(1, 0, False, DVector(
                - thickness - separation,
                - thickness - separation
            ))))

        elif self.frame_type.endswith("lt"):
            self.cell.insert(DCellInstArray(corner_cell, DCplxTrans(1, 0, False, DVector(
                - thickness - separation,
                - thickness - separation
            ))))

        else:
            raise ValueError(f"Corner {self.frame_type} is not valid")


    def draw_corner_vias(self):
        pass


    @staticmethod
    def approximate_m(m: int) -> tuple[int, int]:
        """Given a target multiplicity, returns most approximate upper and lower bounds valid for waffle topology"""
        temp =      1+2*m
        sqrt_temp = int(sqrt(temp))

        # Get real or approximate n
        if temp == sqrt_temp**2:
            # Multiplicity m can be obtained exactly
            n = int( (1 + int(sqrt(1+2*m)) ) / 2 )

            if n % 2 == 0:
                n_top = n
                n_bottom = n

            else:
                # Value is even
                n_top = n + 1
                n_bottom = n -1

        else:
            # Multiplicity m can't be obtained exactly
            # n is approximated to upper bound
            n = (1 + sqrt(1+2*m) ) / 2
            n_top = ceil(n)
            n_bottom = floor(n)

            if n_top % 2 == 0:
                # if n_top is even, n_bottom is odd
                n_bottom -= 1
            else:
                n_top += 1

        get_m = lambda n: 2 * n * (n-1)

        return get_m(n_bottom), get_m(n_top)


    @staticmethod
    def recursive_m_exploration(until, m=0):
        if until == 0:
            return
        _, m = FetWaffleLayout.approximate_m(m)
        print(f"{m = }")
        FetWaffleLayout.recursive_m_exploration(until=until-1, m=m+1)


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
            params["x_max"] = (via_size + (2 * via_enc))

        if params["y_max"] < (via_size + (2 * via_enc)):
            params["y_max"] = (via_size + (2 * via_enc))

    if params["base_layer"] == "comp" and "implant" not in params.keys():
        params["implant"] = "p+"

    return params


def create_via_cell(cell: Cell, position: DPoint = None, params: dict = dict()):
    params = via_filter_parameters(params)

    via_name = f'via-{params["base_layer"]}-{params["metal_level"]}-{params["x_max"]}-{params["y_max"]}'
    if "implant" in params.keys():
        via_name = f"{via_name}-{params['implant']}"

    via_cell = cell.layout().cell(via_name)
    if via_cell is None:
        via_cell = cell.layout().create_cell(via_name)

        via_instance: Cell = draw_via_dev(
            via_cell.layout(),
            x_max=params["x_max"],
            y_max=params["y_max"],
            base_layer=params["base_layer"],
            metal_level=params["metal_level"],
        )
        
        inst = DCellInstArray(
            via_instance,
            DTrans(0, 0)
        )

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
                DPoint(
                    -implant_min_gap,
                    -implant_min_gap), 
                DPoint(
                    via_cell.dbbox().width() + implant_min_gap,
                    via_cell.dbbox().height() + implant_min_gap
                )
            )

            via_cell.shapes(KlayoutUtilities.get_layer(implant_layer)).insert(implant_box)

        via_offset = -via_cell.dbbox().p1 - 1/2 * (via_cell.dbbox().p2 - via_cell.dbbox().p1)
        KlayoutUtilities.recursive_transform_shapes(via_cell, DCplxTrans(1, 0, False, via_offset))


    if position:
        cell.insert(DCellInstArray(via_cell, DTrans(position)))

    return via_cell


class PortPmosFrame:
    def __init__(self, gds_path, dx: DVector, dy: DVector, center: DVector, l=0.5, w=4.38):
        # This class should not be used with other cells.
        # It's only for port a specific cell.

        self.l = l
        self.w = w

        KlayoutUtilities.set_load_mapping(KlayoutUtilities.sky130_gf180_mapping())
        self.cell, *_ = KlayoutUtilities.read_gds(gds_path)

        self.dx = dx
        self.dy = dy


        KlayoutUtilities.recursive_transform_shapes(self.cell, DCplxTrans(1, 0, False, -center))


        # Separation between source/drain vias with poly
        self.drc_via_overlap =  0.05
        self.via_poly_gap = 0.1  # PL.5b_LV
        self.via_poly_proximity_x = self.dx - DVector(self.l + self.drc_via_overlap + self.via_poly_gap, 0)
        self.via_poly_proximity_y = self.dy - DVector(0, self.l + self.drc_via_overlap + self.via_poly_gap)


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

        KlayoutUtilities.recursive_remove_layer(self.cell, (95,20))


    def remove_layers(self):
        # LAYERS THAT SHOULD BE REMOVED (always uncommented)
        ####################################################

        # # Always remove this sky130 layer
        KlayoutUtilities.recursive_remove_layer(self.cell, (95,20))

        # USING 3V3 DEVICES, NOT 5V
        # This layer is not removed from transation because it will be useful in other cases.
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dualgate"])

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["poly2"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["via5"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["via4"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["via3"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["via2"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["via1"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["contact"])

        # LAYERS THAT SHOULD NOT BE REMOVED (always commented)
        ######################################################

        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal3"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal4"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal5"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metaltop"])

        # See if this is problematic
        ############################
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"]) 
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        if self.frame_type == "source_in":
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"]) 
            #KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "drain_in":
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "source_lt":
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "drain_lt":
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "source_rb":
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "drain_rb":
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
            # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

        elif self.frame_type == "corner_lb":
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
            KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

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
        gate_params = via_filter_parameters({
            "x_max": self.l,
            "y_max": self.l,
            "base_layer": "poly2",
            "metal_level": "M3",
        })

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
        poly_name = f"poly_{type.value}_{self.name}_{self.w}_{self.l}"
        poly_cell = self.cell.layout().cell(poly_name)
        if not poly_cell is None:
            return poly_cell

        print("function generate_poly invocated")

        poly_cell = self.cell.layout().create_cell(poly_name)

        # POLY2 layer
        #############
        poly_corner = DPoint(self.dx.x, self.l/2)
        poly_box = DBox(-poly_corner, poly_corner)

        poly_cell.shapes(KlayoutUtilities.get_layer("poly2")).insert(poly_box)


        if type == PortPmosFrame.PolyType.COVERED:
            # COMP layer
            ############
            # DF.6_MV : Min. COMP extend beyond gate (it also means source/drain overhang). : 0.4µm

            gap_between_poly_comp = 0.4
            comp_corner = DPoint(
                self.w/2, 
                self.l/2 + gap_between_poly_comp)
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

            pplus_corner = comp_corner + DPoint(
                p_channel_overlap, 
                pplus_comp_min_gap
            )
            pplus_box = DBox(-pplus_corner, pplus_corner)

            poly_cell.shapes(KlayoutUtilities.get_layer("pplus")).insert(pplus_box)

        return poly_cell


    def draw_covered_poly(self):
        top = False
        bottom = False # Always
        left = False
        right = False

        if self.frame_type in {"source_in", "drain_in", "source_lt", "drain_lt", "source_rb", "drain_rb", "corner_lb", "corner_rb"}:
            top = True

        if self.frame_type in {"source_in", "drain_in", "source_rb", "drain_rb", "corner_rt",  "corner_rb"}:
            left = True

        if self.frame_type in {"corner_lb"}:
            right = True

        if not (top or bottom or left or right):
            return

        poly_cell = self.generate_poly(PortPmosFrame.PolyType.COVERED)

        if top: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 0, False, self.dy)))
        if bottom: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 0, False, -self.dy)))
        if left: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 90, False, -self.dx)))
        if right: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 90, False, self.dx)))


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

        if top: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 0, False, self.dy)))
        if bottom: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 0, False, -self.dy)))
        if left: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 90, False, -self.dx)))
        if right: self.cell.insert(DCellInstArray(poly_cell, DCplxTrans(1, 90, False, self.dx)))


    def draw_poly_contacts(self):
        top =  False
        bottom = False
        left =  False
        right = False

        via_connection_length = 2*self.via_poly_proximity_x.x
        via_parameters = via_filter_parameters({
            "x_max": via_connection_length,
            "y_max": 0,
            "base_layer": "comp",
            "metal_level": "M2",
            "implant": "p+"
        })

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

        if top: self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False,  self.via_poly_proximity_y)))
        if bottom: self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False, -self.via_poly_proximity_y)))
        if left: self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 90, False,  -self.via_poly_proximity_x)))
        if right: self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 90, False,  self.via_poly_proximity_x)))


    def draw_via_stack(self):
        track_1_params = via_filter_parameters({
            "x_max": 3,
            "y_max": 3,
            "base_layer": "comp",
            "metal_level": "M3",
            "implant": "n+"
        })

        track_2_params = via_filter_parameters({
            "x_max": 1.5,
            "y_max": 1.5,
            "base_layer": "M3",
            "metal_level": "Mtop",
        })

        if self.frame_type in {"drain_in", "drain_lt", "drain_rb", "corner_lt", "corner_rb"}:
            track_1_params["base_layer"] = "M2"
            del track_1_params["implant"]

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

            self.cell.insert(DCellInstArray(track_2_via_cell, DTrans(-track_2_separation)))
            self.cell.insert(DCellInstArray(track_2_via_cell, DTrans(track_2_separation)))


    def draw_big_box(self, layer: str, dimentions: DPoint):
        box = DBox(DPoint(), dimentions) * DTrans(-dimentions/2)
        self.cell.shapes(KlayoutUtilities.get_layer(layer)).insert(box)


    def draw_frame(self, frame_type):
        self.name = f"pmos_{frame_type}"
        self.frame_type = frame_type

        self.remove_layers()
        #self.remove_all_layers()

        self.draw_gates()
        self.draw_covered_poly()
        self.draw_raw_poly()

        self.draw_poly_contacts()
        self.draw_via_stack()

        self.draw_big_box("nwell", 4*DPoint(self.dx.x, self.dy.y))
        self.draw_big_box("metal2", 2*DPoint(self.via_poly_proximity_x + self.via_poly_proximity_y))
        if self.frame_type in {"source_in", "source_rb", "corner_lb", "source_lt"}:
            self.draw_big_box("metal1", 2*DPoint(self.via_poly_proximity_x + self.via_poly_proximity_y))

        pass


def main_waffle():
    KlayoutUtilities.clear()

    overlap = 0.4

    default_params = {
        "dx": DVector(2.75, 0),
        "dy": DVector(0, 2.75),
        "center": DVector(0.25, -0.25)+DVector(2.75, 2.75)
    }

    source_in = PortPmosFrame( gds_path="pmos_source_in", **default_params)
    drain_in = PortPmosFrame( gds_path="pmos_drain_in", **default_params)
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

    # Comment to avoid porting
    # source_in.draw_frame("source_in")
    # drain_in.draw_frame("drain_in")
    # source_lt.draw_frame("source_lt")
    # drain_lt.draw_frame("drain_lt")
    # source_rb.draw_frame("source_rb")
    # drain_rb.draw_frame("drain_rb")
    # corner_lb.draw_frame("corner_lb")
    # corner_rb.draw_frame("corner_rb")
    # corner_rt.draw_frame("corner_rt")
    # corner_lt.draw_frame("corner_lt")
    # overlap = 5.5


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

    waffle = FetWaffleLayout(m=0, waffle_cells=waffle_cells, overlap=overlap)
    waffle.draw()
    top.insert(DCellInstArray(waffle.get_cell(), DTrans(DPoint())))

    #KlayoutUtilities().cell_view.cell_name = "via-comp-M2-4.2-0.4"
    #KlayoutUtilities().cell_view.cell_name = "pmos_source_in"

    KlayoutUtilities.set_visual_configuration()


def main_specific():
    KlayoutUtilities.clear()

    default_params = {
        "dx": DVector(2.75, 0),
        "dy": DVector(0, 2.75),
        "center": DVector(0.25, -0.25)+DVector(2.75, 2.75)
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
    }

    frame = "source_in"
    # frame = "drain_in"
    # frame = "source_lt"
    # frame = "drain_lt"
    # frame = "source_rb"
    # frame = "drain_rb"

    # default_params["center"] = DVector(-2.50, -3.00)
    # frame = "corner_lb"

    # default_params["center"] = DVector(-2.50, 2.50)
    # frame = "corner_lt"
    
    # default_params["center"] = DVector(3.00, -3.00)
    # frame = "corner_rb"
    
    # default_params["center"] = DVector(3.00, 2.50)
    # frame = "corner_rt"

    port = PortPmosFrame(gds_path=frame_gds_map[frame], **default_params)
    port.draw_frame(frame)


    top = KlayoutUtilities().viewed_cell
    top.insert(DCellInstArray(port.get_cell(), DTrans(0, 0)))

    KlayoutUtilities.set_visual_configuration()


if __name__ == "__main__":

    #main_specific()
    main_waffle()