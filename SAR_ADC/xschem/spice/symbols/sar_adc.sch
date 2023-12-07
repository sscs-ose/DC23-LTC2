v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -40 160 -10 160 {
lab=#net1}
N -20 140 -10 140 {
lab=#net2}
N -40 180 -10 180 {
lab=#net3}
N -120 220 -120 240 {
lab=#net3}
N -120 240 -40 240 {
lab=#net3}
N -40 180 -40 240 {
lab=#net3}
N -20 140 -20 260 {
lab=#net2}
N -100 260 -20 260 {
lab=#net2}
N -100 220 -100 260 {
lab=#net2}
N -40 -160 -10 -160 {
lab=#net4}
N -20 -140 -10 -140 {
lab=#net5}
N -40 -180 -10 -180 {
lab=#net6}
N -40 -240 -40 -180 {
lab=#net6}
N -120 -240 -40 -240 {
lab=#net6}
N -120 -240 -120 -220 {
lab=#net6}
N -20 -260 -20 -140 {
lab=#net5}
N -100 -260 -20 -260 {
lab=#net5}
N -100 -260 -100 -220 {
lab=#net5}
C {cdac.sym} 130 160 1 0 {name=x1 cu=5u}
C {cdac.sym} 130 -160 1 1 {name=x2 cu=5u}
C {sar_logic.sym} 780 110 0 1 {}
C {bootstrap_sw.sym} -100 -120 2 1 {name=x3}
C {bootstrap_sw.sym} -100 120 0 0 {name=x4}
C {devices/ipin.sym} -160 160 0 0 {name=p1 lab=vinn}
C {devices/ipin.sym} -160 -160 0 0 {name=p2 lab=vinp}
