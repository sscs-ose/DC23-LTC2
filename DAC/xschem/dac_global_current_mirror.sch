v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 290 -520 290 -490 {
lab=VDD}
N 290 -520 450 -520 {
lab=VDD}
N 290 -410 350 -410 {
lab=pGate}
N 350 -460 350 -410 {
lab=pGate}
N 280 -520 280 -460 {
lab=VDD}
N 290 -430 290 -350 {
lab=pGate}
N 280 -520 290 -520 {
lab=VDD}
N 280 -460 290 -460 {
lab=VDD}
N 370 -580 370 -520 {
lab=VDD}
N 290 -290 290 -250 {
lab=pGate}
N 150 -260 150 -210 {
lab=BGR}
N 150 -150 150 -120 {
lab=VSS}
N 110 -180 150 -180 {
lab=VSS}
N 190 -180 250 -180 {
lab=BGR}
N 150 -230 200 -230 {
lab=BGR}
N 200 -230 200 -180 {
lab=BGR}
N 290 -250 290 -210 {
lab=pGate}
N 290 -180 320 -180 {
lab=VSS}
N 290 -150 290 -120 {
lab=VSS}
N 150 -290 150 -260 {
lab=BGR}
N 290 -350 290 -290 {
lab=pGate}
N 350 -460 400 -460 {
lab=pGate}
N 330 -460 350 -460 {
lab=pGate}
N 400 -460 450 -460 {
lab=pGate}
N 150 -410 150 -290 {
lab=BGR}
C {symbols/pfet_03v3.sym} 310 -460 0 1 {name=M1
L=1u
W=1u
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
C {symbols/nfet_03v3.sym} 170 -180 0 1 {name=MN1
L=4u
W=1u
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
C {symbols/nfet_03v3.sym} 270 -180 0 0 {name=MN2
L=4u
W=1u
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
C {devices/ipin.sym} 150 -410 0 0 {name=p7 lab=BGR}
C {devices/ipin.sym} 370 -580 0 0 {name=p28 lab=VDD}
C {devices/lab_pin.sym} 320 -180 0 1 {name=p2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 290 -120 0 1 {name=p3 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 110 -180 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {devices/opin.sym} 450 -460 0 0 {name=p25 lab=pGate}
C {devices/ipin.sym} 150 -120 0 0 {name=p1 lab=VSS}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
