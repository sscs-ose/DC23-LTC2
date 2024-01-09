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
N 170 -270 210 -270 {
lab=#net3}
N 460 -250 550 -250 {
lab=#net2}
N 400 -250 460 -250 {
lab=#net2}
N 390 -250 400 -250 {
lab=#net2}
C {devices/ipin.sym} 680 -90 0 0 {name=p9 lab=VSS}
C {devices/opin.sym} 800 -290 0 0 {name=p11 lab=OUT+}
C {devices/opin.sym} 800 -250 0 0 {name=p12 lab=OUT-}
C {devices/ipin.sym} 600 -210 0 0 {name=p13 lab=Vb2}
C {devices/ipin.sym} 600 -170 0 0 {name=p14 lab=Vb1}
C {devices/ipin.sym} 210 -250 0 0 {name=p2 lab=CLK}
C {dac_current_unit.sym} 700 -230 0 0 {name=x1 finger=16}
C {devices/title.sym} 160 0 0 0 {name=l2 author="Junbeom Park"}
C {digital_cell/dac_local_decoder.sym} 70 -230 0 0 {name=x3 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
C {devices/ipin.sym} 50 -290 0 0 {name=p1 lab=Ri}
C {devices/ipin.sym} 50 -250 0 0 {name=p3 lab=Rk}
C {devices/ipin.sym} 110 -330 0 0 {name=p4 lab=Cj}
C {std_cell/dffqnq_1.sym} 300 -260 0 0 {name=x5 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
