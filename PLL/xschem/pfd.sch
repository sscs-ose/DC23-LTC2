v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {RESET is active low} 170 -275 0 0 0.4 0.4 {}
T {Conventional PFD} 1180 0 2 0 0.4 0.4 {}
N 80 -120 120 -120 {
lab=DATA}
N 80 -380 120 -380 {
lab=CLK}
N 520 -380 520 -270 {
lab=UP}
N 520 -230 520 -120 {
lab=DOWN}
N 520 -120 580 -120 {
lab=DOWN}
N 520 -380 570 -380 {
lab=UP}
N 460 -380 520 -380 {
lab=UP}
N 460 -120 520 -120 {
lab=DOWN}
N 300 -380 460 -380 {
lab=UP}
N 300 -120 460 -120 {
lab=DOWN}
N 70 -140 120 -140 {
lab=VDD}
N 70 -360 70 -140 {
lab=VDD}
N 70 -360 120 -360 {
lab=VDD}
N 120 -170 120 -160 {
lab=#net1}
N 120 -250 400 -250 {
lab=#net2}
N 120 -340 120 -250 {
lab=#net2}
N 60 -270 70 -270 {
lab=VDD}
C {devices/ipin.sym} 80 -120 0 0 {name=p1 lab=DATA}
C {devices/ipin.sym} 80 -380 0 0 {name=p2 lab=CLK}
C {devices/opin.sym} 570 -380 0 0 {name=p3 lab=UP}
C {devices/opin.sym} 580 -120 0 0 {name=p4 lab=DOWN}
C {nand2_1.sym} 460 -250 0 1 {name=x3 VDD=VDD VNW=VDD VPW=GND VSS=GND prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {dffrnq_1.sym} 210 -360 0 0 {name=x1 VDD=VDD VNW=VDD VPW=GND VSS=GND prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {dffrnq_1.sym} 210 -140 2 1 {name=x2 VDD=VDD VNW=VDD VPW=GND VSS=GND prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_1.sym} 120 -210 1 0 {name=x4 VDD=VDD VNW=VDD VPW=GND VSS=GND prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/vdd.sym} 60 -270 0 0 {name=l1 lab=VDD}
C {devices/title.sym} 160 -30 0 0 {name=l2 author="Mizuki Mori"}
