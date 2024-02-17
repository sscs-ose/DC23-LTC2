v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {sar_logic.sym} 350 90 0 0 {name=X1}
C {devices/opin.sym} 450 110 1 0 {name=p2 lab=eoc}
C {devices/ipin.sym} 330 -160 0 0 {name=p3 lab=data_in}
C {devices/ipin.sym} 390 -430 1 0 {name=p4 lab=clk}
C {devices/ipin.sym} 410 -430 1 0 {name=p5 lab=rst}
C {devices/code_shown.sym} -920 -220 0 0 {name=NGSPICE only_toplevel=false value="

.param period=10n
.param span=4
.param stoptime=\{48*period\}

vd0 data_in 0 PULSE(0 3.3 \{4*period\}  1ps 1ps \{13*period\} \{26*period\} 2)
vc  clk 0 PULSE(0 3.3 \{0*period\}  1ps 1ps \{period/2\} \{period\})
vr  rst 0 PULSE(0 3.3 \{0.5*period\}  1ps 1ps \{1*period\} \{12*period\} 1)

.tran \{0.1*period\} \{stoptime\}

.control
run
plot data_in
plot \{qt0\} \{qt1 + 4\} \{qt2 + 8\} \{qt3 + 12\} \{qt4 + 16\} \{qt5 + 20\} \{qt6 + 24\} \{qt7 + 28\} \{qt8 + 32\} \{qt9 + 36\} \{qt10 + 40\} \{qt11 + 44\} \{data_in + 55\} \{clk + 50\} \{eoc + 60\}
plot \{q0\} \{q1 + 4\} \{q2 + 8\} \{q3 + 12\} \{q4 + 16\} \{q5 + 20\} \{q6 + 24\} \{q7 + 28\} \{q8 + 32\} \{q9 + 36\} \{q10 + 40\} \{q11 + 44\} \{data_in + 55\} \{clk + 50\} \{eoc + 60\}


*plot \{(V(q11)*2048+V(q10)*1024+V(q9)*512+V(q8)*256+V(q7)*128+V(q6)*64+V(q5)*32+V(q4)*16+V(q3)*8+V(q2)*4+V(q1)*2+V(q0))/4096\} V(eoc)
.endc
"}
C {devices/opin.sym} 510 -150 0 0 {name=p1 lab=q0}
C {devices/opin.sym} 510 -130 0 0 {name=p6 lab=q1}
C {devices/opin.sym} 510 -110 0 0 {name=p7 lab=q2}
C {devices/opin.sym} 510 -90 0 0 {name=p8 lab=q3}
C {devices/opin.sym} 510 -70 0 0 {name=p9 lab=q4}
C {devices/opin.sym} 510 -50 0 0 {name=p10 lab=q5}
C {devices/opin.sym} 510 -30 0 0 {name=p11 lab=q6}
C {devices/opin.sym} 510 -10 0 0 {name=p12 lab=q7}
C {devices/opin.sym} 510 10 0 0 {name=p13 lab=q8}
C {devices/opin.sym} 510 30 0 0 {name=p14 lab=q9}
C {devices/opin.sym} 510 50 0 0 {name=p15 lab=q10}
C {devices/opin.sym} 510 70 0 0 {name=p16 lab=q11}
C {devices/vsource.sym} -220 -240 0 0 {name=V1 value=3.3}
C {devices/lab_pin.sym} 390 110 3 0 {name=l1 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 450 -430 3 1 {name=l2 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} -945 -390 0 0 {name=Libraries/Includes
format="tcleval(  @value  )"
only_toplevel=false
value="
.include $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice
.include [pwd]/designs/sar_logic.spice
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/gnd.sym} -220 -210 0 1 {name=l3 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -220 -270 3 1 {name=l4 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 510 -390 0 0 {name=p17 lab=qt0}
C {devices/opin.sym} 510 -370 0 0 {name=p18 lab=qt1}
C {devices/opin.sym} 510 -350 0 0 {name=p19 lab=qt2}
C {devices/opin.sym} 510 -330 0 0 {name=p20 lab=qt3}
C {devices/opin.sym} 510 -310 0 0 {name=p21 lab=qt4}
C {devices/opin.sym} 510 -290 0 0 {name=p22 lab=qt5}
C {devices/opin.sym} 510 -270 0 0 {name=p23 lab=qt6}
C {devices/opin.sym} 510 -250 0 0 {name=p24 lab=qt7}
C {devices/opin.sym} 510 -230 0 0 {name=p25 lab=qt8}
C {devices/opin.sym} 510 -210 0 0 {name=p26 lab=qt9}
C {devices/opin.sym} 510 -190 0 0 {name=p27 lab=qt10}
C {devices/opin.sym} 510 -170 0 0 {name=p28 lab=qt11}
