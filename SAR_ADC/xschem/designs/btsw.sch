v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1080 -70 1170 -70 {
lab=#net1}
N 910 110 910 200 {
lab=vi}
N 910 200 990 200 {
lab=vi}
N 790 -70 1020 -70 {
lab=#net2}
N 570 -70 730 -70 {
lab=#net3}
N 570 100 840 100 {
lab=#net4}
N 840 100 840 110 {
lab=#net4}
N 840 110 850 110 {
lab=#net4}
N 650 40 650 100 {
lab=#net4}
N 650 -70 650 -30 {
lab=#net3}
N 650 30 650 40 {
lab=#net4}
N 540 -250 540 -110 {
lab=#net2}
N 540 -250 930 -250 {
lab=#net2}
N 930 -250 930 -70 {
lab=#net2}
N 880 70 1020 70 {
lab=#net2}
N 1020 70 1020 160 {
lab=#net2}
N 930 -70 930 70 {
lab=#net2}
N 1050 200 1110 200 {
lab=vo}
N 280 -240 280 -140 {
lab=#net5}
N 280 -270 300 -270 {
lab=v}
N 300 -300 300 -270 {
lab=v}
N 280 -300 300 -300 {
lab=v}
N 280 -110 290 -110 {
lab=#net4}
N 290 -110 290 -80 {
lab=#net4}
N 280 -80 290 -80 {
lab=#net4}
N 240 -270 240 -110 {
lab=#net6}
N 770 80 770 100 {
lab=#net4}
N 770 70 770 80 {
lab=#net4}
N 720 40 770 40 {
lab=GND}
N 810 40 930 40 {
lab=#net2}
N 760 -110 850 -110 {
lab=#net5}
N 850 -110 850 10 {
lab=#net5}
N 770 10 850 10 {
lab=#net5}
N 280 -190 770 -190 {
lab=#net5}
N 770 -190 770 -110 {
lab=#net5}
N 760 -70 760 -50 {
lab=#net3}
N 150 -250 150 -150 {
lab=#net6}
N 150 -280 170 -280 {
lab=v}
N 170 -310 170 -280 {
lab=v}
N 150 -310 170 -310 {
lab=v}
N 150 -120 160 -120 {
lab=GND}
N 160 -120 160 -90 {
lab=GND}
N 150 -90 160 -90 {
lab=GND}
N 110 -280 110 -120 {
lab=clk}
N 150 -190 240 -190 {
lab=#net6}
N 280 -80 280 40 {
lab=#net4}
N 280 40 650 40 {
lab=#net4}
N 880 110 880 130 {
lab=GND}
N 1020 200 1020 220 {
lab=GND}
N 540 -70 540 -50 {
lab=#net3}
N 720 -50 760 -50 {
lab=#net3}
N 720 -70 720 -50 {
lab=#net3}
N 540 -50 590 -50 {
lab=#net3}
N 590 -70 590 -50 {
lab=#net3}
N 540 100 540 110 {
lab=GND}
N 520 110 540 110 {
lab=GND}
N 460 100 510 100 {
lab=GND}
N 510 100 510 110 {
lab=GND}
N 510 110 520 110 {
lab=GND}
N 1050 -70 1050 -50 {
lab=GND}
N 1050 -50 1230 -50 {
lab=GND}
N 1230 -70 1230 -50 {
lab=GND}
N 1200 -70 1200 -50 {
lab=GND}
N 1230 -50 1230 -30 {
lab=GND}
N 830 150 880 150 {
lab=GND}
N 880 130 880 150 {
lab=GND}
N 150 -90 150 -60 {
lab=GND}
N 150 -60 160 -60 {
lab=GND}
N 550 60 580 60 {
lab=clk}
N 540 60 550 60 {
lab=clk}
N 170 -350 170 -310 {
lab=v}
N 170 -350 310 -350 {
lab=v}
N 310 -350 310 -300 {
lab=v}
N 300 -300 310 -300 {
lab=v}
N 510 -350 510 -70 {
lab=v}
N 280 -350 510 -350 {
lab=v}
N 1050 -340 1050 -110 {
lab=v}
N 510 -340 1050 -340 {
lab=v}
N 480 100 480 280 {
lab=GND}
N 480 280 1270 280 {
lab=GND}
N 1270 10 1270 280 {
lab=GND}
N 1220 10 1270 10 {
lab=GND}
N 1220 -50 1220 10 {
lab=GND}
N 830 150 830 280 {
lab=GND}
N 730 40 730 190 {
lab=GND}
N 730 190 830 190 {
lab=GND}
N 150 -60 150 190 {
lab=GND}
N 150 190 480 190 {
lab=GND}
N 120 60 540 60 {
lab=clk}
N 120 -110 120 60 {
lab=clk}
N 110 -110 120 -110 {
lab=clk}
N 110 -120 110 -110 {
lab=clk}
N 1200 -160 1200 -110 {
lab=clk}
N 1130 -160 1200 -160 {
lab=clk}
N 1130 -160 1130 160 {
lab=clk}
N 1130 160 1190 160 {
lab=clk}
N 1190 160 1190 310 {
lab=clk}
N 300 310 1190 310 {
lab=clk}
N 300 60 300 310 {
lab=clk}
N 1020 220 1020 280 {
lab=GND}
C {nfet_03v3.sym} 1020 180 1 0 {name=M1
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
model=nfet_03v3
spiceprefix=X
}
C {pfet_03v3.sym} 760 -90 3 1 {name=M2
L=0.28u
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
C {nfet_03v3.sym} 880 90 1 0 {name=M3
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
C {nfet_03v3.sym} 1050 -90 1 0 {name=M4
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
model=nfet_03v3
spiceprefix=X
}
C {nfet_03v3.sym} 540 80 1 0 {name=M5
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
model=nfet_03v3
spiceprefix=X
}
C {nfet_03v3.sym} 1200 -90 1 0 {name=M6
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
model=nfet_03v3
spiceprefix=X
}
C {pfet_03v3.sym} 540 -90 3 1 {name=M7
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
C {devices/iopin.sym} 1110 200 0 0 {name=p9 sig_type=std_logic lab=vo}
C {pfet_03v3.sym} 260 -270 0 0 {name=M8
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
C {nfet_03v3.sym} 260 -110 0 0 {name=M9
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
C {pfet_03v3.sym} 790 40 2 0 {name=M10
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
C {pfet_03v3.sym} 130 -280 0 0 {name=M11
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
C {nfet_03v3.sym} 130 -120 0 0 {name=M12
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
C {devices/iopin.sym} 170 -310 0 0 {name=p3 sig_type=std_logic lab=v}
C {devices/iopin.sym} 160 -60 0 0 {name=p14 lab=GND}
C {devices/iopin.sym} 110 -170 0 1 {name=p2 lab=clk}
C {devices/iopin.sym} 910 200 0 1 {name=p4 sig_type=std_logic lab=vi}
C {devices/code.sym} 1370 110 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/capa.sym} 650 0 0 0 {name=C1
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
