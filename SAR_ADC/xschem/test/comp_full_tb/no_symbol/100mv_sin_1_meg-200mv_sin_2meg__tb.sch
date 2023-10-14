v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1150 -190 1150 -100 {
lab=GND}
N 600 -100 1150 -100 {
lab=GND}
N 600 -150 600 -100 {
lab=GND}
N 890 -180 890 -100 {
lab=GND}
N 600 -330 1150 -330 {
lab=V}
N 600 -330 600 -320 {
lab=V}
N 890 -330 890 -320 {
lab=V}
N 960 -290 1070 -290 {
lab=Vin1comp}
N 950 -280 960 -280 {
lab=Vin1comp}
N 960 -290 960 -280 {
lab=Vin1comp}
N 950 -220 1070 -220 {
lab=Vin2comp}
N 1070 -230 1070 -220 {
lab=Vin2comp}
N 750 -210 840 -210 {
lab=clk}
N 470 -200 470 -130 {
lab=clk}
N 470 -200 520 -200 {
lab=clk}
N 1230 -290 1260 -290 {
lab=outcomp}
N 880 -370 910 -370 {
lab=V}
N 880 -370 880 -330 {
lab=V}
N 910 -100 910 -70 {
lab=GND}
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
N 650 -10 740 -10 {
lab=clk}
N 470 -130 470 -10 {
lab=clk}
N 470 -10 490 -10 {
lab=clk}
N 740 -210 750 -210 {
lab=clk}
N 740 -210 740 -10 {
lab=clk}
N 480 -10 650 -10 {
lab=clk}
N 280 -150 280 -140 {
lab=V}
N 200 -150 200 -140 {
lab=clk}
N 130 -150 130 -140 {
lab=Vin2}
N 50 -150 50 -140 {
lab=Vin1}
C {jesusu/Simbolos/SR_nor.sym} -1090 1570 0 0 {name=X1}
C {jesusu/Simbolos/preamp.sym} 140 270 0 0 {name=X3}
C {jesusu/Simbolos/strongarm.sym} -1050 1300 0 0 {name=X4}
C {devices/gnd.sym} 910 -70 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 470 -290 0 0 {name=p10 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 470 -240 0 0 {name=p11 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 470 -200 0 0 {name=p12 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 910 -370 0 0 {name=p14 sig_type=std_logic lab=V
}
C {jesusu/Simbolos/Vdiffmeter.sym} 110 -200 0 0 {name=X5}
C {devices/lab_wire.sym} 180 -360 0 0 {name=p15 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 180 -320 0 0 {name=p16 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 240 -300 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 310 -380 0 0 {name=p17 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 1260 -290 0 0 {name=p18 sig_type=std_logic lab=outcomp
}
C {devices/code_shown.sym} 1280 -230 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 10u  
plot vindiff outcomp
plot vindiff Voutpreamp
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
C {devices/vsource.sym} 50 -110 0 0 {name=V1 value="SIN(100m 1 1meg)"}
C {devices/vsource.sym} 130 -110 0 0 {name=V2 value="SIN(200m 1 2meg)"}
C {devices/vsource.sym} 200 -110 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 50 -80 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 130 -80 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 200 -80 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 50 -150 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 130 -150 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 200 -150 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 280 -110 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 280 -80 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 280 -150 0 0 {name=p13 sig_type=std_logic lab=V
}
