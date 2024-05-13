v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -520 130 -520 150 {
lab=vin}
N -620 130 -620 150 {
lab=GND}
N 30 -160 120 -160 {
lab=#net1}
N 180 -160 200 -160 {
lab=out}
N -430 -140 -430 -130 {
lab=vin_p}
N -430 -70 -430 -60 {
lab=#net2}
N 200 -40 200 -20 {
lab=#net3}
N 200 -160 200 -100 {
lab=out}
N 200 40 200 60 {
lab=GND}
N 30 -100 80 -100 {
lab=GND}
N -340 -140 -270 -140 {
lab=feedback}
N -450 -140 -400 -140 {
lab=vin_p}
N -450 -200 -450 -140 {
lab=vin_p}
N -450 -200 -310 -200 {
lab=vin_p}
N -310 -200 -310 -160 {
lab=vin_p}
N -310 -160 -270 -160 {
lab=vin_p}
N -620 30 -620 70 {
lab=ref}
N -520 30 -520 70 {
lab=iref}
C {devices/isource.sym} -520 100 2 0 {name=I1 value=10u
}
C {devices/gnd.sym} -620 150 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -620 100 0 0 {name=V1 value=1.25}
C {devices/lab_pin.sym} -620 50 2 0 {name=l3 sig_type=std_logic lab=ref}
C {devices/iopin.sym} 200 -160 0 0 {name=p2 lab=out}
C {devices/vsource.sym} -430 -30 0 0 {name=vt value=0}
C {devices/vsource.sym} 150 -160 3 0 {name=v2 value=0}
C {devices/res.sym} -370 -140 1 0 {name=R3
value=1G
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} -430 -100 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -430 0 0 0 {name=l5 lab=GND}
C {devices/code.sym} -491.25 -411.875 0 0 {name=MODELS_TT
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
C {devices/code_shown.sym} -1131.25 -441.875 0 0 {name=NGSPICE
only_toplevel=true
spice_ignore=false
value="
.param R=66k
*.param R=33
R10 out 0 \{R\}
*IL out 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
*CL out 0 10u

.param iref = 10u
.param vdd  = 5
.param vss  = 0.0
.param vcm  = 1.25
.param vac  = 60m

Vs vin 0 5

.nodeset v(out)=0
.nodeset v(x2.pos)=0
.nodeset v(feedback)=1.25

*Stability_Analysis (openloop)
.control
reset
alter Vs AC=0
alter Vt AC=1
ac dec 100 1 1G
let phase_val = 180/PI*cph(out)
plot phase_val vdb(out)
meas ac pm       FIND phase_val WHEN vdb(out)=0
meas ac cut_freq FIND frequency WHEN vdb(out)=0

.endc
"}
C {devices/lab_pin.sym} -520 150 3 0 {name=l6 sig_type=std_logic lab=vin}
C {devices/capa.sym} 200 10 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 200 -70 2 0 {name=R4
value=2
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 200 60 0 0 {name=l7 lab=GND}
C {devices/code.sym} -371.25 -411.875 0 0 {name=MODELS_SS
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
C {devices/code.sym} -251.25 -411.875 0 0 {name=MODELS_FF
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
C {devices/code_shown.sym} -330 120 0 0 {name="Extracted devices"
only_toplevel=false
spice_ignore=0
value="
*.include ../../../spice/TOP_CHILE_OPEN_LDO_pex.spice
*.include ../../../spice/TOP_CHILE_OPEN_LDO_pex.edited.spice
.include ../../../spice/TOP_CHILE_OPEN_LDO_pex.cleaned.spice

*****  iref vin_p vss feedback ref out vdd TOP_CHILE_OPEN_LDO_pex
x2     iref vin_p GND feedback ref out vdd TOP_CHILE_OPEN_LDO_pex
"}
C {devices/lab_pin.sym} -520 50 2 0 {name=l9 sig_type=std_logic lab=iref}
C {symbol/TOP_CHILE_OPEN_LDO.sym} -120 -120 0 0 {name=x2
spice_ignore=1}
C {devices/lab_pin.sym} 30 -140 2 0 {name=l11 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 30 -120 2 0 {name=l13 sig_type=std_logic lab=vin}
C {devices/gnd.sym} 80 -100 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} 30 -80 2 0 {name=l15 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} -310 -190 0 0 {name=p1 sig_type=std_logic lab=vin_p}
C {devices/lab_pin.sym} -300 -140 3 0 {name=p3 sig_type=std_logic lab=feedback}
