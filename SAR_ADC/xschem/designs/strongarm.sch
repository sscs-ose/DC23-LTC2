v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1150 -40 1150 -0 {
lab=GND}
N 1130 0 1150 -0 {
lab=GND}
N 430 -50 430 -0 {
lab=GND}
N 630 -50 630 0 {
lab=GND}
N 1130 -70 1150 -70 {
lab=GND}
N 1130 -70 1130 0 {
lab=GND}
N 430 -80 480 -80 {
lab=GND}
N 480 -80 480 -0 {
lab=GND}
N 390 -80 390 50 {
lab=#net1}
N 690 50 1190 50 {
lab=#net1}
N 1190 -70 1190 50 {
lab=#net1}
N 920 -50 920 -0 {
lab=GND}
N 610 -80 630 -80 {
lab=GND}
N 610 -80 610 -0 {
lab=GND}
N 920 -80 940 -80 {
lab=GND}
N 940 -80 940 -0 {
lab=GND}
N 920 -120 920 -110 {
lab=Vout2}
N 920 -290 920 -230 {
lab=#net2}
N 860 -350 930 -350 {
lab=V}
N 630 -120 630 -110 {
lab=Vout1}
N 630 -290 630 -240 {
lab=#net3}
N 620 -320 630 -320 {
lab=V}
N 620 -350 620 -320 {
lab=V}
N 920 -320 930 -320 {
lab=V}
N 930 -350 930 -320 {
lab=V}
N 670 -320 700 -320 {
lab=Vout2}
N 670 -80 700 -80 {
lab=Vout2}
N 700 -160 700 -80 {
lab=Vout2}
N 630 -210 680 -210 {
lab=V}
N 680 -350 680 -210 {
lab=V}
N 840 -120 840 -80 {
lab=Vout1}
N 840 -80 880 -80 {
lab=Vout1}
N 860 -200 920 -200 {
lab=V}
N 860 -350 860 -200 {
lab=V}
N 840 -320 880 -320 {
lab=Vout1}
N 700 -160 920 -160 {
lab=Vout2}
N 630 -120 840 -120 {
lab=Vout1}
N 430 -120 630 -120 {
lab=Vout1}
N 430 -120 430 -110 {
lab=Vout1}
N 920 -120 1150 -120 {
lab=Vout2}
N 1150 -120 1150 -100 {
lab=Vout2}
N 760 -30 760 -0 {
lab=GND}
N 320 100 510 100 {
lab=V}
N 510 180 1010 180 {
lab=GND}
N 1010 -0 1010 180 {
lab=GND}
N 690 50 690 140 {
lab=#net1}
N 610 140 690 140 {
lab=#net1}
N 400 140 450 140 {
lab=CLK}
N 610 -0 630 0 {
lab=GND}
N 760 -0 920 -0 {
lab=GND}
N 1010 -0 1130 0 {
lab=GND}
N 430 -0 480 -0 {
lab=GND}
N 480 -0 610 -0 {
lab=GND}
N 920 -0 940 -0 {
lab=GND}
N 620 -350 680 -350 {
lab=V}
N 780 -350 860 -350 {
lab=V}
N 700 -320 700 -160 {
lab=Vout2}
N 920 -170 920 -160 {
lab=Vout2}
N 630 -180 630 -120 {
lab=Vout1}
N 840 -320 840 -120 {
lab=Vout1}
N 920 -160 920 -120 {
lab=Vout2}
N 680 -350 780 -350 {
lab=V}
N 630 0 760 -0 {
lab=GND}
N 940 -0 1010 -0 {
lab=GND}
N 390 50 690 50 {
lab=#net1}
N 770 -500 770 -470 {
lab=V}
N 770 -500 780 -500 {
lab=V}
N 770 -470 790 -470 {
lab=V}
N 790 -470 790 -440 {
lab=V}
N 770 -440 790 -440 {
lab=V}
N 770 -410 770 -350 {
lab=V}
N 320 -440 730 -440 {
lab=#net1}
N 320 -440 320 -360 {
lab=#net1}
N 80 100 320 100 {
lab=V}
N 80 -540 80 100 {
lab=V}
N 80 -540 750 -540 {
lab=V}
N 750 -540 750 -480 {
lab=V}
N 320 -360 320 50 {
lab=#net1}
N 320 50 390 50 {
lab=#net1}
N 750 -480 770 -480 {
lab=V}
N 770 -440 770 -410 {
lab=V}
C {symbols/pfet_03v3.sym} 650 -320 0 1 {name=M1
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
C {symbols/nfet_03v3.sym} 410 -80 0 0 {name=M2
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
C {symbols/nfet_03v3.sym} 900 -80 0 0 {name=M3
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
C {symbols/nfet_03v3.sym} 1170 -70 0 1 {name=M4
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
C {symbols/nfet_03v3.sym} 650 -80 0 1 {name=M5
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
C {symbols/pfet_03v3.sym} 900 -320 0 0 {name=M6
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
C {symbols/pfet_03v3.sym} 610 -210 0 0 {name=M7
L=0.28u
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
C {symbols/pfet_03v3.sym} 940 -200 0 1 {name=M8
L=0.28u
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
C {devices/iopin.sym} 780 -500 0 0 {name=p1 lab=V
W=2u}
C {devices/iopin.sym} 430 -120 0 1 {name=p2 lab=Vout1}
C {devices/iopin.sym} 590 -210 0 1 {name=p3 lab=Vin1}
C {devices/iopin.sym} 960 -200 0 0 {name=p4 lab=Vin2}
C {devices/iopin.sym} 1150 -120 0 0 {name=p5 lab=Vout2}
C {devices/iopin.sym} 400 140 0 1 {name=p6 lab=CLK
}
C {devices/iopin.sym} 760 -30 0 0 {name=p7 lab=GND
}
C {inv.sym} 510 140 0 0 {name=x1 cl=0.28u wp=0.44u wn=0.22u wx=4u}
