v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 550 -520 550 -490 {
lab=VDD}
N 550 -520 710 -520 {
lab=VDD}
N 770 -520 770 -490 {
lab=VDD}
N 550 -410 610 -410 {
lab=#net1}
N 610 -460 610 -410 {
lab=#net1}
N 540 -520 540 -460 {
lab=VDD}
N 780 -520 780 -460 {
lab=VDD}
N 550 -430 550 -350 {
lab=#net1}
N 540 -520 550 -520 {
lab=VDD}
N 540 -460 550 -460 {
lab=VDD}
N 630 -580 630 -520 {
lab=VDD}
N 550 -290 550 -250 {
lab=#net1}
N 410 -260 410 -210 {
lab=BGR}
N 410 -150 410 -120 {
lab=VSS}
N 370 -180 410 -180 {
lab=VSS}
N 450 -180 510 -180 {
lab=BGR}
N 410 -230 460 -230 {
lab=BGR}
N 460 -230 460 -180 {
lab=BGR}
N 550 -250 550 -210 {
lab=#net1}
N 550 -180 580 -180 {
lab=VSS}
N 550 -150 550 -120 {
lab=VSS}
N 410 -290 410 -260 {
lab=BGR}
N 550 -350 550 -290 {
lab=#net1}
N 610 -460 660 -460 {
lab=#net1}
N 770 -460 780 -460 {
lab=VDD}
N 590 -460 610 -460 {
lab=#net1}
N 730 -520 780 -520 {
lab=VDD}
N 660 -460 710 -460 {
lab=#net1}
N 770 -430 770 -410 {
lab=Vb2}
N 770 -250 770 -210 {
lab=Vb1}
N 770 -220 830 -220 {
lab=Vb1}
N 830 -220 830 -180 {
lab=Vb1}
N 770 -150 770 -120 {
lab=VSS}
N 740 -280 770 -280 {
lab=VSS}
N 740 -180 770 -180 {
lab=VSS}
N 770 -340 770 -310 {
lab=Vb2}
N 770 -320 830 -320 {
lab=Vb2}
N 830 -320 830 -280 {
lab=Vb2}
N 710 -460 730 -460 {
lab=#net1}
N 710 -520 730 -520 {
lab=VDD}
N 810 -280 910 -280 {
lab=Vb2}
N 810 -180 910 -180 {
lab=Vb1}
N 770 -410 770 -340 {
lab=Vb2}
C {symbols/pfet_03v3.sym} 570 -460 0 1 {name=M1
L=1u
W=0.5u
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
C {symbols/pfet_03v3.sym} 750 -460 0 0 {name=M2
L=1u
W=2.5u
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
C {symbols/nfet_03v3.sym} 430 -180 0 1 {name=MN1
L=1u
W=0.5u
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
C {symbols/nfet_03v3.sym} 530 -180 0 0 {name=MN2
L=1u
W=0.5u
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
C {devices/ipin.sym} 410 -290 0 0 {name=p7 lab=BGR}
C {devices/ipin.sym} 630 -580 0 0 {name=p28 lab=VDD}
C {symbols/nfet_03v3.sym} 790 -280 0 1 {name=M5
L=0.5u
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
C {symbols/nfet_03v3.sym} 790 -180 0 1 {name=M6
L=1u
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
C {devices/ipin.sym} 770 -120 0 0 {name=p33 lab=VSS}
C {devices/lab_pin.sym} 740 -280 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 740 -180 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 580 -180 0 1 {name=p2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 550 -120 0 1 {name=p3 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 410 -120 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 370 -180 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {devices/opin.sym} 910 -280 0 0 {name=p6 lab=Vb2}
C {devices/opin.sym} 910 -180 0 0 {name=p8 lab=Vb1}
C {devices/title.sym} 160 0 0 0 {name=l1 author="Junbeom Park"}
