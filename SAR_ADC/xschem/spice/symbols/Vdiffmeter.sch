v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 110 -110 190 -110 {
lab=Vout}
N 30 -100 70 -100 {
lab=VP}
N 40 -50 70 -50 {
lab=VN}
N 70 -60 70 -50 {
lab=VN}
N 190 -50 190 -40 {
lab=GND}
N 110 -50 110 -40 {
lab=GND}
N 110 -40 190 -40 {
lab=GND}
N 160 -40 160 -20 {
lab=GND}
N 160 -150 160 -110 {
lab=Vout}
C {devices/res.sym} 190 -80 0 0 {name=R4
value=1k
footprint=1206
device=resistor
m=1}
C {devices/vcvs.sym} 110 -80 0 0 {name=E4 value=1}
C {devices/iopin.sym} 160 -150 0 0 {name=p1 lab=Vout}
C {devices/iopin.sym} 160 -20 0 0 {name=p2 lab=GND}
C {devices/iopin.sym} 30 -100 0 1 {name=p5 lab=VP}
C {devices/iopin.sym} 40 -50 0 1 {name=p6 lab=VN}
