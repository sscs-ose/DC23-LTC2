v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 100 -960 550 -960 {
lab=#net1}
N 100 -840 550 -840 {
lab=#net2}
N 100 -710 560 -710 {
lab=#net3}
N 550 -960 1240 -960 {
lab=#net1}
N 380 -840 380 -590 {
lab=#net2}
N 420 -960 420 -590 {
lab=#net1}
N 750 -960 750 -600 {
lab=#net1}
N 1040 -840 1040 -600 {
lab=#net2}
N 1080 -960 1080 -600 {
lab=#net1}
N 1210 -840 1210 -590 {
lab=#net2}
N 1250 -960 1250 -590 {
lab=#net1}
N 550 -840 1210 -840 {
lab=#net2}
N 190 -710 190 -595 {
lab=#net3}
N 230 -840 230 -595 {
lab=#net2}
N 270 -960 270 -595 {
lab=#net1}
N 550 -710 550 -670 {
lab=#net3}
N 590 -840 590 -670 {
lab=#net2}
N 870 -710 870 -680 {
lab=#net3}
N 910 -840 910 -680 {
lab=#net2}
N 0 -960 20 -960 {
lab=D2}
N 0 -840 20 -840 {
lab=D1}
N 0 -710 20 -710 {
lab=D0}
N 750 -470 750 -210 {
lab=O3}
N 750 -480 750 -470 {
lab=O3}
N 930 -500 970 -500 {
lab=#net1}
N 750 -520 750 -480 {
lab=O3}
N 970 -960 970 -500 {
lab=#net1}
N 230 -480 230 -210 {
lab=O6}
N 400 -470 400 -200 {
lab=O5}
N 570 -550 570 -510 {
lab=#net4}
N 610 -960 610 -510 {
lab=#net1}
N 590 -390 590 -210 {
lab=O4}
N 890 -560 890 -500 {
lab=#net5}
N 910 -380 910 -210 {
lab=O2}
N 1060 -480 1060 -210 {
lab=O1}
N 1170 -710 1170 -590 {
lab=#net3}
N 560 -710 1170 -710 {
lab=#net3}
N 1240 -960 1250 -960 {
lab=#net1}
N 1210 -470 1210 -200 {
lab=O0}
N 230 -210 230 -200 {
lab=O6}
N 590 -210 590 -200 {
lab=O4}
N 750 -210 750 -200 {
lab=O3}
N 910 -210 910 -200 {
lab=O2}
N 1060 -210 1060 -200 {
lab=O1}
C {devices/title.sym} 160 -30 0 0 {name=3to7 author="Junbeom Ethan Park"}
C {devices/ipin.sym} 0 -710 0 0 {name=p16 lab=D0}
C {devices/ipin.sym} 0 -840 0 0 {name=p18 lab=D1}
C {devices/ipin.sym} 0 -960 0 0 {name=p19 lab=D2}
C {devices/opin.sym} 230 -200 1 0 {name=p29 lab=O6}
C {devices/opin.sym} 400 -200 1 0 {name=p30 lab=O5}
C {devices/opin.sym} 590 -200 1 0 {name=p31 lab=O4}
C {devices/opin.sym} 750 -200 1 0 {name=p32 lab=O3}
C {devices/opin.sym} 910 -200 1 0 {name=p33 lab=O2}
C {devices/opin.sym} 1060 -200 1 0 {name=p34 lab=O1}
C {devices/opin.sym} 1210 -200 1 0 {name=p35 lab=O0}
C {std_cells/inv_1.sym} 60 -960 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/inv_1.sym} 60 -840 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/inv_1.sym} 60 -710 0 0 {name=x3 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/nor3_1.sym} 230 -540 1 0 {name=x10 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/nor2_1.sym} 400 -530 1 0 {name=x5 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {std_cells/and2_1.sym} 570 -610 1 0 {name=x11 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/nor2_1.sym} 590 -450 1 0 {name=x12 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {std_cells/inv_1.sym} 750 -560 1 0 {name=x7 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/or2_1.sym} 890 -620 1 0 {name=x6 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/nand2_1.sym} 910 -440 1 0 {name=x8 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/nand2_1.sym} 1060 -540 1 0 {name=x9 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/nand3_1.sym} 1210 -530 1 0 {name=x4 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
