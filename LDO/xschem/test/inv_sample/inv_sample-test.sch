v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1040 -160 1840 240 {flags=graph
y1=-0.0079
y2=3.5
ypos1=0
ypos2=2
divy=5

unity=1
x1=-1e-08
x2=9e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="Vout;v(out)
Vin;in
\\"Limit;1\\""
color="4 7 21"

unitx=1
logx=0
logy=0
rainbow=1
dataset=-1
subdivy=1}
B 2 1040 260 1840 660 {flags=graph
y1=0
y2=3.3
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-1e-08
x2=9e-08
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0

color=5
node="Transfer_Curve;out"

digital=0
rainbow=0
dataset=-1}
B 2 1050 740 1850 1140 {flags=graph
y1=0
y2=3.3
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-1e-08
x2=9e-08
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0

color=5
node="\\"Vout;v(out) %0 $netlist_dir/rawspice.raw transient\\""

digital=0
rainbow=0
dataset=-1}
T {Template usage:

1. Each simulation should has a "code_shown", "launcher" and at least one "graph"
2. Each simulation should have a unique name. It should be added on the launcher} 1230 -370 0 0 0.4 0.4 {}
C {/workspaces/DC23-LTC2-LDO/LDO/xschem/test/inv_sample/inv_sample.sym} 80 0 0 0 {name=x1}
C {devices/vdd.sym} 60 -50 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 60 50 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 20 160 0 0 {name=vvdd value=3.3 savecurrent=false}
C {devices/gnd.sym} 20 190 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 140 160 0 0 {name=vin
value="pulse(0 3.3 100p 100p 1n 4n 10n)"
savecurrent=false}
C {devices/gnd.sym} 140 190 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 20 130 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} 170 0 2 0 {name=p3 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -20 0 0 0 {name=p1 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 140 130 2 0 {name=p2 sig_type=std_logic lab=in}
C {devices/code_shown.sym} 640 -130 0 0 {name=Transient
only_toplevel=false
spice_ignore=0
value="
.control
save all

tran 0.01n 100n
*plot in out

set curplotname=transient
write
.endc
"}
C {devices/code.sym} 340 -80 0 0 {name=MODELS
only_toplevel=true
place=header
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice bjt_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
"}
C {devices/code_shown.sym} 640 290 0 0 {name="DC Sweep"
only_toplevel=false
spice_ignore=0
value="
.control
save all

dc vin 0 3.3 0.01
*plot out vs in in

set curplotname=transfer_curve
write
.endc
"}
C {devices/launcher.sym} 930 -260 0 0 {name=h5
descr="Load rawspice.raw"
tclcommand="
set filepath $\{netlist_dir\}rawspice.raw
puts $filepath

xschem raw_clear
#xschem raw_read $filepath transient
xschem raw_read $filepath transfer_curve

"
}
C {devices/code_shown.sym} 620 -280 0 0 {name="Setup testbench"
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc

"}
