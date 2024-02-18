v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -200 -100 -160 -100 {
lab=data_in}
N -160 -100 -160 -97.5 {
lab=data_in}
N -200 -220 -100 -220 {
lab=vdd}
N -100 -220 -100 -137.5 {
lab=vdd}
N -200 -60 -200 -40 {
lab=clock}
N -200 -40 -20 -40 {
lab=clock}
N -20 -70 -20 -40 {
lab=clock}
N -20 -70 -0 -70 {
lab=clock}
N -200 -180 -180 -180 {
lab=gnd}
N -180 -180 -180 40 {
lab=gnd}
N -180 40 35 40 {
lab=gnd}
N 35 0 35 40 {
lab=gnd}
N -100 -57.5 -100 40 {
lab=gnd}
N -160 -360 75 -360 {
lab=set}
N 75 -360 75 -340 {
lab=set}
N -100 -220 130 -220 {
lab=vdd}
N 130 -220 220 -220 {
lab=vdd}
N 220 -220 220 100 {
lab=vdd}
N 117.5 100 220 100 {
lab=vdd}
N 160 -100 240 -100 {
lab=#net1}
N 115 -280 130 -280 {
lab=vdd}
N 130 -280 130 -220 {
lab=vdd}
N -200 -360 -160 -360 {
lab=set}
N -180 160 77.5 160 {
lab=reset}
N 35 100 37.5 100 {
lab=gnd}
N 35 40 35 100 {
lab=gnd}
N -180 -280 -180 -180 {
lab=gnd}
N -180 -280 35 -280 {
lab=gnd}
N 220 -220 300 -220 {
lab=vdd}
N 300 -220 300 -140 {
lab=vdd}
N 300 -60 300 40 {
lab=gnd}
N 35 40 300 40 {
lab=gnd}
N 130 -220 130 -180 {
lab=vdd}
C {dffrsnq_1.sym} 0 0 0 0 {name=FF1}
C {inv.sym} -100 -97.5 0 0 {name=x1 cl=0.28u wp=0.44u wn=0.22u}
C {inv.sym} 75 -280 1 0 {name=x2 cl=0.28u wp=0.44u wn=0.22u}
C {inv.sym} 77.5 100 1 1 {name=x3 cl=0.28u wp=0.44u wn=0.22u}
C {devices/ipin.sym} -200 -100 0 0 {name=p1 lab=data_in}
C {devices/ipin.sym} -200 -60 0 0 {name=p2 lab=clock}
C {devices/ipin.sym} -200 -220 0 0 {name=p3 lab=vdd}
C {devices/ipin.sym} -200 -180 0 0 {name=p4 lab=gnd}
C {devices/opin.sym} 400 -100 0 0 {name=p5 lab=data_out}
C {devices/ipin.sym} -180 160 0 0 {name=p6 lab=reset}
C {devices/ipin.sym} -200 -360 0 0 {name=p7 lab=set}
C {inv.sym} 300 -100 0 0 {name=x4 cl=0.28u wp=0.44u wn=0.22u}
