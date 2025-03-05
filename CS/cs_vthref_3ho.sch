v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 100 290 220 290 {
lab=VSS}
N 160 290 160 310 {
lab=VSS}
N 160 -460 160 -440 {
lab=VDD}
N 90 -180 100 -180 {
lab=VSS}
N 90 -180 90 -140 {
lab=VSS}
N 220 -230 230 -230 {
lab=#net1}
N 230 -230 230 -190 {
lab=#net1}
N 220 -190 230 -190 {
lab=#net1}
N 100 -440 100 -420 {
lab=VDD}
N 100 -440 220 -440 {
lab=VDD}
N 220 -440 220 -420 {
lab=VDD}
N 90 -390 100 -390 {
lab=VDD}
N 90 -430 90 -390 {
lab=VDD}
N 90 -430 100 -430 {
lab=VDD}
N 220 -390 230 -390 {
lab=VDD}
N 230 -430 230 -390 {
lab=VDD}
N 220 -430 230 -430 {
lab=VDD}
N 140 -390 180 -390 {
lab=vb}
N 170 -350 220 -350 {
lab=vb}
N 170 -390 170 -350 {
lab=vb}
N 90 -140 100 -140 {
lab=VSS}
N 220 -200 220 -130 {
lab=#net1}
N 100 -230 180 -230 {
lab=#net2}
N 140 -180 220 -180 {
lab=#net1}
N 190 -100 200 -100 {
lab=VSS}
N 190 -100 190 -50 {
lab=VSS}
N 100 -360 100 -210 {
lab=#net2}
N 220 -360 220 -260 {
lab=vb}
N 190 -10 200 -10 {
lab=VSS}
N 190 -10 190 40 {
lab=VSS}
N 100 -150 100 200 {
lab=VSS}
N 220 -70 220 -40 {
lab=#net3}
N 220 20 220 50 {
lab=#net4}
N 220 -350 250 -350 {
lab=vb}
N 100 200 100 290 {
lab=VSS}
N 190 -50 190 -10 {
lab=VSS}
N 220 110 220 160 {
lab=#net5}
N 220 220 220 290 {
lab=VSS}
N 190 80 200 80 {
lab=VSS}
N 190 80 190 290 {
lab=VSS}
N 190 190 200 190 {
lab=VSS}
N 190 40 190 80 {
lab=VSS}
C {devices/iopin.sym} 160 310 0 0 {name=p1 lab=VSS}
C {devices/iopin.sym} 160 -460 0 0 {name=p2 lab=VDD}
C {devices/opin.sym} 250 -350 0 0 {name=p3 lab=vb}
C {symbols/pfet_03v3.sym} 200 -390 0 0 {name=M4
L=0.56u
W=5.6u
nf=1
m=8
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 120 -390 0 1 {name=M3
L=0.56u
W=5.6u
nf=1
m=8
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 200 -230 0 0 {name=M2
L=0.56u
W=5.6u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3_dn
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 120 -180 0 1 {name=M1
L=0.56u
W=5.6u
nf=1
m=2
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3_dn
spiceprefix=X
}
C {symbols/ppolyf_u.sym} 220 80 0 0 {name=R3
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 220 190 0 0 {name=R4
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 220 -100 0 0 {name=R1
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 220 -10 0 0 {name=R2
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
