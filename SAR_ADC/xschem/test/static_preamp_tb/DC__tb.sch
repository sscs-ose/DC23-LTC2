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
N 440 70 480 70 {
lab=Vout}
N 480 50 480 70 {
lab=Vout}
N 150 -110 150 -70 {
lab=Vcm}
N 210 -290 250 -290 {
lab=Vcm}
N 210 -330 250 -330 {
lab=Vdif}
N 310 -330 360 -330 {
lab=Vdiff}
N 920 -70 920 10 {
lab=Vout1}
N 920 -110 930 -110 {
lab=Vout1}
N 1100 -60 1100 10 {
lab=Vout2}
N 1100 10 1120 10 {
lab=Vout2}
N 1010 70 1120 70 {
lab=#net1}
N 820 40 870 40 {
lab=Vcm}
N 910 10 920 10 {
lab=Vout1}
N 1010 230 1010 260 {
lab=GND}
N 1010 200 1070 200 {
lab=GND}
N 1070 200 1070 260 {
lab=GND}
N 930 -120 930 -110 {
lab=Vout1}
N 1020 -150 1100 -150 {
lab=V}
N 1020 -180 1020 -150 {
lab=V}
N 1010 70 1010 170 {
lab=#net1}
N 1010 40 1120 40 {
lab=GND}
N 1160 40 1250 40 {
lab=Vdif}
N 920 -110 920 -70 {
lab=Vout1}
N 1100 -120 1100 -60 {
lab=Vout2}
N 1010 260 1070 260 {
lab=GND}
N 930 -150 1020 -150 {
lab=V}
N 910 70 1010 70 {
lab=#net1}
N 910 40 1010 40 {
lab=GND}
N 1010 -180 1100 -180 {
lab=V}
N 930 -180 1010 -180 {
lab=V}
N 950 200 970 200 {
lab=clk}
N 1110 -240 1110 -210 {
lab=V}
N 1070 -210 1110 -210 {
lab=V}
N 1070 -210 1070 -180 {
lab=V}
N 1160 110 1160 260 {
lab=GND}
N 1070 260 1160 260 {
lab=GND}
N 820 20 820 40 {
lab=Vcm}
N 1050 40 1050 120 {
lab=GND}
N 1050 120 1160 120 {
lab=GND}
N 340 70 380 70 {
lab=Vout1}
N 380 70 380 80 {
lab=Vout1}
N 340 110 380 110 {
lab=Vout2}
N 890 -150 890 -80 {
lab=Vout1}
N 890 -80 1140 -80 {
lab=Vout1}
N 1140 -150 1140 -80 {
lab=Vout1}
N 890 -110 920 -110 {
lab=Vout1}
C {devices/vsource.sym} 150 -140 0 0 {name=V1 value=.1u}
C {devices/vsource.sym} 150 -30 0 0 {name=V2 value=1.5}
C {devices/vsource.sym} 300 -140 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 1070 260 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 150 0 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 300 -110 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 150 -180 0 0 {name=p1 sig_type=std_logic lab=Vdif}
C {devices/lab_wire.sym} 150 -70 0 0 {name=p2 sig_type=std_logic lab=Vcm}
C {devices/lab_wire.sym} 300 -180 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 1250 40 0 0 {name=p4 sig_type=std_logic lab=Vdif}
C {devices/lab_wire.sym} 820 40 0 0 {name=p5 sig_type=std_logic lab=Vcm}
C {devices/vsource.sym} 380 -140 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 380 -110 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 380 -180 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1110 -230 0 0 {name=p8 sig_type=std_logic lab=V
}
C {devices/code_shown.sym} 480 -390 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 50n  
plot vdiff   vout
plot vout1 clk
.endc"}
C {devices/code.sym} 50 -400 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/gnd.sym} 410 130 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 480 50 0 0 {name=p15 sig_type=std_logic lab=Vout
}
C {devices/lab_wire.sym} 340 70 0 0 {name=p12 sig_type=std_logic lab=Vout1
}
C {devices/lab_wire.sym} 340 110 0 0 {name=p13 sig_type=std_logic lab=Vout2
}
C {devices/lab_wire.sym} 360 -330 0 0 {name=p9 sig_type=std_logic lab=Vdiff}
C {devices/lab_wire.sym} 210 -330 0 0 {name=p10 sig_type=std_logic lab=Vdif}
C {devices/lab_wire.sym} 210 -290 0 0 {name=p11 sig_type=std_logic lab=Vcm}
C {../../../symbols/Vdiffmeter.sym} 380 130 0 0 {name=X4}
C {../../../symbols/Vdiffmeter.sym} 250 -270 0 0 {name=X1}
C {../../../symbols/strongarm.sym} 350 310 0 0 {name=X2}
C {devices/gnd.sym} 390 320 0 0 {name=l2 lab=GND}
C {symbols/nfet_03v3.sym} 1140 40 0 1 {name=M26
L=.28u
W=4u
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
C {symbols/nfet_03v3.sym} 890 40 0 0 {name=M27
L=.28u
W=4u
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
C {symbols/nfet_03v3.sym} 990 200 0 0 {name=M28
L=.28u
W=.22u
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
C {symbols/pfet_03v3.sym} 910 -150 0 0 {name=M24
L=0.28u
W=.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 1120 -150 0 1 {name=M25
L=0.28u
W=.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/lab_wire.sym} 920 -40 0 0 {name=p14 sig_type=std_logic lab=Vout1
}
C {devices/lab_wire.sym} 1100 -30 0 0 {name=p16 sig_type=std_logic lab=Vout2
}
C {devices/lab_wire.sym} 340 210 0 0 {name=p17 sig_type=std_logic lab=Vout1
}
C {devices/lab_wire.sym} 340 270 0 0 {name=p18 sig_type=std_logic lab=Vout2
}
C {devices/lab_wire.sym} 950 200 0 0 {name=p6 sig_type=std_logic lab=clk
}
