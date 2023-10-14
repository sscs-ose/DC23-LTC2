v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 310 -290 530 -290 {
lab=V}
N 310 -260 530 -260 {
lab=V}
N 300 -150 540 -150 {
lab=V}
N 320 -40 540 -40 {
lab=GND}
N 300 -40 320 -40 {
lab=GND}
N 300 -10 540 -10 {
lab=GND}
N 410 -310 450 -310 {
lab=V}
N 410 -310 410 -290 {
lab=V}
N 410 -290 410 -260 {
lab=V}
N 410 -260 410 -150 {
lab=V}
N 410 -10 410 20 {
lab=GND}
N 410 -40 410 -10 {
lab=GND}
N 580 -150 580 -40 {
lab=A}
N 260 -150 260 -40 {
lab=B}
N 260 -350 260 -150 {
lab=B}
N 260 -350 580 -350 {
lab=B}
N 580 -350 580 -260 {
lab=B}
N 570 -260 580 -260 {
lab=B}
N 220 -260 270 -260 {
lab=A}
N 220 -360 220 -260 {
lab=A}
N 220 -360 610 -360 {
lab=A}
N 610 -360 610 -150 {
lab=A}
N 580 -150 610 -150 {
lab=A}
N 530 -230 530 -180 {
lab=#net1}
N 530 -180 540 -180 {
lab=#net1}
N 310 -230 310 -180 {
lab=#net2}
N 300 -180 310 -180 {
lab=#net2}
N 300 -120 300 -70 {
lab=Z}
N 540 -120 540 -70 {
lab=Z}
N 300 -100 540 -100 {
lab=Z}
N 160 -260 220 -260 {
lab=A}
N 580 -260 660 -260 {
lab=B}
N 410 -100 410 -80 {
lab=Z}
C {devices/iopin.sym} 410 20 0 0 {name=p3 lab=GND}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 290 -260 0 0 {name=M3
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 280 -150 0 0 {name=M6
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 550 -260 0 1 {name=M9
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 560 -150 0 1 {name=M12
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 280 -40 0 0 {name=M2
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 560 -40 0 1 {name=M4
L=0.28u
W=0.22u
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
C {devices/iopin.sym} 160 -260 0 1 {name=p5 lab=A}
C {devices/iopin.sym} 660 -260 0 0 {name=p7 lab=B}
C {devices/iopin.sym} 450 -310 0 0 {name=p9 lab=V}
C {devices/iopin.sym} 410 -80 0 0 {name=p10 lab=Z}
C {devices/code.sym} 780 -230 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
