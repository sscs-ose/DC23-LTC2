v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 190 -590 190 -510 {
lab=vcp}
N 150 -380 190 -380 {
lab=vcm}
N 190 -450 190 -380 {
lab=vcm}
N 720 -590 720 -320 {
lab=vgate}
N 650 -380 650 -280 {
lab=vin}
N 650 -280 690 -280 {
lab=vin}
N 600 -280 650 -280 {
lab=vin}
N 720 -280 720 -260 {
lab=GND}
N 750 -280 830 -280 {
lab=vout}
N 720 -590 860 -590 {
lab=vgate}
N 920 -590 1010 -590 {
lab=negclk}
N 890 -590 890 -570 {
lab=GND}
N 190 -650 210 -650 {
lab=GND}
N 620 -610 620 -590 {
lab=vcp}
N 580 -610 620 -610 {
lab=vcp}
N 580 -610 580 -590 {
lab=vcp}
N 70 -380 90 -380 {
lab=GND}
N 80 -380 80 -360 {
lab=GND}
N 80 -360 120 -360 {
lab=GND}
N 120 -380 120 -360 {
lab=GND}
N 190 -710 190 -680 {
lab=vy}
N 890 -670 890 -630 {
lab=vdd}
N 70 -430 120 -430 {
lab=clk}
N 120 -430 120 -420 {
lab=clk}
N 650 -590 720 -590 {
lab=vgate}
N 430 -540 450 -540 {
lab=#net1}
N 430 -570 430 -540 {
lab=#net1}
N 430 -570 480 -570 {
lab=#net1}
N 480 -570 480 -540 {
lab=#net1}
N 510 -540 620 -540 {
lab=#net2}
N 190 -380 230 -380 {
lab=vcm}
N 230 -400 230 -380 {
lab=vcm}
N 230 -400 260 -400 {
lab=vcm}
N 290 -400 290 -380 {
lab=GND}
N 230 -380 230 -310 {
lab=vcm}
N 230 -310 270 -310 {
lab=vcm}
N 300 -340 300 -310 {
lab=vdd}
N 350 -340 350 -310 {
lab=vin}
N 330 -310 350 -310 {
lab=vin}
N 320 -400 350 -400 {
lab=vin}
N 350 -400 350 -340 {
lab=vin}
N 350 -380 650 -380 {
lab=vin}
N 570 -390 590 -390 {
lab=vin}
N 570 -420 570 -390 {
lab=vin}
N 570 -450 590 -450 {
lab=GND}
N 590 -390 660 -390 {
lab=vin}
N 660 -430 660 -390 {
lab=vin}
N 630 -460 660 -460 {
lab=vdd}
N 630 -510 660 -510 {
lab=#net2}
N 660 -510 660 -490 {
lab=#net2}
N 570 -510 570 -480 {
lab=#net2}
N 570 -510 630 -510 {
lab=#net2}
N 620 -550 620 -510 {
lab=#net2}
N 650 -390 650 -380 {
lab=vin}
N 330 -540 430 -540 {
lab=#net1}
N 190 -540 270 -540 {
lab=vcp}
N 300 -570 300 -540 {
lab=GND}
N 480 -500 480 -480 {
lab=negclk}
N 290 -460 290 -440 {
lab=negclk}
N 300 -270 300 -250 {
lab=clk}
N 480 -490 530 -490 {
lab=negclk}
N 530 -490 530 -450 {
lab=negclk}
N 700 -460 740 -460 {
lab=clk}
N 130 -700 190 -700 {
lab=vy}
N 130 -700 130 -650 {
lab=vy}
N 130 -650 150 -650 {
lab=vy}
N 190 -590 590 -590 {
lab=vcp}
N 190 -620 190 -590 {
lab=vcp}
N 300 -500 300 -490 {
lab=vy}
N 300 -490 320 -490 {
lab=vy}
N 110 -970 110 -950 {
lab=vdd}
N 110 -970 230 -970 {
lab=vdd}
N 230 -970 230 -950 {
lab=vdd}
N 150 -920 160 -920 {
lab=vy}
N 160 -920 200 -880 {
lab=vy}
N 200 -880 230 -880 {
lab=vy}
N 180 -920 190 -920 {
lab=#net3}
N 140 -880 180 -920 {
lab=#net3}
N 110 -880 140 -880 {
lab=#net3}
N 110 -890 110 -850 {
lab=#net3}
N 230 -890 230 -850 {
lab=vy}
N 110 -790 110 -770 {
lab=negclk}
N 230 -790 230 -770 {
lab=clk}
N 230 -920 270 -920 {
lab=GND}
N 70 -920 110 -920 {
lab=GND}
N 120 -50 120 -40 {
lab=GND}
N 190 -50 190 -40 {
lab=GND}
N 410 -50 410 -40 {
lab=GND}
N 120 -120 120 -110 {
lab=vdd}
N 190 -120 190 -110 {
lab=clk}
N 410 -120 410 -110 {
lab=vin}
N 570 -30 570 -20 {
lab=GND}
N 570 -100 570 -90 {
lab=negclk}
C {symbols/nfet_03v3.sym} 720 -300 3 1 {name=M1
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
C {symbols/pfet_03v3.sym} 620 -570 3 0 {name=M2
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
C {symbols/nfet_03v3.sym} 290 -420 1 0 {name=M3
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
C {symbols/nfet_03v3.sym} 890 -610 3 1 {name=M8
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
C {symbols/nfet_03v3.sym} 120 -400 1 0 {name=M6
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
C {devices/lab_pin.sym} 70 -430 0 0 {name=p6 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 600 -280 0 0 {name=p8 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 830 -280 2 0 {name=p9 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 190 -710 3 1 {name=p15 sig_type=std_logic lab=vy}
C {devices/capa.sym} 190 -480 0 0 {name=CB
m=1
value=0.1p
footprint=1206
device="ceramic capacitor"}
C {symbols/pfet_03v3.sym} 480 -520 3 0 {name=Mb
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
C {devices/gnd.sym} 70 -380 1 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} 890 -670 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 720 -260 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 890 -570 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 1010 -590 2 0 {name=p2 sig_type=std_logic lab=negclk}
C {symbols/nfet_03v3.sym} 300 -520 3 0 {name=Mc
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
C {symbols/pfet_03v3.sym} 300 -290 3 0 {name=Mb2
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
C {symbols/nfet_03v3.sym} 550 -450 0 0 {name=M4
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
C {symbols/pfet_03v3.sym} 680 -460 2 0 {name=Mb3
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
C {devices/gnd.sym} 300 -570 2 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 480 -480 3 0 {name=p3 sig_type=std_logic lab=negclk}
C {devices/lab_pin.sym} 290 -460 2 0 {name=p4 sig_type=std_logic lab=negclk}
C {devices/lab_pin.sym} 300 -250 3 0 {name=p5 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 740 -460 2 0 {name=p10 sig_type=std_logic lab=clk}
C {symbols/nfet_03v3.sym} 170 -650 0 0 {name=M5
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
C {devices/gnd.sym} 210 -650 3 1 {name=l4 lab=GND}
C {devices/lab_pin.sym} 320 -490 0 1 {name=p13 sig_type=std_logic lab=vy}
C {symbols/nfet_03v3.sym} 210 -920 0 0 {name=Mc1
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
C {symbols/nfet_03v3.sym} 130 -920 0 1 {name=Mc2
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
C {devices/capa.sym} 230 -820 0 0 {name=CB1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 110 -820 0 0 {name=CB2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 230 -770 2 0 {name=p14 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 110 -770 0 0 {name=p16 sig_type=std_logic lab=negclk}
C {devices/lab_pin.sym} 230 -970 2 0 {name=p17 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 230 -880 0 1 {name=p18 sig_type=std_logic lab=vy}
C {devices/code_shown.sym} 920 -980 0 0 {name=SPICE only_toplevel=false value="
.control



save all
tran 50p 5u 3u

plot vin vout
plot vgate vin
plot clk negclk vy
plot \{vcp-vcm\}
***** For AC analysis *****

*ac dec 200 10 1000Meg
*settype decibel vout
*plot vdb(vout)  
*op
.endc"
}
C {devices/lab_pin.sym} 720 -520 2 0 {name=p19 sig_type=std_logic lab=vgate}
C {devices/gnd.sym} 270 -920 3 0 {name=l6 lab=GND}
C {devices/gnd.sym} 70 -920 1 0 {name=l7 lab=GND}
C {devices/code.sym} 580 -970 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/vsource.sym} 190 -80 0 0 {name=V1 value="PULSE(3.3 0 0 100p 100p 93.75n 187.5n)"}
C {devices/lab_pin.sym} 190 -120 0 0 {name=p20 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 190 -40 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 410 -80 0 0 {name=V2 value="AC 1 sin(1.8 1.4 0.4Meg)"}
C {devices/gnd.sym} 410 -40 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 120 -80 0 0 {name=V3 value=3.3}
C {devices/lab_pin.sym} 120 -120 0 0 {name=p21 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 120 -40 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 410 -120 0 0 {name=p22 sig_type=std_logic lab=vin}
C {devices/vsource.sym} 570 -60 0 0 {name=V4 value="PULSE(0 3.3 0 100p 100p 93.75n 187.5n)"}
C {devices/lab_pin.sym} 570 -100 0 0 {name=p7 sig_type=std_logic lab=negclk}
C {devices/gnd.sym} 570 -20 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 190 -540 0 0 {name=p11 sig_type=std_logic lab=vcp}
C {devices/lab_pin.sym} 190 -440 0 0 {name=p12 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 630 -460 1 0 {name=p23 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 300 -340 0 0 {name=p24 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 290 -380 1 0 {name=l10 lab=GND}
C {devices/gnd.sym} 590 -450 2 0 {name=l13 lab=GND}
