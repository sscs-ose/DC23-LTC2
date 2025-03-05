v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Analog switch} 1180 0 2 0 0.4 0.4 {}
N 60 -140 80 -140 {
lab=DIS}
N 160 -140 230 -140 {
lab=#net1}
N 230 -160 230 -140 {
lab=#net1}
N 60 -220 230 -220 {
lab=DIS}
N 60 -220 60 -140 {
lab=DIS}
C {devices/opin.sym} 270 -190 0 0 {name=p1 lab=OUT}
C {devices/ipin.sym} 190 -190 0 0 {name=p2 lab=IN}
C {devices/ipin.sym} 60 -140 0 0 {name=p4 lab=DIS}
C {inv_1.sym} 120 -140 0 0 {name=x1 VDD=VDD VNW=VDD VPW=GND VSS=GND prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {tmg.sym} 230 -190 0 0 {name=x2}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Mizuki Mori"}
