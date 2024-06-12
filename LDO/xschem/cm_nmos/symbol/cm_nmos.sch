v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -140 60 -140 120 {
lab=iout}
N -370 40 -370 120 {
lab=iref}
N -190 270 -190 300 {
lab=vss}
N -40 130 -40 190 {
lab=vout}
N -140 150 -120 150 {
lab=vss}
N -120 150 -120 190 {
lab=vss}
N -140 190 -120 190 {
lab=vss}
N -40 220 -30 220 {
lab=vss}
N -30 220 -30 260 {
lab=vss}
N -40 260 -30 260 {
lab=vss}
N -40 250 -40 270 {
lab=vss}
N -390 150 -370 150 {
lab=vss}
N -390 150 -390 200 {
lab=vss}
N -390 200 -370 200 {
lab=vss}
N -370 180 -370 270 {
lab=vss}
N -370 270 -40 270 {
lab=vss}
N -140 180 -140 270 {
lab=vss}
N -330 150 -180 150 {
lab=iref}
N -200 220 -80 220 {
lab=iref}
N -200 150 -200 220 {
lab=iref}
N -370 90 -310 90 {
lab=iref}
N -310 90 -310 150 {
lab=iref}
N -320 300 -320 310 {
lab=vss}
N -320 300 -270 300 {
lab=vss}
N -270 300 -270 390 {
lab=vss}
N -280 340 -270 340 {
lab=vss}
N -320 370 -320 390 {
lab=vss}
N -330 340 -320 340 {
lab=vss}
N -330 340 -330 380 {
lab=vss}
N -330 380 -320 380 {
lab=vss}
N -340 390 -270 390 {
lab=vss}
C {symbols/nfet_03v3.sym} -160 150 0 0 {name=M5
L=1u
W=5u
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
C {symbols/nfet_03v3.sym} -350 150 0 1 {name=M8
L=1u
W=5u
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
C {devices/ipin.sym} -370 40 0 0 {name=p3 lab=iref}
C {devices/iopin.sym} -190 300 1 0 {name=p7 lab=vss}
C {devices/opin.sym} -140 60 0 0 {name=p8 lab=iout}
C {symbols/nfet_03v3.sym} -60 220 0 0 {name=M7
L=1u
W=5u
nf=1
m=5
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/opin.sym} -40 130 0 0 {name=p1 lab=vout}
C {symbols/nfet_03v3.sym} -300 340 0 1 {name=MDummy
L=1u
W=5u
nf=1
m=5
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} -340 390 0 0 {name=p2 sig_type=std_logic lab=vss}
