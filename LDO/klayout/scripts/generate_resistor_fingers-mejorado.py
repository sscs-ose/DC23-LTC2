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

# Resistor design
#################


def create_centered_box(width: float, height: float) -> DBox:
    corner = DPoint(width / 2, height / 2)
    return DBox(-corner, corner)


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

        self.name = f"via_{base_layer}_{metal_level}_{round(self.pcell.x_max, 4)}_{round(self.pcell.y_max, 4)}"
        if self.implant:
            self.name = f"{self.name}-{self.implant}"

    def get_cell(self, cell: Cell):
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


class ResistorGenerator:
    def __init__(self, res_type: str, l, w):
        if res_type == "ppolyf_u":
            self.pcell = ppolyf_u_resistor()
            self.res_type = res_type

        else:
            raise ValueError(f"Resistor type {res_type} don't exists")

        self.pcell.l_res = l
        self.pcell.w_res = w

        self.pcell.coerce_parameters_impl()

        self.name = f"resistor_{self.res_type}_{self.pcell.l_res}_{self.pcell.w_res}"


class CommonCentroidResistorGenerator:
    def __init__(self):
        self.name = "resistor"

    def generate_resistor(self, res_cell):
        """Generates the resistor to be used in a common centroid resistor"""

        res_core: Cell = cells.draw_res.draw_ppolyf_res(
            layout=res_cell.layout(),
            l_res=20,
            w_res=1,
            res_type="ppolyf_u",
            deepnwell=0,
            pcmpgr=0,
            lbl=1,
            r0_lbl="",
            r1_lbl="",
            sub_lbl=1,
        )

        # res_core.flatten(1)

        # Min space bewteen resistors: 0.4 um
        res_x_spacing = 0

        # res_y_spacing = 2 # Minimum valid
        res_y_spacing = 3  # -1.6

        res = DCellInstArray(
            res_core,
            DTrans(DPoint(0, 0)),
            DVector(res_x_spacing, 0),
            DVector(0, res_y_spacing),
            1,
            18,
        )

        res_cell.insert(res)

        return res

    def generate_resistor_bulk_connection(self, res_cell):
        metal1_width = 0.38  # min 0.23

        path = DPath(
            [DPoint(-1.7, 51.5 + 1.1 / 2), DPoint(-1.7, 0.5 - 1.1 / 2)], metal1_width
        )

        layer = KlayoutUtilities.get_layer("metal1")

        # bulk = layout.create_cell("res_bulk_connection")
        res_cell.shapes(layer).insert(path)

        return res_cell

    def insert_resistor_core_vias(self, res_cell) -> DCellInstArray:
        via_gen = ViaGenerator(base_layer="M1", metal_level="M2", x_max=1.1, y_max=1.1)
        via_cell: Cell = via_gen.get_cell(res_cell)

        # Array setting

        start = DPoint(-0.33000, 0.500)

        # Separation between centers: 20.66
        #
        x_space = 20.66
        y_space = 3

        via_array = DCellInstArray(
            via_cell,
            DTrans(start),
            DVector(x_space, 0),
            DVector(0, y_space),
            2,
            18,
        )

        res_cell.insert(via_array)

        return via_array

    def insert_resistor_inner_routing_vias(self, res_cell) -> DCellInstArray:
        via_gen = ViaGenerator(base_layer="M1", metal_level="M2", x_max=1.1, y_max=1.1)
        via_cell: Cell = via_gen.get_cell(res_cell)

        # https://www.klayout.de/doc/manual/create_variants.html
        # https://www.klayout.de/forum/discussion/1814/making-a-cell-variant-using-the-script

        # Array setting
        extension_x = 3

        start_x = -0.33 - extension_x
        start_y = 0.5

        x_space = 20.66 + 2 * extension_x
        y_space = 3

        via_array = DCellInstArray(
            via_cell,
            DTrans(DPoint(start_x, start_y)),
            DVector(x_space, 0),
            DVector(0, y_space),
            2,
            18,
        )

        # for dtrans in via_array.each_trans():
        #   res_cell.insert(DCellInstArray(via_cell, dtrans))

        res_cell.insert(via_array).explode()

        return via_array

    def insert_resistor_outer_routing_vias(self, res_cell) -> DCellInstArray:
        via_gen = ViaGenerator(base_layer="M1", metal_level="M2", x_max=1.1, y_max=1.1)
        via_cell: Cell = via_gen.get_cell(res_cell)

        # Array setting
        extension_x = 3 + 2

        start_x = -0.33 - extension_x
        start_y = 0.5

        x_space = 20.66 + 2 * extension_x
        y_space = 3

        via_array = DCellInstArray(
            via_cell,
            DTrans(DPoint(start_x, start_y)),
            DVector(x_space, 0),
            DVector(0, y_space),
            2,
            18,
        )

        # for dtrans in via_array.each_trans():
        #   res_cell.insert(DCellInstArray(via_cell, dtrans))

        res_cell.insert(via_array).explode()

        return via_array

    def get_cell(self, cell: Cell):
        res_cell: Cell | None = cell.layout().cell(self.name)

        if res_cell is None:
            res_cell = cell.layout().create_cell(self.name)

            # The process should be done in a specific order
            # 1. Generate inner and outer vias

            # We stop here. With manual handling one has to turn the vias into
            # variations
            # Edit > Selection > Make Cell Variants
            # Then run the following functions
            # exit()

            # 1. Generate resistor fingers
            # 1. Generate bulk connection
            # 1. Generate resistor vias

            self.insert_resistor_inner_routing_vias(res_cell)
            self.insert_resistor_outer_routing_vias(res_cell)

            self.generate_resistor(res_cell)
            self.generate_resistor_bulk_connection(res_cell)
            self.insert_resistor_core_vias(res_cell)

        return res_cell

    def draw(self, cell: Cell, position: DPoint) -> Instance:
        """Accepts a position and draws the cell centered"""
        res_cell = self.get_cell(cell)

        return cell.insert(DCellInstArray(res_cell, DTrans(position)))


def main():
    KlayoutUtilities.clear()

    ccres_gen = CommonCentroidResistorGenerator()
    ccres_gen.draw(KlayoutUtilities().viewed_cell, DPoint())

    KlayoutUtilities.set_visual_configuration()


main()
