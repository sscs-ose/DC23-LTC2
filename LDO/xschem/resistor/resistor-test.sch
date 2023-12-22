v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 300 -570 300 -550 {
lab=GND}
N 300 -650 300 -630 {
lab=vin}
N 470 -380 470 -360 {
lab=GND}
N 420 -370 470 -370 {
lab=GND}
N 420 -480 420 -370 {
lab=GND}
C {devices/gnd.sym} 470 -360 0 0 {name=l1 lab=GND}
C {devices/opin.sym} 490 -480 0 0 {name=p3 lab=out
}
C {devices/code.sym} 228.75 -841.875 0 0 {name=MODELS
only_toplevel=true
place=header
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
"}
C {devices/gnd.sym} 300 -550 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 300 -600 0 0 {name=vin value=4}
C {devices/code_shown.sym} 368.75 -691.875 0 0 {name=NGSPICE
only_toplevel=true
format="tcleval( @value )"
spice_ignore=false
value="
.control
dc vin 0 3.3 0.01
plot V(vin) V(out)
.endc
"}
C {resistor.sym} 470 -480 0 0 {name=x1}
C {devices/iopin.sym} 470 -580 0 0 {name=p1 lab=vin}
C {devices/iopin.sym} 300 -650 0 0 {name=p2 lab=vin}
