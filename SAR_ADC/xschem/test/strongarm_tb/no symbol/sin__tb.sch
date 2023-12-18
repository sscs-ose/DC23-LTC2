v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 310 -370 350 -370 {
lab=Vindiff}
N 220 -370 250 -370 {
lab=Vin1}
N 220 -330 250 -330 {
lab=Vin2}
N 380 -180 380 -170 {
lab=V}
N 300 -180 300 -170 {
lab=clk}
N 230 -180 230 -170 {
lab=Vin2}
N 150 -180 150 -170 {
lab=Vin1}
N 350 -390 350 -370 {
lab=Vindiff}
N 1000 -140 1040 -140 {
lab=Vout}
N 1040 -160 1040 -140 {
lab=Vout}
N 2130 -350 2130 -310 {
lab=GND}
N 2110 -310 2130 -310 {
lab=GND}
N 1410 -360 1410 -310 {
lab=GND}
N 1610 -360 1610 -310 {
lab=GND}
N 2110 -380 2130 -380 {
lab=GND}
N 2110 -380 2110 -310 {
lab=GND}
N 1410 -390 1460 -390 {
lab=GND}
N 1460 -390 1460 -310 {
lab=GND}
N 1370 -390 1370 -260 {
lab=#net1}
N 1670 -260 2170 -260 {
lab=#net1}
N 2170 -380 2170 -260 {
lab=#net1}
N 1900 -360 1900 -310 {
lab=GND}
N 1590 -390 1610 -390 {
lab=GND}
N 1590 -390 1590 -310 {
lab=GND}
N 1900 -390 1920 -390 {
lab=GND}
N 1920 -390 1920 -310 {
lab=GND}
N 1900 -430 1900 -420 {
lab=Vout2}
N 1900 -600 1900 -540 {
lab=#net2}
N 1840 -660 1910 -660 {
lab=V}
N 1610 -430 1610 -420 {
lab=Vout1}
N 1610 -600 1610 -550 {
lab=#net3}
N 1600 -630 1610 -630 {
lab=V}
N 1600 -660 1600 -630 {
lab=V}
N 1900 -630 1910 -630 {
lab=V}
N 1910 -660 1910 -630 {
lab=V}
N 1650 -630 1680 -630 {
lab=Vout2}
N 1650 -390 1680 -390 {
lab=Vout2}
N 1680 -470 1680 -390 {
lab=Vout2}
N 1610 -520 1660 -520 {
lab=V}
N 1660 -660 1660 -520 {
lab=V}
N 1820 -430 1820 -390 {
lab=Vout1}
N 1820 -390 1860 -390 {
lab=Vout1}
N 1840 -510 1900 -510 {
lab=V}
N 1840 -660 1840 -510 {
lab=V}
N 1820 -630 1860 -630 {
lab=Vout1}
N 1680 -470 1900 -470 {
lab=Vout2}
N 1610 -430 1820 -430 {
lab=Vout1}
N 1410 -430 1610 -430 {
lab=Vout1}
N 1410 -430 1410 -420 {
lab=Vout1}
N 1900 -430 2130 -430 {
lab=Vout2}
N 2130 -430 2130 -410 {
lab=Vout2}
N 1300 -210 1490 -210 {
lab=V}
N 1490 -130 1990 -130 {
lab=GND}
N 1990 -310 1990 -130 {
lab=GND}
N 1670 -260 1670 -170 {
lab=#net1}
N 1590 -170 1670 -170 {
lab=#net1}
N 1380 -170 1430 -170 {
lab=clk}
N 1590 -310 1610 -310 {
lab=GND}
N 1740 -310 1900 -310 {
lab=GND}
N 1990 -310 2110 -310 {
lab=GND}
N 1410 -310 1460 -310 {
lab=GND}
N 1460 -310 1590 -310 {
lab=GND}
N 1900 -310 1920 -310 {
lab=GND}
N 1600 -660 1660 -660 {
lab=V}
N 1760 -660 1840 -660 {
lab=V}
N 1680 -630 1680 -470 {
lab=Vout2}
N 1900 -480 1900 -470 {
lab=Vout2}
N 1610 -490 1610 -430 {
lab=Vout1}
N 1820 -630 1820 -430 {
lab=Vout1}
N 1900 -470 1900 -430 {
lab=Vout2}
N 1660 -660 1760 -660 {
lab=V}
N 1610 -310 1740 -310 {
lab=GND}
N 1920 -310 1990 -310 {
lab=GND}
N 1370 -260 1670 -260 {
lab=#net1}
N 1750 -780 1770 -780 {
lab=V}
N 1770 -780 1770 -750 {
lab=V}
N 1750 -750 1770 -750 {
lab=V}
N 1750 -720 1750 -660 {
lab=V}
N 1750 -750 1750 -720 {
lab=V}
C {devices/vsource.sym} 230 -140 0 0 {name=V2 value=1.6}
C {devices/vsource.sym} 300 -140 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 7n 15n)"}
C {devices/gnd.sym} 1700 -130 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 230 -110 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 300 -110 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 150 -180 0 0 {name=p1 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 230 -180 0 0 {name=p2 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 300 -180 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 1940 -510 0 1 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 1390 -170 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 380 -140 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 380 -110 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 380 -180 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1750 -780 0 0 {name=p8 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 220 -370 0 0 {name=p9 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 220 -330 0 0 {name=p10 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 280 -310 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 350 -390 0 0 {name=p11 sig_type=std_logic lab=Vindiff
}
C {devices/res.sym} 350 -340 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=2}
C {devices/gnd.sym} 350 -310 0 0 {name=l8 lab=GND}
C {devices/code_shown.sym} 740 -540 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 100n  
plot \{vindiff * 1000000\} vout
plot vin1
plot vout clk 
.endc"}
C {devices/code.sym} 50 -400 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/gnd.sym} 970 -80 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 1040 -160 0 0 {name=p15 sig_type=std_logic lab=Vout
}
C {devices/res.sym} 1040 -110 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=2}
C {devices/gnd.sym} 1040 -80 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} 150 -110 0 0 {name=p12 sig_type=std_logic lab=Vin2}
C {../../../../symbols/Vdiffmeter.sym} 940 -80 0 0 {name=X3}
C {../../../../symbols/Vdiffmeter.sym} 250 -310 0 0 {name=X2}
C {symbols/pfet_03v3.sym} 1630 -630 0 1 {name=M1
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
C {symbols/nfet_03v3.sym} 1390 -390 0 0 {name=M2
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
C {symbols/nfet_03v3.sym} 1880 -390 0 0 {name=M3
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
C {symbols/nfet_03v3.sym} 2150 -380 0 1 {name=M4
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
C {symbols/nfet_03v3.sym} 1630 -390 0 1 {name=M5
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
C {symbols/pfet_03v3.sym} 1880 -630 0 0 {name=M6
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
C {symbols/pfet_03v3.sym} 1590 -520 0 0 {name=M7
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
C {symbols/pfet_03v3.sym} 1920 -510 0 1 {name=M8
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
C {devices/lab_wire.sym} 1410 -430 0 1 {name=p14 lab=Vout1}
C {devices/lab_wire.sym} 2130 -430 0 0 {name=p18 lab=Vout2}
C {../../../../symbols/inv.sym} 1490 -170 0 0 {name=x4 cl=0.28u wp=0.44u wn=0.22u}
C {devices/lab_wire.sym} 1570 -520 0 0 {name=p16 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 940 -140 0 0 {name=p4 lab=Vout1}
C {devices/lab_wire.sym} 940 -100 0 0 {name=p17 lab=Vout2}
C {devices/lab_wire.sym} 1310 -210 0 0 {name=p13 sig_type=std_logic lab=V
}
C {devices/vsource.sym} 150 -140 0 0 {name=V1 value="SIN(0 .01u 20meg)"}
