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


    def draw(self, cell: Cell, position: DVector = DVector(0, 0)):
        self.draw_central_layout()
        self.draw_left_top_layout()
        self.draw_right_bottom_layout()
        self.draw_corners_layout()

        self.insert_onto(cell, position)


    def insert_onto(self, cell: Cell, position):
        cell_base = -self.cell.dbbox().p1
        inst = DCellInstArray(self.cell, DTrans(cell_base + position))
        cell.insert(inst)


    def draw_central_layout(self):
        array_A1 = DCellInstArray(
            self.source_in, 
            DTrans(- self.source_in.dbbox().p1),
            self.dx * 2,
            self.dy * 2,
            self.n,
            self.n
        )

        array_A2 = DCellInstArray(
            self.source_in,
            DTrans(-self.source_in.dbbox().p1 + self.dx + self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n,
            self.n
        )

        array_B1 = DCellInstArray(
            self.drain_in,
            DTrans(-self.drain_in.dbbox().p1 + self.dx),
            self.dx * 2,
            self.dy * 2,
            self.n,
            self.n
        )

        array_B2 = DCellInstArray(
            self.drain_in, 
            DTrans(-self.drain_in.dbbox().p1 + self.dy),
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
        source_base = -self.source_lt.dbbox().p1 - DPoint(self.source_lt.dbbox().width() - self.box_size, 0)
        drain_base = -self.drain_lt.dbbox().p1 - DPoint(self.drain_lt.dbbox().width() - self.box_size, 0)

        array_A1 = DCellInstArray(
            self.source_lt, 
            DTrans(source_base - self.dx + self.dy),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        array_B1 = DCellInstArray(
            self.drain_lt, 
            DTrans(drain_base - self.dx),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_B1)

        array_A2 = DCellInstArray(
            self.source_lt,
            DCplxTrans.new(1, 270, True, source_base + self.dx + self.dy*2*self.n + self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        array_B2 = DCellInstArray(
            self.drain_lt,
            DCplxTrans.new(1, 270, True, drain_base + self.dx*2 + self.dy*2*self.n + self.dy),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        self.cell.insert(array_A2)
        self.cell.insert(array_B2)


    def draw_right_bottom_layout(self):
        source_base = -self.source_rb.dbbox().p1
        drain_base = -self.drain_rb.dbbox().p1

        array_A1 = DCellInstArray(
            self.source_rb, 
            DTrans(source_base + self.dx*2*self.n),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        array_B1 = DCellInstArray(
            self.drain_rb, 
            DTrans(drain_base + self.dx*2*self.n + self.dy),
            self.dx * 2,
            self.dy * 2,
            0,
            self.n
        )

        self.cell.insert(array_A1)
        self.cell.insert(array_B1)

        array_A2 = DCellInstArray(
            self.source_rb, 
            DCplxTrans.new(1, 270, True, source_base + 2*self.dx),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        array_B2 = DCellInstArray(
            self.drain_rb, 
            DCplxTrans.new(1, 270, True, drain_base + self.dx),
            self.dx * 2,
            self.dy * 2,
            self.n,
            0
        )

        self.cell.insert(array_A2)
        self.cell.insert(array_B2)


    def draw_corners_layout(self):
        # The "base" of each corner cell is the vertex that is adjacent to the core.
        #  lt  |  rt
        # -----------
        #  lb  |  rb


        lb_base = -self.corner_lb.dbbox().p2
        lb_base += DVector(self.x_offset, self.y_offset)

        lt_base = -DVector(self.corner_lt.dbbox().p2.x, self.corner_lt.dbbox().p1.y)
        lt_base += DVector(self.x_offset, self.y_offset)

        rb_base = -DVector(self.corner_rb.dbbox().p1.x, self.corner_rb.dbbox().p2.y)
        rb_base += DVector(self.x_offset, self.y_offset)

        rt_base = -self.corner_rt.dbbox().p1
        rt_base += DVector(self.x_offset, self.y_offset)


        array_A = DCellInstArray(self.corner_lb, DTrans(lb_base))
        array_B = DCellInstArray(self.corner_lt, DTrans(lt_base + self.dy*2*self.n))
        array_C = DCellInstArray(self.corner_rb, DTrans(rb_base  + self.dx*2*self.n))
        array_D = DCellInstArray(self.corner_rt, DTrans(rt_base + self.dx*2*self.n + self.dy*2*self.n))

        self.cell.insert(array_A)
        self.cell.insert(array_B)
        self.cell.insert(array_C)
        self.cell.insert(array_D)


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

    return params


def create_via_cell(cell: Cell, position: DPoint = None, params: dict = dict()):
    params = via_filter_parameters(params)

    via_name = f"via-{'-'.join(str(i) for i in params.values())}"
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

        via_offset = -(via_cell.dbbox().p2 - via_cell.dbbox().p1) / 2
        KlayoutUtilities.recursive_transform_shapes(via_cell, DCplxTrans(1, 0, False, via_offset))


    if position:
        base_coordinates = -via_cell.dbbox().p1
        base_coordinates -= DVector(via_cell.dbbox().width(), via_cell.dbbox().height()) / 2
        cell.insert(DCellInstArray(via_cell, DTrans(base_coordinates + position)))

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


    def draw_pmos_fets(self):
        poly_name = f"poly_{self.name}_{self.w}_{self.l}"
        poly_cell = self.cell.layout().create_cell(poly_name)

        # POLY2 layer
        #############

        poly_corner = DPoint(self.dx.x, self.l/2)
        poly_box = DBox(-poly_corner, poly_corner)
        poly_cell.shapes(KlayoutUtilities.get_layer("poly2")).insert(poly_box)
        
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

        # Placement
        ###########

        horizontal_placement = DCplxTrans(1, 0, False, self.dy)
        vertical_placement = DCplxTrans(1, 90, False, -self.dx)

        # self.cell.insert(DCellInstArray(poly_cell, DTrans(DPoint())))
        self.cell.insert(DCellInstArray(poly_cell, horizontal_placement))
        self.cell.insert(DCellInstArray(poly_cell, vertical_placement))


    def draw_pmos_frame_lt_fets(self):
        poly_name = f"poly_{self.name}_{self.w}_{self.l}"
        poly_cell = self.cell.layout().create_cell(poly_name)

        poly_raw = f"poly_raw_{self.name}_{self.w}_{self.l}"
        poly_lateral_cell = self.cell.layout().create_cell(poly_raw)

        # POLY2 layer
        #############
        poly_corner = DPoint(self.dx.x, self.l/2)
        poly_box = DBox(-poly_corner, poly_corner)
        
        poly_cell.shapes(KlayoutUtilities.get_layer("poly2")).insert(poly_box)
        poly_lateral_cell.shapes(KlayoutUtilities.get_layer("poly2")).insert(poly_box)
        
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

        # Placement
        ###########

        horizontal_placement = DCplxTrans(1, 0, False, self.dy)
        vertical_placement = DCplxTrans(1, 90, False, -self.dx)

        # self.cell.insert(DCellInstArray(poly_cell, DTrans(DPoint())))
        self.cell.insert(DCellInstArray(poly_cell, horizontal_placement))
        self.cell.insert(DCellInstArray(poly_lateral_cell, vertical_placement))


    def draw_drain_top(self):
        # M2 - M3 Via placement
        #######################
        m2_m3_params = via_filter_parameters({
            "x_max": 3,
            "y_max": 3,
            "base_layer": "M2",
            "metal_level": "M3",
        })
        vias_m2_m3 = create_via_cell(self.cell, params=m2_m3_params)
        self.cell.insert(DCellInstArray(vias_m2_m3, DTrans(DPoint())))

        # Metal 2 Via connection
        ####################
        # The 4 vias should be connected in metal2.

        metal2_corner = self.via_poly_proximity_x + self.via_poly_proximity_y
        metal2_box = DBox(-metal2_corner, metal2_corner)
        
        vias_m2_m3.shapes(KlayoutUtilities.get_layer("metal2")).insert(metal2_box)

        # M3-MTop Via placement
        #######################
        m3_mtop_params = via_filter_parameters({
            "x_max": 1.5,
            "y_max": 1.5,
            "base_layer": "M3",
            "metal_level": "Mtop",
        })
        vias_m3_mtop = create_via_cell(self.cell, params=m3_mtop_params)

        separation = DPoint(
            -vias_m3_mtop.dbbox().width() / 2,
            vias_m3_mtop.dbbox().height() / 2,
        )
        self.cell.insert(DCellInstArray(vias_m3_mtop, DTrans(-separation)))
        self.cell.insert(DCellInstArray(vias_m3_mtop, DTrans(separation)))


    def draw_via_stack_frame_lt(self):
        # M2 - M3 Via placement
        #######################
        m2_m3_params = via_filter_parameters({
            "x_max": 3,
            "y_max": 3,
            "base_layer": "comp",
            "metal_level": "M3",
        })
        vias_m2_m3 = create_via_cell(self.cell, params=m2_m3_params)
        self.cell.insert(DCellInstArray(vias_m2_m3, DTrans(DPoint())))

        # Metal 2 Via connection
        ####################
        # The 4 vias should be connected in metal2.

        metal2_corner = self.via_poly_proximity_x + self.via_poly_proximity_y
        metal2_box = DBox(-metal2_corner, metal2_corner)
        
        vias_m2_m3.shapes(KlayoutUtilities.get_layer("metal2")).insert(metal2_box)

        # M3-MTop Via placement
        #######################
        m3_mtop_params = via_filter_parameters({
            "x_max": 1.5,
            "y_max": 1.5,
            "base_layer": "M3",
            "metal_level": "Mtop",
        })
        vias_m3_mtop = create_via_cell(self.cell, params=m3_mtop_params)

        separation = DPoint(
            -vias_m3_mtop.dbbox().width() / 2,
            vias_m3_mtop.dbbox().height() / 2,
        )
        self.cell.insert(DCellInstArray(vias_m3_mtop, DTrans(-separation)))
        self.cell.insert(DCellInstArray(vias_m3_mtop, DTrans(separation)))


    def draw_extension_via_stack_frame_lt(self):
        track1_position = DPoint(-6.25000, 0.25000)
        track2_position = DPoint(-6.25000, 1.62000)

        # Track 1 Via placement
        #######################
        track1_params = via_filter_parameters({
            "x_max": 3.0,
            "y_max": 5.5,
            "base_layer": "comp",
            "metal_level": "M2",
        })
        track1_cell = create_via_cell(self.cell, params=track1_params)
        self.cell.insert(DCellInstArray(track1_cell, DTrans(track1_position)))

        track1_cell_width = track1_cell.dbbox().width()
        track1_cell_height = track1_cell.dbbox().height()

        # Track 1 NWELL
        ###############
        # DF.4d_LV : Min. (Nwell overlap of NCOMP) outside DNWELL. : 0.12µm
        # NP.5b : Extension beyond COMP for the COMP (1) inside LVPWELL (2) outside Nwell and DNWELL. : 0.16µm
        # NP.5di : Extension beyond COMP: For Outside DNWELL, inside Nwell: (i) For Nwell overlap of Nplus < 0.43um. : 0.16µm
        
        nwell_gap =  1 # Toy chato
        nwell_corner = DPoint(
            track1_cell_width / 2 + nwell_gap,
            track1_cell_height / 2 + nwell_gap
        )
        nwell_box = DBox(-nwell_corner, nwell_corner)
        track1_cell.shapes(KlayoutUtilities.get_layer("nwell")).insert(nwell_box)

        # Track 2 Via placement
        #######################
        track2_params = via_filter_parameters({
            "x_max": 1.2,
            "y_max": 1.2,
            "base_layer": "M2",
            "metal_level": "Mtop",
        })
        track2_cell = create_via_cell(self.cell, params=track2_params)
        self.cell.insert(DCellInstArray(track2_cell, DTrans(track2_position)))


    def draw_source_top(self):
        # M2 - M3 Via placement
        #######################
        m2_m3_params = via_filter_parameters({
            "x_max": 3,
            "y_max": 3,
            "base_layer": "comp",
            "metal_level": "M3",
        })
        vias_m2_m3 = create_via_cell(self.cell, params=m2_m3_params)
        self.cell.insert(DCellInstArray(vias_m2_m3, DTrans(DPoint())))

        # Metal 2 Via connection
        ####################
        # The 4 vias should be connected in metal2.

        metal_corner = self.via_poly_proximity_x + self.via_poly_proximity_y
        metal_box = DBox(-metal_corner, metal_corner)
        
        vias_m2_m3.shapes(KlayoutUtilities.get_layer("metal1")).insert(metal_box)
        vias_m2_m3.shapes(KlayoutUtilities.get_layer("metal2")).insert(metal_box)

        # M3-MTop Via placement
        #######################
        m3_mtop_params = via_filter_parameters({
            "x_max": 1.5,
            "y_max": 1.5,
            "base_layer": "M3",
            "metal_level": "Mtop",
        })
        vias_m3_mtop = create_via_cell(self.cell, params=m3_mtop_params)

        separation = DPoint(
            -vias_m3_mtop.dbbox().width() / 2,
            vias_m3_mtop.dbbox().height() / 2,
        )
        self.cell.insert(DCellInstArray(vias_m3_mtop, DTrans(-separation)))
        self.cell.insert(DCellInstArray(vias_m3_mtop, DTrans(separation)))


    def draw_gate(self, position):
        params = via_filter_parameters({
            "x_max": self.l,
            "y_max": self.l,
            "base_layer": "poly2",
            "metal_level": "M3",
        })
        create_via_cell(self.cell, position, params)


    def draw_vias(self):
        #via_connection_length = 4.38 # Original
        via_connection_length_gap = 0.28 # M1.2a, M2.2a: Proximity between metals
        via_connection_width = 0.4
        #via_connection_length = 2*self.via_poly_proximity_x.x - via_connection_width - 2*via_connection_length_gap
        via_connection_length = 2*self.via_poly_proximity_x.x

        via_parameters = via_filter_parameters({
            "x_max": via_connection_length,
            "y_max": 0,
            "base_layer": "comp",
            "metal_level": "M2",
        })

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
        pplus_comp_min_gap = 0.16
        pplus_corner = via_cell.dbbox().p2 + DPoint(pplus_comp_min_gap, pplus_comp_min_gap)
        pplus_box = DBox(-pplus_corner, pplus_corner)

        via_cell.shapes(KlayoutUtilities.get_layer("pplus")).insert(pplus_box)

        # Placement
        ###########

        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 90, False, -self.via_poly_proximity_x)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 90, False,  self.via_poly_proximity_x)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False, -self.via_poly_proximity_y)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False,  self.via_poly_proximity_y)))


    def draw_vias_frame_lt(self):
        via_connection_length = 2*self.via_poly_proximity_x.x

        via_parameters = via_filter_parameters({
            "x_max": via_connection_length,
            "y_max": 0,
            "base_layer": "comp",
            "metal_level": "M2",
        })

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
        pplus_comp_min_gap = 0.16
        pplus_corner = via_cell.dbbox().p2 + DPoint(pplus_comp_min_gap, pplus_comp_min_gap)
        pplus_box = DBox(-pplus_corner, pplus_corner)

        via_cell.shapes(KlayoutUtilities.get_layer("pplus")).insert(pplus_box)

        # Placement
        ###########

        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 90, False,  self.via_poly_proximity_x)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False, -self.via_poly_proximity_y)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False,  self.via_poly_proximity_y)))


    def big_nwell(self):
        nwell_corner = 2 * DPoint( self.dx.x, self.dy.y )
        nwell_box = DBox(-nwell_corner, nwell_corner)

        self.cell.shapes(KlayoutUtilities.get_layer("nwell")).insert(nwell_box)


    def draw_big_box(self, layer: str, dimentions: DPoint):
        box = DBox(DPoint(), dimentions) * DTrans(-dimentions/2)
        self.cell.shapes(KlayoutUtilities.get_layer(layer)).insert(box)


    def remove_layers_required(self):
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


    def remove_layers_drain_in(self):
        self.remove_layers_required()

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])


    def remove_layers_source_in(self):
        self.remove_layers_required()

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"]) 
        #KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])

    
    def remove_layers_source_frame_lt(self):
        self.remove_layers_required()

        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
        # KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])


    def remove_all_layers(self):
        for layer_tuple in cells.layers_def.layer.values():
            KlayoutUtilities.recursive_remove_layer(self.cell, layer_tuple)

        KlayoutUtilities.recursive_remove_layer(self.cell, (95,20))


    def draw_source_in_frame(self):
        self.name = "pmos_source_in"

        self.remove_layers_source_in()
        #self.remove_all_layers()

        self.big_nwell()

        self.draw_pmos_fets()
        self.draw_gate(position=-self.dx + self.dy) # Poly to M3

        self.draw_vias()

        self.draw_source_top() # It's OK

        # NPLUS layer DONDE LO PONGO???
        #############
        # nplus_length=1 # For now...
        # nplus_corner = DPoint(nplus_length/2, nplus_length/2)
        # nplus_box = DBox(-nplus_corner, nplus_corner)

        # self.cell.shapes(KlayoutUtilities.get_layer("nplus")).insert(nplus_box)

        pass


    def draw_drain_in_frame(self):
        self.name = "pmos_drain_in"

        self.remove_layers_drain_in()
        #self.remove_all_layers()

        self.big_nwell()

        self.draw_pmos_fets()
        self.draw_gate(position=-self.dx + self.dy) # Poly to M3

        self.draw_vias()

        self.draw_drain_top() # It's OK

        pass


    def draw_source_frame_lt(self):
        self.name = "pmos_source_frame_lt"

        self.remove_layers_source_frame_lt()
        #self.remove_all_layers()

        self.big_nwell()
        #self.draw_big_box("pplus", DPoint(10, 10))

        self.draw_pmos_frame_lt_fets()
        self.draw_gate(position=-self.dx + self.dy)

        self.draw_vias_frame_lt()

        self.draw_via_stack_frame_lt() # It's OK
        self.draw_extension_via_stack_frame_lt()
        
        ########################################
        # PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
        # PP.5dii : Extension beyond COMP: For Outside DNWELL (ii) For Pplus to NWELL space < 0.43um for Pfield or LVPWELL tap. : 0.16µm

        pass


    def get_cell(self):
        return self.cell


