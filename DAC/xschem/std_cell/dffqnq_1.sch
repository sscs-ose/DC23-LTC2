v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 90 -10 90 50 {
lab=Q}
N 90 -10 170 -10 {
lab=Q}
N -100 -10 -90 -10 {
lab=D}
N -100 10 -90 10 {
lab=CLK}
N 170 50 180 50 {
lab=nQ}
N 170 -10 180 -10 {
lab=Q}
C {./dffq_1.sym} 0 0 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {./inv_1.sym} 130 50 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/ipin.sym} -100 -10 0 0 {name=p1 lab=D}
C {devices/ipin.sym} -100 10 0 0 {name=p2 lab=CLK}
C {devices/opin.sym} 180 -10 0 0 {name=p3 lab=Q}
C {devices/opin.sym} 180 50 0 0 {name=p4 lab=nQ}
