v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 80 -395 80 -165 {lab=d[11:0] bus=true}
C {devices/code_shown.sym} -710 -560 0 0 {name=NGSPICE only_toplevel=false value="
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
plot V(d[0])
.endc
"}
C {devices/vdd.sym} 80 -395 0 0 {name=l1 lab=d[11:0]}
C {devices/bus_tap.sym} 80 -165 1 0 {name=l2 lab=[11]}
C {devices/bus_tap.sym} 80 -185 1 0 {name=l3 lab=[10]}
C {devices/bus_tap.sym} 80 -205 1 0 {name=l4 lab=[9]}
C {devices/bus_tap.sym} 80 -225 1 0 {name=l5 lab=[8]}
C {devices/bus_tap.sym} 80 -245 1 0 {name=l6 lab=[7]}
C {devices/bus_tap.sym} 80 -265 1 0 {name=l7 lab=[6]}
C {devices/bus_tap.sym} 80 -285 1 0 {name=l8 lab=[5]}
C {devices/bus_tap.sym} 80 -305 1 0 {name=l9 lab=[4]}
C {devices/bus_tap.sym} 80 -325 1 0 {name=l10 lab=[3]}
C {devices/bus_tap.sym} 80 -345 1 0 {name=l11 lab=[2]}
C {devices/bus_tap.sym} 80 -365 1 0 {name=l12 lab=[1]}
C {devices/bus_tap.sym} 80 -385 1 0 {name=l13 lab=[0]}
C {devices/vdd.sym} 230 -125 2 0 {name=l14 lab=vdd}
C {devices/gnd.sym} 190 -125 0 0 {name=l15 lab=gnd}
C {devices/opin.sym} 350 -265 0 0 {name=p1 lab=out}
C {devices/vsource.sym} 0 -250 0 0 {name=VDD value=3.3}
C {devices/gnd.sym} 0 -220 0 0 {name=l17 lab=gnd}
C {devices/vdd.sym} 0 -280 0 0 {name=l18 lab=vdd}
C {../spice/cdac.sym} 210 -265 0 0 {name=xDUT cu=\{cu\}}
