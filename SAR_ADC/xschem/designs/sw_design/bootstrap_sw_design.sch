v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 130 -590 590 -590 {
lab=vcp}
N 190 -590 190 -510 {
lab=vcp}
N 340 -470 340 -450 {
lab=#net1}
N 280 -500 300 -500 {
lab=negclk}
N 280 -500 280 -420 {
lab=negclk}
N 340 -500 360 -500 {
lab=vdd}
N 360 -540 360 -500 {
lab=vdd}
N 340 -540 360 -540 {
lab=vdd}
N 340 -420 360 -420 {
lab=vcm}
N 360 -420 360 -380 {
lab=vcm}
N 530 -460 530 -450 {
lab=#net1}
N 150 -380 190 -380 {
lab=vcm}
N 190 -450 190 -380 {
lab=vcm}
N 340 -390 340 -380 {
lab=vcm}
N 190 -380 530 -380 {
lab=vcm}
N 530 -390 530 -380 {
lab=vcm}
N 510 -420 530 -420 {
lab=GND}
N 530 -460 620 -460 {
lab=#net1}
N 620 -550 620 -460 {
lab=#net1}
N 530 -380 590 -380 {
lab=vcm}
N 570 -420 620 -420 {
lab=vgate}
N 620 -380 620 -360 {
lab=GND}
N 720 -590 720 -320 {
lab=vgate}
N 620 -420 720 -420 {
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
N 790 -280 790 -240 {
lab=vout}
N 720 -590 860 -590 {
lab=vgate}
N 920 -590 1010 -590 {
lab=vclose}
N 1070 -590 1110 -590 {
lab=GND}
N 890 -590 890 -570 {
lab=GND}
N 1040 -590 1040 -570 {
lab=GND}
N 100 -590 100 -570 {
lab=vcp}
N 100 -570 140 -570 {
lab=vcp}
N 140 -590 140 -570 {
lab=vcp}
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
N 790 -180 790 -160 {
lab=GND}
N 100 -670 100 -630 {
lab=vgate}
N 100 -670 720 -670 {
lab=vgate}
N 720 -670 720 -590 {
lab=vgate}
N 40 -590 70 -590 {
lab=vdd}
N 890 -670 890 -630 {
lab=vdd}
N 70 -430 120 -430 {
lab=clk}
N 120 -430 120 -420 {
lab=clk}
N 1040 -670 1040 -630 {
lab=clk}
N 340 -560 340 -530 {
lab=vdd}
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
N 340 -460 530 -460 {
lab=#net1}
N 360 -910 360 -890 {
lab=vdd}
N 360 -750 360 -720 {
lab=GND}
N 280 -820 300 -820 {
lab=clk}
N 270 -420 300 -420 {
lab=negclk}
N 300 -860 320 -860 {
lab=clk}
N 300 -860 300 -780 {
lab=clk}
N 300 -780 320 -780 {
lab=clk}
N 360 -830 360 -810 {
lab=negclk}
N 360 -820 450 -820 {
lab=negclk}
N 360 -860 380 -860 {
lab=vdd}
N 380 -900 380 -860 {
lab=vdd}
N 360 -900 380 -900 {
lab=vdd}
N 360 -780 380 -780 {
lab=GND}
N 380 -780 380 -740 {
lab=GND}
N 360 -740 380 -740 {
lab=GND}
N 970 -670 970 -590 {
lab=vclose}
N 650 -590 720 -590 {
lab=vgate}
C {symbols/nfet_03v3.sym} 720 -300 1 0 {name=M1
L=0.28u
W=\{wmos1\}
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
W=\{wmos26\}
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
C {symbols/nfet_03v3.sym} 620 -400 1 0 {name=M3
L=0.28u
W=\{wmos35\}
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
W=\{wmos26\}
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
C {symbols/nfet_03v3.sym} 1040 -610 3 1 {name=M4
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
C {symbols/pfet_03v3.sym} 100 -610 3 1 {name=M5
L=0.28u
W=\{wmos35\}
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
C {devices/vsource.sym} 190 -80 0 0 {name=V1 value="PULSE(3 0 0 100p 100p 7.81n 187.5n)"}
C {devices/lab_pin.sym} 190 -120 0 0 {name=p2 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 190 -40 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 70 -430 0 0 {name=p6 sig_type=std_logic lab=clk}
C {devices/vsource.sym} 410 -80 0 0 {name=V2 value="AC 1 sin(1.8 1.4 2Meg)"}
C {devices/lab_pin.sym} 600 -280 0 0 {name=p8 sig_type=std_logic lab=vin}
C {devices/gnd.sym} 410 -40 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 830 -280 2 0 {name=p9 sig_type=std_logic lab=vout}
C {devices/vsource.sym} 120 -80 0 0 {name=V3 value=3.3}
C {devices/lab_pin.sym} 120 -120 0 0 {name=p10 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 120 -40 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 190 -560 0 0 {name=p13 sig_type=std_logic lab=vcp}
C {devices/lab_pin.sym} 190 -430 0 0 {name=p14 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 40 -590 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/capa.sym} 790 -210 0 0 {name=C1
m=1
value=4.5p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 190 -480 0 0 {name=CB
m=1
value=\{CB\}
footprint=1206
device="ceramic capacitor"}
C {symbols/nfet_03v3.sym} 550 -420 0 1 {name=Mc
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
C {symbols/nfet_03v3.sym} 320 -420 0 0 {name=Ma
L=0.28u
W=0.25u
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
C {symbols/pfet_03v3.sym} 320 -500 0 0 {name=Mb
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
C {devices/gnd.sym} 70 -380 1 0 {name=l12 lab=GND}
C {devices/gnd.sym} 790 -160 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 1110 -590 3 0 {name=l15 lab=GND}
C {devices/lab_pin.sym} 890 -670 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 340 -560 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 1040 -670 0 0 {name=p4 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 410 -120 0 0 {name=p5 sig_type=std_logic lab=vin}
C {devices/code.sym} 0 -800 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/lab_pin.sym} 360 -910 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/gnd.sym} 360 -720 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 280 -820 0 0 {name=p11 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 450 -820 2 0 {name=p12 sig_type=std_logic lab=negclk}
C {devices/lab_pin.sym} 270 -420 0 0 {name=p16 sig_type=std_logic lab=negclk}
C {devices/code_shown.sym} 1170 -780 0 0 {name=SPICE only_toplevel=false value="
.param CB=1p
.param wmos35=3u
.param wmos26=0.28u
.param wmos1=15u
.control


***** for W_MOS M2-M6 *****

*compose wid values 0.28u 1.5u 5u 15u  
*foreach widmos $&wid
*alterparam wmos26=$widmos 

***** for W_MOS M3-M5 *****

*compose wid values 3u 5u 10u 20u  
*foreach widmos $&wid
*alterparam wmos35=$widmos 

***** for W_MOS M1 *****

*compose wid values 8u 10u 15u 20u  
*foreach widmos $&wid
*alterparam wmos1=$widmos 

*reset

save all
tran 50p 5u 3u
*wrdata /foss/designs/sw_comp_gf180/bootstrap_switch/data/data_vout_m26.dat vin vout
*set appendwrite
*end

plot vclose
plot vin vout
plot vgate vin

***** For AC analysis *****

*ac dec 200 10 1000Meg
*settype decibel vout
*plot vdb(vout)  
*op
.endc"
}
C {symbols/nfet_03v3.sym} 340 -780 0 0 {name=Ma1
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
C {symbols/pfet_03v3.sym} 340 -860 0 0 {name=Mb1
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
C {devices/gnd.sym} 720 -260 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 620 -360 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 890 -570 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 1040 -570 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 510 -420 1 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 970 -670 0 0 {name=p17 sig_type=std_logic lab=vclose}
C {devices/lab_pin.sym} 720 -480 2 0 {name=p18 sig_type=std_logic lab=vgate}
