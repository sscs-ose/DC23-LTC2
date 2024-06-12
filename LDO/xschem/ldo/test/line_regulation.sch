v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 660 -210 1460 190 {flags=graph
y1=-0.0191302
y2=6.02919
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-0.15338
x2=6.94688
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
x1=-0.15338
x2=6.94688
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
Electrolitic Capacitor} 370 -180 0 0 0.4 0.4 {}
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
N 20 -330 20 -310 {
lab=vin}
N 250 -240 270 -240 {
lab=#net1}
N 270 -140 270 -120 {
lab=#net2}
N 270 -60 270 -40 {
lab=GND}
N 270 -240 270 -200 {
lab=#net1}
N -220 -140 -220 -100 {
lab=DVDD}
N -150 -140 -150 -100 {
lab=DVSS}
N 170 -240 190 -240 {
lab=out}
N -380 -140 -380 -100 {
lab=ref}
N -280 -140 -280 -100 {
lab=iref}
C {devices/isource.sym} -280 -70 2 0 {name=I1 value=10u
}
C {devices/gnd.sym} -280 -40 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} -380 -40 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -380 -70 0 0 {name=V1 value=1.25}
C {devices/lab_pin.sym} -380 -120 2 0 {name=l3 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} 20 -330 2 0 {name=l4 sig_type=std_logic lab=vin}
C {devices/iopin.sym} 180 -240 3 0 {name=p2 lab=out}
C {devices/vsource.sym} 220 -240 3 0 {name=v2 value=0}
C {devices/code_shown.sym} -921.25 -581.875 0 0 {name=NGSPICE1
only_toplevel=true
spice_ignore=false
value="
.param R=33
R10 out 0 \{R\}
IL out 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)

Vs vin 0 5

.nodeset v(out)=0
.nodeset v(x2.feedback)=0
.nodeset v(out)=3.3
.nodeset v(x2.op_out)=0

*supply_sweep
.control
save vin out
alter IL 0
dc Vs 6 0 -0.01
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
C {devices/capa.sym} 270 -90 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 270 -170 2 0 {name=R4
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
C {devices/lab_pin.sym} -280 -120 2 0 {name=l11 sig_type=std_logic lab=iref}
C {devices/code_shown.sym} 0 30 0 0 {name="PAD devices"
only_toplevel=false
spice_ignore=1
value="
*Xvdd DVDD DVSS VSS gf180mcu_fd_io__dvdd
*Xvss DVDD DVSS VDD gf180mcu_fd_io__dvss

*Xiref iref DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0
*Xref  ref  DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0
*Xout  out  DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0
"}
C {symbol/ldo.sym} 20 -240 0 0 {name=x2
spice_ignore=1}
C {devices/vsource.sym} -220 -70 0 0 {name=V3 value=5}
C {devices/vsource.sym} -150 -70 0 0 {name=V4 value=0}
C {devices/gnd.sym} -150 -40 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} -220 -40 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -220 -110 2 0 {name=l8 sig_type=std_logic lab=DVDD}
C {devices/lab_pin.sym} -150 -110 2 0 {name=l9 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} -220 -130 2 0 {name=l12 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -150 -130 2 0 {name=l13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 20 -170 2 0 {name=l1 sig_type=std_logic lab=VSS}
C {devices/gnd.sym} 270 -40 0 0 {name=l14 lab=GND}
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
C {devices/code_shown.sym} 0 480 0 0 {name="Magic pex extraction"
only_toplevel=false
spice_ignore=0
value="
.include ../../../spice/ldo_pex.spice
**** iref out ref vss vdd ldo_pex
x2   iref out ref GND vin ldo_pex
"}
C {devices/code_shown.sym} 0 240 0 0 {name="Magic clean extraction"
only_toplevel=false
spice_ignore=1
value="
.include ../../../spice/ldo_clean.spice
**** iref out ref vss vdd ldo_clean
x2   iref out ref GND vin ldo_clean
"}
C {devices/code_shown.sym} 0 360 0 0 {name="Klayout clean extraction"
only_toplevel=false
spice_ignore=1
value="
.include ../../../spice/ldo.cir
**** iref out ref vss vdd ldo
x2   iref out ref GND vin ldo
"}
C {devices/lab_pin.sym} -130 -260 0 0 {name=l7 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} -130 -220 0 0 {name=l15 sig_type=std_logic lab=iref}
