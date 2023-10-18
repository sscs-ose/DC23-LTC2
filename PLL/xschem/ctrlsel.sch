v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Vctrl selector} 1180 0 2 0 0.4 0.4 {}
N 360 -250 380 -250 {
lab=OUT}
N 310 -270 310 -230 {
lab=FREERUN}
N 140 -250 160 -250 {
lab=#net1}
N 240 -250 310 -250 {
lab=FREERUN}
N 350 -300 360 -300 {
lab=OUT}
N 360 -300 360 -200 {
lab=OUT}
N 355 -200 360 -200 {
lab=OUT}
N 350 -200 355 -200 {
lab=OUT}
N 310 -170 310 -150 {
lab=#net1}
N 140 -150 310 -150 {
lab=#net1}
N 310 -350 310 -330 {
lab=#net1}
N 140 -350 310 -350 {
lab=#net1}
N 140 -350 140 -250 {
lab=#net1}
N 140 -250 140 -150 {
lab=#net1}
N 260 -200 270 -200 {
lab=LF}
N 260 -250 260 -230 {
lab=FREERUN}
N 260 -300 270 -300 {
lab=EX}
C {devices/opin.sym} 380 -250 0 0 {name=p1 lab=OUT}
C {devices/ipin.sym} 260 -300 0 0 {name=p2 lab=EX}
C {devices/ipin.sym} 260 -200 0 0 {name=p3 lab=LF}
C {inv_1.sym} 200 -250 0 1 {name=x1 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {tmg.sym} 310 -300 0 0 {name=x2}
C {tmg.sym} 310 -200 0 0 {name=x3}
C {devices/ipin.sym} 260 -230 0 0 {name=p4 lab=FREERUN}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Mizuki Mori"}
