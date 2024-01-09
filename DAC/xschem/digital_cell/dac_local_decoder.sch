v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 265 -220 330 -220 {
lab=#net1}
N 330 -220 330 -190 {
lab=#net1}
N 110 -150 170 -150 {
lab=R_k}
N 110 -200 165 -200 {
lab=R_i}
N 110 -240 165 -240 {
lab=C_j}
N 170 -150 330 -150 {
lab=R_k}
N 330 -150 410 -150 {
lab=R_k}
N 330 -190 410 -190 {
lab=#net1}
C {devices/ipin.sym} 110 -240 0 0 {name=p5 lab=C_j}
C {devices/ipin.sym} 110 -150 0 0 {name=p15 lab=R_k}
C {devices/ipin.sym} 110 -200 0 0 {name=p9 lab=R_i}
C {devices/opin.sym} 530 -170 0 0 {name=p13 lab=OUT}
C {std_cell/and2_1.sym} 220 -220 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/or2_1.sym} 470 -170 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Junbeom Ethan Park"}
