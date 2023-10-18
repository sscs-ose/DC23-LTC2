v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 120 -320 120 -280 {
lab=#net1}
N 120 -220 120 -180 {
lab=Y}
N 120 -120 120 -80 {
lab=#net2}
N 80 -250 80 -150 {
lab=A}
N 60 -200 80 -200 {
lab=A}
N 120 -250 140 -250 {
lab=VDD}
N 140 -350 140 -250 {
lab=VDD}
N 120 -350 140 -350 {
lab=VDD}
N 120 -150 140 -150 {
lab=GND}
N 140 -150 140 -50 {
lab=GND}
N 120 -50 140 -50 {
lab=GND}
N 140 -50 140 -20 {
lab=GND}
N 120 -20 140 -20 {
lab=GND}
N 140 -380 140 -350 {
lab=VDD}
N 120 -380 140 -380 {
lab=VDD}
N 120 -200 140 -200 {
lab=Y}
C {symbols/pfet_06v0.sym} 100 -350 0 0 {name=M1
L=0.50u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/pfet_06v0.sym} 100 -250 0 0 {name=M2
L=0.50u
W=8u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 100 -150 0 0 {name=M3
L=0.60u
W=3.6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {symbols/nfet_06v0.sym} 100 -50 0 0 {name=M4
L=0.60u
W=0.9u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X
}
C {devices/vdd.sym} 120 -380 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 120 -20 0 0 {name=l2 lab=GND}
C {devices/opin.sym} 140 -200 0 0 {name=p1 lab=Y}
C {devices/ipin.sym} 60 -200 0 0 {name=p2 lab=A}
C {devices/ipin.sym} 80 -350 0 0 {name=p3 lab=VBP}
C {devices/ipin.sym} 80 -50 0 0 {name=p4 lab=VBN}
