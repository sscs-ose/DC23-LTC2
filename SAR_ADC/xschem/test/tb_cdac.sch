v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {devices/code_shown.sym} -670 -470 0 0 {name=NGSPICE only_toplevel=false value="
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
C {devices/vdd.sym} 230 -125 2 0 {name=l14 lab=vdd}
C {devices/gnd.sym} 190 -125 0 0 {name=l15 lab=gnd}
C {devices/opin.sym} 350 -265 0 0 {name=p1 lab=out}
C {devices/vsource.sym} 0 -250 0 0 {name=VDD value=3.3}
C {devices/gnd.sym} 0 -220 0 0 {name=l17 lab=gnd}
C {devices/vdd.sym} 0 -280 0 0 {name=l18 lab=vdd}
C {cdac.sym} 210 -265 0 0 {name=xDUT cu=\{cu\}}
C {devices/code_shown.sym} -525 -595 0 0 {name=LIB 
only_toplevel=false
format="tcleval(  @value  )"
value="
.include $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim \{0*period\}  1ps 1ps \{period/2\} \{period\} 1)
"}
C {devices/lab_pin.sym} 90 -375 0 0 {name=l1 sig_type=std_logic lab=d[11]}
C {devices/lab_pin.sym} 90 -355 0 0 {name=l2 sig_type=std_logic lab=d[10]}
C {devices/lab_pin.sym} 90 -335 0 0 {name=l3 sig_type=std_logic lab=d[9]}
C {devices/lab_pin.sym} 90 -315 0 0 {name=l4 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 90 -295 0 0 {name=l5 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 90 -275 0 0 {name=l6 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 90 -255 0 0 {name=l7 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 90 -235 0 0 {name=l8 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 90 -215 0 0 {name=l9 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 90 -195 0 0 {name=l10 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 90 -175 0 0 {name=l11 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 90 -155 0 0 {name=l12 sig_type=std_logic lab=d[0]}
