v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {TODO: Use the current-source module} 750 -570 0 0 0.4 0.4 {}
N 290 -460 320 -460 {
lab=#net1}
N 180 -500 320 -500 {
lab=ref}
N 180 -480 250 -480 {
lab=#net1}
N 250 -480 250 -460 {
lab=#net1}
N 250 -460 290 -460 {
lab=#net1}
C {devices/opin.sym} 620 -480 0 0 {name=p3 lab=out
}
C {devices/code.sym} 538.75 -761.875 0 0 {name=MODELS
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
C {symbol/ldo.sym} 470 -480 0 0 {name=x1}
C {devices/lab_pin.sym} 250 -500 1 0 {name=l3 sig_type=std_logic lab=ref}
C {symbol/bandgap.sym} 100 -500 0 0 {name=x2}
C {devices/iopin.sym} 100 -560 3 0 {name=p1 sig_type=std_logic lab=vin
}
C {devices/iopin.sym} 470 -550 3 0 {name=p4 sig_type=std_logic lab=vin
}
C {devices/iopin.sym} 100 -440 1 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/iopin.sym} 470 -410 1 0 {name=p6 sig_type=std_logic lab=vss}
