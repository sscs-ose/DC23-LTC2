v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 80 -20 240 -20 {
lab=#net1}
N 310 150 310 180 {
lab=gnd}
N 370 40 370 70 {
lab=#net2}
N 370 40 540 40 {
lab=#net2}
N 540 40 540 50 {
lab=#net2}
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
lab=#net3}
N -230 60 -230 130 {
lab=#net3}
N -350 60 -350 130 {
lab=#net3}
N -350 130 -280 130 {
lab=#net3}
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
N -310 30 -190 30 {
lab=#net4}
N -190 30 -40 30 {
lab=#net4}
N -40 30 -40 120 {
lab=#net4}
N 60 110 60 120 {
lab=#net1}
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
N 120 250 270 250 {
lab=gnd}
N -330 270 -330 300 {
lab=#net5}
N 60 130 180 110 {
lab=#net4}
N -50 130 60 130 {
lab=#net4}
N -50 130 -40 120 {
lab=#net4}
N -330 220 -330 270 {
lab=#net5}
N -310 90 -290 90 {
lab=gnd}
N -290 60 -290 90 {
lab=gnd}
N -360 230 -300 230 {
lab=#net5}
N -360 180 -360 190 {
lab=gnd}
N -390 180 -360 180 {
lab=gnd}
N -390 180 -390 190 {
lab=gnd}
N -300 180 -300 190 {
lab=vdd}
N -300 180 -270 180 {
lab=vdd}
N -270 180 -270 190 {
lab=vdd}
N -330 230 -330 240 {
lab=#net5}
N -330 160 -330 190 {
lab=#net3}
N -330 130 -330 160 {
lab=#net3}
N 60 -20 60 10 {
lab=#net1}
N 60 -20 70 -20 {
lab=#net1}
N 240 -20 250 -20 {
lab=#net1}
N 370 90 390 90 {
lab=#net1}
N 390 -20 390 90 {
lab=#net1}
N 250 -20 390 -20 {
lab=#net1}
N 60 10 60 110 {
lab=#net1}
N 530 0 530 40 {
lab=#net2}
N 140 170 190 170 {
lab=#net2}
N 190 90 190 170 {
lab=#net2}
N 190 90 210 90 {
lab=#net2}
N 210 40 210 90 {
lab=#net2}
N 210 40 370 40 {
lab=#net2}
C {symbols/cap_mim_2f0fF.sym} 70 -50 0 0 {name=C1
W=CW
L=CL
model=cap_mim_2f0fF
m=1}
C {devices/iopin.sym} 240 200 0 0 {name=p3 lab=vdd}
C {devices/iopin.sym} 310 180 3 1 {name=p4 lab=gnd}
C {devices/iopin.sym} 530 -320 3 0 {name=p5 lab=sample
}
C {devices/opin.sym} 70 -80 3 0 {name=p6 lab=vout}
C {bootstrap_sw.sym} 310 50 0 0 {name=x2}
C {devices/ipin.sym} 250 90 3 0 {name=p1 lab=vin
}
C {inv.sym} 540 110 1 0 {name=x4 cl=0.28u wp=0.44u wn=0.22u wx=.22u}
C {devices/lab_pin.sym} 580 110 0 1 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 590 200 0 1 {name=p7 sig_type=std_logic lab=gnd}
C {devices/ipin.sym} -330 350 1 1 {name=p8 lab=b}
C {devices/iopin.sym} -190 90 3 1 {name=p9 lab=vref}
C {symbols/nfet_03v3.sym} -330 60 0 0 {name=M1
L=0.28u
W=12u
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
C {symbols/pfet_03v3.sym} -210 60 2 1 {name=M2
L=0.28u
W=12u
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
C {devices/lab_pin.sym} 180 90 3 1 {name=p15 sig_type=std_logic lab=nsample}
C {devices/lab_pin.sym} -150 180 0 1 {name=p16 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -280 60 0 1 {name=p11 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -270 190 0 1 {name=p10 sig_type=std_logic lab=vdd
W=6u}
C {devices/lab_pin.sym} -390 190 0 0 {name=p18 sig_type=std_logic lab=gnd
W=6u}
C {symbols/nfet_03v3.sym} -360 210 3 0 {name=M3
L=0.28u
W=1u
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
C {symbols/pfet_03v3.sym} -300 210 3 0 {name=M4
L=0.28u
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
C {inv.sym} 530 -260 1 0 {name=x3 cl=0.28u wp=0.44u wn=0.22u wx=.22u}
C {devices/lab_pin.sym} 570 -260 0 1 {name=p19 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 490 -260 0 0 {name=p20 sig_type=std_logic lab=gnd}
C {inv.sym} 530 -100 1 0 {name=x5 cl=0.28u wp=0.44u wn=0.22u wx=2u}
C {devices/lab_pin.sym} 570 -100 0 1 {name=p21 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 490 -100 0 0 {name=p22 sig_type=std_logic lab=gnd}
