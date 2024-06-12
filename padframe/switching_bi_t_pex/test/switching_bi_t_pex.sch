v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1240 -680 2040 -280 {flags=graph
y1=-0.075
y2=3.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="A
PAD0
Y0"
color="7 12 21"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 2060 -680 2860 -280 {flags=graph
y1=-0.075
y2=3.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color="7 12"
node="pad0
pad1"}
B 2 2880 -690 3680 -290 {flags=graph
y1=-1.9
y2=1.6
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color=7
node="\\"pad0 pad1 -\\""}
N 150 -490 150 -470 {
lab=GND}
N 150 -610 150 -550 {
lab=DVDD}
N 210 -490 210 -470 {
lab=GND}
N 210 -610 210 -550 {
lab=VDD}
N 150 -470 210 -470 {
lab=GND}
N 270 -490 270 -470 {
lab=GND}
N 270 -610 270 -550 {
lab=DVSS}
N 330 -490 330 -470 {
lab=GND}
N 330 -610 330 -550 {
lab=VSS}
N 270 -470 330 -470 {
lab=GND}
N 210 -470 270 -470 {
lab=GND}
N 390 -300 390 -280 {
lab=GND}
N 390 -420 390 -360 {
lab=A}
N 510 -490 510 -470 {
lab=GND}
N 510 -610 510 -550 {
lab=IE}
N 570 -490 570 -470 {
lab=GND}
N 510 -470 570 -470 {
lab=GND}
N 570 -610 570 -550 {
lab=OE}
N 630 -490 630 -470 {
lab=GND}
N 570 -470 630 -470 {
lab=GND}
N 630 -610 630 -550 {
lab=PU}
N 690 -490 690 -470 {
lab=GND}
N 630 -470 690 -470 {
lab=GND}
N 690 -610 690 -550 {
lab=PD}
N 750 -490 750 -470 {
lab=GND}
N 690 -470 750 -470 {
lab=GND}
N 750 -610 750 -550 {
lab=SL}
N 810 -490 810 -470 {
lab=GND}
N 750 -470 810 -470 {
lab=GND}
N 810 -610 810 -550 {
lab=CS}
N 330 -470 510 -470 {
lab=GND}
C {devices/code_shown.sym} 1050 -630 0 0 {name=s1
only_toplevel=false
value="
.tran 100p 100n
.save all
.control
run
display
plot A PAD0 Y0
plot PAD0 PAD1

write
.endc
"}
C {devices/code_shown.sym} 40 -750 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include "../../../../spice/gf180mcu_fd_io.spice"
.include "../../../../spice/gf180mcu_fd_io__bi_t_extracted.spice"
XDUT0 A CS DVDD DVSS IE OE PAD0 PD VSS VSS PU SL VDD VSS Y0 gf180mcu_fd_io__bi_t
XDUT1 A CS DVDD DVSS IE OE PAD1 PD VSS VSS PU SL VDD VSS Y1 gf180mcu_fd_io__bi_t_extracted
"}
C {devices/vsource.sym} 150 -520 0 0 {name=V1 value=3}
C {devices/gnd.sym} 150 -470 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 150 -590 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 210 -520 0 0 {name=V2 value=3}
C {devices/lab_wire.sym} 210 -590 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 270 -520 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} 270 -590 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 330 -520 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 330 -590 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 390 -330 0 0 {name=V5 value="PULSE(0 3 10n 100p 100p 10n 20n)"}
C {devices/lab_wire.sym} 390 -400 0 0 {name=p5 sig_type=std_logic lab=A}
C {devices/vsource.sym} 510 -520 0 0 {name=V7 value=3}
C {devices/lab_wire.sym} 510 -590 0 0 {name=p7 sig_type=std_logic lab=IE}
C {devices/vsource.sym} 570 -520 0 0 {name=V8 value=3}
C {devices/lab_wire.sym} 570 -590 0 0 {name=p8 sig_type=std_logic lab=OE}
C {devices/vsource.sym} 630 -520 0 0 {name=V9 value=0}
C {devices/lab_wire.sym} 630 -590 0 0 {name=p9 sig_type=std_logic lab=PU}
C {devices/vsource.sym} 690 -520 0 0 {name=V10 value=0}
C {devices/lab_wire.sym} 690 -590 0 0 {name=p10 sig_type=std_logic lab=PD}
C {devices/vsource.sym} 750 -520 0 0 {name=V11 value=0}
C {devices/lab_wire.sym} 750 -590 0 0 {name=p11 sig_type=std_logic lab=SL}
C {devices/gnd.sym} 390 -280 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 810 -520 0 0 {name=V13 value=3.3}
C {devices/lab_wire.sym} 810 -590 0 0 {name=p13 sig_type=std_logic lab=CS}
C {devices/code.sym} 200 -960 0 0 {name=GF_MODELS
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
C {devices/launcher.sym} 1310 -720 0 0 {name=h2
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 1310 -820 0 0 {name=h5
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
C {devices/launcher.sym} 1310 -760 0 0 {name=h3
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 1300 -930 0 0 {name="Setup testbench"
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc"}
C {devices/launcher.sym} 1510 -760 0 0 {name=h4
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
