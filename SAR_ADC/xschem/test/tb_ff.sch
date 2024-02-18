v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 -150 180 -150 {
lab=Q}
C {devices/netlist.sym} 0 10 0 0 {name=s1 value="
*.include $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/design.ngspice
*.include $::PDK_ROOT/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::PDK_ROOT/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical

.param stoptime = 1200n
.tran \{0.01*stoptime\} \{stoptime\} uic

.control
save all
run
plot V(DATA) V(CLK) V(Q)
plot V(Q) V(CLK) V(SET) V(RST)
.endc
"}
C {devices/vdd.sym} 10 -150 0 0 {name=l1 lab=DATA}
C {devices/opin.sym} 180 -150 0 0 {name=p1 lab=Q}
C {devices/vdd.sym} 140 -230 0 0 {name=l2 lab=VDD}
C {devices/vsource.sym} 245 -120 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} 245 -90 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 245 -150 0 0 {name=l5 lab=VDD}
C {devices/vsource.sym} 300 -120 0 0 {name=V2 value="PULSE(0 3.3 120n 1ps 1ps 150n 300n 2)"}
C {devices/gnd.sym} 300 -90 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 300 -150 0 0 {name=l7 lab=DATA}
C {devices/vdd.sym} 10 -120 3 0 {name=l8 lab=CLK}
C {devices/vsource.sym} 300 -240 0 0 {name=V3 value="PULSE(0 3.3 50n 1ps 1ps 100n 200n)"}
C {devices/gnd.sym} 300 -210 0 0 {name=l9 lab=GND}
C {devices/vdd.sym} 300 -270 0 0 {name=l10 lab=CLK}
C {ff.sym} 30 -70 0 0 {name=FFF
model=gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1
}
C {devices/gnd.sym} 45 -50 0 0 {name=l11 lab=GND}
C {devices/vsource.sym} 555 -245 0 0 {name=V4 value="PULSE(0 3.3 600n 1ps 1ps 75n 150n 1)"}
C {devices/gnd.sym} 555 -215 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 555 -275 0 0 {name=l14 lab=SET}
C {devices/vsource.sym} 555 -125 0 0 {name=V5 value="PULSE(0 3.3 810n 1ps 1ps 75n 150n 1)"}
C {devices/gnd.sym} 555 -95 0 0 {name=l15 lab=GND}
C {devices/vdd.sym} 555 -155 0 0 {name=l16 lab=RST}
C {devices/vdd.sym} 85 -230 0 0 {name=l3 lab=SET}
C {devices/vdd.sym} 85 -50 2 0 {name=l12 lab=RST}
C {devices/code_shown.sym} -205 330 0 0 {name=Libraries/Includes
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
