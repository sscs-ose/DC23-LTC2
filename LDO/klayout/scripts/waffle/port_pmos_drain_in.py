import pya
import cells
from cells.via_generator import draw_via_dev
from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import DPoint, DCellInstArray, DTrans, Cell, Layout, DVector, DBox, DPath, Shapes, DCplxTrans

import math
from math import ceil, floor, sqrt


from pprint import pprint
from pathlib import Path

from klayout_utilities import KlayoutUtilities
from pya import DPoint, DCellInstArray, DTrans, DVector, DCplxTrans, Cell, Layout

from math import ceil, floor, sqrt


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

class PortPmosDrainIn:
    def __init__(self, l=0.5, w=4.38):
        # This class should not be used with other cells.
        # It's only for port a specific cell.

        self.l = l
        self.w = w

        KlayoutUtilities.set_load_mapping(KlayoutUtilities.sky130_gf180_mapping())
        self.cell, *_ = KlayoutUtilities.read_gds("pmos_drain_in")

        self.name = "pmos_drain_in"

        self.dx = DVector(2.75, 0)
        self.dy = DVector(0, 2.75)

        # Centering the waffle frame
        offset = DVector(0.25, -0.25)
        center = DVector(2.75, 2.75)
        KlayoutUtilities.recursive_transform_shapes(self.cell, DCplxTrans(1, 0, False, -(offset + center)))

        # Separation between drain vias with poly
        self.drc_via_overlap =  0.05
        self.drain_via_gap = 0.1  # PL.5b_LV
        self.drain_proximity_x = self.dx - DVector(self.l + self.drc_via_overlap + self.drain_via_gap, 0)
        self.drain_proximity_y = self.dy - DVector(0, self.l + self.drc_via_overlap + self.drain_via_gap)


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

        metal2_corner = self.drain_proximity_x + self.drain_proximity_y
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


    def draw_gate(self, position):
        params = via_filter_parameters({
            "x_max": self.l,
            "y_max": self.l,
            "base_layer": "poly2",
            "metal_level": "M3",
        })
        create_via_cell(self.cell, position, params)


    def draw_drain_vias(self):
        #via_connection_length = 4.38 # Original
        via_connection_length_gap = 0.28 # M1.2a, M2.2a: Proximity between metals
        via_connection_width = 0.4
        via_connection_length = 2*self.drain_proximity_x.x - via_connection_width - 2*via_connection_length_gap

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
        comp_corner = DPoint(
            self.drain_proximity_x.x + via_connection_width/2,
            via_cell.dbbox().p2.y,
        )
        comp_box = DBox(-comp_corner, comp_corner)
        via_cell.shapes(KlayoutUtilities.get_layer("comp")).insert(comp_box)


        # PP.5di : Extension beyond COMP: For Outside DNWELL (i) For Pplus to NWELL space >= 0.43um for Pfield or LVPWELL tap. : 0.02µm
        # PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
        pplus_comp_min_gap = 0.16
        pplus_corner = via_cell.dbbox().p2 + DPoint(pplus_comp_min_gap, pplus_comp_min_gap)
        pplus_box = DBox(-pplus_corner, pplus_corner)

        via_cell.shapes(KlayoutUtilities.get_layer("pplus")).insert(pplus_box)

        # Placement
        ###########

        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 90, False, -self.drain_proximity_x)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 90, False,  self.drain_proximity_x)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False, -self.drain_proximity_y)))
        self.cell.insert(DCellInstArray(via_cell, DCplxTrans(1, 0, False,  self.drain_proximity_y)))


    def big_nwell(self):
        nwell_corner = 2 * DPoint( self.dx.x, self.dy.y )
        nwell_box = DBox(-nwell_corner, nwell_corner)

        self.cell.shapes(KlayoutUtilities.get_layer("nwell")).insert(nwell_box)


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

        # LAYERS THAT COULD BE MANTAINED OR REMOVED
        ###########################################

        # It's used to make a ring. I'm not sure if that's relevant considering the DRC problems it's making
        # The pattern is followed by
        # - COMP
        # - PPLUS
        # - METAL1
        # - METAL2, it is filled

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal1"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["metal2"])

        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["comp"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nwell"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["pplus"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["nplus"])
        KlayoutUtilities.recursive_remove_layer(self.cell, cells.layers_def.layer["dnwell"])


    def remove_all_layers(self):
        for layer_tuple in cells.layers_def.layer.values():
            KlayoutUtilities.recursive_remove_layer(self.cell, layer_tuple)

        KlayoutUtilities.recursive_remove_layer(self.cell, (95,20))


    def draw(self):
        self.remove_layers()
        #self.remove_all_layers()

        self.big_nwell()

        self.draw_pmos_fets()
        self.draw_gate(position=-self.dx + self.dy) # Poly to M3

        self.draw_drain_vias()

        self.draw_drain_top() # It's OK

        # TODO in drc errors:
        # DF.1a_MV : Min. COMP Width. : 0.3µm
        # Handled extending COMP boxes with Partial tool

        # DF.6_MV : Min. COMP extend beyond gate (it also means source/drain overhang). : 0.4µm
        # Se extienden los COMPS que estan bajo transistores.

        # 98

        # 8 DV.8 : Min Dualgate enclose Poly2. : 0.4µm
        # Se agranda manualmente Dualgate

        # 88

        # 2 DF.12 : COMP not covered by Nplus or Pplus is forbidden (except those COMP under marking).
        # Al corregir un problema anterior, se hizo que COMP sobrepasara P+, extender P+ corrigió el problema

        # 81

        # 4 DV.6 : Min. Dualgate enclose COMP (except substrate tap). : 0.24µm
        # COMP está por fuera de Dualgate, al parece esto no puede ser.
        
        # 78

        # PP.5a : Overlap of P-channel gate. : 0.23µm
        # Supongo que ocurre porque el área Pplus debe sobrepasar el largo del transistor.

        # 62

        # PP.1 : min. pplus width : 0.4µm
        # Una estupidez, hay que hacer los Pplus y Nplus lo mas regulares posibles, sin "detalles", "salidas"
        # Funcionó

        # 61

        # 16 - PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
        # COMP, NWELL
        # Intuyo que se refiere a tener un gap de 0.16 de Pplus por sobre COMP
        # Se expanden todas las áreas donde haya Pplus, posiblemente gatille drc por PP.1
        # Altamente efectivo

        # 29

        # CO.7 : Space from COMP contact to Poly2 on COMP. : 0.15µm
        # Es un problema de los "contact", muy cerca a poly2.
        # Corregir esto posiblemente gatille problemas DRC por cercanía de vía o contacto
        # Esto afecta a todas las vías, pero solamente modifiqué las que en este layout están cerca.

        # 15
        
        # https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_07_06.html
        # 1 DF.13_MV : Max distance of Nwell tap (NCOMP inside Nwell) from (PCOMP inside Nwell): 15um
        # El error DRC enfloba todo el COMP.
        # Nwell TAP: Nplus + COMP + NWELL
        # Máxima distancia entre Nwell TAP y [Pplus + COMP + NWELL]: 15um
        # No se como corregir este problema.
        # Tendré que poner un Nwell Tap
        # OJOO!!!! No es necesario pescar tanto este error, ya que el layout contiene Nwel Taps

        # Agregar Comp dentro de un Nplus al lado del circuito arregló el error

        # 14

        # https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_07_08.html
        # 2 PL.2_MV : Gate Width (Channel Length).
        # CREO que se estaba considerando que el transistor operaba en 6V, puse una capa de 5V_XTOR para
        # que se quede en 5V y los transistores tienen ancho 0.5
        # Funcionó.

        # 12

        # Ya no hay errores relevantes de DRC.

        ##############################
        ## Procedimiento
        ##############################

        # En función gate()
        ####################

        # HANDLED
        # DF.6_MV : Min. COMP extend beyond gate (it also means source/drain overhang). : 0.4µm
        # Se extienden los COMPS que estan bajo transistores.

        # HANDLED
        # 8 DV.8 : Min Dualgate enclose Poly2. : 0.4µm
        # Se agranda manualmente Dualgate

        #
        # 4 DV.6 : Min. Dualgate enclose COMP (except substrate tap). : 0.24µm
        # COMP está por fuera de Dualgate, al parece esto no puede ser.

        #
        # PP.5a : Overlap of P-channel gate. : 0.23µm
        # Supongo que ocurre porque el área Pplus debe sobrepasar el largo del transistor.

        #
        # 16 - PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
        # COMP, NWELL
        # Intuyo que se refiere a tener un gap de 0.16 de Pplus por sobre COMP
        # Se expanden todas las áreas donde haya Pplus, posiblemente gatille drc por PP.1
        # Altamente efectivo

        #
        # https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_07_08.html
        # 2 PL.2_MV : Gate Width (Channel Length).
        # CREO que se estaba considerando que el transistor operaba en 6V, puse una capa de 5V_XTOR para
        # que se quede en 5V y los transistores tienen ancho 0.5
        # Funcionó.


        # En función connections()
        ##########################

        # CO.7 : Space from COMP contact to Poly2 on COMP. : 0.15µm
        # Es un problema de los "contact", muy cerca a poly2.
        # Corregir esto posiblemente gatille problemas DRC por cercanía de vía o contacto
        # Esto afecta a todas las vías, pero solamente modifiqué las que en este layout están cerca.



        # No gestionados aún
        ####################


        ##################################

        # After doing manual fixing, this is another DRC revision

        # 47

        # DF.4c_MV : Min. (Nwell overlap of PCOMP) outside DNWELL. : 0.6µm
        # NWELL, COMP
        # Se extiende Nwell para cubrir por sobre 0.6um el COMP
        # NO SE SI puedo tener huecos de NWELL dentro de la celda...

        # 44

        # DF.13_MV : Max distance of Nwell tap (NCOMP inside Nwell) from (PCOMP inside Nwell): 15um
        # SE IGNORA porque simplemente falta un Pplus.

        # PL.12 : V5_Xtor enclose 5V Comp.
        # COMP, V5_XTOR
        # Se extiende V5 para cubrir justo todo COMP. sin gap. ESTO FUNCIONA
        # TIP: V5_XTOR solo requiere de cubrir todo el COMP, no necesita tener GAP.

        # 43
                
        # DV.6 : Min. Dualgate enclose COMP (except substrate tap). : 0.24µm
        # COMP, DUALGATE
        # Falta un gap que separe COMP de DUALGATE.
        # Se extiende DUALGATE manualmente.

        # 37

        # PP.5a : Overlap of P-channel gate. : 0.23µm
        # COMP, POLY2, PPLUS
        # Pplus debe extenderse por sobre el gate (COMP+POLY)

        # 23

        # PP.5b : Extension beyond COMP for COMP (1) Inside NWELL (2) outside LVPWELL but inside DNWELL. : 0.16µm
        # COMP, PPLUS
        # Pplus debe estar 0.16 más afuera de COMP. SIEMPRE

        # PP.5dii : Extension beyond COMP: For Outside DNWELL (ii) For Pplus to NWELL space < 0.43um for Pfield or LVPWELL tap. : 0.16µm
        pass


    def get_cell(self):
        return self.cell


def main_test_port():
    KlayoutUtilities.clear()

    top = KlayoutUtilities().viewed_cell

    #port = PortPmosSourceIn()
    port = PortPmosDrainIn()

    port.draw()
    top.insert(DCellInstArray(port.get_cell(), DTrans(0, 0)))
    KlayoutUtilities.set_visual_configuration()

if __name__ == "__main__":
    main_test_port()