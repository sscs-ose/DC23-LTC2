v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 700 -550 700 -530 {
lab=S}
N 640 -500 660 -500 {
lab=G}
N 700 -500 710 -500 {
lab=S}
N 700 -470 700 -450 {
lab=D}
N 710 -540 710 -500 {
lab=S}
N 700 -540 710 -540 {
lab=S}
C {symbols/pfet_03v3.sym} 680 -500 0 0 {name=M1
L=0.5u
W=4.38u
nf=1
m=1984
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/iopin.sym} 700 -550 3 0 {name=p1 lab=S}
C {devices/iopin.sym} 640 -500 2 0 {name=p2 lab=G}
C {devices/iopin.sym} 700 -450 1 0 {name=p3 lab=D}
