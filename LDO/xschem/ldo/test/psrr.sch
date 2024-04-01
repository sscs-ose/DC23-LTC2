v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Cap Off-chip
Electrolitic Capacitor} 870 -200 0 0 0.4 0.4 {}
N 0 -120 0 -100 {
lab=GND}
N 0 -280 0 -180 {
lab=iref}
N 0 -280 30 -280 {
lab=iref}
N -110 -110 -110 -90 {
lab=GND}
N -110 -310 30 -310 {
lab=ref}
N -110 -310 -110 -170 {
lab=ref}
N 410 -310 500 -310 {
lab=op_out}
N 640 -280 640 -260 { lab=#net1}
N 640 -30 640 -10 { lab=pos}
N 640 -310 740 -310 { lab=vin}
N 640 -50 640 -40 { lab=pos}
N 640 -40 640 -30 { lab=pos}
N 500 -310 600 -310 { lab=op_out}
N 640 -410 640 -340 {
lab=vin}
N 740 -410 740 -310 {
lab=vin}
N 640 -260 640 -230 {
lab=#net1}
N 640 -170 640 -130 {
lab=#net2}
N 640 -10 640 20 {
lab=pos}
N 640 -490 640 -410 {
lab=vin}
N 320 -490 635 -490 {
lab=vin}
N 635 -490 640 -490 {
lab=vin}
N 640 -270 730 -270 {
lab=#net1}
N 640 -70 640 -50 {
lab=pos}
N 640 80 640 110 {
lab=GND}
N 80 -340 80 -20 {
lab=vin_p}
N 80 -340 210 -340 {
lab=vin_p}
N 480 -510 480 -490 {
lab=vin}
N 580 -200 620 -200 {
lab=GND}
N 580 50 620 50 {
lab=GND}
N 320 110 640 110 {
lab=GND}
N 480 110 480 130 {
lab=GND}
N 580 -200 580 50 {
lab=GND}
N 580 50 580 110 {
lab=GND}
N 740 -490 740 -410 {
lab=vin}
N 640 -490 740 -490 {
lab=vin}
N 30 -310 210 -310 {
lab=ref}
N 500 -20 640 -20 {
lab=pos}
N 80 -20 130 -20 {
lab=vin_p}
N 190 -20 500 -20 {
lab=pos}
N 110 -280 210 -280 {
lab=iref}
N 30 -280 110 -280 {
lab=iref}
N 790 -270 810 -270 {
lab=out}
N 320 -130 320 110 {
lab=GND}
N 320 -240 320 -130 {
lab=GND}
N 320 -490 320 -470 {
lab=vin}
N 320 -410 320 -380 {
lab=vdd}
N 320 -240 340 -270 {
lab=GND}
N 210 -280 300 -250 {
lab=iref}
N 320 -380 320 -360 {
lab=vdd}
N 210 -340 260 -290 {
lab=vin_p}
N 210 -310 260 -330 {
lab=ref}
N 400 -310 410 -310 {
lab=op_out}
N 810 -170 810 -150 {
lab=#net3}
N 810 -90 810 -70 {
lab=GND}
N 810 -270 810 -230 {
lab=out}
C {devices/isource.sym} 0 -150 2 0 {name=I1 value=10u
}
C {devices/gnd.sym} 0 -100 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} 480 130 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -110 -90 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -110 -140 0 0 {name=V1 value=1.25}
C {devices/lab_pin.sym} -40 -310 1 0 {name=l3 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} 480 -510 2 0 {name=l4 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 505 -310 1 0 {name=l12 sig_type=std_logic lab=op_out

}
C {symbols/pfet_03v3.sym} 620 -310 0 0 {name=M1
L=0.5u
W=4.38u
nf=1
m=1984
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/ppolyf_u.sym} 640 -200 0 0 {name=R1
W=1e-6
L=164e-6
model=ppolyf_u_2k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 640 50 0 0 {name=R2
W=1e-6
L=100e-6
model=ppolyf_u_2k
spiceprefix=X
m=1}
C {devices/vsource.sym} 640 -100 0 0 {name=v4 value=0}
C {devices/iopin.sym} 810 -270 0 0 {name=p2 lab=out}
C {devices/lab_pin.sym} 495 -20 1 0 {name=l5 sig_type=std_logic lab=pos

}
C {devices/vsource.sym} 160 -20 3 0 {name=vt value=0}
C {devices/vsource.sym} 760 -270 3 0 {name=v2 value=0}
C {devices/vsource.sym} 320 -440 0 0 {name=v5 value=0}
C {symbol/ota.sym} 320 -310 0 0 {name=x1
spice_ignore=0}
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
C {devices/capa.sym} 810 -120 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 810 -200 2 0 {name=R4
value=2
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 810 -70 0 0 {name=l7 lab=GND}
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
C {devices/lab_pin.sym} 320 -380 2 0 {name=l6 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 150 -340 2 0 {name=l9 sig_type=std_logic lab=vin_p}
C {devices/lab_pin.sym} 150 -280 2 0 {name=l11 sig_type=std_logic lab=iref}
C {devices/code_shown.sym} 270 210 0 0 {name="Extracted devices"
only_toplevel=false
spice_ignore=1
value="
.include ../../../../ota/output/extraction/layout_clean/ota_clean.spice
**  iref vin_n vin_p vdd vss vout ota_clean
*x1 iref ref   vin_p vdd GND op_out ota_clean

.include ../../../../ota/output/extraction/layout_pex/ota_pex.spice
*  vin_n vin_p vdd iref vout   vss ota_pex
x1 ref   vin_p vdd iref op_out GND ota_pex
"}
