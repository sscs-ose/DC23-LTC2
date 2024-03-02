v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 860 -760 1640 -340 {flags=graph






unity=1




xlabmag=1.0

node="oe
pad0
y0"
color="4 5 21"
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=4e-06
digital=1
subdivx=5

divx=5
rainbow=0

linewidth_mult=4
ylabmag=0.7
divy=2
subdivy=10}
B 2 860 -340 1640 80 {flags=graph





subdivy=3
unity=1




xlabmag=1.0

node="pad1
y1"
color="5 21"
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=4e-06
digital=1
subdivx=5

divx=5
rainbow=0
divy=1
linewidth_mult=4
ylabmag=0.7}
N 1050 -820 1050 -800 {
lab=GND}
N 1050 -940 1050 -880 {
lab=DVDD}
N 1110 -820 1110 -800 {
lab=GND}
N 1110 -940 1110 -880 {
lab=VDD}
N 1050 -800 1110 -800 {
lab=GND}
N 1170 -820 1170 -800 {
lab=GND}
N 1170 -940 1170 -880 {
lab=DVSS}
N 1230 -820 1230 -800 {
lab=GND}
N 1230 -940 1230 -880 {
lab=VSS}
N 1170 -800 1230 -800 {
lab=GND}
N 1110 -800 1170 -800 {
lab=GND}
N 1410 -820 1410 -800 {
lab=GND}
N 1410 -940 1410 -880 {
lab=IE}
N 970 -940 970 -880 {
lab=OE}
N 1470 -820 1470 -800 {
lab=GND}
N 1410 -800 1470 -800 {
lab=GND}
N 1470 -940 1470 -880 {
lab=SL}
N 1530 -820 1530 -800 {
lab=GND}
N 1470 -800 1530 -800 {
lab=GND}
N 1530 -940 1530 -880 {
lab=CS}
N 1230 -800 1410 -800 {
lab=GND}
N 970 -820 970 -800 {
lab=GND}
C {devices/code_shown.sym} 190 -480 0 0 {name=s1
only_toplevel=false
value="
.option klu

.control
save all

tran 100p 4000n
remzerovec
write digital_io_tristate.raw

*plot OE PAD0 Y0
*plot OE PAD1 Y1
.endc
"}
C {devices/code_shown.sym} 240 -740 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice diode_typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
"}
C {devices/code_shown.sym} 820 -1040 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include "../../../../spice/gf180mcu_fd_io.spice"
XDUT0 VDD CS DVDD DVSS IE OE PAD0 VDD VSS VSS VSS SL VDD VSS Y0 gf180mcu_fd_io__bi_t
XDUT1 VSS CS DVDD DVSS IE OE PAD1 VSS VSS VSS VDD SL VDD VSS Y1 gf180mcu_fd_io__bi_t
"}
C {devices/vsource.sym} 1050 -850 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} 1050 -800 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 1050 -920 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 1110 -850 0 0 {name=V2 value=3.3}
C {devices/lab_wire.sym} 1110 -920 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 1170 -850 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} 1170 -920 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 1230 -850 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 1230 -920 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 970 -850 0 1 {name=V5 value="PULSE(0 3.3 1000n 100p 100p 1000n 2000n)"}
C {devices/vsource.sym} 1410 -850 0 0 {name=V7 value=3.3}
C {devices/lab_wire.sym} 1410 -920 0 0 {name=p7 sig_type=std_logic lab=IE}
C {devices/lab_wire.sym} 970 -920 0 0 {name=p8 sig_type=std_logic lab=OE}
C {devices/vsource.sym} 1470 -850 0 0 {name=V11 value=0}
C {devices/lab_wire.sym} 1470 -920 0 0 {name=p11 sig_type=std_logic lab=SL}
C {devices/vsource.sym} 1530 -850 0 0 {name=V13 value=3.3}
C {devices/lab_wire.sym} 1530 -920 0 0 {name=p13 sig_type=std_logic lab=CS}
C {devices/gnd.sym} 970 -800 0 1 {name=l3 lab=GND}
C {devices/launcher.sym} 215 -545 0 0 {name=h1
descr="Load/unload waveforms."
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw
"
}
