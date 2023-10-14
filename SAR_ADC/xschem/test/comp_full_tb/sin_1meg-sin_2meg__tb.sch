v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 270 -600 310 -600 {
lab=Vindiff}
N 180 -600 210 -600 {
lab=Vin1}
N 180 -560 210 -560 {
lab=Vin2}
N 490 -550 510 -550 {
lab=Vin1}
N 490 -520 510 -520 {
lab=clk}
N 490 -480 510 -480 {
lab=Vin2}
N 340 -410 340 -400 {
lab=V}
N 260 -410 260 -400 {
lab=clk}
N 190 -410 190 -400 {
lab=Vin2}
N 110 -410 110 -400 {
lab=Vin1}
N 310 -620 310 -600 {
lab=Vindiff}
C {jesusu/Simbolos/Preamp-Strong-Latch.sym} -3830 3130 0 0 {name=X1}
C {devices/vsource.sym} 110 -370 0 0 {name=V1 value="SIN(1 1 1meg)"}
C {devices/vsource.sym} 190 -370 0 0 {name=V2 value="SIN(1 1 2meg)"}
C {devices/vsource.sym} 260 -370 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 590 -450 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 110 -340 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 190 -340 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 260 -340 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 110 -410 0 0 {name=p1 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 190 -410 0 0 {name=p2 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 260 -410 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 490 -550 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 490 -480 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 490 -520 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 340 -370 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 340 -340 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 340 -410 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 590 -590 0 0 {name=p8 sig_type=std_logic lab=V
}
C {jesusu/Simbolos/Vdiffmeter.sym} 110 -440 0 0 {name=X2}
C {devices/lab_wire.sym} 180 -600 0 0 {name=p9 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 180 -560 0 0 {name=p10 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 240 -540 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 310 -620 0 0 {name=p11 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 670 -520 0 0 {name=p12 sig_type=std_logic lab=outcomp
}
C {devices/res.sym} 310 -570 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=2}
C {devices/res.sym} 670 -490 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 670 -460 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 310 -540 0 0 {name=l8 lab=GND}
C {devices/code_shown.sym} 30 -740 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 10u  
plot vindiff outcomp
.endc"}
C {devices/code.sym} 10 -630 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
