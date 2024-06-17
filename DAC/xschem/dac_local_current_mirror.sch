v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 -480 170 -450 {
lab=VDD}
N 180 -480 180 -420 {
lab=VDD}
N 170 -420 180 -420 {
lab=VDD}
N 130 -480 180 -480 {
lab=VDD}
N 170 -390 170 -370 {
lab=Vb2}
N 170 -210 170 -170 {
lab=Vb1}
N 170 -180 230 -180 {
lab=Vb1}
N 230 -180 230 -140 {
lab=Vb1}
N 170 -110 170 -80 {
lab=VSS}
N 140 -240 170 -240 {
lab=VSS}
N 140 -140 170 -140 {
lab=VSS}
N 170 -300 170 -270 {
lab=Vb2}
N 170 -280 230 -280 {
lab=Vb2}
N 230 -280 230 -240 {
lab=Vb2}
N 110 -420 130 -420 {
lab=pGate}
N 110 -480 130 -480 {
lab=VDD}
N 170 -370 170 -300 {
lab=Vb2}
N 130 -420 140 -410 {
lab=pGate}
N 140 -410 340 -410 {
lab=pGate}
N 340 -410 370 -410 {
lab=pGate}
N 180 -480 420 -480 {
lab=VDD}
N 220 -240 280 -240 {
lab=Vb2}
N 210 -240 220 -240 {
lab=Vb2}
N 210 -140 280 -140 {
lab=Vb1}
C {symbols/pfet_03v3.sym} 150 -420 0 0 {name=M2
L=1u
W=5u
nf=5
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
C {symbols/nfet_03v3.sym} 190 -240 0 1 {name=M5
L=1u
W=4u
nf=4
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
C {symbols/nfet_03v3.sym} 190 -140 0 1 {name=M6
L=1u
W=4u
nf=4
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
C {devices/ipin.sym} 170 -80 0 0 {name=p33 lab=VSS}
C {devices/lab_pin.sym} 140 -240 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 140 -140 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {devices/opin.sym} 280 -240 0 0 {name=p6 lab=Vb2}
C {devices/opin.sym} 280 -140 0 0 {name=p8 lab=Vb1}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
C {devices/ipin.sym} 110 -480 0 0 {name=p28 lab=VDD}
C {devices/ipin.sym} 110 -420 0 0 {name=p2 lab=pGate}
