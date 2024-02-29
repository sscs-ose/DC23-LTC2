v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 20 -10 20 30 {
lab=A}
N 20 -20 20 -10 {
lab=A}
N 20 30 20 40 {
lab=A}
N -140 40 20 40 {
lab=A}
N -140 10 -140 40 {
lab=A}
N -140 -90 -140 -50 {
lab=avdd}
N -140 -90 180 -90 {
lab=avdd}
N 180 -90 180 -50 {
lab=avdd}
N -220 -20 -140 -20 {
lab=avdd}
N -220 -90 -220 -20 {
lab=avdd}
N -220 -90 -140 -90 {
lab=avdd}
N 180 -20 260 -20 {
lab=avdd}
N 260 -90 260 -20 {
lab=avdd}
N 180 -90 260 -90 {
lab=avdd}
N 180 10 180 40 {
lab=B}
N 0 -20 20 -20 {
lab=A}
N 20 -20 140 -20 {
lab=A}
N -100 -20 -0 -20 {
lab=A}
C {devices/iopin.sym} 10 -90 0 0 {name=p8 lab=avdd}
C {symbols/pfet_03v3.sym} -120 -20 0 1 {name=M3
L=0.8u
W=2.25u
nf=1
m=4
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 160 -20 0 0 {name=M4
L=0.8u
W=2.25u
nf=1
m=4
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/iopin.sym} -140 40 0 1 {name=p1 lab=A}
C {devices/iopin.sym} 180 40 0 0 {name=p2 lab=B
}
