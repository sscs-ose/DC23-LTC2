v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 700 -200 700 -160 {
lab=VSS}
N 410 -360 430 -360 {
lab=#net1}
N 460 -360 520 -360 {
lab=#net1}
N 430 -360 460 -360 {
lab=#net1}
N 520 -360 620 -360 {
lab=#net1}
N 410 -340 620 -340 {
lab=#net2}
N 620 -340 620 -320 {
lab=#net2}
C {devices/ipin.sym} 700 -160 0 0 {name=p9 lab=VSS}
C {devices/opin.sym} 820 -360 0 0 {name=p11 lab=OUT+}
C {devices/opin.sym} 820 -320 0 0 {name=p12 lab=OUT-}
C {devices/ipin.sym} 620 -280 0 0 {name=p13 lab=Vb2}
C {devices/ipin.sym} 620 -240 0 0 {name=p14 lab=Vb1}
C {dac_current_unit.sym} 720 -300 0 0 {name=x1 nf=4}
C {devices/title.sym} 160 0 0 0 {name=l1 author="Junbeom Park"}
C {devices/ipin.sym} 230 -360 0 0 {name=p1 lab=D}
C {devices/ipin.sym} 230 -340 0 0 {name=p2 lab=CLK}
C {std_cell/dffqnq_1.sym} 320 -350 0 0 {name=x5 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
