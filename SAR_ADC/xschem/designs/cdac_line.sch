v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 80 30 240 {
lab=vdd}
N 110 80 110 240 {
lab=gnd}
N 70 300 70 340 {
lab=vin}
N 10 -80 70 -80 {
lab=vout}
N -110 -20 10 -20 {
lab=gnd}
N -110 -20 -110 200 {
lab=gnd}
N -110 200 110 200 {
lab=gnd}
C {symbols/cap_mim_2f0fF.sym} 70 -50 0 0 {name=C1
W=CW
L=CL
model=cap_mim_2f0fF
m=1}
C {devices/ipin.sym} 30 160 0 0 {name=p3 lab=vdd}
C {devices/ipin.sym} 110 160 2 0 {name=p4 lab=gnd}
C {devices/ipin.sym} 70 340 3 0 {name=p5 lab=vin
}
C {devices/opin.sym} 70 -80 3 0 {name=p6 lab=vout}
C {inv.sym} 70 80 3 0 {name=x3 cl=0.28u wp=0.44u wn=0.22u}
C {inv.sym} 70 240 3 0 {name=x1 cl=0.28u wp=0.44u wn=0.22u}
C {devices/res.sym} 10 -50 0 0 {name=R1
value=1T
footprint=1206
device=resistor
m=1}
