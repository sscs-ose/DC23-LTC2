v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 150 170 220 {
lab=#net1}
N 110 150 110 220 {
lab=vref}
N 110 280 170 280 {
lab=GND}
N 150 150 150 190 {
lab=#net2}
N 50 190 150 190 {
lab=#net2}
N 450 -240 450 -150 {
lab=sample}
N 140 -240 450 -240 {
lab=sample}
N 140 -240 140 -130 {
lab=sample}
N 410 -70 510 -70 {
lab=#net3}
N 290 -130 290 10 {
lab=out}
N 290 -130 330 -130 {
lab=out}
N 170 150 340 150 {
lab=#net1}
N 340 -70 340 150 {
lab=#net1}
N 340 -70 370 -70 {
lab=#net1}
N -90 190 50 190 {
lab=#net2}
N 510 -70 590 -70 {
lab=#net3}
N 450 -230 590 -230 {
lab=sample}
N 630 -170 630 190 {
lab=#net1}
N 170 190 630 190 {
lab=#net1}
C {cdac_2n.sym} 150 10 0 0 {name=x1 cu=5u}
C {devices/lab_pin.sym} 140 -130 0 0 {name=p1 sig_type=std_logic lab=sample}
C {devices/gnd.sym} 130 150 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 110 250 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/vsource.sym} 170 250 0 0 {name=V2 value=3.3 savecurrent=false}
C {devices/gnd.sym} 140 280 0 0 {name=l2 lab=GND}
C {bootstrap_sw.sym} 390 -170 0 0 {name=x2}
C {devices/lab_pin.sym} 110 210 0 0 {name=p2 sig_type=std_logic lab=vref}
C {devices/lab_pin.sym} 450 -130 0 1 {name=p3 sig_type=std_logic lab=vref}
C {devices/gnd.sym} 390 -70 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -90 220 0 0 {name=V3 value=1 savecurrent=false}
C {devices/gnd.sym} -90 250 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 30 -100 0 0 {name=p4 sig_type=std_logic lab=d11}
C {devices/lab_pin.sym} 30 -80 0 0 {name=p5 sig_type=std_logic lab=d10}
C {devices/lab_pin.sym} 30 -60 0 0 {name=p6 sig_type=std_logic lab=d9}
C {devices/lab_pin.sym} 30 -40 0 0 {name=p7 sig_type=std_logic lab=d8}
C {devices/lab_pin.sym} 30 -20 0 0 {name=p8 sig_type=std_logic lab=d7}
C {devices/lab_pin.sym} 30 0 0 0 {name=p9 sig_type=std_logic lab=d6}
C {devices/lab_pin.sym} 30 20 0 0 {name=p10 sig_type=std_logic lab=d5}
C {devices/lab_pin.sym} 30 40 0 0 {name=p11 sig_type=std_logic lab=d4}
C {devices/lab_pin.sym} 30 60 0 0 {name=p12 sig_type=std_logic lab=d3}
C {devices/lab_pin.sym} 30 80 0 0 {name=p13 sig_type=std_logic lab=d2}
C {devices/lab_pin.sym} 30 100 0 0 {name=p14 sig_type=std_logic lab=d1}
C {devices/lab_pin.sym} 30 120 0 0 {name=p15 sig_type=std_logic lab=d0}
C {devices/code_shown.sym} -1145 -125 0 0 {name=NGSPICE
only_toplevel=false
value="
.param period=1u
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
C {devices/lab_pin.sym} 290 -80 0 1 {name=p16 sig_type=std_logic lab=out}
C {inv.sym} 590 -170 1 0 {name=x3 cl=0.28u wp=0.44u wn=0.22u}
C {devices/gnd.sym} 550 -170 0 0 {name=l5 lab=GND}
