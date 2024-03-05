v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 7 -130 -580 -130 -550 {}
B 2 740 -250 1600 -100 {flags=graph,unlocked


ypos1=0
ypos2=2


unity=1


divx=5





dataset=-1
unitx=1
logx=0
logy=0
x1=-1.23568e-07
x2=6.27676e-06

y2=4.27916
y1=-1.02083


color=6
node=vin
digital=0
linewidth_mult=5





subdivx=1
subdivy=5
divy=3
rainbow=0
xlabmag=1
ylabmag=1}
B 2 740 -100 1600 60 {flags=graph,unlocked


ypos1=0
ypos2=2


unity=1


divx=5





dataset=-1
unitx=1
logx=0
logy=0
x1=-1.23572e-07
x2=6.27676e-06

y2=4.5
y1=-0.8


color=5
node=asig5v
digital=0
linewidth_mult=5





subdivx=1
subdivy=5
divy=3
rainbow=0
xlabmag=1
ylabmag=1}
P 7 7 -210 -570 -160 -570 -160 -560 -140 -570 -160 -580 -160 -570 -210 -570 {}
T {If uncommented,
simulation do not work
"time step too small"} -410 -650 0 0 0.4 0.4 { layer=7}
T {This is a simple inverter simulation where it was added some PAD RING cells 
(schematic view) to test them, since they add a lot of passive componentes to 
the netlist. The simulation become sensitive ("time step too small") by 
adding de __cor and __fill5 cells.} -130 -780 0 0 0.4 0.4 { layer=18}
N 0 100 0 105 {
lab=GND}
N 0 -35 0 25 {
lab=DVDD}
N 60 85 60 105 {
lab=GND}
N 60 -35 60 25 {
lab=VDD}
N 0 105 60 105 {
lab=GND}
N -100 -280 -40 -280 {
lab=vin}
N -100 -170 -100 -150 {
lab=DVSS}
N 60 105 130 105 {
lab=GND}
N 130 85 130 105 {
lab=GND}
N 130 -20 130 25 {
lab=DVSS}
N -110 85 -110 100 {
lab=GND}
N -110 100 0 100 {
lab=GND}
N -110 -10 -110 25 {
lab=VSS}
N -135 -10 -110 -10 {
lab=VSS}
N -100 -280 -100 -230 {
lab=vin}
N 0 -280 10 -280 {
lab=DVDD}
N 10 -310 10 -280 {
lab=DVDD}
N 0 -310 10 -310 {
lab=DVDD}
N 0 -210 10 -210 {
lab=DVSS}
N 10 -210 10 -180 {
lab=DVSS}
N 0 -180 10 -180 {
lab=DVSS}
N 0 -250 0 -240 {
lab=ASIG5V}
N -40 -280 -40 -210 {
lab=vin}
N 0 -360 0 -310 {
lab=DVDD}
N 0 -240 140 -240 {
lab=ASIG5V}
N 100 -180 100 -120 {
lab=DVSS}
N 0 -180 0 -120 {
lab=DVSS}
N 0 85 0 100 {
lab=GND}
C {devices/code.sym} 980 -490 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
"}
C {devices/code_shown.sym} -140 -630 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice

*Xc1 DVDD DVSS VDD VSS gf180mcu_fd_io__cor
*Xf1 DVDD DVSS VDD VSS gf180mcu_fd_io__fill5
*Xf2 DVDD DVSS VDD VSS gf180mcu_fd_io__fill10

Xsup1 DVDD DVSS VSS gf180mcu_fd_io__dvdd
Xsup2 DVDD DVSS VDD gf180mcu_fd_io__dvss

Xa1 ASIG5V DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0

"}
C {devices/vsource.sym} 0 55 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} 0 105 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 0 -15 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 60 55 0 0 {name=V2 value=3.3}
C {devices/lab_wire.sym} 60 -15 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -100 -200 0 1 {name=Vin value="pulse(0 3.3 50p 50p 50p 1u 3u)"}
C {devices/capa.sym} 100 -210 0 0 {name=C1
m=1
value=10a
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} 515 -170 0 0 {name=NGSPICE only_toplevel=true
value="
.control
save all

tran 100n 10u

remzerovec 
write
.endc"}
C {devices/lab_wire.sym} 130 -20 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} -110 55 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} -130 -10 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} -100 -150 0 0 {name=p7 sig_type=std_logic lab=DVSS}
C {devices/lab_wire.sym} 0 -125 0 0 {name=p9 sig_type=std_logic lab=DVSS}
C {devices/lab_wire.sym} 100 -125 0 0 {name=p11 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 130 55 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 140 -240 0 1 {name=p5 sig_type=std_logic lab=ASIG5V}
C {symbols/nfet_03v3.sym} -20 -210 0 0 {name=M1
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
C {symbols/pfet_03v3.sym} -20 -280 0 0 {name=M2
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
C {devices/lab_wire.sym} 0 -355 0 0 {name=p8 sig_type=std_logic lab=DVDD}
C {devices/lab_wire.sym} -80 -280 0 0 {name=p6 sig_type=std_logic lab=vin}
C {devices/launcher.sym} 800 -280 0 0 {name=h6
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 800 -380 0 0 {name=h7
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
C {devices/launcher.sym} 800 -320 0 0 {name=h8
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 790 -490 0 0 {name=Setup testbench1
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc"}
C {devices/launcher.sym} 1000 -320 0 0 {name=h9
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
