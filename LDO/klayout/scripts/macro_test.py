import pya
from cells.draw_fet import draw_pfet


############### PCELLS ####################

fet_3p3_l = float(0.28)
fet_3p3_w = float(0.22)
fet_w_con = float(0.36)
fet_w_con_bulk = 0.42
fet_5_6_w = 0.3

nfet_05v0_l = 0.6
nfet_06v0_l = 0.7

pfet_05v0_l = 0.5
pfet_06v0_l = 0.55

nfet_nat_l = 1.8
nfet_nat_w = 0.8
fet_grw = 0.38
fet_ld = 0.52

ldfet_l_min = 0.6
ldfet_l_max = 20
ldfet_w_min = 4
ldfet_w_max = 50

class pfet():
    """
    PFET Generator for GF180MCU
    """

    def __init__(self, layout, cell):
    
        

        # ===================== PARAMETERS DECLARATIONS =====================

        self.volt = 3.3 #5V, 6V
        self.w_gate = fet_3p3_w
        self.l_gate = fet_3p3_l
        self.ld = fet_ld
        self.nf = 1
        self.gate_con_pos = "top" #bottom, alternating
        self.layout = layout
        self.cell = cell


    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "pfet(L=" + ("%.3f" % self.l_gate) + ",W=" + ("%.3f" % self.w_gate) + ")"

    def coerce_parameters_impl(self):
        # We employ coerce_parameters_impl to decide whether the handle or the
        # numeric parameter has changed (by comparing against the effective
        # radius ru) and set ru to the effective radius. We also update the
        # numerical value or the shape, depending on which on has not changed.
        self.area = self.w_gate * self.l_gate
        self.perim = 2 * (self.w_gate + self.l_gate)
        # w,l must be larger or equal than min. values.
        if self.volt == "3.3V":
            if (self.l_gate) < fet_3p3_l:
                self.l_gate = fet_3p3_l
            if (self.w_gate) < fet_3p3_w:
                self.w_gate = fet_3p3_w

        elif self.volt == "5V":
            if (self.l_gate) < pfet_05v0_l:
                self.l_gate = pfet_05v0_l
            if (self.w_gate) < fet_5_6_w:
                self.w_gate = fet_5_6_w

        elif self.volt == "6V":
            if (self.l_gate) < pfet_06v0_l:
                self.l_gate = pfet_06v0_l
            if (self.w_gate) < fet_5_6_w:
                self.w_gate = fet_5_6_w

        if (self.ld) < fet_ld:
            self.ld = fet_ld

        if (self.grw) < fet_grw:
            self.grw = fet_grw

        if self.con_bet_fin == 1:
            if self.bulk == "Bulk Tie":
                if (self.w_gate) < fet_w_con_bulk:
                    self.w_gate = fet_w_con_bulk
            else:
                if (self.w_gate) < fet_w_con:
                    self.w_gate = fet_w_con

    def produce_impl(self):
        instance = draw_pfet(
            self.layout,
            l_gate=self.l_gate,
            w_gate=self.w_gate,
            inter_sd_l=self.ld,
            nf=self.nf,
            volt=self.volt,
            gate_con_pos=self.gate_con_pos
        )
        write_cells = pya.CellInstArray(
            instance.cell_index(),
            pya.Trans(pya.Point(0, 0)),
            pya.Vector(0, 0),
            pya.Vector(0, 0),
            1,
            1,
        )
        self.cell.insert(write_cells)
        self.cell.flatten(1)

###########################################

# Get the current layout view
layout_view = pya.LayoutView.current()

# Check if the layout view is valid
if layout_view is None:
    raise Exception("No layout view is active. Open a GDS file in the KLayout viewer.")

# Get the current layout directly
layout = layout_view.active_cellview().layout()

# Get the top cell of the currently opened GDS file
top_cell = layout.top_cell()

# Define the layer for the box
#layer_number = 1
#layer = layout.layer(layer_number, 0)

# Create a box shape and insert it into the top cell
#box = pya.Box(pya.DPoint(0, 0), pya.DPoint(3000, 2000))
#top_cell.shapes(layer).insert(box)

###########################################

#instance = draw_pfet(layout=layout, l_gate=0.8, w_gate=9, nf=3, gate_con_pos="top", inter_sd_l = 0.52)

#write_cells = pya.CellInstArray(
#    instance.cell_index(),
#    pya.Trans(pya.Point(10000, 0)),
#    pya.Vector(0, 0),
#    pya.Vector(0, 0),
#    1,
#    1,
#)
#top_cell.insert(write_cells)
#top_cell.flatten(1)

#############################################

device = pfet(layout,top_cell)
device.w_gate = 9 
device.l_gate =0.8
device.nf = 6
device.produce_impl()

##############################################

layer_number = 36
layer = layout.layer(layer_number, 0)

# Create a box shape and insert it into the top cell
box = pya.Box(pya.DPoint(0, 200+device.w_gate*1000), pya.DPoint((device.l_gate+device.ld)*device.nf*1000, 800+device.w_gate*1000))
top_cell.shapes(layer).insert(box)

##############################################

layer_number = 34
layer = layout.layer(layer_number, 0)
box = pya.Box(pya.DPoint(-450,device.w_gate*1000-500), pya.DPoint(device.ld*1000-550, device.w_gate*1000+800))
top_cell.shapes(layer).insert(box)

###############################################

layer_number = 34
layer = layout.layer(layer_number, 0)

box = pya.Box(pya.DPoint(-500,500), pya.DPoint(0, -800))
top_cell.shapes(layer).insert(box)

box = pya.Box(pya.DPoint(device.l_gate*3*1000+100,500), pya.DPoint(device.l_gate*3*1000+500, -800))
top_cell.shapes(layer).insert(box)

box = pya.Box(pya.DPoint((device.l_gate+0.47)*4*1000,500), pya.DPoint((device.l_gate+0.47)*4*1000+device.ld*1000, -800))
top_cell.shapes(layer).insert(box)

box = pya.Box(pya.DPoint((device.l_gate+0.53)*6*1000,500), pya.DPoint((device.l_gate+0.53)*6*1000+device.ld*1000, -800))
top_cell.shapes(layer).insert(box)

#################################################

layer_number = 36
layer = layout.layer(layer_number, 0)

# Create a box shape and insert it into the top cell
box = pya.Box(pya.DPoint(-500, -800), pya.DPoint(device.l_gate*3*1000+500, -300))
top_cell.shapes(layer).insert(box)

box = pya.Box(pya.DPoint((device.l_gate+0.47)*4*1000, -800), pya.DPoint((device.l_gate+0.53)*6*1000+device.ld*1000, -300))
top_cell.shapes(layer).insert(box)