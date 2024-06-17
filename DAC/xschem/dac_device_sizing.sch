v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 0 -850 0 -160 {}
L 4 0 -160 150 -160 {}
L 4 150 -590 150 -160 {}
L 4 150 -590 280 -590 {}
L 4 280 -860 280 -590 {}
L 4 0 -860 280 -860 {}
L 4 0 -860 0 -850 {}
L 4 790 -1120 3260 -1120 {}
L 4 3260 -1280 3260 -1120 {}
L 4 790 -1280 790 -1120 {}
L 4 790 -1380 790 -1280 {}
L 4 790 -1380 3260 -1380 {}
L 4 3260 -1380 3260 -1280 {}
T {EXT.} 100 -880 0 0 0.8 0.8 {}
T {EXT.} 1980 -1410 0 0 0.8 0.8 {}
T {#reference current source = 2uA

#nominal current
for 4LSB, binary coded
1x=10uA, 2x=20uA, 4x=40uA, 8x=80uA

for 6MSB, thermometer coded 
16x=160uA} -1100 -1610 0 0 1 1 {}
N 600 -590 600 -570 {
lab=#net1}
N 440 -690 440 -660 {
lab=VDD}
N 440 -690 600 -690 {
lab=VDD}
N 600 -690 600 -660 {
lab=VDD}
N 480 -630 560 -630 {
lab=#net2}
N 600 -600 600 -590 {
lab=#net1}
N 430 -690 430 -630 {
lab=VDD}
N 600 -630 610 -630 {
lab=VDD}
N 610 -690 610 -630 {
lab=VDD}
N 600 -690 610 -690 {
lab=VDD}
N 430 -690 440 -690 {
lab=VDD}
N 430 -630 440 -630 {
lab=VDD}
N 520 -750 520 -690 {
lab=VDD}
N 250 -320 250 -270 {
lab=#net3}
N 250 -210 250 -180 {
lab=VSS}
N 210 -240 250 -240 {
lab=VSS}
N 440 -240 470 -240 {
lab=VSS}
N 440 -210 440 -180 {
lab=VSS}
N 250 -800 250 -680 {
lab=VDD}
N 980 -390 980 -370 {
lab=vd11}
N 980 -210 980 -180 {
lab=VSS}
N 980 -340 1090 -340 {
lab=VSS}
N 980 -240 1090 -240 {
lab=VSS}
N 640 -340 940 -340 {lab=vb2}
N 640 -240 940 -240 {lab=vb1}
N 600 -310 600 -270 {
lab=vb1}
N 600 -210 600 -180 {
lab=VSS}
N 570 -340 600 -340 {
lab=VSS}
N 570 -240 600 -240 {
lab=VSS}
N 980 -290 980 -270 {
lab=vd1}
N 980 -310 980 -290 {
lab=vd1}
N 860 -480 860 -460 {
lab=#net4}
N 1100 -480 1100 -460 {
lab=#net4}
N 860 -460 1100 -460 {
lab=#net4}
N 860 -590 860 -540 {
lab=#net5}
N 1100 -570 1100 -540 {
lab=#net6}
N 790 -510 820 -510 {
lab=Q0+}
N 860 -510 940 -510 {
lab=VSS}
N 1030 -510 1100 -510 {
lab=VSS}
N 860 -710 860 -660 {
lab=#net5}
N 860 -600 860 -590 {
lab=#net5}
N 860 -660 860 -600 {
lab=#net5}
N 1100 -650 1100 -580 {
lab=#net6}
N 1100 -580 1100 -570 {
lab=#net6}
N 1140 -510 1170 -510 {lab=Q0-}
N 940 -340 950 -330 {
lab=vb2}
N 1240 -330 1250 -340 {
lab=vb2}
N 940 -240 950 -230 {
lab=vb1}
N 1230 -230 1240 -240 {
lab=vb1}
N 950 -330 1240 -330 {
lab=vb2}
N 950 -230 1230 -230 {
lab=vb1}
N 980 -400 980 -390 {
lab=vd11}
N 860 -1030 860 -920 {
lab=#net5}
N 1100 -1030 1100 -820 {
lab=#net6}
N 860 -920 860 -710 {
lab=#net5}
N 1100 -820 1100 -650 {
lab=#net6}
N 1500 -390 1500 -370 {
lab=vd22}
N 1500 -210 1500 -180 {
lab=VSS}
N 1500 -340 1610 -340 {
lab=VSS}
N 1500 -240 1610 -240 {
lab=VSS}
N 1500 -290 1500 -270 {
lab=vd2}
N 1500 -310 1500 -290 {
lab=vd2}
N 1500 -410 1500 -390 {
lab=vd22}
N 1380 -480 1380 -460 {
lab=#net7}
N 1620 -480 1620 -460 {
lab=#net7}
N 1380 -460 1620 -460 {
lab=#net7}
N 1380 -590 1380 -540 {
lab=#net8}
N 1620 -570 1620 -540 {
lab=#net9}
N 1310 -510 1340 -510 {
lab=Q0+}
N 1380 -510 1460 -510 {
lab=VSS}
N 1550 -510 1620 -510 {
lab=VSS}
N 1380 -710 1380 -660 {
lab=#net8}
N 1380 -600 1380 -590 {
lab=#net8}
N 1380 -660 1380 -600 {
lab=#net8}
N 1620 -650 1620 -580 {
lab=#net9}
N 1620 -580 1620 -570 {
lab=#net9}
N 1660 -510 1690 -510 {lab=Q0-}
N 1460 -340 1470 -330 {
lab=vb2}
N 1460 -240 1470 -230 {
lab=vb1}
N 1250 -340 1460 -340 {
lab=vb2}
N 1240 -240 1460 -240 {
lab=vb1}
N 1380 -1020 1380 -710 {
lab=#net8}
N 1620 -1020 1620 -650 {
lab=#net9}
N 2030 -390 2030 -370 {
lab=#net10}
N 2030 -210 2030 -180 {
lab=VSS}
N 2030 -340 2140 -340 {
lab=VSS}
N 2030 -240 2140 -240 {
lab=VSS}
N 2030 -290 2030 -270 {
lab=vd3}
N 2030 -310 2030 -290 {
lab=vd3}
N 2030 -410 2030 -390 {
lab=#net10}
N 1910 -480 1910 -460 {
lab=#net11}
N 2150 -480 2150 -460 {
lab=#net11}
N 1910 -460 2150 -460 {
lab=#net11}
N 1910 -590 1910 -540 {
lab=#net12}
N 2150 -570 2150 -540 {
lab=#net13}
N 1840 -510 1870 -510 {
lab=Q0+}
N 1910 -510 1990 -510 {
lab=VSS}
N 2080 -510 2150 -510 {
lab=VSS}
N 1910 -710 1910 -660 {
lab=#net12}
N 1910 -600 1910 -590 {
lab=#net12}
N 1910 -660 1910 -600 {
lab=#net12}
N 2150 -650 2150 -580 {
lab=#net13}
N 2150 -580 2150 -570 {
lab=#net13}
N 2190 -510 2220 -510 {lab=Q0-}
N 2550 -390 2550 -370 {
lab=#net14}
N 2550 -210 2550 -180 {
lab=VSS}
N 2550 -340 2660 -340 {
lab=VSS}
N 2550 -240 2660 -240 {
lab=VSS}
N 2550 -290 2550 -270 {
lab=vd4}
N 2550 -310 2550 -290 {
lab=vd4}
N 2430 -480 2430 -460 {
lab=#net15}
N 2670 -480 2670 -460 {
lab=#net15}
N 2430 -460 2670 -460 {
lab=#net15}
N 2430 -590 2430 -540 {
lab=#net16}
N 2670 -570 2670 -540 {
lab=#net17}
N 2360 -510 2390 -510 {
lab=Q0+}
N 2430 -510 2510 -510 {
lab=VSS}
N 2600 -510 2670 -510 {
lab=VSS}
N 2710 -510 2740 -510 {lab=Q0-}
N 1980 -330 1990 -340 {
lab=vb2}
N 1980 -230 1990 -240 {
lab=vb1}
N 1990 -340 2000 -330 {
lab=vb2}
N 1990 -240 2000 -230 {
lab=vb1}
N 2550 -400 2550 -390 {
lab=#net14}
N 1470 -230 1980 -230 {
lab=vb1}
N 1470 -330 1980 -330 {
lab=vb2}
N 1910 -760 1910 -710 {
lab=#net12}
N 2150 -700 2150 -650 {
lab=#net13}
N 2430 -900 2430 -590 {
lab=#net16}
N 2670 -900 2670 -570 {
lab=#net17}
N 860 -1040 860 -1030 {
lab=#net5}
N 1100 -1040 1100 -1030 {
lab=#net6}
N 1380 -1030 1380 -1020 {
lab=#net8}
N 1380 -1040 1380 -1030 {
lab=#net8}
N 1620 -1040 1620 -1020 {
lab=#net9}
N 1910 -1040 1910 -760 {
lab=#net12}
N 2150 -1040 2150 -700 {
lab=#net13}
N 2430 -1040 2430 -900 {
lab=#net16}
N 2670 -1040 2670 -900 {
lab=#net17}
N 2910 -330 2920 -340 {
lab=vb2}
N 2910 -230 2920 -240 {
lab=vb1}
N 3050 -390 3050 -370 {
lab=#net18}
N 3050 -210 3050 -180 {
lab=VSS}
N 3050 -340 3160 -340 {
lab=VSS}
N 3050 -240 3160 -240 {
lab=VSS}
N 3050 -290 3050 -270 {
lab=vd5}
N 3050 -310 3050 -290 {
lab=vd5}
N 2930 -480 2930 -460 {
lab=#net19}
N 3170 -480 3170 -460 {
lab=#net19}
N 2930 -460 3170 -460 {
lab=#net19}
N 2930 -590 2930 -540 {
lab=#net20}
N 3170 -570 3170 -540 {
lab=#net21}
N 2930 -510 3010 -510 {
lab=VSS}
N 3100 -510 3170 -510 {
lab=VSS}
N 3210 -510 3240 -510 {lab=Q0-}
N 3050 -400 3050 -390 {
lab=#net18}
N 2930 -900 2930 -590 {
lab=#net20}
N 3170 -900 3170 -570 {
lab=#net21}
N 2930 -1040 2930 -900 {
lab=#net20}
N 3170 -1040 3170 -900 {
lab=#net21}
N 2920 -340 3010 -340 {
lab=vb2}
N 2920 -240 3010 -240 {
lab=vb1}
N 860 -1140 860 -1100 {
lab=#net22}
N 2510 -340 2520 -330 {
lab=vb2}
N 2520 -330 2910 -330 {
lab=vb2}
N 2510 -240 2520 -230 {
lab=vb1}
N 2520 -230 2910 -230 {
lab=vb1}
N 1100 -1230 1100 -1200 {
lab=#net23}
N 860 -1230 860 -1200 {
lab=#net23}
N 1100 -1140 1100 -1100 {
lab=#net24}
N 1380 -1140 1380 -1100 {
lab=#net25}
N 1620 -1230 1620 -1200 {
lab=#net23}
N 1380 -1230 1380 -1200 {
lab=#net23}
N 1620 -1140 1620 -1100 {
lab=#net26}
N 1910 -1140 1910 -1100 {
lab=#net27}
N 2150 -1230 2150 -1200 {
lab=#net23}
N 1910 -1230 1910 -1200 {
lab=#net23}
N 2150 -1140 2150 -1100 {
lab=#net28}
N 2430 -1140 2430 -1100 {
lab=#net29}
N 2670 -1230 2670 -1200 {
lab=#net23}
N 2430 -1230 2430 -1200 {
lab=#net23}
N 2670 -1140 2670 -1100 {
lab=#net30}
N 2930 -1140 2930 -1100 {
lab=#net31}
N 3170 -1230 3170 -1200 {
lab=#net23}
N 2930 -1230 2930 -1200 {
lab=#net23}
N 3170 -1140 3170 -1100 {
lab=#net32}
N 80 -770 80 -670 {
lab=VDD}
N 80 -800 80 -770 {
lab=VDD}
N 260 -690 260 -650 {
lab=VDD}
N 250 -690 260 -690 {
lab=VDD}
N 250 -600 250 -550 {
lab=#net33}
N 250 -490 250 -320 {
lab=#net3}
N 250 -680 250 -660 {
lab=VDD}
N 250 -630 260 -630 {
lab=VDD}
N 260 -650 260 -630 {
lab=VDD}
N 140 -630 210 -630 {
lab=#net34}
N 80 -510 80 -180 {
lab=VSS}
N 2290 -330 2300 -340 {
lab=vb2}
N 2280 -230 2290 -240 {
lab=vb1}
N 2000 -330 2290 -330 {
lab=vb2}
N 2000 -230 2280 -230 {
lab=vb1}
N 2300 -340 2510 -340 {
lab=vb2}
N 2290 -240 2510 -240 {
lab=vb1}
N 860 -1230 3170 -1230 {
lab=#net23}
N 2030 -1260 2030 -1230 {
lab=#net23}
N 2030 -1360 2030 -1320 {
lab=VDD}
N 440 -600 440 -550 {
lab=#net2}
N 440 -490 440 -270 {
lab=#net35}
N 600 -510 600 -370 {
lab=vb2}
N 250 -290 310 -290 {
lab=#net3}
N 310 -290 310 -240 {
lab=#net3}
N 440 -570 500 -570 {
lab=#net2}
N 500 -630 500 -570 {
lab=#net2}
N 600 -390 660 -390 {
lab=vb2}
N 660 -390 660 -340 {
lab=vb2}
N 600 -290 660 -290 {
lab=vb1}
N 660 -290 660 -240 {
lab=vb1}
N 290 -240 400 -240 {
lab=#net3}
C {devices/lab_pin.sym} 520 -750 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {symbols/pfet_03v3.sym} 460 -630 0 1 {name=M1
L=1u
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
C {symbols/pfet_03v3.sym} 580 -630 0 0 {name=M2
L=1u
W=5u
nf=5
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
C {devices/lab_pin.sym} 250 -800 0 0 {name=p28 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 270 -240 0 1 {name=M3
L=4u
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
C {symbols/nfet_03v3.sym} 420 -240 0 0 {name=M10
L=4u
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
C {devices/ammeter.sym} 250 -520 0 0 {name=Vref}
C {symbols/nfet_03v3.sym} 960 -340 0 0 {name=M7
L=cln
W=Wn2*2
nf=2
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
C {symbols/nfet_03v3.sym} 960 -240 0 0 {name=M8
L=sln
W=Wn1*1
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
C {symbols/nfet_03v3.sym} 620 -340 0 1 {name=M9
L=1u
W=4u
nf=4
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
C {symbols/nfet_03v3.sym} 620 -240 0 1 {name=M11
L=1u
W=4u
nf=4
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
C {symbols/nfet_03v3.sym} 840 -510 0 0 {name=M12
L=0.5u
W=Wn3
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
C {symbols/nfet_03v3.sym} 1120 -510 0 1 {name=M13
L=0.5u
W=Wn3
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
C {devices/lab_pin.sym} 570 -340 0 0 {name=p20 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 570 -240 0 0 {name=p21 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1090 -340 0 1 {name=p22 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1090 -240 0 1 {name=p23 sig_type=std_logic lab=VSS}
C {devices/ammeter.sym} 440 -520 0 0 {name=Vcm1}
C {devices/lab_pin.sym} 1170 -510 0 1 {name=p5 sig_type=std_logic lab=Q0-}
C {devices/lab_pin.sym} 790 -510 0 0 {name=p7 sig_type=std_logic lab=Q0+}
C {devices/lab_pin.sym} 770 -340 1 0 {name=p36 sig_type=std_logic lab=vb2}
C {devices/lab_pin.sym} 770 -240 1 0 {name=p37 sig_type=std_logic lab=vb1}
C {devices/lab_pin.sym} 980 -290 0 0 {name=p48 sig_type=std_logic lab=vd1}
C {devices/ammeter.sym} 600 -540 0 0 {name=Vcm2}
C {devices/ammeter.sym} 980 -430 0 0 {name=Vcs1}
C {symbols/nfet_03v3.sym} 1480 -340 0 0 {name=M14
L=cln
W=Wn2*4
nf=4
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
C {symbols/nfet_03v3.sym} 1480 -240 0 0 {name=M15
L=sln
W=Wn1*2
nf=2
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
C {symbols/nfet_03v3.sym} 1360 -510 0 0 {name=M18
L=0.5u
W=Wn3*2
nf=2
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
C {symbols/nfet_03v3.sym} 1640 -510 0 1 {name=M19
L=0.5u
W=Wn3*2
nf=2
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
C {devices/lab_pin.sym} 1610 -340 0 1 {name=p39 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1610 -240 0 1 {name=p40 sig_type=std_logic lab=VSS}
C {devices/ammeter.sym} 860 -1070 0 0 {name=Vout1+}
C {devices/ammeter.sym} 1100 -1070 0 0 {name=Vout1-}
C {symbols/nfet_03v3.sym} 2010 -340 0 0 {name=M20
L=cln
W=Wn2*8
nf=8
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
C {symbols/nfet_03v3.sym} 2010 -240 0 0 {name=M21
L=sln
W=Wn1*4
nf=4
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
C {symbols/nfet_03v3.sym} 1890 -510 0 0 {name=M24
L=0.5u
W=Wn3*4
nf=4
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
C {symbols/nfet_03v3.sym} 2170 -510 0 1 {name=M25
L=0.5u
W=Wn3*4
nf=4
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
C {devices/lab_pin.sym} 2140 -340 0 1 {name=p51 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2140 -240 0 1 {name=p52 sig_type=std_logic lab=VSS}
C {symbols/nfet_03v3.sym} 2530 -340 0 0 {name=M26
L=cln
W=Wn2*16
nf=16
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
C {symbols/nfet_03v3.sym} 2530 -240 0 0 {name=M27
L=sln
W=Wn1*8
nf=8
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
C {symbols/nfet_03v3.sym} 2410 -510 0 0 {name=M30
L=0.5u
W=Wn3*8
nf=8
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
C {symbols/nfet_03v3.sym} 2690 -510 0 1 {name=M31
L=0.5u
W=Wn3*8
nf=8
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
C {devices/lab_pin.sym} 2660 -340 0 1 {name=p63 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2660 -240 0 1 {name=p64 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1310 -510 0 0 {name=p2 sig_type=std_logic lab=Q0+}
C {devices/lab_pin.sym} 1690 -510 0 1 {name=p16 sig_type=std_logic lab=Q0-}
C {devices/lab_pin.sym} 1840 -510 0 0 {name=p18 sig_type=std_logic lab=Q0+}
C {devices/lab_pin.sym} 2220 -510 0 1 {name=p24 sig_type=std_logic lab=Q0-}
C {devices/lab_pin.sym} 2740 -510 0 1 {name=p32 sig_type=std_logic lab=Q0-}
C {devices/lab_pin.sym} 2360 -510 0 0 {name=p34 sig_type=std_logic lab=Q0+}
C {devices/code.sym} -880 -115 0 0 {name=COMMANDS
only_toplevel=false
value="
.param Mn1=1
.param Mn2=1
.param Mn3=1
.param Mn4=1
.param nf1=1
.param nf2=2
.param nf3=3
.param nf4=4
.param sln=0.5u
.param cln=0.5u
.param Wn1=2u
.param Wn2=1u
.param Wn3=1u

.save @m.xm7.m0[vth] @m.xm8.m0[vth] @m.xm27.m0[vth] @m.xm26.m0[vth] @m.xm30.m0[vth]
.options savecurrents

.control
	tran 0.5n 100n

	****plot currents of each current mirrror*****
	plot i(Vref) i(Vcm1) i(Vcm2)
	****plot currents of each current source****
	plot i(vcs1) i(Vcs2) i(Vcs3) i(Vcs4) i(Vcs5)
	****plot output currents of each cell****
	plot i(Vout1+) i(Vout1-) i(Vout2+) i(Vout2-) i(Vout3+) i(Vout3-) i(Vout4+) i(Vout4-) i(Vout5+) i(Vout5-) 

	*plot i(Vmeas1) i(Vmeas2) i(Vmeas3) i(Vmeas4) i(Vmeas5)
	*plot v(vb2) v(vb1) v(vd1) v(vd2)
	*plot v(vb1)-@m.xm8.m0[vth]
	*plot v(vb2)-@m.xm8.m0[vth]
	*plot v(vb1)-@m.xm8.m0[vth] 
	*plot v(vb2)-v(vd1)-@m.xm7.m0[vth]
	*plot v(q0+)-v(vd2)-@m.xm12.m0[vth]
	*plot v(vb1)-@m.xm27.m0[vth]
	*plot v(q0+)-v(vd2)-@m.xm12.m0[vth]
	*plot @m.xm8.m0[vth] @m.xm27.m0[vth]
	*plot v(vd1)-v(vb1)+@m.xm8.m0[vth]
	*plot v(vd1)-v(vb1)+@m.xm15.m0[vth]
	*plot v(vd1)-v(vb1)+@m.xm21.m0[vth]
	*plot v(vd1)-v(vb1)+@m.xm27.m0[vth]
	*plot v(vd1)-v(vb1)+@m.xm5.m0[vth]
	*plot v(vd11)-v(vb2)+@m.xm8.m0[vth]
	*plot v(vb1) v(vd1) v(vd2) v(vd3) v(vd4) v(vd5)
	*plot v(vb1) v(vd1) v(vd2) v(vd3) v(vd4) v(vd5)
	write tb_mosfet_sizing.raw
.endc

.save all
"}
C {devices/vsource.sym} -660 -70 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -660 -40 0 1 {name=p35 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -660 -100 0 1 {name=p38 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -590 -70 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -590 -40 0 1 {name=p41 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -590 -100 0 1 {name=p45 sig_type=std_logic lab=VSS}
C {devices/code_shown.sym} -880 -360 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/lab_pin.sym} -320 -760 2 1 {name=p630 sig_type=std_logic lab=0}
C {devices/vsource.sym} -590 -790 0 0 {name=V4
value="pulse 0 3.3 15n 2n 2n 13n 30n"
}
C {devices/lab_pin.sym} -160 -820 0 1 {name=p61 sig_type=std_logic lab=Q0+}
C {devices/lab_pin.sym} -430 -820 0 1 {name=p68 sig_type=std_logic lab=Q0-}
C {devices/vsource.sym} -320 -790 0 0 {name=V1
value="pulse 0 3.3 0n 2n 2n 13n 30n"
}
C {std_cell/inv_1.sym} -550 -820 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -470 -820 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -280 -820 0 0 {name=x3 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -200 -820 0 0 {name=x4 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -590 -760 2 1 {name=p46 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 2550 -290 0 0 {name=p47 sig_type=std_logic lab=vd4}
C {symbols/nfet_03v3.sym} 3030 -340 0 0 {name=M4
L=cln
W=Wn2*32
nf=16
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
C {symbols/nfet_03v3.sym} 3030 -240 0 0 {name=M5
L=sln
W=Wn1*16
nf=16
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
C {symbols/nfet_03v3.sym} 2910 -510 0 0 {name=M6
L=0.5u
W=Wn3*16
nf=8
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
C {symbols/nfet_03v3.sym} 3190 -510 0 1 {name=M16
L=0.5u
W=Wn3*16
nf=8
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
C {devices/lab_pin.sym} 3160 -340 0 1 {name=p59 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 3160 -240 0 1 {name=p60 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 3240 -510 0 1 {name=p62 sig_type=std_logic lab=Q0-}
C {devices/lab_pin.sym} 3100 -510 0 0 {name=p57 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 3010 -510 0 1 {name=p58 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2510 -510 0 1 {name=p55 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2600 -510 0 0 {name=p56 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 940 -510 0 1 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1030 -510 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1460 -510 0 1 {name=p25 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1550 -510 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1990 -510 0 1 {name=p43 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2080 -510 0 0 {name=p44 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1500 -290 0 0 {name=p4 sig_type=std_logic lab=vd2}
C {devices/lab_pin.sym} 2030 -290 0 0 {name=p6 sig_type=std_logic lab=vd3}
C {devices/lab_pin.sym} 3050 -290 0 0 {name=p8 sig_type=std_logic lab=vd5}
C {devices/ammeter.sym} 1500 -430 0 0 {name=Vcs2}
C {devices/ammeter.sym} 2030 -430 0 0 {name=Vcs3}
C {devices/ammeter.sym} 2550 -430 0 0 {name=Vcs4}
C {devices/ammeter.sym} 3050 -430 0 0 {name=Vcs5}
C {devices/lab_pin.sym} 2890 -510 0 0 {name=p10 sig_type=std_logic lab=Q0+}
C {devices/res.sym} 1100 -1170 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 860 -1170 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 2030 -1360 0 1 {name=p49 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1620 -1170 0 0 {name=R3
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1380 -1170 0 0 {name=R4
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 2150 -1170 0 0 {name=R5
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1910 -1170 0 0 {name=R6
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 2670 -1170 0 0 {name=R9
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 2430 -1170 0 0 {name=R10
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 3170 -1170 0 0 {name=R7
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 2930 -1170 0 0 {name=R8
value=50
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 980 -390 0 0 {name=p69 sig_type=std_logic lab=vd11}
C {devices/lab_pin.sym} 1500 -390 0 0 {name=p70 sig_type=std_logic lab=vd22}
C {cs_vthref.sym} 0 -490 0 0 {name=X5}
C {devices/lab_pin.sym} 80 -800 0 0 {name=p71 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 80 -180 0 1 {name=p27 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 250 -180 0 1 {name=p29 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 440 -180 0 1 {name=p72 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 470 -240 0 1 {name=p30 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 210 -240 0 0 {name=p31 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 600 -180 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 980 -180 0 0 {name=p33 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1500 -180 0 0 {name=p73 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2030 -180 0 1 {name=p3 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2550 -180 0 1 {name=p42 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 3050 -180 0 1 {name=p53 sig_type=std_logic lab=VSS}
C {symbols/pfet_03v3.sym} 230 -630 0 0 {name=M17
L=0.56u
W=0.49u
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
C {devices/ammeter.sym} 1380 -1070 0 0 {name=Vout2+}
C {devices/ammeter.sym} 1620 -1070 0 0 {name=Vout2-}
C {devices/ammeter.sym} 1910 -1070 0 0 {name=Vout3+}
C {devices/ammeter.sym} 2150 -1070 0 0 {name=Vout3-}
C {devices/ammeter.sym} 2430 -1070 0 0 {name=Vout4+}
C {devices/ammeter.sym} 2670 -1070 0 0 {name=Vout4-}
C {devices/ammeter.sym} 2930 -1070 0 0 {name=Vout5+}
C {devices/ammeter.sym} 3170 -1070 0 0 {name=Vout5-}
C {devices/ammeter.sym} 2030 -1290 0 0 {name=Vout}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
