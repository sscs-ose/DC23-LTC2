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

from .klayout_utilities import KlayoutUtilities

def default_pmos_parameters():    
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


    return dict({
        "layout": None,                 # layout
        "deepnwell": 0,                 # Deep NWELL
        "pcmpgr": 0,                    # Deep NWELL Guard Ring
        "volt": "3.3V",                 # Operating Voltage (3.3V 5V 6V)
        "bulk": "None",                 # Bulk Type (None, Bulk Tie, Guard Ring)
        "w_gate": fet_3p3_w,            # Width
        "l_gate": fet_3p3_l,            # Length
        "inter_sd_l": fet_ld,           # Diffusion Length
        "nf": 1,                        # Number of Fingers
        "grw": fet_grw,                 # Guard Ring Width
        "gate_con_pos": "alternating",  # Gate Contact Position (top bottom alternating)
        "con_bet_fin": 1,               # Contact Between Fingers
        "sd_con_col": 1,                # Diffusion Contacts Columns
        "interdig": 0,                  # Interdigitation
        "patt": "",                     # Pattern in case of Interdigitation
        "patt_lbl": 0,                  # Interdigitation pattern label
        "lbl": 0,                       # Labels
        "sd_lbl": list(),               # Pattern of Source/Drain Labels
        "g_lbl": list(),                # Patterns of Gate Labels
        "sub_lbl": "",                  # Substrate Label
    })


def pmos_dimentions(l, w, nf) -> dict:
    pmos_params = default_pmos_parameters()

    # Calculate x length

    pmos_dim = dict()

    # Calculate x length

    pmos_dim["total_channel_length"] = l * nf
    pmos_dim["total_channel_width"] = w / nf

    pmos_dim["diffusion_length"] = pmos_params["inter_sd_l"]
    pmos_dim["total_diffusion_length"] = (nf-1)*pmos_dim["diffusion_length"]

    pmos_dim["drain_source_length_offset"] = 0.13
    
    pmos_dim["drain_length"] = 0.65 #0.46 + 0.19
    pmos_dim["source_length"] = 0.65 #0.46 + 0.19
    pmos_dim["bulk_length"] = 0.73 # 0.21 + 0.52

    pmos_dim["x_offset"] = -0.46
    pmos_dim["x_length"] = (
        pmos_dim["total_channel_length"] +
        pmos_dim["total_diffusion_length"] + 
        pmos_dim["drain_length"] + 
        pmos_dim["source_length"] + 
        pmos_dim["bulk_length"]
    )
    
    pmos_dim["y_offset"] = 0
    pmos_dim["y_length"] = (
        pmos_dim["total_channel_width"]
    )

    pmos_dim["first_poly_contact_center_x"] = 0.19 + l/2
    pmos_dim["first_poly_contact_center_y"] = pmos_dim["total_channel_width"] + 0.49

    return pmos_dim
