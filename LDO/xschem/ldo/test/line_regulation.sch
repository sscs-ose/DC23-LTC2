v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 660 -210 1460 190 {flags=graph
y1=-1.4442148
y2=6.136986
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0.001
x2=6
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1
dataset=0
rawfile=$netlist_dir/rawspice.raw
sim_type=dc

color="4 7"
node="v-sweep
out"}
B 2 660 200 1460 600 {flags=graph
y1=0
y2=2.7
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0.001
x2=6
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1
dataset=0
rawfile=$netlist_dir/rawspice.raw
sim_type=dc

color="4 7"
node="\\"v-sweep out -\\"
\\"0 v-sweep *\\""}
T {Cap Off-chip
Electrolitic Capacitor} 310 -170 0 0 0.4 0.4 {}
T {Template usage:

1. Each simulation should have in the title:
- Type of simulation (tran, dc, etc)
- Name of the simulation (Purpose, something like that)
2. Each simulation of set of simulations should be contained on the same control block.
3. Use Shift-S to change element processing order.
4. Graphs should use the dataset index in the same order of element processing} 860 -480 0 0 0.4 0.4 {}
T {Graph Configuration:
Each graph has 3 configurations BEFORE plotting:

1. Set rawfile
2. Signals in Graph indicates the type of simulation (dc, tran)
3. Set dataset index} 1710 -430 0 0 0.4 0.4 {}
N -160 -60 -160 -40 {
lab=GND}
N -160 -220 -160 -120 {
lab=iref}
N -160 -220 -130 -220 {
lab=iref}
N -270 -50 -270 -30 {
lab=GND}
N -270 -260 -130 -260 {
lab=ref}
N -270 -250 -270 -110 {
lab=ref}
N 20 -330 20 -310 {
lab=vin}
N 230 -240 250 -240 {
lab=out}
N 250 -140 250 -120 {
lab=#net1}
N 250 -60 250 -40 {
lab=GND}
N 250 -240 250 -200 {
lab=out}
N -270 -260 -270 -250 {
lab=ref}
N 340 20 340 60 {
lab=DVDD}
N 410 20 410 60 {
lab=DVSS}
N 340 -10 340 20 {
lab=DVDD}
N 410 -10 410 20 {
lab=DVSS}
C {devices/isource.sym} -160 -90 2 0 {name=I1 value=10u
}
C {devices/gnd.sym} -160 -40 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} -270 -30 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -270 -80 0 0 {name=V1 value=1.25}
C {devices/lab_pin.sym} -200 -260 1 0 {name=l3 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} 20 -330 2 0 {name=l4 sig_type=std_logic lab=vin}
C {devices/iopin.sym} 250 -240 0 0 {name=p2 lab=out}
C {devices/vsource.sym} 200 -240 3 0 {name=v2 value=0}
C {devices/code_shown.sym} -921.25 -581.875 0 0 {name=NGSPICE1
only_toplevel=true
spice_ignore=false
value="
.param R=33
R10 out 0 \{R\}
IL out 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)

.param iref = 10u
.param vdd  = 5
.param vss  = 0.0
.param vcm  = 1.25
.param vac  = 60m
.param w857 = 5u
.param l857 = 1u
.param m857 = 1
.param wpar = 10u
.param lpar = 1u
.param mpar = 1
.param w34  = 10u
.param l34  = 1u
.param m34  = 1
.param w6   = 100u
.param l6   = 1u
.param m6   = 1

.param m5   = 1
.param m7   = 5


Vs vin 0 5

.nodeset v(out)=0
.nodeset v(x1.pos)=0

*supply_sweep
.control
save vin out
alter IL 0
dc Vs 6 0 -0.001
plot v(vin) v(out)
meas DC vldo_sup_4_6 FIND v(out) AT=4.6
meas DC vldo_nom FIND v(out) AT=5
meas DC vldo_sup_5_4 FIND v(out) AT=5.4
let line_reg = abs((vldo_sup_5_4-vldo_sup_4_6)/0.8)
print line_reg
meas DC vin WHEN v(out)=3.2982
let dropout = vin-3.2982
print dropout

write
.endc
"}
C {devices/capa.sym} 250 -90 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 250 -170 2 0 {name=R4
value=2
footprint=1206
device=resistor
m=1}
C {devices/code.sym} -131.25 -531.875 0 0 {name=MODELS_TT
only_toplevel=true
place=header
spice_ignore=0
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice bjt_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_typical

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
"}
C {devices/code.sym} -11.25 -531.875 0 0 {name=MODELS_SS
only_toplevel=true
place=header
spice_ignore=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice ss
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_ss

.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_ss

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
"}
C {devices/code.sym} 108.75 -531.875 0 0 {name=MODELS_FF
only_toplevel=true
place=header
spice_ignore=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice ff
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_ff

.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_ff

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
"}
C {devices/lab_pin.sym} -160 -190 2 0 {name=l11 sig_type=std_logic lab=iref}
C {devices/code_shown.sym} -290 60 0 0 {name="Extracted devices"
only_toplevel=false
spice_ignore=0
value="
.include ../../../spice/ldo_clean.spice
.include ../../../spice/ldo_pex.spice

Xvdd DVDD DVSS VSS gf180mcu_fd_io__dvdd
Xvss DVDD DVSS VDD gf180mcu_fd_io__dvss

Xiref iref DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0
Xref  ref  DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0
Xout  out  DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0

*** vdd ref iref out vss ldo_*
x1 vin ref iref out GND ldo_clean
*x1 vin ref iref out GND ldo_pex
"}
C {symbol/ldo.sym} 20 -240 0 0 {name=x2
spice_ignore=1}
C {devices/vsource.sym} 340 90 0 0 {name=V3 value=3.3}
C {devices/vsource.sym} 410 90 0 0 {name=V4 value=0}
C {devices/gnd.sym} 410 120 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 340 120 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 340 30 2 0 {name=l8 sig_type=std_logic lab=DVDD}
C {devices/lab_pin.sym} 410 30 2 0 {name=l9 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} 340 10 2 0 {name=l12 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 410 10 2 0 {name=l13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 20 -170 2 0 {name=l1 sig_type=std_logic lab=VSS}
C {devices/gnd.sym} 250 -40 0 0 {name=l14 lab=GND}
C {devices/launcher.sym} 570 -310 0 0 {name=h2
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 570 -410 0 0 {name=h5
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
C {devices/launcher.sym} 570 -350 0 0 {name=h1
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 520 -560 0 0 {name="Setup testbench"
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc

"}
C {devices/launcher.sym} 570 -270 0 0 {name=h3
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
