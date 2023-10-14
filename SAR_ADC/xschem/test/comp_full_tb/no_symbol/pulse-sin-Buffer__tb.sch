v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 960 -290 1070 -290 {
lab=Vin1comp}
N 950 -280 960 -280 {
lab=Vin1comp}
N 960 -290 960 -280 {
lab=Vin1comp}
N 950 -220 1070 -220 {
lab=Vin2comp}
N 470 -200 520 -200 {
lab=clk}
N 470 -240 520 -240 {
lab=Vin2}
N 470 -290 520 -290 {
lab=Vin1}
N 270 -360 310 -360 {
lab=Vindiff}
N 180 -360 210 -360 {
lab=Vin1}
N 180 -320 210 -320 {
lab=Vin2}
N 340 -170 340 -160 {
lab=V}
N 260 -170 260 -160 {
lab=clk}
N 310 -380 310 -360 {
lab=Vindiff}
N 790 -460 830 -460 {
lab=Voutpreamp}
N 700 -460 730 -460 {
lab=Vin1preamp}
N 700 -420 730 -420 {
lab=Vin2preamp}
N 830 -480 830 -460 {
lab=Voutpreamp}
N 1060 -460 1100 -460 {
lab=Voutcomp}
N 970 -460 1000 -460 {
lab=Vin1comp}
N 970 -420 1000 -420 {
lab=Vin2comp}
N 1100 -480 1100 -460 {
lab=Voutcomp}
N 680 -220 680 -190 {
lab=Vin2preamp}
N 680 -230 680 -220 {
lab=Vin2preamp}
N 1070 -290 1120 -290 {
lab=Vin1comp}
N 1070 -160 1160 -160 {
lab=Vin2comp}
N 1070 -220 1070 -160 {
lab=Vin2comp}
N 1260 -120 1260 -20 {
lab=#net1}
N 1260 -120 1320 -120 {
lab=#net1}
N 1320 -160 1320 -120 {
lab=#net1}
N 1340 -240 1340 -130 {
lab=#net2}
N 1340 -130 1430 -130 {
lab=#net2}
N 1430 -130 1430 -20 {
lab=#net2}
N 1420 -20 1430 -20 {
lab=#net2}
N 1340 -350 1340 -300 {
lab=#net3}
N 1340 -350 1380 -350 {
lab=#net3}
N 1380 -420 1380 -350 {
lab=#net3}
N 1220 -420 1220 -340 {
lab=#net4}
N 1220 -340 1280 -340 {
lab=#net4}
N 1280 -340 1280 -290 {
lab=#net4}
N 200 -170 200 -160 {
lab=Vin2}
N 120 -170 120 -160 {
lab=Vin1}
N 680 -290 840 -290 {
lab=Vin1preamp}
N 680 -230 840 -230 {
lab=Vin2preamp}
C {jesusu/Simbolos/SR_nor.sym} -820 1560 0 0 {name=X1}
C {jesusu/Simbolos/preamp.sym} 140 270 0 0 {name=X3}
C {jesusu/Simbolos/strongarm.sym} -1050 1300 0 0 {name=X4}
C {devices/vsource.sym} 260 -130 0 0 {name=V3 value="PULSE(0 3 0 10p 10p .5n 1n)"}
C {devices/gnd.sym} 260 -100 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 260 -170 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 470 -290 0 0 {name=p10 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 470 -240 0 0 {name=p11 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 470 -200 0 0 {name=p12 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 340 -130 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 340 -100 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 340 -170 0 0 {name=p13 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 890 -320 0 0 {name=p14 sig_type=std_logic lab=V
}
C {jesusu/Simbolos/Vdiffmeter.sym} 110 -200 0 0 {name=X5}
C {devices/lab_wire.sym} 180 -360 0 0 {name=p15 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 180 -320 0 0 {name=p16 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 240 -300 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 310 -380 0 0 {name=p17 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 1500 -300 0 0 {name=p18 sig_type=std_logic lab=outcomp
}
C {devices/code_shown.sym} 1830 -250 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 10u  
plot vindiff outcomp
plot \{(vin1 + vin2)/2\} vindiff Voutpreamp 
plot  Voutcomp Voutpreamp
plot outcomp Voutcomp
plot vin1 vin2

.endc"}
C {devices/code.sym} 10 -390 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {jesusu/Simbolos/Vdiffmeter.sym} 630 -300 0 0 {name=X2}
C {devices/lab_wire.sym} 700 -460 0 0 {name=p1 sig_type=std_logic lab=Vin1preamp}
C {devices/lab_wire.sym} 700 -420 0 0 {name=p2 sig_type=std_logic lab=Vin2preamp}
C {devices/gnd.sym} 760 -400 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 830 -480 0 0 {name=p3 sig_type=std_logic lab=Voutpreamp
}
C {jesusu/Simbolos/Vdiffmeter.sym} 900 -300 0 0 {name=X6}
C {devices/lab_wire.sym} 970 -460 0 0 {name=p7 sig_type=std_logic lab=Vin1comp}
C {devices/lab_wire.sym} 970 -420 0 0 {name=p8 sig_type=std_logic lab=Vin2comp}
C {devices/gnd.sym} 1030 -400 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} 1100 -480 0 0 {name=p9 sig_type=std_logic lab=Voutcomp
}
C {devices/lab_wire.sym} 680 -290 0 0 {name=p19 sig_type=std_logic lab=Vin1preamp}
C {devices/lab_wire.sym} 680 -190 0 0 {name=p20 sig_type=std_logic lab=Vin2preamp}
C {devices/lab_wire.sym} 1050 -290 0 0 {name=p21 sig_type=std_logic lab=Vin1comp}
C {devices/lab_wire.sym} 1050 -220 0 0 {name=p22 sig_type=std_logic lab=Vin2comp}
C {SAR_ADC/SAR_ADC_gf180/xschem/spice/inv.sym} 1180 -290 0 0 {name=x7 cl=0.28u wp=0.44u wn=0.22u}
C {SAR_ADC/SAR_ADC_gf180/xschem/spice/inv.sym} 1220 -160 0 0 {name=x8 cl=0.28u wp=0.44u wn=0.22u}
C {devices/lab_wire.sym} 840 -210 0 0 {name=p23 sig_type=std_logic lab=clk
}
C {devices/gnd.sym} 600 -150 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 890 -180 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} 1220 -120 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 1180 -250 0 0 {name=l12 lab=GND}
C {devices/lab_wire.sym} 1180 -330 0 0 {name=p24 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1220 -200 0 0 {name=p25 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1420 -340 0 0 {name=p26 sig_type=std_logic lab=V
}
C {devices/gnd.sym} 1420 -200 0 0 {name=l13 lab=GND}
C {devices/lab_wire.sym} 600 -320 0 0 {name=p27 sig_type=std_logic lab=V
}
C {SAR_ADC/SAR_ADC_gf180/xschem/spice/inv.sym} 1280 -420 0 0 {name=x9 cl=0.28u wp=0.44u wn=0.22u}
C {SAR_ADC/SAR_ADC_gf180/xschem/spice/inv.sym} 1320 -20 0 0 {name=x10 cl=0.28u wp=0.44u wn=0.22u}
C {devices/gnd.sym} 1280 -380 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 1320 20 0 0 {name=l14 lab=GND}
C {devices/lab_wire.sym} 1320 -60 0 0 {name=p28 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1280 -460 0 0 {name=p29 sig_type=std_logic lab=V
}
C {devices/vsource.sym} 120 -130 0 0 {name=V1 value="PULSE(1.7 1.2 0 1n 1n 500n 1000n)"}
C {devices/vsource.sym} 200 -130 0 0 {name=V2 value="SIN(1.6 1 0.5meg)"}
C {devices/gnd.sym} 120 -100 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 200 -100 0 0 {name=l3 lab=GND}
C {devices/lab_wire.sym} 120 -170 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 200 -170 0 0 {name=p5 sig_type=std_logic lab=Vin2}
