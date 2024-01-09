v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 680 -130 680 -90 {
lab=VSS}
N 550 -270 600 -270 {
lab=#net1}
N 600 -290 600 -270 {
lab=#net1}
N 550 -250 600 -250 {
lab=#net2}
N 390 -270 550 -270 {
lab=#net1}
N 470 -250 550 -250 {
lab=#net2}
N 390 -250 470 -250 {
lab=#net2}
C {devices/ipin.sym} 680 -90 0 0 {name=p9 lab=VSS}
C {devices/opin.sym} 800 -290 0 0 {name=p11 lab=OUT+}
C {devices/opin.sym} 800 -250 0 0 {name=p12 lab=OUT-}
C {devices/ipin.sym} 600 -210 0 0 {name=p13 lab=Vb2}
C {devices/ipin.sym} 600 -170 0 0 {name=p14 lab=Vb1}
C {devices/ipin.sym} 210 -270 0 0 {name=p1 lab=D}
C {devices/ipin.sym} 210 -250 0 0 {name=p2 lab=CLK}
C {dac_current_unit.sym} 700 -230 0 0 {name=x1 Mn=@Mn}
C {devices/title.sym} 160 0 0 0 {name=l2 author="Stefan Schippers"}
C {std_cell/dlxbp_1.sym} 300 -260 0 0 {name=x2 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
