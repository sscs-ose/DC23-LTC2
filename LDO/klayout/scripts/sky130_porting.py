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


if __name__ == "__main__":

    gds_path = Path("ota-ldo-v2-sky130.gds")

    KlayoutUtilities.set_load_mapping(KlayoutUtilities.sky130_gf180_mapping())
    KlayoutUtilities.read_gds(gds_path)
