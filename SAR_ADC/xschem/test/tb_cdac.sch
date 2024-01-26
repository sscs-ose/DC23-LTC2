v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 -130 190 -130 {
lab=GND}
N 160 -130 160 -120 {
lab=GND}
N 350 -270 450 -270 {
lab=out}
C {devices/code_shown.sym} -1070 -480 0 0 {name=NGSPICE only_toplevel=false value="
.param cu=5u
.param period=100u
.param stoptime=\{15*period\}

vd0  d0  0 PULSE(0 3.3 \{0*period\} 1p 1p \{period/2\} \{period\} 1)
vd1  d1  0 PULSE(0 3.3 \{1*period\} 1p 1p \{period/2\} \{period\} 1)
vd2  d2  0 PULSE(0 3.3 \{2*period\} 1p 1p \{period/2\} \{period\} 1)
vd3  d3 0 PULSE(0 3.3 \{3*period\} 1p 1p \{period/2\} \{period\} 1)
vd4  d4  0 PULSE(0 3.3 \{4*period\} 1p 1p \{period/2\} \{period\} 1)
vd5  d5  0 PULSE(0 3.3 \{5*period\} 1p 1p \{period/2\} \{period\} 1)
vd6  d6  0 PULSE(0 3.3 \{6*period\} 1p 1p \{period/2\} \{period\} 1)
vd7  d7  0 PULSE(0 3.3 \{7*period\} 1p 1p \{period/2\} \{period\} 1)
vd8  d8  0 PULSE(0 3.3 \{8*period\} 1p 1p \{period/2\} \{period\} 1)
vd9  d9  0 PULSE(0 3.3 \{9*period\} 1p 1p \{period/2\} \{period\} 1)
vd10 d10 0 PULSE(0 3.3 \{10*period\} 1p 1p \{period/2\} \{period\} 1)
vd11 d11 0 PULSE(0 3.3 \{11*period\} 1p 1p \{period/2\} \{period\} 1)

.tran \{0.01*stoptime\} \{stoptime\} uic

.control
save all
run
plot V(out)
plot V(d0)
.endc
"}
C {devices/vdd.sym} 230 -125 2 0 {name=l14 lab=vdd}
C {devices/vsource.sym} 0 -250 0 0 {name=VDD value=3.3}
C {devices/vdd.sym} 0 -280 0 0 {name=l18 lab=vdd}
C {devices/code_shown.sym} -525 -595 0 0 {name=LIB 
only_toplevel=false
format="tcleval(  @value  )"
value="
.include $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim "}
C {cdac.sym} 210 -270 0 0 {name=x1 cu=5u}
C {devices/lab_pin.sym} 90 -160 0 0 {name=l1 sig_type=std_logic lab=d[0]}
C {devices/lab_pin.sym} 90 -180 0 0 {name=l2 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 90 -200 0 0 {name=l3 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 90 -220 0 0 {name=l4 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 90 -240 0 0 {name=l5 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 90 -260 0 0 {name=l6 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 90 -280 0 0 {name=l19 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 90 -300 0 0 {name=l20 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 90 -320 0 0 {name=l21 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 90 -340 0 0 {name=l22 sig_type=std_logic lab=d9}
C {devices/lab_pin.sym} 90 -360 0 0 {name=l23 sig_type=std_logic lab=d10}
C {devices/lab_pin.sym} 90 -380 0 0 {name=l24 sig_type=std_logic lab=d11}
C {devices/gnd.sym} 160 -120 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 0 -220 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 450 -270 0 1 {name=l7 sig_type=std_logic lab=out}
C {devices/gnd.sym} 210 -70 0 0 {name=l10 lab=GND}
C {devices/res.sym} 210 -100 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
