v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -140 -80 -140 -30 {
lab=A}
N -140 30 -140 70 {
lab=C}
N -140 70 180 70 {
lab=C}
N 180 30 180 70 {
lab=C}
N -140 0 180 0 {
lab=GND}
N 180 -80 180 -30 {
lab=B}
N -30 70 -30 90 {
lab=C}
N -10 -20 -10 -0 {
lab=GND}
C {devices/ipin.sym} -180 0 0 0 {name=p10 lab=GA}
C {devices/ipin.sym} 220 0 0 1 {name=p11 lab=GB}
C {symbols/nfet_03v3.sym} -160 0 0 0 {name=M1
L=0.3u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 200 0 0 1 {name=M2
L=0.3u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/ipin.sym} -140 -80 0 0 {name=p1 lab=A}
C {devices/ipin.sym} 180 -80 0 0 {name=p2 lab=B}
C {devices/ipin.sym} -30 90 0 0 {name=p3 lab=C}
C {devices/ipin.sym} -10 -20 0 0 {name=p4 lab=GND}
