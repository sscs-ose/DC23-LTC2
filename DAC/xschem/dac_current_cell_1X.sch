v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 640 -220 640 -180 {
lab=VSS}
N 320 -380 440 -380 {
lab=#net1}
N 440 -380 560 -380 {
lab=#net1}
N 330 -360 560 -360 {
lab=#net2}
N 560 -360 560 -340 {
lab=#net2}
N 320 -360 330 -360 {
lab=#net2}
C {devices/ipin.sym} 640 -180 0 0 {name=p9 lab=VSS}
C {devices/opin.sym} 760 -380 0 0 {name=p11 lab=OUT+}
C {devices/opin.sym} 760 -340 0 0 {name=p12 lab=OUT-}
C {devices/ipin.sym} 560 -300 0 0 {name=p13 lab=Vb2}
C {devices/ipin.sym} 560 -260 0 0 {name=p14 lab=Vb1}
C {devices/ipin.sym} 140 -380 0 0 {name=p1 lab=D}
C {devices/ipin.sym} 140 -360 0 0 {name=p2 lab=CLK}
C {dac_current_unit.sym} 660 -320 0 0 {name=x1 nf=1}
C {devices/title.sym} 160 0 0 0 {name=l1 author="Junbeom Park"}
C {std_cell/dffqnq_1.sym} 230 -370 0 0 {name=x5 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
