v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 150 -260 150 -100 {
lab=B}
N 90 -260 90 -100 {
lab=A}
N 60 -180 90 -180 {
lab=A}
N 150 -180 180 -180 {
lab=B}
N 120 -260 120 -240 {
lab=VDD}
N 120 -120 120 -100 {
lab=GND}
N 120 -320 120 -300 {
lab=PG}
N 120 -60 120 -40 {
lab=NG}
C {devices/opin.sym} 180 -180 0 0 {name=p1 lab=B}
C {devices/ipin.sym} 60 -180 0 0 {name=p2 lab=A}
C {devices/gnd.sym} 120 -120 2 0 {name=l1 lab=GND}
C {devices/vdd.sym} 120 -240 2 0 {name=l2 lab=VDD}
C {devices/ipin.sym} 120 -320 0 0 {name=p3 lab=PG}
C {devices/ipin.sym} 120 -40 0 0 {name=p4 lab=NG}
C {symbols/pfet_06v0.sym} 120 -280 3 1 {name=M3
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
C {symbols/nfet_06v0.sym} 120 -80 3 0 {name=M4
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
