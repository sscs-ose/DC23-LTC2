v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -240 -270 -215 -270 {
lab=gnd}
N -240 -330 -215 -330 {
lab=vinp}
N -300 -270 -240 -270 {
lab=gnd}
N -140 -190 -130 -190 {
lab=compn}
N -130 -190 -130 -80 {
lab=compn}
N -130 -80 -100 -80 {
lab=compn}
C {sar_adc.sym} -120 -290 0 0 {name=x1}
C {devices/code_shown.sym} -895 -345 0 0 {name=NGSPICE
only_toplevel=false
value="
.param period=20n
.param stoptime=\{32*period\}

.model swm1 sw vt=1 vh=0.2 ron=0.1 roff=100k

vclk clk 0 PULSE(0 3.3 \{0*period\} 1ps 1ps \{period/2\} \{period\})
vr  rst 0 PULSE(0 5 \{0.5*period\}  1ps 1ps \{1*period\} \{12*period\} 1)

.tran \{0.01*stoptime\} \{stoptime\} uic

.control
save all
run
plot \{(V(d11)+V(d10)*2+V(d9)*4+V(d8)*8+V(d7)*16+V(d6)*32+V(d5)*64+V(d4)*128+V(d3)*256+V(d2)*512+V(d1)*1024+V(d0)*2048)/4095\} eoc
plot compn compp compout clk
plot V(clk)
plot V(rst)
.endc
"}
C {devices/vsource.sym} -240 -300 0 1 {name=VIN value=1.8}
C {devices/ipin.sym} -145 -410 1 0 {name=p1 lab=rst}
C {devices/ipin.sym} -120 -410 1 0 {name=p2 lab=clk}
C {devices/opin.sym} 15 -350 0 0 {name=p3 lab=d0}
C {devices/vsource.sym} -300 -300 0 1 {name=VIN1 value=3.3}
C {devices/lab_pin.sym} -300 -330 1 0 {name=l1 lab=vdd}
C {devices/lab_pin.sym} -300 -270 3 0 {name=l2 lab=gnd}
C {devices/lab_pin.sym} -60 -410 1 0 {name=l3 lab=vdd}
C {devices/opin.sym} 15 -340 0 0 {name=p4 lab=d1}
C {devices/opin.sym} 15 -330 0 0 {name=p5 lab=d2}
C {devices/opin.sym} 15 -320 0 0 {name=p6 lab=d3}
C {devices/opin.sym} 15 -310 0 0 {name=p7 lab=d4}
C {devices/opin.sym} 15 -300 0 0 {name=p8 lab=d5}
C {devices/opin.sym} 15 -290 0 0 {name=p9 lab=d6}
C {devices/opin.sym} 15 -280 0 0 {name=p10 lab=d7}
C {devices/opin.sym} 15 -270 0 0 {name=p11 lab=d8}
C {devices/opin.sym} 15 -260 0 0 {name=p12 lab=d9}
C {devices/opin.sym} 15 -250 0 0 {name=p13 lab=d10}
C {devices/opin.sym} 15 -240 0 0 {name=p14 lab=d11}
C {devices/lab_pin.sym} -30 -410 1 0 {name=l4 lab=gnd}
C {devices/lab_pin.sym} -240 -330 1 0 {name=l5 lab=vinp}
C {devices/code_shown.sym} -915 -520 0 0 {name=Libraries/Includes
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
C {devices/opin.sym} -140 -190 1 0 {name=p15 lab=compn}
C {devices/opin.sym} -105 -190 1 0 {name=p16 lab=compp}
C {devices/opin.sym} -60 -190 1 0 {name=p17 lab=compout}
C {devices/opin.sym} -30 -190 1 0 {name=p18 lab=eoc}
C {devices/vsource.sym} -100 -50 0 1 {name=VIN2 value=1.6}
C {devices/lab_pin.sym} -100 -20 3 0 {name=l6 lab=gnd}
