v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 778.75 420 1578.75 820 {flags=graph,unlocked
y1=8400
y2=8500
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=3.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1
dataset=-1
rawfile=$netlist_dir/rawspice.raw
sim_type=dc

color=4
node=i(vid)}
B 2 1598.75 420 2398.75 820 {flags=graph,unlocked
y1=-0.0028
y2=0.00013
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=2.50163e-08
x2=2.57542e-08
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0

color=5
node="\\"Difference between clean and pex; out out_pex -\\""

digital=0
rainbow=1
dataset=0
rawfile=$netlist_dir/rawspice.raw
sim_type=dc}
B 2 780 0 1580 400 {flags=graph,unlocked
y1=8580
y2=8680
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=1.5e-07
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
sim_type=tran
color=4
node="i(vid)"}
T {Template usage:

1. Each simulation should have in the title:
- Type of simulation (tran, dc, etc)
- Name of the simulation (Purpose, something like that)
2. Each simulation of set of simulations should be contained on the same control block.
3. Use Shift-S to change element processing order.
4. Graphs should use the dataset index in the same order of element processing} 970 -210 0 0 0.4 0.4 {}
T {Graph Configuration:
Each graph has 3 configurations BEFORE plotting:

1. Set rawfile
2. Signals in Graph indicates the type of simulation (dc, tran)
3. Set dataset index} 1820 -160 0 0 0.4 0.4 {}
N -140 250 -140 260 {
lab=GND}
N -60 250 -60 260 {
lab=GND}
N -100 260 -100 270 {
lab=GND}
N -140 150 -140 190 {
lab=vss}
N -60 150 -60 190 {
lab=vdd}
N 30 150 30 190 {
lab=g}
N 110 80 120 80 {
lab=g}
N -140 260 -60 260 {
lab=GND}
N 160 110 160 160 {
lab=vss}
N 160 80 180 80 {
lab=vss}
N 30 250 30 270 {
lab=vss}
N 180 80 180 130 {
lab=vss}
N 160 130 180 130 {
lab=vss}
N 60 -140 60 -110 {
lab=vdd}
N 160 30 160 50 {
lab=vdd_spice}
N 160 -140 160 -110 {
lab=vdd}
N 260 -140 260 -110 {
lab=vdd}
N 160 -50 160 -20 {
lab=vdd_clean}
N 260 -50 260 -20 {
lab=vdd_pex}
N 60 -50 60 -20 {
lab=vdd_spice}
C {devices/vsource.sym} -60 220 0 0 {name=vvdd value=3.3 savecurrent=false}
C {devices/gnd.sym} -100 270 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 30 220 0 0 {name=vg
value="pulse(0 3.3 0 1n 1n 50n 100n)"
savecurrent=false}
C {devices/lab_pin.sym} 110 80 0 0 {name=p1 sig_type=std_logic lab=g}
C {devices/code_shown.sym} 380 30 0 0 {name="tran: Pulses 100n"
only_toplevel=false
spice_ignore=0
value="
.control
save all

tran 0.1n 150n
*plot i(vid)

write
.endc
"}
C {devices/launcher.sym} 680 -40 0 0 {name=h2
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/code.sym} -220 -60 0 0 {name=MODELS
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
C {devices/launcher.sym} 680 -140 0 0 {name=h5
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
C {devices/launcher.sym} 680 -80 0 0 {name=h1
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} -100 -300 0 0 {name="Clean Simulation"
spice_ignore=0
value="
.include ../layout_clean/waffle_1984_extracted.spice
.include ../layout_pex/waffle_1984_pex.spice

Xclean  vdd_clean g vss vss waffle_1984

*.save i(vid_clean)
"}
C {devices/vsource.sym} -140 220 0 0 {name=vvss value=0 savecurrent=false}
C {devices/lab_pin.sym} -60 170 2 0 {name=p4 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -140 170 2 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 60 -140 2 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 160 160 2 0 {name=p7 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 30 170 2 0 {name=p2 sig_type=std_logic lab=g}
C {devices/code_shown.sym} 380 -120 0 0 {name="Setup testbench"
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc

"}
C {devices/code_shown.sym} 378.75 450 0 0 {name="dc: Transfer curve"
only_toplevel=false
spice_ignore=0
value="
.control
save all

dc vvdd 0 3.3 0.01 vg 0 3.3 0.5

plot i(vid) i(vid_clean)

write

.endc
"}
C {devices/lab_pin.sym} 30 270 2 0 {name=p8 sig_type=std_logic lab=vss}
C {devices/ammeter.sym} 60 -80 0 0 {name=vid savecurrent=true}
C {symbols/pfet_03v3.sym} 140 80 0 0 {name=M1
L=0.5u
W=4.38u
nf=1
m=1984
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} 160 -140 2 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/ammeter.sym} 160 -80 0 0 {name=vid_clean savecurrent=true}
C {devices/lab_pin.sym} 260 -140 2 0 {name=p9 sig_type=std_logic lab=vdd}
C {devices/ammeter.sym} 260 -80 0 0 {name=vid_pex savecurrent=true}
C {devices/lab_pin.sym} 160 -20 2 0 {name=p10 sig_type=std_logic lab=vdd_clean}
C {devices/lab_pin.sym} 260 -20 2 0 {name=p11 sig_type=std_logic lab=vdd_pex}
C {devices/lab_pin.sym} 60 -20 2 0 {name=p12 sig_type=std_logic lab=vdd_spice}
C {devices/lab_pin.sym} 160 30 2 0 {name=p13 sig_type=std_logic lab=vdd_spice}
