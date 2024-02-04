v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -110 140 -110 210 {
lab=#net1}
N -170 270 -110 270 {
lab=GND}
N -130 140 -130 180 {
lab=#net2}
N -230 180 -130 180 {
lab=#net2}
N 170 -250 170 -160 {
lab=sample}
N -140 -250 170 -250 {
lab=sample}
N -140 -250 -140 -140 {
lab=sample}
N 130 -80 230 -80 {
lab=#net3}
N 10 -140 10 0 {
lab=out}
N 10 -140 50 -140 {
lab=out}
N -110 140 60 140 {
lab=#net1}
N 60 -80 60 140 {
lab=#net1}
N 60 -80 90 -80 {
lab=#net1}
N -370 180 -230 180 {
lab=#net2}
N 230 -80 310 -80 {
lab=#net3}
N 170 -240 310 -240 {
lab=sample}
N 350 -180 350 180 {
lab=#net1}
N -110 180 350 180 {
lab=#net1}
N -170 140 -170 170 {
lab=#net1}
N -170 170 -110 170 {
lab=#net1}
C {cdac_2n.sym} -130 0 0 0 {name=x1 cu=5u}
C {devices/lab_pin.sym} -140 -140 0 0 {name=p1 sig_type=std_logic lab=sample}
C {devices/gnd.sym} -150 140 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -170 240 0 0 {name=V1 value=1.65 savecurrent=false}
C {devices/vsource.sym} -110 240 0 0 {name=V2 value=3.3 savecurrent=false}
C {devices/gnd.sym} -140 270 0 0 {name=l2 lab=GND}
C {bootstrap_sw.sym} 110 -180 0 0 {name=x2}
C {devices/lab_pin.sym} -170 200 0 0 {name=p2 sig_type=std_logic lab=vref}
C {devices/lab_pin.sym} 170 -140 0 1 {name=p3 sig_type=std_logic lab=vref}
C {devices/gnd.sym} 110 -80 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -370 210 0 0 {name=V3 value=1 savecurrent=false}
C {devices/gnd.sym} -370 240 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -250 110 2 1 {name=p4 sig_type=std_logic lab=d11}
C {devices/lab_pin.sym} -250 90 2 1 {name=p5 sig_type=std_logic lab=d10}
C {devices/lab_pin.sym} -250 70 2 1 {name=p6 sig_type=std_logic lab=d9}
C {devices/lab_pin.sym} -250 50 2 1 {name=p7 sig_type=std_logic lab=d8}
C {devices/lab_pin.sym} -250 30 2 1 {name=p8 sig_type=std_logic lab=d7}
C {devices/lab_pin.sym} -250 10 2 1 {name=p9 sig_type=std_logic lab=d6}
C {devices/lab_pin.sym} -250 -10 2 1 {name=p10 sig_type=std_logic lab=d5}
C {devices/lab_pin.sym} -250 -30 2 1 {name=p11 sig_type=std_logic lab=d4}
C {devices/lab_pin.sym} -250 -50 2 1 {name=p12 sig_type=std_logic lab=d3}
C {devices/lab_pin.sym} -250 -70 2 1 {name=p13 sig_type=std_logic lab=d2}
C {devices/lab_pin.sym} -250 -90 2 1 {name=p14 sig_type=std_logic lab=d1}
C {devices/lab_pin.sym} -250 -110 2 1 {name=p15 sig_type=std_logic lab=d0}
C {devices/code_shown.sym} -1145 -125 0 0 {name=NGSPICE
only_toplevel=false
value="
.param period=10u
.param stoptime=\{32*period\}

.tran \{0.01*stoptime\} \{stoptime\} uic

vsmp sample 0 PULSE(0 3.3 0 10p 10p \{period/2\} \{period\} 1)
vd0 d0 0 PULSE(0 3.3 \{period\} 10p 10p \{period/2\} \{period\} 1)
vd1 d1 0 PULSE(0 3.3 \{2*period\} 10p 10p \{period/2\} \{period\} 1)
vd2 d2 0 PULSE(0 3.3 \{3*period\} 10p 10p \{period/2\} \{period\} 1)
vd3 d3 0 PULSE(0 3.3 \{4*period\} 10p 10p \{period/2\} \{period\} 1)
vd4 d4 0 PULSE(0 3.3 \{5*period\} 10p 10p \{period/2\} \{period\} 1)
vd5 d5 0 PULSE(0 3.3 \{6*period\}10p 10p \{period/2\} \{period\} 1)
vd6 d6 0 PULSE(0 3.3 \{7*period\} 10p 10p \{period/2\} \{period\} 1)
vd7 d7 0 PULSE(0 3.3 \{8*period\} 10p 10p \{period/2\} \{period\} 1)
vd8 d8 0 PULSE(0 3.3 \{9*period\} 10p 10p \{period/2\} \{period\} 1)
vd9 d9 0 PULSE(0 3.3 \{10*period\} 10p 10p \{period/2\} \{period\} 1)
vd10 d10 0 PULSE(0 3.3 \{11*period\} 10p 10p \{period/2\} \{period\} 1)
vd11 d11 0 PULSE(0 3.3 \{12*period\} 10p 10p \{period/2\} \{period\} 1)
.control

save all
run
plot out 
plot sample d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 out
.endc
"}
C {devices/code_shown.sym} -1155 -270 0 0 {name=Libraries/Includes
format="tcleval(  @value  )"
only_toplevel=false
value="
.include $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/lab_pin.sym} 10 -90 0 1 {name=p16 sig_type=std_logic lab=out}
C {inv.sym} 310 -180 1 0 {name=x3 cl=0.28u wp=0.44u wn=0.22u}
C {devices/gnd.sym} 270 -180 0 0 {name=l5 lab=GND}
