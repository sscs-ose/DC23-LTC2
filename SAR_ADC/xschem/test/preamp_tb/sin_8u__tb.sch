v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 380 -180 380 -170 {
lab=V}
N 300 -180 300 -170 {
lab=clk}
N 150 -70 150 -60 {
lab=Vcm}
N 150 -180 150 -170 {
lab=Vdif}
N 1000 -140 1040 -140 {
lab=Vout}
N 1040 -160 1040 -140 {
lab=Vout}
N 840 -140 940 -140 {
lab=Vout1}
N 840 -180 840 -140 {
lab=Vout1}
N 830 -180 840 -180 {
lab=Vout1}
N 830 -100 830 -80 {
lab=Vout2}
N 830 -100 940 -100 {
lab=Vout2}
N 150 -110 150 -70 {
lab=Vcm}
N 210 -290 250 -290 {
lab=Vcm}
N 210 -330 250 -330 {
lab=Vdif}
N 310 -330 360 -330 {
lab=Vdiff}
N 810 40 810 70 {
lab=GND}
N 810 70 970 70 {
lab=GND}
N 970 40 970 70 {
lab=GND}
N 940 40 940 70 {
lab=GND}
N 910 40 910 70 {
lab=GND}
N 870 40 870 70 {
lab=GND}
N 840 40 840 70 {
lab=GND}
N 850 -140 850 -0 {
lab=Vout1}
N 840 -0 850 -0 {
lab=Vout1}
N 900 -100 900 -0 {
lab=Vout2}
N 900 -0 940 -0 {
lab=Vout2}
C {devices/vsource.sym} 150 -140 0 0 {name=V1 value="SIN(0 8u 10meg)"}
C {devices/vsource.sym} 150 -30 0 0 {name=V2 value= 1.6}
C {devices/vsource.sym} 300 -140 0 0 {name=V3 value="PULSE(0 3.3 0 10p 10p 7n 15n)"}
C {devices/gnd.sym} 750 -40 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 150 0 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 300 -110 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 150 -180 0 0 {name=p1 sig_type=std_logic lab=Vdif}
C {devices/lab_wire.sym} 150 -70 0 0 {name=p2 sig_type=std_logic lab=Vcm}
C {devices/lab_wire.sym} 300 -180 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 670 -180 0 0 {name=p4 sig_type=std_logic lab=Vdif}
C {devices/lab_wire.sym} 670 -130 0 0 {name=p5 sig_type=std_logic lab=Vcm}
C {devices/lab_wire.sym} 670 -90 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 380 -140 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 380 -110 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 380 -180 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 750 -210 0 0 {name=p8 sig_type=std_logic lab=V
}
C {devices/code_shown.sym} 480 -390 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 100n  
plot \{vdiff * 1000\} vout
plot vdiff vout \{clk / 1000\}
plot Vout1 clk
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
C {devices/lab_wire.sym} 900 -140 0 0 {name=p12 sig_type=std_logic lab=Vout1
}
C {devices/lab_wire.sym} 900 -100 0 0 {name=p13 sig_type=std_logic lab=Vout2
}
C {devices/lab_wire.sym} 360 -330 0 0 {name=p9 sig_type=std_logic lab=Vdiff}
C {devices/lab_wire.sym} 210 -330 0 0 {name=p10 sig_type=std_logic lab=Vdif}
C {devices/lab_wire.sym} 210 -290 0 0 {name=p11 sig_type=std_logic lab=Vcm}
C {symbols/nfet_03v3.sym} 840 20 1 0 {name=M27
L=.28u
W=20u
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
C {symbols/nfet_03v3.sym} 940 20 1 0 {name=M1
L=.28u
W=20u
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
C {devices/gnd.sym} 890 70 0 0 {name=l2 lab=GND}
C {../../../symbols/preamp.sym} 680 -60 0 0 {name=X1}
C {../../../symbols/Vdiffmeter.sym} 250 -270 0 0 {name=X2}
C {../../../symbols/Vdiffmeter.sym} 940 -80 0 0 {name=X3}
