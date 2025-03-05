v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Clock divider by 6} 1180 0 2 0 0.4 0.4 {}
N 80 -180 100 -180 {
lab=clk}
N 60 -180 80 -180 {
lab=clk}
N 920 -220 940 -220 {
lab=out}
N 260 -180 340 -180 {
lab=#net1}
N 340 -200 340 -180 {
lab=#net1}
N 340 -180 540 -180 {
lab=#net1}
N 540 -200 540 -180 {
lab=#net1}
N 540 -180 740 -180 {
lab=#net1}
N 740 -200 740 -180 {
lab=#net1}
N 520 -220 540 -220 {
lab=#net2}
N 720 -220 740 -220 {
lab=#net3}
N 920 -280 920 -220 {
lab=out}
N 670 -280 920 -280 {
lab=out}
N 340 -280 590 -280 {
lab=#net4}
N 340 -280 340 -220 {
lab=#net4}
N 280 -180 280 -140 {
lab=#net1}
C {devices/ipin.sym} 60 -180 0 0 {name=p1 lab=clk}
C {devices/opin.sym} 940 -220 0 0 {name=p3 lab=out}
C {clkbuf_3.sym} 140 -180 0 0 {name=x10 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_8.sym} 220 -180 0 0 {name=x11 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/opin.sym} 280 -140 0 0 {name=p5 lab=6f}
C {dffq_1.sym} 430 -210 0 0 {name=x1 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {dffq_1.sym} 630 -210 0 0 {name=x2 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {dffq_1.sym} 830 -210 0 0 {name=x3 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 630 -280 0 1 {name=x4 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Mizuki Mori"}
