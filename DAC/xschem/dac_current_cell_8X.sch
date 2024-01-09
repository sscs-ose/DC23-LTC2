v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 640 -190 640 -150 {
lab=VSS}
N 340 -350 360 -350 {
lab=#net1}
N 380 -350 440 -350 {
lab=#net1}
N 360 -350 380 -350 {
lab=#net1}
N 440 -350 560 -350 {
lab=#net1}
N 490 -310 560 -310 {
lab=#net2}
N 490 -330 490 -310 {
lab=#net2}
N 340 -330 490 -330 {
lab=#net2}
C {devices/ipin.sym} 640 -150 0 0 {name=p9 lab=VSS}
C {devices/opin.sym} 760 -350 0 0 {name=p11 lab=OUT+}
C {devices/opin.sym} 760 -310 0 0 {name=p12 lab=OUT-}
C {devices/ipin.sym} 560 -270 0 0 {name=p13 lab=Vb2}
C {devices/ipin.sym} 560 -230 0 0 {name=p14 lab=Vb1}
C {dac_current_unit.sym} 660 -290 0 0 {name=x1 nf=8}
C {devices/title.sym} 160 0 0 0 {name=l1 author="Junbeom Park"}
C {devices/ipin.sym} 160 -350 0 0 {name=p1 lab=D}
C {devices/ipin.sym} 160 -330 0 0 {name=p2 lab=CLK}
C {std_cell/dffqnq_1.sym} 250 -340 0 0 {name=x5 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
