v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 2070 -1750 2070 -1690 {
lab=VDD}
N 2070 -1750 2700 -1750 {
lab=VDD}
N 2700 -1750 2700 -1680 {
lab=VDD}
N 2590 -1750 2590 -1680 {
lab=VDD}
N 2480 -1750 2590 -1750 {
lab=VDD}
N 2480 -1750 2480 -1680 {
lab=VDD}
N 2480 -1750 2480 -1680 {
lab=VDD}
N 2300 -1750 2480 -1750 {
lab=VDD}
N 2300 -1750 2300 -1690 {
lab=VDD}
N 2300 -1750 2300 -1690 {
lab=VDD}
N 2200 -1750 2300 -1750 {
lab=VDD}
N 2200 -1750 2200 -1690 {
lab=VDD}
N 2440 -1650 2440 -1500 {
lab=VOUT+}
N 2340 -1660 2340 -1500 {
lab=VOUT-}
N 2280 -1390 2300 -1390 {
lab=#net1}
N 2300 -1470 2300 -1390 {
lab=#net1}
N 2480 -1470 2480 -1390 {
lab=#net2}
N 2480 -1390 2510 -1390 {
lab=#net2}
N 2200 -1630 2300 -1630 {
lab=VOUT+}
N 2200 -1630 2300 -1630 {
lab=VOUT+}
N 2300 -1630 2300 -1530 {
lab=VOUT+}
N 2300 -1600 2300 -1530 {
lab=VOUT+}
N 2300 -1600 2440 -1600 {
lab=VOUT+}
N 2480 -1620 2590 -1620 {
lab=VOUT-}
N 2480 -1620 2590 -1620 {
lab=VOUT-}
N 2480 -1620 2480 -1530 {
lab=VOUT-}
N 2480 -1560 2480 -1530 {
lab=VOUT-}
N 2340 -1560 2480 -1560 {
lab=VOUT-}
N 2070 -1630 2070 -1440 {
lab=#net1}
N 2070 -1440 2300 -1440 {
lab=#net1}
N 2480 -1440 2700 -1440 {
lab=#net2}
N 2700 -1620 2700 -1440 {
lab=#net2}
N 2280 -1330 2510 -1330 {
lab=#net3}
N 2400 -1330 2400 -1280 {
lab=#net3}
N 2220 -1360 2240 -1360 {
lab=VIN+}
N 2280 -1500 2300 -1500 {
lab=#net1}
N 2280 -1500 2280 -1480 {
lab=#net1}
N 2300 -1480 2300 -1470 {
lab=#net1}
N 2480 -1500 2500 -1500 {
lab=#net2}
N 2500 -1500 2500 -1470 {
lab=#net2}
N 2480 -1470 2500 -1470 {
lab=#net2}
N 2690 -1650 2700 -1650 {
lab=VDD}
N 2690 -1680 2690 -1650 {
lab=VDD}
N 2690 -1680 2700 -1680 {
lab=VDD}
N 2570 -1650 2590 -1650 {
lab=VDD}
N 2570 -1680 2570 -1650 {
lab=VDD}
N 2570 -1680 2590 -1680 {
lab=VDD}
N 2480 -1650 2500 -1650 {
lab=VDD}
N 2500 -1680 2500 -1650 {
lab=VDD}
N 2480 -1680 2500 -1680 {
lab=VDD}
N 2070 -1660 2090 -1660 {
lab=VDD}
N 2090 -1690 2090 -1660 {
lab=VDD}
N 2070 -1690 2090 -1690 {
lab=VDD}
N 2200 -1660 2220 -1660 {
lab=VDD}
N 2220 -1690 2220 -1660 {
lab=VDD}
N 2200 -1690 2220 -1690 {
lab=VDD}
N 2280 -1660 2300 -1660 {
lab=VDD}
N 2280 -1690 2280 -1660 {
lab=VDD}
N 2280 -1690 2300 -1690 {
lab=VDD}
N 2280 -1360 2510 -1360 {
lab=#net3}
N 2400 -1360 2400 -1340 {
lab=#net3}
N 2400 -1340 2400 -1330 {
lab=#net3}
N 2400 -1250 2420 -1250 {
lab=GND}
N 2420 -1250 2420 -1220 {
lab=GND}
N 2280 -1470 2300 -1470 {
lab=#net1}
N 2280 -1480 2280 -1470 {
lab=#net1}
N 2260 -1570 2300 -1570 {
lab=VOUT+}
N 2400 -1220 2420 -1220 {
lab=GND}
N 2400 -1770 2400 -1750 {
lab=VDD}
N 2550 -1360 2570 -1360 {
lab=VIN-}
N 2340 -1250 2360 -1250 {
lab=VDD}
N 2400 -1220 2400 -1200 {
lab=GND}
N 2480 -1560 2520 -1560 {
lab=VOUT-}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 2050 -1660 0 0 {name=M1
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 2180 -1660 0 0 {name=M2
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 2320 -1660 0 1 {name=M3
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 2460 -1650 0 0 {name=M4
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 2610 -1650 0 1 {name=M5
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 2720 -1650 0 1 {name=M6
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 2320 -1500 0 1 {name=M7
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 2460 -1500 0 0 {name=M8
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 2260 -1360 0 0 {name=M9
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 2530 -1360 0 1 {name=M10
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 2380 -1250 0 0 {name=M11
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
C {devices/ipin.sym} 2160 -1660 0 0 {name=p5 lab=CLK}
C {devices/ipin.sym} 2030 -1660 0 0 {name=p3 lab=CLK}
C {devices/ipin.sym} 2630 -1650 2 0 {name=p6 lab=CLK}
C {devices/ipin.sym} 2740 -1650 2 0 {name=p7 lab=CLK}
C {devices/ipin.sym} 2400 -1770 1 0 {name=p8 lab=VDD}
C {devices/ipin.sym} 2220 -1360 0 0 {name=p10 lab=VIN+}
C {devices/ipin.sym} 2570 -1360 2 0 {name=p1 lab=VIN-}
C {devices/ipin.sym} 2340 -1250 0 0 {name=p2 lab=VDD}
C {devices/ipin.sym} 2400 -1200 3 0 {name=p11 lab=GND}
C {devices/opin.sym} 2260 -1570 2 0 {name=p12 lab=VOUT+}
C {devices/opin.sym} 2520 -1560 0 0 {name=p4 lab=VOUT-}
