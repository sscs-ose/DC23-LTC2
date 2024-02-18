v {xschem version=3.4.4 file_version=1.2

* Copyright 2022 GlobalFoundries PDK Authors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     https://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.

}
G {}
K {}
V {}
S {}
E {}
L 7 480 -990 480 -60 {}
L 7 820 -990 820 -60 {}
L 7 1160 -990 1160 -60 {}
L 7 1500 -990 1500 -60 {}
L 7 1840 -990 1840 -60 {}
L 7 20 -990 20 -60 {}
L 7 2180 -990 2180 -60 {}
L 10 840 -530 840 -370 {}
L 10 840 -370 1140 -370 {}
L 10 1140 -530 1140 -370 {}
L 10 840 -530 1140 -530 {}
L 10 1180 -640 1180 -580 {}
L 10 1480 -640 1480 -580 {}
L 10 1180 -640 1480 -640 {}
L 10 1180 -580 1480 -580 {}
L 15 840 -560 1140 -560 {}
L 15 1140 -620 1140 -560 {}
L 15 840 -620 1140 -620 {}
L 15 840 -620 840 -560 {}
L 15 1180 -790 1180 -680 {}
L 15 1180 -680 1480 -680 {}
L 15 1480 -790 1480 -680 {}
L 15 1180 -790 1480 -790 {}
L 17 840 -650 1140 -650 {}
L 17 1140 -860 1140 -650 {}
L 17 840 -860 1140 -860 {}
L 17 840 -860 840 -650 {}
L 21 840 -340 840 -280 {}
L 21 840 -280 1140 -280 {}
L 21 1140 -340 1140 -280 {}
L 21 840 -340 1140 -340 {}
T {DEVICE
CHARACTERIZATION} 40 -990 0 0 0.8 0.8 {}
T {TOP
SIMULATION} 500 -990 0 0 0.8 0.8 {}
T {COMPARATOR} 840 -990 0 0 0.8 0.8 {}
T {BOOTSTRAP
SWITCH} 1200 -990 0 0 0.8 0.8 {}
T {CDAC} 1610 -990 0 0 0.8 0.8 {}
T {SAR
LOGIC} 1940 -990 0 0 0.8 0.8 {}
T {Comparator testbench} 870 -890 0 0 0.4 0.4 { layer=17}
T {Static preamp testbench} 860 -650 0 0 0.4 0.4 { layer=15}
T {Strongarm testbench} 880 -560 0 0 0.4 0.4 { layer=10}
T {SR-NAND latch testbench} 860 -370 0 0 0.4 0.4 { layer=21}
T {Switch design} 1250 -820 0 0 0.4 0.4 { layer=15}
T {Switch testbench} 1240 -670 0 0 0.4 0.4 { layer=10}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Team Chile2"}
C {tb_cdac.sym} 1670 -760 0 0 {name=x8}
C {fast_bootstrap_design.sym} 1330 -710 0 0 {name=x14}
C {bootstrap_sw_design.sym} 1330 -760 0 0 {name=x21}
C {strongarm_DC_tb.sym} 990 -500 0 0 {name=x38}
C {stat_preamp_tb.sym} 990 -590 0 0 {name=x39}
C {latch_rs-1_tb.sym} 990 -310 0 0 {name=x45}
C {strongarm_sin_1m_tb.sym} 990 -400 0 0 {name=x46}
C {strongarm_peak_tb.sym} 990 -450 0 0 {name=x47}
C {bootstrap_sw_design.sym} 1330 -610 0 0 {name=x54}
C {pmos_charac_gf180_3p3_M34.sym} 240 -660 0 0 {name=x3}
C {nmos_charac_gf180_3p3_M7.sym} 240 -710 0 0 {name=x2}
C {nmos_charac_gf180_3p3.sym} 240 -760 0 0 {name=x1}
C {tb_sar_logic.sym} 2010 -760 0 0 {name=x59}
C {tb_ff.sym} 650 -710 0 0 {name=xf}
C {tb_sar_adc.sym} 650 -760 0 0 {name=xj}
C {comp_sin_1u_10meg_tb.sym} 990 -730 0 0 {name=x4}
C {comp_step_tb.sym} 990 -680 0 0 {name=x5}
C {comp_random_tb.sym} 990 -780 0 0 {name=x6}
C {comp_0input_tb.sym} 990 -830 0 0 {name=xf1}
C {tb_cdac_2.sym} 1670 -690 0 0 {name=x7}
C {tb_sar_adc_sin.sym} 650 -660 0 0 {name=xj1}
