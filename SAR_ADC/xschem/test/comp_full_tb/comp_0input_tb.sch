v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -530 360 -530 {
lab=Vindiff}
N 230 -530 260 -530 {
lab=Vin1}
N 230 -490 260 -490 {
lab=Vin2}
N 390 -340 390 -330 {
lab=V}
N 310 -340 310 -330 {
lab=clk}
N 240 -340 240 -330 {
lab=Vin2}
N 160 -340 160 -330 {
lab=Vin1}
N 360 -550 360 -530 {
lab=Vindiff}
N 630 -480 630 -470 {
lab=V}
N 630 -390 630 -380 {
lab=GND}
N 630 -400 630 -380 {
lab=GND}
N 630 -470 630 -460 {
lab=V}
N 670 -450 720 -450 {
lab=outcomp}
N 670 -450 670 -430 {
lab=outcomp}
C {devices/vsource.sym} 160 -300 0 0 {name=V1 value=2.65}
C {devices/vsource.sym} 240 -300 0 0 {name=V2 value=1.6}
C {devices/vsource.sym} 310 -300 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 630 -380 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 240 -270 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 310 -270 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 160 -340 0 0 {name=p1 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 240 -340 0 0 {name=p2 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 310 -340 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 560 -450 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 560 -410 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 560 -430 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 390 -300 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 390 -270 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 390 -340 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 630 -480 0 0 {name=p8 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 230 -530 0 0 {name=p9 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 230 -490 0 0 {name=p10 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 290 -470 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 360 -550 0 0 {name=p11 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 720 -450 0 0 {name=p12 sig_type=std_logic lab=outcomp
}
C {devices/res.sym} 360 -500 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=2}
C {devices/gnd.sym} 360 -470 0 0 {name=l8 lab=GND}
C {devices/code_shown.sym} 190 -700 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 5p 100n
plot vindiff outcomp
plot vin1 vin2 outcomp clk
.endc"}
C {devices/code.sym} 60 -560 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
"
}
C {Preamp-Strong-Latch.sym} 580 -400 0 0 {name=X1}
C {Vdiffmeter.sym} 260 -470 0 0 {name=X2}
C {devices/gnd.sym} 160 -270 0 0 {name=l2 lab=GND}
