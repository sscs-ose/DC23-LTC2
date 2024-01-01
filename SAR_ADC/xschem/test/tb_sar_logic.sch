v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -0 150 80 150 {
lab=gnd}
N -0 130 0 150 {
lab=gnd}
N -0 -190 0 70 {
lab=vdd}
N 0 -190 140 -190 {
lab=vdd}
N 140 -190 140 -150 {
lab=vdd}
C {sar_logic.sym} 40 130 0 0 {name=X1}
C {devices/opin.sym} 140 150 1 0 {name=p2 lab=eoc}
C {devices/ipin.sym} 20 0 0 0 {name=p3 lab=data_in}
C {devices/ipin.sym} 80 -150 1 0 {name=p4 lab=clk}
C {devices/ipin.sym} 100 -150 1 0 {name=p5 lab=rst}
C {devices/code_shown.sym} -920 -220 0 0 {name=NGSPICE only_toplevel=false value="
.include /home/designer/.volare/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /home/designer/.volare/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
.lib /home/designer/.volare/gf180mcuC/libs.tech/ngspice/sm141064.ngspice diode_typical
.include /home/designer/repositories/DC23-LTC2/SAR_ADC/xschem/spice/sar_logic.spice

.param period=10n
.param stoptime=\{36*period\}

vd0 data_in 0 PULSE(0 3.3 \{4*period\}  1ps 1ps \{3*period\} \{4*period\} 2)
vc  clk 0 PULSE(0 3.3 \{0*period\}  1ps 1ps \{period/2\} \{period\})
vr  rst 0 PULSE(0 3.3 \{0.5*period\}  1ps 1ps \{1*period\} \{12*period\} 1)

.tran \{0.1*period\} \{stoptime\}

.control
run
*plot V(q0) V(q1) V(q2) V(q3) V(q11)
plot V(clk)
plot V(rst)
plot V(data_in)
plot \{V(q11)*2048+V(q10)*1024+V(q9)*512+V(q8)*256+V(q7)*128+V(q6)*64+V(q5)*32+V(q4)*16+V(q3)*8+V(q2)*4+V(q1)*2+V(q0)\}
plot V(eoc)
.endc
"}
C {devices/opin.sym} 200 -110 0 0 {name=p1 lab=q0}
C {devices/opin.sym} 200 -90 0 0 {name=p6 lab=q1}
C {devices/opin.sym} 200 -70 0 0 {name=p7 lab=q2}
C {devices/opin.sym} 200 -50 0 0 {name=p8 lab=q3}
C {devices/opin.sym} 200 -30 0 0 {name=p9 lab=q4}
C {devices/opin.sym} 200 -10 0 0 {name=p10 lab=q5}
C {devices/opin.sym} 200 10 0 0 {name=p11 lab=q6}
C {devices/opin.sym} 200 30 0 0 {name=p12 lab=q7}
C {devices/opin.sym} 200 50 0 0 {name=p13 lab=q8}
C {devices/opin.sym} 200 70 0 0 {name=p14 lab=q9}
C {devices/opin.sym} 200 90 0 0 {name=p15 lab=q10}
C {devices/opin.sym} 200 110 0 0 {name=p16 lab=q11}
C {devices/vsource.sym} 0 100 0 0 {name=V1 value=3.3}
C {devices/lab_pin.sym} 0 150 0 0 {name=l1 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 0 -190 0 0 {name=l2 sig_type=std_logic lab=vdd}
