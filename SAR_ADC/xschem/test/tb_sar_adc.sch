v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 0 30 25 30 {
lab=#net1}
N 25 20 25 30 {
lab=#net1}
N 0 -30 25 -30 {
lab=#net2}
N 25 -30 25 -20 {
lab=#net2}
C {/foss/designs/sar_adc/xschem/spice/sar_adc.sym} 120 0 0 0 {name=x1}
C {devices/code_shown.sym} -795 -275 0 0 {name=NGSPICE only_toplevel=false value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice cap_mim

.param cu=5u
.param period=100u
.param stoptime=\{15*period\}

vd0  d[0]  0 PULSE(0 3.3 \{0*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd1  d[1]  0 PULSE(0 3.3 \{1*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd2  d[2]  0 PULSE(0 3.3 \{2*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd3  d[3]  0 PULSE(0 3.3 \{3*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd4  d[4]  0 PULSE(0 3.3 \{4*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd5  d[5]  0 PULSE(0 3.3 \{5*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd6  d[6]  0 PULSE(0 3.3 \{6*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd7  d[7]  0 PULSE(0 3.3 \{7*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd8  d[8]  0 PULSE(0 3.3 \{8*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd9  d[9]  0 PULSE(0 3.3 \{9*period\}  1ps 1ps \{period/2\} \{period\} 1)
vd10 d[10] 0 PULSE(0 3.3 \{10*period\} 1ps 1ps \{period/2\} \{period\} 1)
vd11 d[11] 0 PULSE(0 3.3 \{11*period\} 1ps 1ps \{period/2\} \{period\} 1)

.tran \{0.01*stoptime\} \{stoptime\} uic

.control
save all
run
plot V(out)
.endc
"}
C {devices/vsource.sym} 0 0 0 1 {name=VIN value=3.3}
C {devices/ipin.sym} 125 -80 1 0 {name=p1 lab=rst}
C {devices/ipin.sym} 160 -80 1 0 {name=p2 lab=clk}
C {devices/opin.sym} 255 0 0 0 {name=p3 lab=out}
C {devices/vsource.sym} 0 120 0 1 {name=VIN1 value=3.3}
C {devices/vdd.sym} 0 90 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 0 150 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 210 -80 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 210 80 0 0 {name=l4 lab=GND}
