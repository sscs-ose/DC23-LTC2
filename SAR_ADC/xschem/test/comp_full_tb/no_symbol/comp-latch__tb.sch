v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 650 -210 760 -210 {
lab=Vin1comp}
N 640 -200 650 -200 {
lab=Vin1comp}
N 650 -210 650 -200 {
lab=Vin1comp}
N 640 -140 760 -140 {
lab=Vin2comp}
N 760 -150 760 -140 {
lab=Vin2comp}
N 920 -210 950 -210 {
lab=outcomp}
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
N 490 -330 530 -330 {
lab=Voutcomp}
N 400 -330 430 -330 {
lab=Vin1comp}
N 400 -290 430 -290 {
lab=Vin2comp}
N 530 -350 530 -330 {
lab=Voutcomp}
C {jesusu/Simbolos/SR_nor.sym} -1400 1650 0 0 {name=X1}
C {jesusu/Simbolos/strongarm.sym} -1360 1380 0 0 {name=X4}
C {devices/vsource.sym} 110 -130 0 0 {name=V1 value="SIN(2 2 .1meg)"}
C {devices/vsource.sym} 190 -130 0 0 {name=V2 value="SIN(3 3 .2meg)"}
C {devices/vsource.sym} 260 -130 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 580 -100 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 110 -100 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 190 -100 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 260 -100 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 110 -170 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 190 -170 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 260 -170 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 340 -130 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 340 -100 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 340 -170 0 0 {name=p13 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 840 -250 0 0 {name=p14 sig_type=std_logic lab=V
}
C {jesusu/Simbolos/Vdiffmeter.sym} 110 -200 0 0 {name=X5}
C {devices/lab_wire.sym} 180 -360 0 0 {name=p15 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 180 -320 0 0 {name=p16 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 240 -300 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 310 -380 0 0 {name=p17 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 950 -210 0 0 {name=p18 sig_type=std_logic lab=outcomp
}
C {devices/code_shown.sym} 970 -150 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 10u  
plot vindiff outcomp
plot vindiff Voutpreamp
plot Voutpreamp Voutcomp
plot Voutcomp outcomp
plot vin1
.endc"}
C {devices/code.sym} 10 -390 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {jesusu/Simbolos/Vdiffmeter.sym} 330 -170 0 0 {name=X6}
C {devices/lab_wire.sym} 400 -330 0 0 {name=p7 sig_type=std_logic lab=Vin1comp}
C {devices/lab_wire.sym} 400 -290 0 0 {name=p8 sig_type=std_logic lab=Vin2comp}
C {devices/gnd.sym} 460 -270 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} 530 -350 0 0 {name=p9 sig_type=std_logic lab=Voutcomp
}
C {devices/lab_wire.sym} 740 -210 0 0 {name=p21 sig_type=std_logic lab=Vin1comp}
C {devices/lab_wire.sym} 740 -140 0 0 {name=p22 sig_type=std_logic lab=Vin2comp}
C {devices/lab_wire.sym} 530 -210 0 0 {name=p19 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 530 -150 0 0 {name=p23 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 530 -130 0 0 {name=p20 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 580 -240 0 0 {name=p10 sig_type=std_logic lab=V
}
C {devices/gnd.sym} 840 -110 0 0 {name=l9 lab=GND}
