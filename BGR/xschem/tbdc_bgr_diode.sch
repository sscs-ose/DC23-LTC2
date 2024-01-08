v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 -70 30 -30 {
lab=GND}
N 150 -50 150 -40 {
lab=GND}
N 30 -40 150 -40 {
lab=GND}
N 150 -220 150 -210 {
lab=#net1}
N 30 -220 150 -220 {
lab=#net1}
N 30 -220 30 -130 {
lab=#net1}
N 210 -170 250 -170 {
lab=vout}
N 250 -170 250 -150 {
lab=vout}
N 250 -90 250 -40 {
lab=GND}
N 150 -40 250 -40 {
lab=GND}
C {devices/code.sym} -120 -120 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice bjt_typical
* .lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/gnd.sym} 30 -30 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 30 -100 0 0 {name=Vdd value=3.3}
C {devices/code_shown.sym} -220 -290 0 0 {name=control only_toplevel=false value=".control
save all
dc vdd 3.0 3.6 0.1
plot vout
dc temp -50 125 25
plot vout
.endc"}
C {devices/lab_pin.sym} 250 -170 0 1 {name=p3 sig_type=std_logic lab=vout}
C {bgr_diode.sym} 90 -30 0 0 {name=X1}
C {devices/capa.sym} 250 -120 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
