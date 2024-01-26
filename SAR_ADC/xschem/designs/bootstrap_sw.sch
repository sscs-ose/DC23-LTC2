v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 180 -390 180 -310 {
lab=#net1}
N 140 -180 180 -180 {
lab=#net2}
N 180 -250 180 -180 {
lab=#net2}
N 710 -390 710 -120 {
lab=#net3}
N 640 -180 640 -80 {
lab=vin}
N 640 -80 680 -80 {
lab=vin}
N 590 -80 640 -80 {
lab=vin}
N 710 -80 710 -60 {
lab=vss}
N 740 -80 820 -80 {
lab=vout}
N 710 -390 850 -390 {
lab=#net3}
N 910 -390 1000 -390 {
lab=negclk}
N 880 -390 880 -370 {
lab=vss}
N 180 -450 200 -450 {
lab=vss}
N 610 -410 610 -390 {
lab=#net1}
N 570 -410 610 -410 {
lab=#net1}
N 570 -410 570 -390 {
lab=#net1}
N 60 -180 80 -180 {
lab=vss}
N 70 -180 70 -160 {
lab=vss}
N 70 -160 110 -160 {
lab=vss}
N 110 -180 110 -160 {
lab=vss}
N 180 -510 180 -480 {
lab=vy}
N 880 -470 880 -430 {
lab=vdd}
N 60 -230 110 -230 {
lab=clk}
N 110 -230 110 -220 {
lab=clk}
N 640 -390 710 -390 {
lab=#net3}
N 420 -340 440 -340 {
lab=#net4}
N 420 -370 420 -340 {
lab=#net4}
N 420 -370 470 -370 {
lab=#net4}
N 470 -370 470 -340 {
lab=#net4}
N 500 -340 610 -340 {
lab=#net5}
N 180 -180 220 -180 {
lab=#net2}
N 220 -200 220 -180 {
lab=#net2}
N 220 -200 250 -200 {
lab=#net2}
N 280 -200 280 -180 {
lab=vss}
N 220 -180 220 -110 {
lab=#net2}
N 220 -110 260 -110 {
lab=#net2}
N 290 -140 290 -110 {
lab=vdd}
N 340 -140 340 -110 {
lab=vin}
N 320 -110 340 -110 {
lab=vin}
N 310 -200 340 -200 {
lab=vin}
N 340 -200 340 -140 {
lab=vin}
N 340 -180 640 -180 {
lab=vin}
N 560 -190 580 -190 {
lab=vin}
N 560 -220 560 -190 {
lab=vin}
N 560 -250 580 -250 {
lab=vss}
N 580 -190 650 -190 {
lab=vin}
N 650 -230 650 -190 {
lab=vin}
N 620 -260 650 -260 {
lab=vdd}
N 620 -310 650 -310 {
lab=#net5}
N 650 -310 650 -290 {
lab=#net5}
N 560 -310 560 -280 {
lab=#net5}
N 560 -310 620 -310 {
lab=#net5}
N 610 -350 610 -310 {
lab=#net5}
N 640 -190 640 -180 {
lab=vin}
N 320 -340 420 -340 {
lab=#net4}
N 180 -340 260 -340 {
lab=#net1}
N 290 -370 290 -340 {
lab=vss}
N 470 -300 470 -280 {
lab=negclk}
N 280 -260 280 -240 {
lab=negclk}
N 290 -70 290 -50 {
lab=clk}
N 470 -290 520 -290 {
lab=negclk}
N 520 -290 520 -250 {
lab=negclk}
N 690 -260 730 -260 {
lab=clk}
N 120 -500 180 -500 {
lab=vy}
N 120 -500 120 -450 {
lab=vy}
N 120 -450 140 -450 {
lab=vy}
N 180 -390 580 -390 {
lab=#net1}
N 180 -420 180 -390 {
lab=#net1}
N 290 -300 290 -290 {
lab=vy}
N 290 -290 310 -290 {
lab=vy}
N 100 -770 100 -750 {
lab=vdd}
N 100 -770 220 -770 {
lab=vdd}
N 220 -770 220 -750 {
lab=vdd}
N 140 -720 150 -720 {
lab=vy}
N 150 -720 190 -680 {
lab=vy}
N 190 -680 220 -680 {
lab=vy}
N 170 -720 180 -720 {
lab=#net6}
N 130 -680 170 -720 {
lab=#net6}
N 100 -680 130 -680 {
lab=#net6}
N 100 -690 100 -650 {
lab=#net6}
N 220 -690 220 -650 {
lab=vy}
N 100 -590 100 -570 {
lab=negclk}
N 220 -590 220 -570 {
lab=clk}
N 220 -720 260 -720 {
lab=vss}
N 60 -720 100 -720 {
lab=vss}
C {symbols/nfet_03v3.sym} 710 -100 3 1 {name=M1
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
C {symbols/pfet_03v3.sym} 610 -370 3 0 {name=M2
L=0.28u
W=5u
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
C {symbols/nfet_03v3.sym} 280 -220 1 0 {name=M3
L=0.28u
W=0.3u
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
C {symbols/nfet_03v3.sym} 880 -410 3 1 {name=M8
L=0.28u
W=5u
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
C {symbols/nfet_03v3.sym} 110 -200 1 0 {name=M6
L=0.28u
W=0.28u
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
C {devices/lab_wire.sym} 60 -230 0 0 {name=p6 sig_type=std_logic lab=clk}
C {devices/lab_wire.sym} 590 -80 0 0 {name=p8 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 820 -80 2 0 {name=p9 sig_type=std_logic lab=vout}
C {devices/lab_wire.sym} 180 -510 3 1 {name=p15 sig_type=std_logic lab=vy}
C {devices/capa.sym} 180 -280 0 0 {name=CB
m=1
value=0.1p
footprint=1206
device="ceramic capacitor"}
C {symbols/pfet_03v3.sym} 470 -320 3 0 {name=Mb
L=0.28u
W=0.28u
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
C {devices/lab_wire.sym} 880 -470 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1000 -390 2 0 {name=p2 sig_type=std_logic lab=negclk}
C {symbols/nfet_03v3.sym} 290 -320 3 0 {name=Mc
L=0.28u
W=0.28u
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
C {symbols/pfet_03v3.sym} 290 -90 3 0 {name=Mb2
L=0.28u
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
C {symbols/nfet_03v3.sym} 540 -250 0 0 {name=M4
L=0.28u
W=0.3u
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
C {symbols/pfet_03v3.sym} 670 -260 2 0 {name=Mb3
L=0.28u
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
C {devices/lab_wire.sym} 470 -280 3 0 {name=p3 sig_type=std_logic lab=negclk}
C {devices/lab_wire.sym} 280 -260 2 0 {name=p4 sig_type=std_logic lab=negclk}
C {devices/lab_wire.sym} 290 -50 3 0 {name=p5 sig_type=std_logic lab=clk}
C {devices/lab_wire.sym} 730 -260 2 0 {name=p10 sig_type=std_logic lab=clk}
C {symbols/nfet_03v3.sym} 160 -450 0 0 {name=M5
L=0.28u
W=0.28u
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
C {devices/lab_wire.sym} 310 -290 0 1 {name=p13 sig_type=std_logic lab=vy}
C {symbols/nfet_03v3.sym} 200 -720 0 0 {name=Mc1
L=0.28u
W=0.28u
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
C {symbols/nfet_03v3.sym} 120 -720 0 1 {name=Mc2
L=0.28u
W=0.28u
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
C {devices/capa.sym} 220 -620 0 0 {name=CB1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 100 -620 0 0 {name=CB2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_wire.sym} 220 -570 2 0 {name=p14 sig_type=std_logic lab=clk}
C {devices/lab_wire.sym} 100 -570 0 0 {name=p16 sig_type=std_logic lab=negclk}
C {devices/lab_wire.sym} 220 -770 2 0 {name=p17 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 220 -680 0 1 {name=p18 sig_type=std_logic lab=vy}
C {devices/lab_wire.sym} 620 -260 1 0 {name=p23 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 290 -140 0 0 {name=p24 sig_type=std_logic lab=vdd}
C {devices/iopin.sym} 460 -750 0 0 {name=p7 lab=vdd}
C {devices/iopin.sym} 460 -720 0 0 {name=p11 lab=vss}
C {devices/ipin.sym} 460 -690 0 0 {name=p19 lab=vin}
C {devices/opin.sym} 460 -660 0 0 {name=p20 lab=vout}
C {devices/lab_wire.sym} 60 -180 0 0 {name=p21 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 280 -180 0 0 {name=p22 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 710 -60 3 0 {name=p25 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 580 -250 1 0 {name=p26 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 290 -370 0 0 {name=p27 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 200 -450 2 0 {name=p28 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 880 -370 3 0 {name=p29 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 260 -720 2 0 {name=p30 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 60 -720 0 0 {name=p31 sig_type=std_logic lab=vss}
