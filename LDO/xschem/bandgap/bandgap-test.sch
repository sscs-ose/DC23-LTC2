v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 -760 170 -740 {
lab=GND}
N 270 -760 270 -740 {
lab=GND}
N 170 -840 170 -820 {
lab=VDD}
N 270 -840 270 -820 {
lab=VSS}
N -170 -730 -170 -710 {
lab=GND}
N -170 -790 -90 -790 {
lab=#net1}
C {devices/vsource.sym} 170 -790 0 0 {name=V1 value=3}
C {devices/gnd.sym} 170 -740 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 270 -790 0 0 {name=V2 value=0}
C {devices/gnd.sym} 270 -740 0 0 {name=l4 lab=GND}
C {devices/opin.sym} 170 -840 0 0 {name=p5 sig_type=std_logic lab=VDD
}
C {devices/opin.sym} 270 -840 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {devices/isource.sym} -170 -760 2 0 {name=I1 value=1.5u
}
C {devices/gnd.sym} -170 -710 0 0 {name=l10 lab=GND}
C {devices/code_shown.sym} -470 -890 0 0 {name=NGSPICE
only_toplevel=true
value="
*TRANSIENT
*.control
*save all
*tran 1ns 2us
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
"}
C {devices/opin.sym} 60 -790 2 1 {name=p13 sig_type=std_logic lab=out
}
C {bandgap.sym} -20 -790 0 0 {name=x1}
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
