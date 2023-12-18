v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 380 -180 380 -170 {
lab=V}
N 230 -180 230 -170 {
lab=reset}
N 150 -180 150 -170 {
lab=set}
N 820 -280 860 -280 {
lab=Vout}
N 860 -300 860 -280 {
lab=Vout}
N 670 -280 760 -280 {
lab=Vq}
N 670 -290 670 -280 {
lab=Vq}
N 670 -240 670 -230 {
lab=#net1}
N 670 -240 760 -240 {
lab=#net1}
C {devices/vsource.sym} 150 -140 0 0 {name=V1 value="PULSE(0 3 0 100p 100p 14n 20n)"}
C {devices/vsource.sym} 230 -140 0 0 {name=V2 value="PULSE(0 3 0 100p 100p 7n 15n)"}
C {devices/gnd.sym} 590 -190 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 150 -110 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 230 -110 0 0 {name=l3 lab=GND}
C {devices/lab_wire.sym} 150 -180 0 0 {name=p1 sig_type=std_logic lab=set}
C {devices/lab_wire.sym} 230 -180 0 0 {name=p2 sig_type=std_logic lab=reset}
C {devices/lab_wire.sym} 510 -290 0 0 {name=p4 sig_type=std_logic lab=set}
C {devices/lab_wire.sym} 510 -230 0 0 {name=p5 sig_type=std_logic lab=reset}
C {devices/vsource.sym} 380 -140 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 380 -110 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 380 -180 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 590 -330 0 0 {name=p8 sig_type=std_logic lab=V
}
C {devices/code_shown.sym} 220 -390 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 100n
plot set reset vout
plot vq
.endc"}
C {devices/code.sym} 50 -400 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/gnd.sym} 790 -220 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 860 -300 0 0 {name=p15 sig_type=std_logic lab=Vout
}
C {devices/res.sym} 860 -250 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=2}
C {devices/gnd.sym} 860 -220 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} 730 -280 0 0 {name=p3 sig_type=std_logic lab=Vq
}
C {../../../symbols/SR_nand.sym} 550 -210 0 0 {name=X1}
C {../../../symbols/Vdiffmeter.sym} 760 -220 0 0 {name=X2}
