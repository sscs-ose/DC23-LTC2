v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 310 -370 350 -370 {
lab=Vindiff}
N 220 -370 250 -370 {
lab=Vin1}
N 220 -330 250 -330 {
lab=Vin2}
N 380 -180 380 -170 {
lab=V}
N 300 -180 300 -170 {
lab=clk}
N 230 -180 230 -170 {
lab=Vin2}
N 150 -180 150 -170 {
lab=Vin1}
N 350 -390 350 -370 {
lab=Vindiff}
N 1000 -140 1040 -140 {
lab=Vout}
N 1040 -160 1040 -140 {
lab=Vout}
N 840 -140 940 -140 {
lab=#net1}
N 830 -100 940 -100 {
lab=#net2}
N 810 -100 830 -100 {
lab=#net2}
N 810 -160 810 -140 {
lab=#net1}
N 810 -140 840 -140 {
lab=#net1}
C {devices/vsource.sym} 150 -140 0 0 {name=V1 value=1u}
C {devices/vsource.sym} 230 -140 0 0 {name=V2 value=1.6}
C {devices/vsource.sym} 300 -140 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 7n 15n)"}
C {devices/gnd.sym} 750 -60 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 230 -110 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 300 -110 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 150 -180 0 0 {name=p1 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 230 -180 0 0 {name=p2 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 300 -180 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 700 -170 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 700 -110 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 700 -90 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 380 -140 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 380 -110 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 380 -180 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 750 -200 0 0 {name=p8 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 220 -370 0 0 {name=p9 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 220 -330 0 0 {name=p10 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 280 -310 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 350 -390 0 0 {name=p11 sig_type=std_logic lab=Vindiff
}
C {devices/res.sym} 350 -340 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=2}
C {devices/gnd.sym} 350 -310 0 0 {name=l8 lab=GND}
C {devices/code_shown.sym} 740 -540 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 100n  
plot \{vindiff * 1000\} vout
plot vin1
plot vout clk 
.endc"}
C {devices/code.sym} 50 -400 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/gnd.sym} 970 -80 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 1040 -160 0 0 {name=p15 sig_type=std_logic lab=Vout
}
C {devices/res.sym} 1040 -110 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=2}
C {devices/gnd.sym} 1040 -80 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} 150 -110 0 0 {name=p12 sig_type=std_logic lab=Vin2}
C {../../../symbols/strongarm.sym} 710 -70 0 0 {name=X1}
C {../../../symbols/Vdiffmeter.sym} 940 -80 0 0 {name=X3}
C {../../../symbols/Vdiffmeter.sym} 250 -310 0 0 {name=X2}
