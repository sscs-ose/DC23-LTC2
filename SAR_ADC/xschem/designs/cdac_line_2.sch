v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 80 -20 240 -20 {
lab=#net1}
N 240 -20 240 90 {
lab=#net1}
N 240 90 250 90 {
lab=#net1}
N 310 150 310 180 {
lab=gnd}
N 370 90 430 90 {
lab=vin}
N 370 40 370 70 {
lab=#net2}
N 370 40 540 40 {
lab=#net2}
N 540 40 540 50 {
lab=#net2}
N 330 150 390 150 {
lab=sample}
N 390 150 390 210 {
lab=sample}
N 390 210 540 210 {
lab=sample}
N 70 -20 80 -20 {
lab=#net1}
N 50 -20 70 -20 {
lab=#net1}
N 50 -20 50 40 {
lab=#net1}
N 50 70 80 70 {
lab=gnd}
N 80 70 80 100 {
lab=gnd}
N 170 -20 170 40 {
lab=#net1}
N 170 70 210 70 {
lab=vdd}
N 210 70 210 150 {
lab=vdd}
N 210 150 210 190 {
lab=vdd}
N 210 190 290 190 {
lab=vdd}
N 290 150 290 190 {
lab=vdd}
N 80 100 170 100 {
lab=gnd}
N 170 100 170 220 {
lab=gnd}
N 170 220 270 220 {
lab=gnd}
N 270 220 270 260 {
lab=gnd}
N 270 260 590 260 {
lab=gnd}
N 590 150 590 260 {
lab=gnd}
N 580 150 590 150 {
lab=gnd}
N 80 140 130 140 {
lab=#net3}
N 130 70 130 140 {
lab=#net3}
N 10 70 10 140 {
lab=#net3}
N 10 140 80 140 {
lab=#net3}
N 0 260 60 260 {
lab=b}
N 0 210 0 220 {
lab=gnd}
N -30 210 0 210 {
lab=gnd}
N -30 210 -30 220 {
lab=gnd}
N 60 210 60 220 {
lab=vdd}
N 60 210 90 210 {
lab=vdd}
N 90 210 90 220 {
lab=vdd}
N 30 140 30 220 {
lab=#net3}
C {symbols/cap_mim_2f0fF.sym} 70 -50 0 0 {name=C1
W=CW
L=CL
model=cap_mim_2f0fF
m=1}
C {devices/iopin.sym} 290 150 0 0 {name=p3 lab=vdd}
C {devices/iopin.sym} 310 180 1 1 {name=p4 lab=gnd}
C {devices/iopin.sym} 330 150 3 0 {name=p5 lab=sample
}
C {devices/opin.sym} 70 -80 3 0 {name=p6 lab=vout}
C {bootstrap_sw.sym} 310 50 0 0 {name=x2}
C {devices/ipin.sym} 430 90 3 0 {name=p1 lab=vin
}
C {inv.sym} 540 150 3 0 {name=x4 cl=0.28u wp=0.44u wn=0.22u}
C {devices/lab_pin.sym} 500 150 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 580 150 0 1 {name=p7 sig_type=std_logic lab=gnd}
C {devices/ipin.sym} 40 260 1 1 {name=p8 lab=b}
C {devices/iopin.sym} 50 100 0 0 {name=p9 lab=vref}
C {symbols/nfet_03v3.sym} 30 70 2 1 {name=M1
L=0.28u
W=4u
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
C {symbols/pfet_03v3.sym} 150 70 0 0 {name=M2
L=0.28u
W=4u
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
C {devices/lab_pin.sym} 90 220 0 1 {name=p10 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -30 220 0 0 {name=p11 sig_type=std_logic lab=gnd}
C {symbols/nfet_03v3.sym} 0 240 3 0 {name=M3
L=0.28u
W=.22u
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
C {symbols/pfet_03v3.sym} 60 240 3 0 {name=M4
L=0.28u
W=.22u
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
