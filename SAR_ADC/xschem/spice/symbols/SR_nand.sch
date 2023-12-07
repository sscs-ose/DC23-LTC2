v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 2020 -2050 2650 -2050 {
lab=V}
N 2020 -1990 2240 -1990 {
lab=Qn}
N 2430 -1990 2650 -1990 {
lab=Q}
N 2120 -1990 2120 -1890 {
lab=Qn}
N 2120 -1830 2120 -1770 {
lab=#net1}
N 2550 -1990 2550 -1880 {
lab=Q}
N 2550 -1820 2550 -1760 {
lab=#net2}
N 2120 -1700 2550 -1700 {
lab=GND}
N 2120 -1710 2120 -1700 {
lab=GND}
N 1980 -2020 1980 -1740 {
lab=S}
N 1980 -1740 2070 -1740 {
lab=S}
N 2070 -1740 2080 -1740 {
lab=S}
N 2590 -1730 2720 -1730 {
lab=R}
N 2720 -2020 2720 -1730 {
lab=R}
N 2690 -2020 2720 -2020 {
lab=R}
N 2390 -2020 2390 -1850 {
lab=Qn}
N 2390 -1850 2510 -1850 {
lab=Qn}
N 2280 -2020 2280 -1860 {
lab=Q}
N 2160 -1860 2280 -1860 {
lab=Q}
N 2280 -1960 2550 -1960 {
lab=Q}
N 2120 -1920 2390 -1920 {
lab=Qn}
N 2720 -1950 2740 -1950 {
lab=R}
N 1960 -1950 1980 -1950 {
lab=S}
N 2330 -2090 2330 -2050 {
lab=V}
N 2330 -1700 2330 -1650 {
lab=GND}
N 2240 -1860 2240 -1800 {
lab=Q}
N 2430 -1850 2430 -1800 {
lab=Qn}
N 2430 -1730 2550 -1730 {
lab=GND}
N 2430 -1730 2430 -1700 {
lab=GND}
N 2120 -1740 2230 -1740 {
lab=GND}
N 2230 -1740 2230 -1700 {
lab=GND}
N 2020 -2020 2240 -2020 {
lab=V}
N 2430 -2020 2650 -2020 {
lab=V}
N 2550 -2050 2550 -2020 {
lab=V}
N 2130 -2050 2130 -2020 {
lab=V}
N 2550 -1850 2660 -1850 {
lab=GND}
N 2660 -1850 2660 -1810 {
lab=GND}
N 2000 -1860 2120 -1860 {
lab=GND}
N 2000 -1700 2120 -1700 {
lab=GND}
N 2000 -1860 2000 -1700 {
lab=GND}
N 2660 -1810 2660 -1690 {
lab=GND}
N 2550 -1690 2660 -1690 {
lab=GND}
N 2550 -1700 2550 -1690 {
lab=GND}
C {pfet_03v3.sym} 2000 -2020 0 0 {name=M1
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
C {nfet_03v3.sym} 2140 -1860 0 1 {name=M2
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
C {pfet_03v3.sym} 2410 -2020 0 0 {name=M3
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
C {pfet_03v3.sym} 2670 -2020 0 1 {name=M4
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
C {pfet_03v3.sym} 2260 -2020 0 1 {name=M5
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
C {nfet_03v3.sym} 2100 -1740 0 0 {name=M6
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
C {nfet_03v3.sym} 2530 -1850 0 0 {name=M7
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
C {nfet_03v3.sym} 2570 -1730 0 1 {name=M8
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
C {devices/iopin.sym} 1960 -1950 0 1 {name=p1 lab=S
W=4u}
C {devices/iopin.sym} 2740 -1950 0 0 {name=p2 lab=R
W=4u}
C {devices/iopin.sym} 2330 -2090 0 0 {name=p3 lab=V
W=2u}
C {devices/iopin.sym} 2330 -1650 0 0 {name=p4 lab=GND
W=2u}
C {devices/iopin.sym} 2430 -1800 0 0 {name=p5 lab=Qn
W=4u}
C {devices/iopin.sym} 2240 -1800 0 1 {name=p6 lab=Q
W=4u}
C {devices/code.sym} 1810 -1830 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
