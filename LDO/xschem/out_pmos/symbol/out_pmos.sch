v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -100 0 -40 0 {
lab=vin}
N 0 -40 20 -40 {
lab=vdd}
N 20 -40 20 0 {
lab=vdd}
N 0 0 20 0 {
lab=vdd}
N 0 -70 0 -30 {
lab=vdd}
N 0 30 0 70 {
lab=vout}
N 150 -60 150 -30 {
lab=xxx}
N 100 -40 150 -40 {
lab=xxx}
N 100 -40 100 40 {
lab=xxx}
N 100 40 150 40 {
lab=xxx}
N 150 30 150 40 {
lab=xxx}
N 100 -0 110 -0 {
lab=xxx}
N 150 -0 160 -0 {}
N 160 -40 160 -0 {}
N 150 -40 160 -40 {}
C {devices/ipin.sym} -100 0 0 0 {name=p3 lab=vin}
C {devices/iopin.sym} 0 -70 2 0 {name=p6 lab=vdd}
C {devices/opin.sym} 0 70 0 0 {name=p8 lab=vout}
C {symbols/pfet_03v3.sym} -20 0 0 0 {name=M6
L=1u
W=100u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 130 0 0 0 {name=MD
L=1u
W=50u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} 150 -60 0 0 {name=p1 sig_type=std_logic lab=vdd}
