v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -240 -270 -215 -270 {
lab=vinn}
N -240 -330 -215 -330 {
lab=vinp}
N 260 -250 340 -250 {
lab=GND}
N 380 -350 420 -350 {
lab=ld0}
N 190 -350 230 -350 {
lab=d0}
N 290 -430 305 -430 {
lab=#net1}
N 290 -430 290 -425 {
lab=#net1}
C {sar_adc_2.sym} -120 -290 0 0 {name=x1}
C {devices/code_shown.sym} -895 -345 0 0 {name=NGSPICE
only_toplevel=false
value="
.param period=150n
.param stoptime=\{48*period\}
*.param stoptime=.2u


.model swm1 sw vt=1 vh=0.2 ron=0.1 roff=100k

vclk clk 0 PULSE(0 3.3 \{0*period\} 10ps 10ps \{period/2\} \{period\})
vr  rst 0 PULSE(0 3.3 \{0*period\}  10ps 10ps \{period/2\} \{15*period\} 1)

.tran \{0.02*stoptime\} \{stoptime\} uic

.control
save all
run
*plot \{(V(d11)+V(d10)*2+V(d9)*4+V(d8)*8+V(d7)*16+V(d6)*32+V(d5)*64+V(d4)*128+V(d3)*256+V(d2)*512+V(d1)*1024+V(d0)*2048)/4095\} \{(rst/3.3) + 4\} eoc \{vinp - vinn\}
plot \{(V(d11)*2+V(d10)*4+V(d9)*8+V(d8)*16+V(d7)*32+V(d6)*64+V(d5)*128+V(d4)*256+V(d3)*512+V(d2)*1024+V(d1)*2048)/4095\} \{2*rst\} eoc \{vinp - vinn\}
plot \{d0\} \{d1 + 4\} \{d2 + 8\} \{d3 + 12\} \{d4 + 16\} \{d5 + 20\} \{d6 + 24\} \{d7 + 28\} \{d8 + 32\} \{d9 + 36\} \{d10 + 40\} \{d11 + 44\} \{clk + 50\} \{compout + 55\} \{eoc + 60\} \{sample + 65\}

plot d0 ld0
plot compn compp compout  eoc \{sample + 4\}  \{(clk/3.3) + 4\}
*plot d0
*plot d1 
*plot d2 
*plot d3 
*plot d4 
*plot d5 
*plot d6 
*plot d7 
*plot d8 
*plot d9 
*plot d10 
*plot d11 
*plot compout
.endc
"}
C {devices/vsource.sym} -240 -300 0 1 {name=VIN value=2u}
C {devices/ipin.sym} -145 -410 1 0 {name=p1 lab=rst}
C {devices/ipin.sym} -120 -410 1 0 {name=p2 lab=clk}
C {devices/opin.sym} 15 -240 2 1 {name=p3 lab=d0}
C {devices/vsource.sym} 30 -460 0 1 {name=VIN1 value=3.3}
C {devices/lab_pin.sym} 30 -490 1 0 {name=l1 lab=vdd}
C {devices/lab_pin.sym} -60 -410 1 0 {name=l3 lab=vdd}
C {devices/opin.sym} 15 -250 2 1 {name=p4 lab=d1}
C {devices/opin.sym} 15 -260 2 1 {name=p5 lab=d2}
C {devices/opin.sym} 15 -270 2 1 {name=p6 lab=d3}
C {devices/opin.sym} 15 -280 2 1 {name=p7 lab=d4}
C {devices/opin.sym} 15 -290 2 1 {name=p8 lab=d5}
C {devices/opin.sym} 15 -300 2 1 {name=p9 lab=d6}
C {devices/opin.sym} 15 -310 2 1 {name=p10 lab=d7}
C {devices/opin.sym} 15 -320 2 1 {name=p11 lab=d8}
C {devices/opin.sym} 15 -330 2 1 {name=p12 lab=d9}
C {devices/opin.sym} 15 -340 2 1 {name=p13 lab=d10}
C {devices/opin.sym} 15 -350 2 1 {name=p14 lab=d11}
C {devices/lab_pin.sym} -240 -330 0 0 {name=l5 lab=vinp}
C {devices/code_shown.sym} -915 -520 0 0 {name=Libraries/Includes
format="tcleval(  @value  )"
only_toplevel=false
value="
.include $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice
.include [pwd]/designs/sar_logic.spice
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical


.include $::PDK_ROOT/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice

"
spice_ignore=false}
C {devices/opin.sym} -140 -190 1 0 {name=p15 lab=compn}
C {devices/opin.sym} -105 -190 1 0 {name=p16 lab=compp}
C {devices/opin.sym} -60 -190 1 0 {name=p17 lab=compout}
C {devices/opin.sym} -30 -190 1 0 {name=p18 lab=eoc}
C {devices/gnd.sym} 30 -430 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} -240 -210 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} -30 -410 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -240 -240 0 1 {name=VIN2 value=1.65}
C {devices/lab_pin.sym} -240 -270 2 1 {name=l4 lab=vinn}
C {devices/lab_pin.sym} 30 -400 0 1 {name=l8 lab=sample}
C {ff.sym} 250 -270 0 0 {name=FF3
model=gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1
}
C {devices/lab_pin.sym} 360 -430 1 0 {name=l9 lab=vdd}
C {devices/gnd.sym} 340 -250 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 230 -320 0 0 {name=l12 lab=eoc}
C {devices/lab_pin.sym} 420 -350 1 0 {name=l13 lab=ld0}
C {devices/lab_pin.sym} 190 -350 1 0 {name=l14 lab=d0}
C {devices/gnd.sym} 289.96826171875 -426.6455078125 0 0 {name=l10 lab=GND}
