v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -720 430 -710 {
lab=GND}
N 430 -710 430 -700 {
lab=GND}
N 430 -800 430 -780 {
lab=VSS}
N 60 -770 100 -770 {
lab=iref}
C {devices/code_shown.sym} -540 -840 0 0 {name=NGSPICE
only_toplevel=true
value="

Vdd VDD 0 PULSE(3.3 0 0 1n 1n 2000n 1000n 1)

*TRANSIENT
.control
save all
tran 1ns 10us
let iref_in = @m.x1.xm3.m0[id]
let iref_out = @m.x1.xm4.m0[id]
plot iref_in iref_out
plot v(iref)
plot v(out) v(VDD)
plot i(v3)
plot i(v3)*v(vin)
.endc

*SUPPLY SWEEP
*.control
*save all
*dc Vdd 5 0 -0.01
*plot v(out) VDD
*plot v(x1.vbe) v(out)-v(x1.vbe)
*.endc

*TEMPERATURE SWEEP
*.control
*save all
*dc v1 0 4 0.01 TEMP -15 75 15
*plot v(out)
*.endc

.control
save all
alter Vdd ac=1
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
C {devices/vsource.sym} 430 -750 0 0 {name=V2 value=0 savecurrent=false}
C {devices/gnd.sym} 430 -700 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 430 -800 0 0 {name=l6 sig_type=std_logic lab=VSS}
C {bandgap.sym} -20 -790 0 0 {name=x1}
C {devices/opin.sym} 100 -770 2 1 {name=p1 sig_type=std_logic lab=iref
}
