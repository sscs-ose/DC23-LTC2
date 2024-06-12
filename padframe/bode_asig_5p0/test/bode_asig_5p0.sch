v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1120 -720 1920 -320 {flags=graph,unlocked
y1=0.00085
y2=1
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=3
x2=11
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=1
logy=0




digital=0
rainbow=1
dataset=0
rawfile=$netlist_dir/rawspice.raw
sim_type=tran
color="7 12"
node="PAD
ASIG"
hilight_wave=0}
B 2 1940 -720 2740 -320 {flags=graph,unlocked
y1=-0.0081
y2=0.0019
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=3
x2=11
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=1
logy=0




digital=0
rainbow=1
dataset=0
rawfile=$netlist_dir/rawspice.raw
sim_type=tran
color=7
node="\\"PAD ASIG -\\""
hilight_wave=0}
B 2 1120 -300 1920 100 {flags=graph,unlocked
y1=-62
y2=-3.6e-06
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=3
x2=11
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=1
logy=0




digital=0
rainbow=1
dataset=0
rawfile=$netlist_dir/rawspice.raw
sim_type=tran
color="7 12"
node="\\"PAD db20()\\"
\\"ASIG db20()\\""
hilight_wave=0}
B 2 1940 -300 2740 100 {flags=graph,unlocked
y1=-13
y2=7.5
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=3
x2=11
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=1
logy=0




digital=0
rainbow=1
dataset=0
rawfile=$netlist_dir/rawspice.raw
sim_type=tran
color=7
node="\\"PAD db20() ASIG db20() -\\""
hilight_wave=0}
N 110 -530 110 -510 {
lab=GND}
N 110 -650 110 -590 {
lab=DVDD}
N 170 -530 170 -510 {
lab=GND}
N 170 -650 170 -590 {
lab=VDD}
N 110 -510 170 -510 {
lab=GND}
N 230 -530 230 -510 {
lab=GND}
N 230 -650 230 -590 {
lab=DVSS}
N 290 -530 290 -510 {
lab=GND}
N 290 -650 290 -590 {
lab=VSS}
N 230 -510 290 -510 {
lab=GND}
N 170 -510 230 -510 {
lab=GND}
N 380 -440 380 -420 {
lab=GND}
N 380 -650 380 -590 {
lab=ASIG}
N 380 -530 380 -500 {
lab=#net1}
C {devices/code_shown.sym} 70 -770 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include ../../../../spice/gf180mcu_fd_io__asig_5p0_extracted.spice
XDUT DVSS DVDD VSS VDD PAD ASIG gf180mcu_fd_io__asig_5p0_extracted
"}
C {devices/vsource.sym} 110 -560 0 0 {name=V1 value=3}
C {devices/gnd.sym} 110 -510 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 110 -630 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 170 -560 0 0 {name=V2 value=3}
C {devices/lab_wire.sym} 170 -630 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 230 -560 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} 230 -630 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 290 -560 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 290 -630 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 380 -470 0 0 {name=V5 value="DC 3 AC 1"}
C {devices/lab_wire.sym} 380 -630 0 0 {name=p5 sig_type=std_logic lab=ASIG}
C {devices/gnd.sym} 380 -420 0 0 {name=l2 lab=GND}
C {devices/res.sym} 380 -560 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/launcher.sym} 1070 -780 0 0 {name=h2
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 1070 -880 0 0 {name=h5
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
C {devices/launcher.sym} 1070 -820 0 0 {name=h1
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 1060 -990 0 0 {name="Setup testbench"
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc"}
C {devices/code.sym} 700 -920 0 0 {name=GF_MODELS
only_toplevel=true
place=header
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice bjt_typical
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
"}
C {devices/code_shown.sym} 840 -620 0 0 {name="ac: Bode diagram"
only_toplevel=false
spice_ignore=0
value="
.control
save all

ac dec 100 1k 100G

*plot PAD ASIG
*plot vdb(asig) vdb(pad)

remzerovec
write
.endc
"}
C {devices/launcher.sym} 1270 -820 0 0 {name=h3
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
