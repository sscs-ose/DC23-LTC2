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
N 310 150 310 180 {
lab=gnd}
N 370 40 370 70 {
lab=sample}
N 370 40 540 40 {
lab=sample}
N 540 40 540 50 {
lab=sample}
N 330 150 390 150 {
lab=nsample}
N 390 150 390 210 {
lab=nsample}
N 390 210 540 210 {
lab=nsample}
N 70 -20 80 -20 {
lab=#net1}
N -310 60 -280 60 {
lab=gnd}
N -280 60 -280 90 {
lab=gnd}
N -190 60 -150 60 {
lab=vdd}
N -150 60 -150 140 {
lab=vdd}
N -150 140 -150 180 {
lab=vdd}
N 210 190 290 190 {
lab=vdd}
N 290 150 290 190 {
lab=vdd}
N 270 260 590 260 {
lab=gnd}
N 590 150 590 260 {
lab=gnd}
N 580 150 590 150 {
lab=gnd}
N -280 130 -230 130 {
lab=#net2}
N -230 60 -230 130 {
lab=#net2}
N -350 60 -350 130 {
lab=#net2}
N -350 130 -280 130 {
lab=#net2}
N 500 110 580 150 {
lab=gnd}
N -360 340 -300 340 {
lab=b}
N -360 290 -360 300 {
lab=gnd}
N -390 290 -360 290 {
lab=gnd}
N -390 290 -390 300 {
lab=gnd}
N -300 290 -300 300 {
lab=vdd}
N -300 290 -270 290 {
lab=vdd}
N -270 290 -270 300 {
lab=vdd}
N -330 340 -330 350 {
lab=b}
N 240 190 240 200 {
lab=vdd}
N 170 110 240 110 {
lab=#net1}
N 240 90 240 110 {
lab=#net1}
N -310 30 -190 30 {
lab=#net3}
N -190 30 -40 30 {
lab=#net3}
N -40 30 -40 120 {
lab=#net3}
N -40 120 60 120 {
lab=#net3}
N 60 110 60 120 {
lab=#net3}
N 100 130 100 170 {
lab=vdd}
N 100 130 220 130 {
lab=vdd}
N 220 130 220 190 {
lab=vdd}
N 270 250 270 260 {
lab=gnd}
N 120 170 120 250 {
lab=gnd}
N -310 90 -310 110 {
lab=gnd}
N -310 110 -300 110 {
lab=gnd}
N -310 90 -280 90 {
lab=gnd}
N 120 250 270 250 {
lab=gnd}
N -360 260 -300 260 {
lab=#net4}
N -360 210 -360 220 {
lab=gnd}
N -390 210 -360 210 {
lab=gnd}
N -390 210 -390 220 {
lab=gnd}
N -300 210 -300 220 {
lab=vdd}
N -300 210 -270 210 {
lab=vdd}
N -270 210 -270 220 {
lab=vdd}
N -330 260 -330 270 {
lab=#net4}
N -330 270 -330 300 {
lab=#net4}
N -330 130 -330 220 {
lab=#net2}
N 290 70 370 90 {
lab=#net1}
N 240 70 290 70 {
lab=#net1}
C {symbols/cap_mim_2f0fF.sym} 70 -50 0 0 {name=C1
W=CW
L=CL
model=cap_mim_2f0fF
m=1}
C {devices/iopin.sym} 240 200 0 0 {name=p3 lab=vdd}
C {devices/iopin.sym} 310 180 3 1 {name=p4 lab=gnd}
C {devices/iopin.sym} 440 40 3 0 {name=p5 lab=sample
}
C {devices/opin.sym} 70 -80 3 0 {name=p6 lab=vout}
C {bootstrap_sw.sym} 310 50 0 0 {name=x2}
C {devices/ipin.sym} 250 90 3 0 {name=p1 lab=vin
}
C {inv.sym} 540 110 1 0 {name=x4 cl=0.28u wp=0.44u wn=0.22u}
C {devices/lab_pin.sym} 580 110 0 1 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 590 200 0 1 {name=p7 sig_type=std_logic lab=gnd}
C {devices/ipin.sym} -330 350 1 1 {name=p8 lab=b}
C {devices/iopin.sym} -190 90 3 1 {name=p9 lab=vref}
C {symbols/nfet_03v3.sym} -330 60 2 1 {name=M1
L=0.28u
W=7u
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
C {symbols/pfet_03v3.sym} -210 60 0 0 {name=M2
L=0.28u
W=7u
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
C {devices/lab_pin.sym} -270 300 0 1 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -390 300 0 0 {name=p13 sig_type=std_logic lab=gnd}
C {symbols/nfet_03v3.sym} -360 320 3 0 {name=M5
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
C {symbols/pfet_03v3.sym} -300 320 3 0 {name=M6
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
C {bootstrap_sw.sym} 120 70 0 0 {name=x1}
C {devices/lab_pin.sym} 390 180 0 1 {name=p14 sig_type=std_logic lab=nsample}
C {devices/lab_pin.sym} 140 170 1 1 {name=p17 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} 180 90 3 1 {name=p15 sig_type=std_logic lab=nsample}
C {devices/lab_pin.sym} -150 180 0 1 {name=p16 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -300 110 0 1 {name=p10 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -270 220 0 1 {name=p11 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -390 220 0 0 {name=p18 sig_type=std_logic lab=gnd}
C {symbols/nfet_03v3.sym} -360 240 3 0 {name=M3
L=0.28u
W=2u
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
C {symbols/pfet_03v3.sym} -300 240 3 0 {name=M4
L=0.28u
W=2u
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
