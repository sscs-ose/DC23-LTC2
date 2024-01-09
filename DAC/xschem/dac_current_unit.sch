v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 480 -290 480 -270 {
lab=#net1}
N 480 -110 480 -80 {
lab=VSS}
N 480 -240 590 -240 {
lab=VSS}
N 480 -140 590 -140 {
lab=VSS}
N 480 -190 480 -170 {
lab=#net2}
N 480 -210 480 -190 {
lab=#net2}
N 480 -310 480 -290 {
lab=#net1}
N 360 -380 360 -360 {
lab=#net1}
N 600 -380 600 -360 {
lab=#net1}
N 360 -360 600 -360 {
lab=#net1}
N 360 -490 360 -440 {
lab=OUT+}
N 600 -470 600 -440 {
lab=OUT-}
N 290 -410 320 -410 {
lab=IN+}
N 360 -410 440 -410 {
lab=VSS}
N 530 -410 600 -410 {
lab=VSS}
N 360 -610 360 -560 {
lab=OUT+}
N 360 -500 360 -490 {
lab=OUT+}
N 360 -560 360 -500 {
lab=OUT+}
N 600 -550 600 -480 {
lab=OUT-}
N 360 -610 470 -610 {
lab=OUT+}
N 600 -480 600 -470 {
lab=OUT-}
N 640 -410 670 -410 {lab=IN-}
N 480 -360 480 -310 {
lab=#net1}
N 380 -240 440 -240 {
lab=Vb2}
N 380 -140 440 -140 {
lab=Vb1}
N 600 -550 700 -550 {
lab=OUT-}
N 470 -610 700 -610 {
lab=OUT+}
C {devices/title.sym} 160 0 0 0 {name=l2 author="Junbeom Park"}
C {symbols/nfet_03v3.sym} 460 -240 0 0 {name=M1
L=0.5u
W=nf*2u
nf=nf
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
C {symbols/nfet_03v3.sym} 460 -140 0 0 {name=M2
L=1u
W=nf*2u
nf=nf
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
C {symbols/nfet_03v3.sym} 340 -410 0 0 {name=M5
L=0.28u
W=nf*1u
nf=nf
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
C {symbols/nfet_03v3.sym} 620 -410 0 1 {name=M6
L=0.28u
W=nf*1u
nf=nf
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
C {devices/ipin.sym} 290 -410 0 0 {name=p3 lab=IN+}
C {devices/ipin.sym} 670 -410 0 1 {name=p6 lab=IN-}
C {devices/opin.sym} 700 -550 0 0 {name=p7 lab=OUT-}
C {devices/lab_pin.sym} 590 -240 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 590 -140 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {devices/opin.sym} 700 -610 0 0 {name=p11 lab=OUT+}
C {devices/lab_pin.sym} 440 -410 0 1 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 530 -410 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} 380 -240 0 0 {name=p15 lab=Vb2}
C {devices/ipin.sym} 380 -140 0 0 {name=p18 lab=Vb1}
C {devices/ipin.sym} 480 -80 0 1 {name=p19 lab=VSS}
