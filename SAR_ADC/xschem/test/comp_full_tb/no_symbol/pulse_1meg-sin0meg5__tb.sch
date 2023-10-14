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
N 1070 -230 1070 -220 {
lab=Vin2comp}
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
N 320 -160 320 -150 {
lab=V}
N 240 -160 240 -150 {
lab=clk}
N 100 -80 100 -70 {
lab=Vin2}
N 100 -190 100 -180 {
lab=Vin1}
N 980 -220 1070 -220 {
lab=Vin2comp}
N 980 -280 1050 -280 {
lab=Vin1comp}
N 1050 -290 1050 -280 {
lab=Vin1comp}
N 1050 -290 1070 -290 {
lab=Vin1comp}
N 840 -290 870 -290 {
lab=Vin1preamp}
N 840 -290 840 -270 {
lab=Vin1preamp}
N 820 -270 840 -270 {
lab=Vin1preamp}
N 840 -230 870 -230 {
lab=Vin2preamp}
N 820 -230 840 -230 {
lab=Vin2preamp}
N 820 -230 820 -170 {
lab=Vin2preamp}
N 870 -210 870 -70 {
lab=clk}
N 480 -70 870 -70 {
lab=clk}
N 470 -70 480 -70 {
lab=clk}
N 650 -220 660 -220 {
lab=#net1}
N 650 -220 650 -190 {
lab=#net1}
N 650 -270 660 -270 {
lab=#net2}
N 650 -290 650 -270 {
lab=#net2}
N 660 -180 660 -70 {
lab=clk}
N 570 -150 600 -150 {
lab=GND}
N 740 -130 740 -100 {
lab=GND}
N 470 -130 470 -70 {
lab=clk}
N 740 -330 740 -300 {
lab=V}
N 570 -320 600 -320 {
lab=V}
N 920 -330 920 -320 {
lab=V}
C {jesusu/Simbolos/SR_nor.sym} -1090 1570 0 0 {name=X1}
C {jesusu/Simbolos/preamp.sym} 110 270 0 0 {name=X3}
C {jesusu/Simbolos/strongarm.sym} -1020 1300 0 0 {name=X4}
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
plot \{vindiff\} outcomp
plot vindiff Voutpreamp
plot Voutpreamp Voutcomp
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
C {devices/lab_wire.sym} 840 -290 0 0 {name=p19 sig_type=std_logic lab=Vin1preamp}
C {devices/lab_wire.sym} 840 -230 0 0 {name=p20 sig_type=std_logic lab=Vin2preamp}
C {devices/lab_wire.sym} 1050 -290 0 0 {name=p21 sig_type=std_logic lab=Vin1comp}
C {devices/lab_wire.sym} 1050 -220 0 0 {name=p22 sig_type=std_logic lab=Vin2comp}
C {devices/vsource.sym} 240 -120 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 240 -90 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 240 -160 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 320 -120 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 320 -90 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 320 -160 0 0 {name=p13 sig_type=std_logic lab=V
}
C {devices/vsource.sym} 100 -150 0 0 {name=V1 value="SIN(800m 800m 1meg)"}
C {devices/vsource.sym} 100 -40 0 0 {name=V2 value="pulse(0 1 0 100p 100p 1u 2u)"}
C {devices/gnd.sym} 100 -10 0 0 {name=l3 lab=GND}
C {devices/lab_wire.sym} 100 -190 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 100 -80 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {jesusu/Simbolos/preamp.sym} 280 290 0 0 {name=X7}
C {devices/gnd.sym} 100 -120 0 0 {name=l2 lab=GND}
