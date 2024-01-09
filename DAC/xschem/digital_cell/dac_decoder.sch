v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1440 -1370 1440 -1300 {
lab=#net1}
N 1440 -1380 1440 -1370 {
lab=#net1}
N 1440 -1380 1520 -1380 {
lab=#net1}
N 1440 -1180 1890 -1180 {
lab=J5}
N 1070 -1420 1520 -1420 {
lab=D2}
N 1070 -1420 1070 -840 {
lab=D2}
N 1110 -1320 1320 -1320 {
lab=D1}
N 1110 -1320 1110 -840 {
lab=D1}
N 1150 -1280 1320 -1280 {
lab=D0}
N 1150 -1280 1150 -840 {
lab=D0}
N 1110 -1200 1320 -1200 {
lab=D1}
N 1070 -1160 1320 -1160 {
lab=D2}
N 1070 -1110 1520 -1110 {
lab=D2}
N 1440 -1070 1520 -1070 {
lab=#net2}
N 1440 -1070 1440 -1030 {
lab=#net2}
N 1110 -1050 1320 -1050 {
lab=D1}
N 1150 -1010 1320 -1010 {
lab=D0}
N 1070 -940 1320 -940 {
lab=D2}
N 1640 -1400 1890 -1400 {
lab=J6}
N 1640 -1090 1890 -1090 {
lab=J4}
N 1440 -820 1440 -760 {
lab=#net3}
N 1450 -820 1540 -820 {
lab=#net3}
N 1070 -860 1540 -860 {
lab=D2}
N 1070 -840 1070 -570 {
lab=D2}
N 1110 -840 1110 -570 {
lab=D1}
N 1150 -840 1150 -570 {
lab=D0}
N 1440 -820 1450 -820 {
lab=#net3}
N 1110 -780 1320 -780 {
lab=D1}
N 1150 -740 1320 -740 {
lab=D0}
N 1070 -650 1320 -650 {
lab=D2}
N 1110 -610 1320 -610 {
lab=D1}
N 1440 -500 1440 -440 {
lab=#net4}
N 1440 -440 1540 -440 {
lab=#net4}
N 1150 -520 1320 -520 {
lab=D0}
N 1150 -570 1150 -520 {
lab=D0}
N 1110 -480 1320 -480 {
lab=D1}
N 1110 -570 1110 -480 {
lab=D1}
N 1070 -570 1070 -400 {
lab=D2}
N 1070 -400 1540 -400 {
lab=D2}
N 820 -520 1150 -520 {
lab=D0}
N 820 -550 1110 -550 {
lab=D1}
N 820 -580 1070 -580 {
lab=D2}
N 1400 -940 1520 -940 {
lab=#net5}
N 1600 -940 1890 -940 {
lab=J3}
N 1660 -840 1890 -840 {
lab=J2}
N 1440 -630 1890 -630 {
lab=J1}
N 1660 -420 1890 -420 {
lab=J0}
C {std_cell/and2_1.sym} 1580 -1400 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/and2_1.sym} 1380 -1300 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/and2_1.sym} 1380 -1180 0 0 {name=x3 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/and2_1.sym} 1580 -1090 0 0 {name=x4 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/or2_1.sym} 1380 -1030 0 0 {name=x5 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} 1360 -940 0 0 {name=x6 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} 1560 -940 0 0 {name=x7 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/or2_1.sym} 1600 -840 0 0 {name=x8 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/and2_1.sym} 1380 -760 0 0 {name=x9 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/or2_1.sym} 1380 -630 0 0 {name=x10 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/or2_1.sym} 1380 -500 0 0 {name=x11 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/or2_1.sym} 1600 -420 0 0 {name=x12 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/opin.sym} 1890 -420 0 0 {name=p96 lab=J0}
C {devices/opin.sym} 1890 -630 0 0 {name=p3 lab=J1}
C {devices/opin.sym} 1890 -840 0 0 {name=p4 lab=J2}
C {devices/opin.sym} 1890 -940 0 0 {name=p5 lab=J3}
C {devices/opin.sym} 1890 -1090 0 0 {name=p6 lab=J4}
C {devices/opin.sym} 1890 -1180 0 0 {name=p7 lab=J5}
C {devices/opin.sym} 1890 -1400 0 0 {name=p8 lab=J6}
C {devices/title-2.sym} 0 0 0 0 {name=l1 author="Stefan Schippers" rev=1.0 lock=false}
C {devices/ipin.sym} 820 -580 0 0 {name=p9 lab=D2}
C {devices/ipin.sym} 820 -550 0 0 {name=p1 lab=D1}
C {devices/ipin.sym} 820 -520 0 0 {name=p2 lab=D0}
