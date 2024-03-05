v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1180 -60 1800 280 {flags=graph,unlocked


ypos1=0
ypos2=2


unity=1









unitx=1
logx=0
logy=0







color="4 5"
node="vin
asig5v"
digital=0
linewidth_mult=4






subdivy=6

rainbow=0
xlabmag=1
ylabmag=1
x1=0
x2=3.3
y1=0
y2=3.4
divy=5
subdivx=2
divx=5
dataset=0}
T {This is a simple inverter simulation where it was added some PAD RING cells 
(schematic view) to test them, since they add a lot of passive componentes to 
the netlist. This is a DC simulation, works fine with these PADS} 200 -520 0 0 0.4 0.4 { layer=18}
N 370 310 370 315 {
lab=GND}
N 370 175 370 235 {
lab=DVDD}
N 430 295 430 315 {
lab=GND}
N 430 175 430 235 {
lab=VDD}
N 370 315 430 315 {
lab=GND}
N 270 -70 330 -70 {
lab=vin}
N 270 40 270 60 {
lab=DVSS}
N 430 315 500 315 {
lab=GND}
N 500 295 500 315 {
lab=GND}
N 500 190 500 235 {
lab=DVSS}
N 260 295 260 310 {
lab=GND}
N 260 310 370 310 {
lab=GND}
N 260 200 260 235 {
lab=VSS}
N 235 200 260 200 {
lab=VSS}
N 270 -70 270 -20 {
lab=vin}
N 370 -70 380 -70 {
lab=DVDD}
N 380 -100 380 -70 {
lab=DVDD}
N 370 -100 380 -100 {
lab=DVDD}
N 370 0 380 0 {
lab=DVSS}
N 380 0 380 30 {
lab=DVSS}
N 370 30 380 30 {
lab=DVSS}
N 370 -40 370 -30 {
lab=ASIG5V}
N 330 -70 330 0 {
lab=vin}
N 370 -150 370 -100 {
lab=DVDD}
N 370 -30 510 -30 {
lab=ASIG5V}
N 470 30 470 90 {
lab=DVSS}
N 370 30 370 90 {
lab=DVSS}
N 370 295 370 310 {
lab=GND}
C {devices/code_shown.sym} 200 -360 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice

Xc1 DVDD DVSS VDD VSS gf180mcu_fd_io__cor
Xf1 DVDD DVSS VDD VSS gf180mcu_fd_io__fill5
Xf2 DVDD DVSS VDD VSS gf180mcu_fd_io__fill10

Xsup1 DVDD DVSS VSS gf180mcu_fd_io__dvdd
Xsup2 DVDD DVSS VDD gf180mcu_fd_io__dvss

Xa1 ASIG5V DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0

"}
C {devices/vsource.sym} 370 265 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} 370 315 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 370 195 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 430 265 0 0 {name=V2 value=3.3}
C {devices/lab_wire.sym} 430 195 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 270 10 0 1 {name=Vin value=0}
C {devices/capa.sym} 470 0 0 0 {name=C1
m=1
value=10a
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} 945 20 0 0 {name=NGSPICE only_toplevel=true
value="
.control
save all

dc Vin 0 3.3 1m
 
write
.endc"}
C {devices/lab_wire.sym} 500 190 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 260 265 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} 240 200 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 270 60 0 0 {name=p7 sig_type=std_logic lab=DVSS}
C {devices/lab_wire.sym} 370 85 0 0 {name=p9 sig_type=std_logic lab=DVSS}
C {devices/lab_wire.sym} 470 85 0 0 {name=p11 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 500 265 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 510 -30 0 1 {name=p5 sig_type=std_logic lab=ASIG5V}
C {symbols/nfet_03v3.sym} 350 0 0 0 {name=M1
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 350 -70 0 0 {name=M2
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/lab_wire.sym} 370 -145 0 0 {name=p8 sig_type=std_logic lab=DVDD}
C {devices/lab_wire.sym} 290 -70 0 0 {name=p6 sig_type=std_logic lab=vin}
C {devices/code.sym} 1420 -310 0 0 {name=GF_MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
"}
C {devices/launcher.sym} 1240 -100 0 0 {name=h6
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 1240 -200 0 0 {name=h7
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
C {devices/launcher.sym} 1240 -140 0 0 {name=h8
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 1230 -310 0 0 {name=Setup testbench1
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc"}
C {devices/launcher.sym} 1440 -140 0 0 {name=h9
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