def main_waffle():
    KlayoutUtilities.clear()

    overlap = 0.4

    source_in_port = PortPmosFrame(
        gds_path="pmos_source_in",
        dx=DVector(2.75, 0),
        dy=DVector(0, 2.75),
        center=DVector(0.25, -0.25) + DVector(2.75, 2.75)
    )
    drain_in_port = PortPmosFrame(
        gds_path="pmos_drain_in",
        dx=DVector(2.75, 0),
        dy=DVector(0, 2.75),
        center=DVector(0.25, -0.25)+DVector(2.75, 2.75)
    )

    # Comment to avoid porting  
    source_in_port.draw_source_in_frame()
    drain_in_port.draw_drain_in_frame()
    overlap = 5.5
    

    waffle_cells = {
        "pmos_source_in": source_in_port.get_cell(),
        "pmos_drain_in": drain_in_port.get_cell(),
        "pmos_source_frame_lt": source_in_port.get_cell(),
        "pmos_drain_frame_lt": source_in_port.get_cell(),
        "pmos_source_frame_rb": source_in_port.get_cell(),
        "pmos_drain_frame_rb": source_in_port.get_cell(),
        "pmos_waffle_corners_lb": source_in_port.get_cell(),
        "pmos_waffle_corners_lt": source_in_port.get_cell(),
        "pmos_waffle_corners_rb": source_in_port.get_cell(),
        "pmos_waffle_corners_rt": source_in_port.get_cell(),
    }

    
    top = KlayoutUtilities().viewed_cell

    waffle = FetWaffleLayout(waffle_cells=waffle_cells, overlap=overlap)
    waffle.draw_central_layout()
    waffle.insert_onto(top, DPoint())

    KlayoutUtilities.set_visual_configuration()


    # DRC Errors
    ############

    ############################################################################
    # DF.3a_LV : Min. COMP Space is : 0.28µm. 
    # [P-substrate tap (PCOMP outside NWELL and DNWELL) can be butted for 
    # different voltage devices as the potential is same]

    # COMP

    # Parece que no puedo dejar islas de COMP.
    # Voy a ajustar tanto el tamaño del COMP como el de Nplus
    # - COMP cubre toda el ár, overlap=5.5ea
    # - NPLUS queda en contacto con PPLUS no tiene gap 

    # CORREGIDO

    ############################################################################
    # NP.3a : Space to PCOMP for PCOMP: (1) Inside Nwell (2) Outside LVPWELL but inside DNWELL. : 0.16µm

    # CORREGIDO AL REMOVER LAS ISLAS DE COMP

    ############################################################################
    # NP.3ci : Space to PCOMP: For Outside DNWELL: (i) For PCOMP space to Nwell < 0.43um. : 0.16µm

    # CORREGIDO AL REMOVER LAS ISLAS DE COMP

    ############################################################################
    # PL.5a_LV : Space from field Poly2 to unrelated COMP Spacer from field Poly2 to Guard-ring. : 0.1µm
    # COMP, POLY2

    # Es un extra que se pone al COMP de los conectores de poly y contact.
    # Tendré que no agregar eso mejor.
    # Habrá que solucionar el problema del mini COMP

    ############################################################################
    # PL.5b_LV : Space from field Poly2 to related COMP. : 0.1µm
    # COMP, POLY2

    ############################################################################
    # PP.2 : min. pplus spacing : 0.4µm
    # PPLUS

    # Podría hacerlo más grande para que se toquen

    ############################################################################
    # PP.8b : Minimum area enclosed by Pplus (um2). : 0.35µm²
    # PPLUS

    # Si hago que se toquen, no tendré problemas


def main_specific():
    KlayoutUtilities.clear()

    overlap = 0.4

    # gds_path="pmos_source_in",
    # gds_path="pmos_drain_in",
    gds_path = "pmos_source_frame_lt"
    # gds_path = "pmos_drain_frame_lt"
    # gds_path = "pmos_source_frame_rb"
    # gds_path = "pmos_drain_frame_rb"
    # gds_path = "pmos_waffle_corners_lb"
    # gds_path = "pmos_waffle_corners_lt"
    # gds_path = "pmos_waffle_corners_rb"
    # gds_path = "pmos_waffle_corners_rt"

    port = PortPmosFrame(
        gds_path=gds_path,
        dx=DVector(2.75, 0),
        dy=DVector(0, 2.75),
        center=DVector(0.25, -0.25)+DVector(2.75, 2.75)
    )

    # Comment to avoid porting  
    #port.draw_source_in_frame()
    #port.draw_drain_in_frame()
    port.draw_source_frame_lt()
    overlap = 5.5
    
    top = KlayoutUtilities().viewed_cell
    top.insert(DCellInstArray(port.get_cell(), DTrans(0, 0)))

    top


    KlayoutUtilities.set_visual_configuration()


if __name__ == "__main__":

    main_specific()
    # main_waffle()