v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Cap Off-chip
Electrolitic Capacitor} 550 -220 0 0 0.4 0.4 {}
N 0 -120 0 -100 {
lab=GND}
N -110 -120 -110 -100 {
lab=GND}
N 320 -290 410 -290 {
lab=out}
N 470 -290 490 -290 {
lab=#net1}
N 490 -190 490 -170 {
lab=#net2}
N 490 -110 490 -90 {
lab=GND}
N 490 -290 490 -250 {
lab=#net1}
N -110 -220 -110 -180 {
lab=ref}
N 0 -220 0 -180 {
lab=iref}
C {devices/isource.sym} 0 -150 2 0 {name=I1 value=10u
}
C {devices/gnd.sym} 0 -100 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} 170 -220 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -110 -100 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -110 -150 0 0 {name=V1 value=1.25}
C {devices/lab_pin.sym} -110 -200 0 0 {name=l3 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} 170 -360 2 0 {name=l4 sig_type=std_logic lab=vin}
C {devices/iopin.sym} 370 -290 3 0 {name=p2 lab=out}
C {devices/vsource.sym} 440 -290 3 0 {name=v2 value=0}
C {devices/code_shown.sym} -921.25 -581.875 0 0 {name=NGSPICE1
only_toplevel=true
spice_ignore=false
value="
.param R=33
R10 out 0 \{R\}
IL out 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)

.param iref = 10u
.param vdd  = 5
.param vss  = 0.0
.param vcm  = 1.25
.param vac  = 60m
.param w857 = 5u
.param l857 = 1u
.param m857 = 1
.param wpar = 10u
.param lpar = 1u
.param mpar = 1
.param w34  = 10u
.param l34  = 1u
.param m34  = 1
.param w6   = 100u
.param l6   = 1u
.param m6   = 1

.param m5   = 1
.param m7   = 5


Vs vin 0 5

.nodeset v(out)=0
.nodeset v(x1.pos)=0
.nodeset v(x1.feedback)=0

*PSRR_Analysis
.control
reset
alter Vs AC =1
alter Vt AC=0
ac dec 100 1 1G
plot vdb(out)
let phase_val = 180/PI*cph(out)
plot phase_val
*plot (180/pi)*vp(out)
*let gm0=@m.xm0.m0[gm]
*let Zout=(1.5)/(gm0*v(op_out))
*let Zout2=v(out)/gm0
*plot vdb(Zout2)
*wrdata /foss/designs/LDO_Design/data/data_PSRR.dat vdb(out)
meas ac gain_1kh FIND vdb(out) WHEN frequency=1000
.endc
"}
C {devices/capa.sym} 490 -140 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 490 -220 2 0 {name=R4
value=2
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 490 -90 0 0 {name=l7 lab=GND}
C {devices/code.sym} -131.25 -531.875 0 0 {name=MODELS_TT
only_toplevel=true
place=header
spice_ignore=0
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical

.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_typical
"}
C {devices/code.sym} -11.25 -531.875 0 0 {name=MODELS_SS
only_toplevel=true
place=header
spice_ignore=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice ss
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_ss

.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_ss
"}
C {devices/code.sym} 108.75 -531.875 0 0 {name=MODELS_FF
only_toplevel=true
place=header
spice_ignore=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice ff
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_ff

.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_ff
"}
C {devices/lab_pin.sym} 0 -200 0 0 {name=l11 sig_type=std_logic lab=iref}
C {symbol/ldo.sym} 170 -290 0 0 {name=x2
spice_ignore=1}
C {devices/lab_pin.sym} 20 -310 0 0 {name=l5 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} 20 -270 0 0 {name=l6 sig_type=std_logic lab=iref}
C {devices/code_shown.sym} 0 270 0 0 {name="Magic pex extraction"
only_toplevel=false
spice_ignore=0
value="
.include ../../../spice/ldo_pex.spice
**** iref out ref vss vdd ldo_pex
x2   iref out ref GND vin ldo_pex
"}
C {devices/code_shown.sym} 0 30 0 0 {name="Magic clean extraction"
only_toplevel=false
spice_ignore=1
value="
.include ../../../spice/ldo_clean.spice
**** iref out ref vss vdd ldo_clean
x2   iref out ref GND vin ldo_clean
"}
C {devices/code_shown.sym} 0 150 0 0 {name="Klayout clean extraction"
only_toplevel=false
spice_ignore=1
value="
.include ../../../spice/ldo.cir
**** iref out ref vss vdd ldo
x2   iref out ref GND vin ldo
"}
