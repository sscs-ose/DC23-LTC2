from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import DPoint, DCellInstArray, DTrans, DVector, DCplxTrans, Cell, Layout

from math import ceil, floor, sqrt


class FetWaffleLayout:
    """This class should be able to create waffle cells and position them on the layout"""
    def __init__(self, m: int = 0):

        # This parameters are observations over the layout
        dx_overlap=0.4
        dy_overlap=0.4
        self.x_offset=0.215
        self.y_offset=0.185

        _, self.m = FetWaffleLayout.approximate_m(m)
        self.n = int( (1 + int(sqrt(1+2*m)) ) / 2 )

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


        # Each cell is a square.
        # The bounding box of each cell is bigger than the actual cell size.
        # That's why we have to overlap the shapes.
        self.box_size = self.source_in.dbbox().width()
        self.dx = DPoint( self.box_size - dx_overlap, 0)
        self.dy = DPoint( 0, self.box_size - dy_overlap)

        # We are working on a new cell
        self.layout: Layout = KlayoutUtilities().layout
        self.cell: Cell = self.layout.create_cell(f"waffle_{self.m}")


    def draw(self, cell: Cell, position: DVector = DVector(0, 0)):
        self.draw_central_layout()
        self.draw_left_top_layout()
        self.draw_right_bottom_layout()
        self.draw_corners_layout()

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
