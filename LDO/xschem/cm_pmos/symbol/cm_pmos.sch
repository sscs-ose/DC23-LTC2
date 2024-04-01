v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -80 -150 20 -150 {
lab=vout1}
N -120 -120 -120 -30 {
lab=vout1}
N -120 -250 60 -250 {
lab=vdd}
N -120 -250 -120 -180 {
lab=vdd}
N 20 -150 80 -150 {
lab=vout1}
N 120 -250 120 -180 {
lab=vdd}
N 60 -250 120 -250 {
lab=vdd}
N 120 -120 120 -30 {
lab=vout2}
N -150 -150 -120 -150 {
lab=vdd}
N -150 -250 -150 -150 {
lab=vdd}
N -150 -250 -120 -250 {
lab=vdd}
N 120 -150 140 -150 {
lab=vdd}
N 140 -250 140 -150 {
lab=vdd}
N -0 -270 0 -250 {
lab=vdd}
N -50 -150 -50 -100 {
lab=vout1}
N -120 -100 -50 -100 {
lab=vout1}
N 120 -250 140 -250 {
lab=vdd}
N 300 -140 320 -140 {
lab=#net1}
N 300 -205 300 -170 {}
N 300 -185 300 -170 {}
N 250 -185 300 -185 {}
N 250 -185 250 -100 {}
N 250 -100 300 -100 {}
N 300 -110 300 -100 {}
N 250 -140 260 -140 {}
N 320 -180 320 -140 {}
N 300 -180 320 -180 {}
C {devices/iopin.sym} 0 -270 3 0 {name=p6 lab=vdd}
C {devices/opin.sym} 120 -30 0 0 {name=p8 lab=vout2}
C {symbols/pfet_03v3.sym} -100 -150 0 1 {name=M3
L=1u
W=10u
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
C {symbols/pfet_03v3.sym} 100 -150 0 0 {name=M4
L=1u
W=10u
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
C {devices/opin.sym} -120 -30 0 0 {name=p1 lab=vout1}
C {symbols/pfet_03v3.sym} 280 -140 0 0 {name=MD
L=1u
W=10u
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
C {devices/lab_pin.sym} 300 -205 0 0 {name=p2 sig_type=std_logic lab=vdd}
