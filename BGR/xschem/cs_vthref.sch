v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 120 -40 240 -40 {
lab=vss}
N 180 -40 180 -20 {
lab=vss}
N 180 -690 180 -670 {
lab=vdd}
N 110 -410 120 -410 {
lab=vss}
N 110 -410 110 -370 {
lab=vss}
N 120 -590 120 -570 {
lab=#net1}
N 240 -220 240 -200 {
lab=#net2}
N 120 -670 120 -650 {
lab=vdd}
N 120 -670 240 -670 {
lab=vdd}
N 240 -670 240 -650 {
lab=vdd}
N 110 -620 120 -620 {
lab=vdd}
N 110 -660 110 -620 {
lab=vdd}
N 110 -660 120 -660 {
lab=vdd}
N 240 -620 250 -620 {
lab=vdd}
N 250 -660 250 -620 {
lab=vdd}
N 240 -660 250 -660 {
lab=vdd}
N 160 -620 200 -620 {
lab=vb}
N 240 -590 240 -570 {
lab=vb}
N 190 -580 240 -580 {
lab=vb}
N 190 -620 190 -580 {
lab=vb}
N 110 -370 120 -370 {
lab=vss}
N 240 -430 240 -360 {
lab=#net3}
N 120 -460 200 -460 {
lab=#net4}
N 160 -410 240 -410 {
lab=#net3}
N 240 -510 240 -490 {
lab=#net5}
N 120 -510 120 -440 {
lab=#net4}
N 210 -250 220 -250 {
lab=vss}
N 240 -300 240 -280 {
lab=#net6}
N 210 -330 220 -330 {
lab=vss}
N 210 -330 210 -250 {
lab=vss}
N 240 -140 240 -120 {
lab=#net7}
N 240 -60 240 -40 {
lab=vss}
N 120 -380 120 -40 {
lab=vss}
N 210 -170 220 -170 {
lab=vss}
N 210 -90 220 -90 {
lab=vss}
N 210 -250 210 -40 {
lab=vss}
N 240 -460 250 -460 {
lab=#net3}
N 250 -460 250 -420 {
lab=#net3}
N 240 -420 250 -420 {
lab=#net3}
N 240 -580 340 -580 {
lab=vb}
N 240 -570 240 -510 {}
N 120 -570 120 -510 {}
C {symbols/nfet_03v3.sym} 140 -410 0 1 {name=M1
L=0.56u
W=5.6u
nf=2
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
C {symbols/nfet_03v3.sym} 220 -460 0 0 {name=M2
L=0.56u
W=5.6u
nf=2
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
C {symbols/pfet_03v3.sym} 140 -620 0 1 {name=M3
L=0.56u
W=5.6u
nf=8
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
C {symbols/pfet_03v3.sym} 220 -620 0 0 {name=M4
L=0.56u
W=5.6u
nf=8
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
C {symbols/ppolyf_u.sym} 240 -250 0 0 {name=R2
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 240 -330 0 0 {name=R1
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 240 -170 0 0 {name=R3
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 240 -90 0 0 {name=R4
W=0.8e-6
L=22e-6
model=ppolyf_u
spiceprefix=X
m=1}
C {devices/iopin.sym} 180 -690 0 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 180 -20 0 0 {name=p2 lab=vss
}
C {devices/opin.sym} 340 -580 0 0 {name=p3 lab=vb
}
