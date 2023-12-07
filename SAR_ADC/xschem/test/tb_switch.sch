v {xschem version=3.1.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 80 -80 80 -60 {
lab=t}
N 80 -80 90 -80 {
lab=t}
N 130 -80 140 -80 {
lab=GND}
N 140 -80 140 -60 {
lab=GND}
N 170 -140 250 -140 {
lab=out}
C {/home/designer/repositories/SAR_ADC_gf180/xschem/spice/switch.sym} 110 -180 0 0 {name=S1 model=swm1 initalstate=ON}
C {devices/code_shown.sym} -365 -345 0 0 {name=NGSPICE only_toplevel=false value="
.include /home/designer/.volare/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /home/designer/.volare/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /home/designer/.volare/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib /home/designer/.volare/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim

.param period=10n
.param stoptime=\{6*period\}

.model swm1 sw vt=1 vh=0.2 ron=0.1 roff=100k

.tran \{0.01*stoptime\} \{stoptime\} uic

.control
save all
run
plot V(t) V(out)
.endc
"}
C {devices/capa.sym} 170 -110 0 0 {name=C1
m=1
value=10n
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 170 -80 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 80 0 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 50 -110 0 1 {name=VIN value=3.3}
C {devices/gnd.sym} 50 -80 0 1 {name=l3 lab=GND}
C {devices/vsource.sym} 80 -30 0 0 {name=VT value="PULSE(0 3.3 \{0*period\} 1ps 1ps \{period/2\} \{period\})"}
C {devices/gnd.sym} 140 -60 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 170 -140 1 0 {name=l5 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} 50 -140 1 0 {name=l6 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 80 -80 0 0 {name=l7 sig_type=std_logic lab=t}
C {devices/res.sym} 250 -110 0 0 {name=R1
value=1
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 250 -80 0 0 {name=l8 lab=GND}
