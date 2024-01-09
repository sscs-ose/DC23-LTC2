v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 760 -170 760 -130 {
lab=VSS}
N 570 -330 680 -330 {
lab=#net1}
N 610 -290 680 -290 {
lab=#net2}
N 470 -330 490 -330 {
lab=#net1}
N 490 -330 570 -330 {
lab=#net1}
N 470 -310 610 -310 {
lab=#net2}
N 610 -310 610 -290 {
lab=#net2}
C {devices/ipin.sym} 760 -130 0 0 {name=p9 lab=VSS}
C {devices/opin.sym} 880 -330 0 0 {name=p11 lab=OUT+}
C {devices/opin.sym} 880 -290 0 0 {name=p12 lab=OUT-}
C {devices/ipin.sym} 680 -250 0 0 {name=p13 lab=Vb2}
C {devices/ipin.sym} 680 -210 0 0 {name=p14 lab=Vb1}
C {dac_current_unit.sym} 780 -270 0 0 {name=x1 nf=2}
C {devices/title.sym} 160 0 0 0 {name=l1 author="Junbeom Park"}
C {devices/ipin.sym} 290 -330 0 0 {name=p1 lab=D}
C {devices/ipin.sym} 290 -310 0 0 {name=p2 lab=CLK}
C {std_cell/dffqnq_1.sym} 380 -320 0 0 {name=x5 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
