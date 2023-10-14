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
N 190 -170 190 -160 {
lab=Vin2}
N 110 -170 110 -160 {
lab=Vin1}
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
N 680 -290 840 -290 {
lab=Vin1preamp}
N 680 -220 680 -190 {
lab=Vin2preamp}
N 680 -230 840 -230 {
lab=Vin2preamp}
N 680 -230 680 -220 {
lab=Vin2preamp}
N 1230 -230 1230 -130 {
lab=#net1}
N 1070 -220 1070 -130 {
lab=Vin2comp}
C {jesusu/Simbolos/preamp.sym} 140 270 0 0 {name=X3}
C {jesusu/Simbolos/strongarm.sym} -1050 1300 0 0 {name=X4}
C {devices/vsource.sym} 110 -130 0 0 {name=V1 value="SIN(1.6 .4m .1meg)"}
C {devices/vsource.sym} 190 -130 0 0 {name=V2 value="SIN(1.6 .4m .2meg)"}
C {devices/vsource.sym} 260 -130 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 110 -100 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 190 -100 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 260 -100 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 110 -170 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 190 -170 0 0 {name=p5 sig_type=std_logic lab=Vin2}
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
C {devices/lab_wire.sym} 1390 -290 0 0 {name=p18 sig_type=std_logic lab=outcomp
}
C {devices/code_shown.sym} 1830 -250 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 20u  
plot vindiff outcomp
plot vindiff Voutpreamp
plot Voutpreamp Voutcomp
plot outcomp Voutcomp
plot \{vindiff * 1000\} voutcomp
plot \{vindiff * 1000\} outcomp
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
C {devices/lab_wire.sym} 840 -210 0 0 {name=p23 sig_type=std_logic lab=clk
}
C {devices/gnd.sym} 600 -150 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 890 -180 0 0 {name=l10 lab=GND}
C {devices/lab_wire.sym} 1310 -330 0 0 {name=p26 sig_type=std_logic lab=V
}
C {devices/gnd.sym} 1310 -190 0 0 {name=l13 lab=GND}
C {devices/lab_wire.sym} 600 -320 0 0 {name=p27 sig_type=std_logic lab=V
}
C {jesusu/Simbolos/SR_nand.sym} -930 1570 0 0 {name=X1}
C {devices/lab_wire.sym} 1130 -330 0 0 {name=p24 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1130 -170 0 0 {name=p25 sig_type=std_logic lab=V
}
C {devices/gnd.sym} 1130 -250 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 1130 -90 0 0 {name=l11 lab=GND}
C {SAR_ADC/SAR_ADC_gf180/xschem/spice/inv.sym} 1130 -290 0 0 {name=x7 cl=0.28u wp=0.44u wn=0.22u}
C {SAR_ADC/SAR_ADC_gf180/xschem/spice/inv.sym} 1130 -130 0 0 {name=x8 cl=0.28u wp=0.44u wn=0.22u}
