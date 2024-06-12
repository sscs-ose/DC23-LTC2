v {xschem version=3.4.4 file_version=1.2
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
N -130 -540 -130 -520 {
lab=GND}
N -130 -660 -130 -600 {
lab=DVDD}
N -70 -540 -70 -520 {
lab=GND}
N -70 -660 -70 -600 {
lab=VDD}
N -130 -520 -70 -520 {
lab=GND}
N -10 -540 -10 -520 {
lab=GND}
N -10 -660 -10 -600 {
lab=DVSS}
N 50 -540 50 -520 {
lab=GND}
N 50 -660 50 -600 {
lab=VSS}
N -10 -520 50 -520 {
lab=GND}
N -70 -520 -10 -520 {
lab=GND}
N 230 -540 230 -520 {
lab=GND}
N 230 -660 230 -600 {
lab=IE}
N -210 -660 -210 -600 {
lab=OE}
N 290 -540 290 -520 {
lab=GND}
N 230 -520 290 -520 {
lab=GND}
N 290 -660 290 -600 {
lab=SL}
N 350 -540 350 -520 {
lab=GND}
N 290 -520 350 -520 {
lab=GND}
N 350 -660 350 -600 {
lab=CS}
N 50 -520 230 -520 {
lab=GND}
N -210 -540 -210 -520 {
lab=GND}
C {devices/code_shown.sym} 650 -740 0 0 {name=s1
only_toplevel=false
value="
.control
save all

tran 100p 4000n

*plot OE PAD0 Y0
*plot OE PAD1 Y1

remzerovec
write
.endc
"}
C {devices/code_shown.sym} -360 -760 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include "../../../../spice/gf180mcu_fd_io.spice"
***** A   CS DVDD DVSS IE OE PAD  PD  PDRV0 PDRV1 PU  SL VDD VSS Y  gf180mcu_fd_io__bi_t
XDUT0 VDD CS DVDD DVSS IE OE PAD0 VDD VSS   VSS   VSS SL VDD VSS Y0 gf180mcu_fd_io__bi_t
XDUT1 VSS CS DVDD DVSS IE OE PAD1 VSS VSS   VSS   VDD SL VDD VSS Y1 gf180mcu_fd_io__bi_t
"}
C {devices/vsource.sym} -130 -570 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} -130 -520 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} -130 -640 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} -70 -570 0 0 {name=V2 value=3.3}
C {devices/lab_wire.sym} -70 -640 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -10 -570 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} -10 -640 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 50 -570 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 50 -640 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -210 -570 0 1 {name=V5 value="PULSE(0 3.3 1000n 100p 100p 1000n 2000n)"}
C {devices/vsource.sym} 230 -570 0 0 {name=V7 value=3.3}
C {devices/lab_wire.sym} 230 -640 0 0 {name=p7 sig_type=std_logic lab=IE}
C {devices/lab_wire.sym} -210 -640 0 0 {name=p8 sig_type=std_logic lab=OE}
C {devices/vsource.sym} 290 -570 0 0 {name=V11 value=0}
C {devices/lab_wire.sym} 290 -640 0 0 {name=p11 sig_type=std_logic lab=SL}
C {devices/vsource.sym} 350 -570 0 0 {name=V13 value=3.3}
C {devices/lab_wire.sym} 350 -640 0 0 {name=p13 sig_type=std_logic lab=CS}
C {devices/gnd.sym} -210 -520 0 1 {name=l3 lab=GND}
C {devices/launcher.sym} 920 -790 0 0 {name=h6
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 920 -890 0 0 {name=h7
descr="Load ALL 3.4.5+"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw

puts $filepath

xschem raw clear
xschem raw read $filepath tran
xschem redraw
xschem raw read $filepath dc
xschem redraw
"}
C {devices/launcher.sym} 920 -830 0 0 {name=h8
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 910 -1000 0 0 {name=Setup testbench1
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc"}
C {devices/launcher.sym} 1120 -830 0 0 {name=h9
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
C {devices/code.sym} -250 -920 0 0 {name=GF_MODELS
only_toplevel=true
place=header
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice bjt_typical
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
"}
