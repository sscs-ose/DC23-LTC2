v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 370 -720 370 -700 {
lab=GND}
N 430 -720 430 -710 {
lab=GND}
N 430 -710 430 -700 {
lab=GND}
N 370 -800 370 -780 {
lab=#net1}
N 430 -800 430 -780 {
lab=VSS}
N 370 -880 370 -860 {
lab=VDD}
N 100 -770 100 -740 {
lab=iref}
N 60 -770 100 -770 {
lab=iref}
N 100 -680 100 -650 {
lab=GND}
N 40 -710 60 -710 {
lab=iref}
N 40 -750 40 -710 {
lab=iref}
N 40 -750 100 -750 {
lab=iref}
N 100 -710 180 -710 {
lab=GND}
N 180 -710 180 -670 {
lab=GND}
N 100 -670 180 -670 {
lab=GND}
C {devices/code_shown.sym} -470 -890 0 0 {name=NGSPICE
only_toplevel=true
value="

*TRANSIENT
*.control
*save all
*tran 1ns 2us
*let iref_in = @m.x1.xm3.m0[id]
*let iref_out = @m.x1.xm4.m0[id]
*plot iref_in iref_out
*plot v(iref)
*plot v(out)
*plot v(op_out)
*plot i(v3)
*plot i(v3)*v(vin)
*.endc

*SUPPLY SWEEP
.control
save all
dc V1 4 0 -0.01
plot v(out) VDD
plot v(x1.vbe) v(out)-v(x1.vbe)
.endc

*TEMPERATURE SWEEP
.control
save all
dc v1 0 4 0.01 TEMP -15 75 15
plot v(out)
.endc

.control
save all
ac dec 200 10 100Meg
settype decibel out
plot vdb(out)
.endc

"}
C {devices/opin.sym} 60 -790 2 1 {name=p13 sig_type=std_logic lab=out
}
C {devices/lab_pin.sym} -20 -850 0 0 {name=l1 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} -20 -730 0 0 {name=l2 sig_type=std_logic lab=VSS}
C {devices/code.sym} -170 -1010 0 0 {name=MODELS
only_toplevel=true
place=header
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice bjt_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
"}
C {devices/vsource.sym} 370 -750 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vsource.sym} 430 -750 0 0 {name=V2 value=0 savecurrent=false}
C {devices/gnd.sym} 370 -700 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 430 -700 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 370 -880 0 0 {name=l5 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 430 -800 0 0 {name=l6 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 370 -830 0 0 {name=V3 value="AC 1"}
C {/workspaces/DC23-LTC2/LDO/xschem/bandgap/bandgap.sym} -20 -790 0 0 {name=x1}
C {symbols/nfet_03v3.sym} 80 -710 0 0 {name=M8
L=0.7u
W=1.66u
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
C {devices/gnd.sym} 100 -650 0 0 {name=l7 lab=GND}
C {devices/opin.sym} 100 -770 2 1 {name=p1 sig_type=std_logic lab=iref
}
