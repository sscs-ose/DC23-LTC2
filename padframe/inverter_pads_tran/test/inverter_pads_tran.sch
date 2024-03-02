v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 7 500 -520 500 -490 {}
B 2 490 -230 1350 -80 {flags=graph,unlocked


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
B 2 490 -80 1350 80 {flags=graph,unlocked


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
P 7 7 600 -630 600 -580 590 -580 600 -560 610 -580 600 -580 600 -630 {}
P 7 7 420 -510 470 -510 470 -500 490 -510 470 -520 470 -510 420 -510 {}
T {PATH to IO cells ($PDK/$PDK_ROOT/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice)
.include /PATH-TO/gf180mcu_fd_io.spice} 620 -650 0 0 0.4 0.4 { layer=7}
T {If uncommented,
simulation do not work
"time step too small"} 220 -590 0 0 0.4 0.4 { layer=7}
T {This is a simple inverter simulation where it was added some PAD RING cells 
(schematic view) to test them, since they add a lot of passive componentes to 
the netlist. The simulation become sensitive ("time step too small") by 
adding de __cor and __fill5 cells.} -650 -450 0 0 0.4 0.4 { layer=18}
N 270 90 270 95 {
lab=GND}
N 270 -45 270 15 {
lab=DVDD}
N 330 75 330 95 {
lab=GND}
N 330 -45 330 15 {
lab=VDD}
N 270 95 330 95 {
lab=GND}
N 170 -290 230 -290 {
lab=vin}
N 170 -180 170 -160 {
lab=DVSS}
N 330 95 400 95 {
lab=GND}
N 400 75 400 95 {
lab=GND}
N 400 -30 400 15 {
lab=DVSS}
N 160 75 160 90 {
lab=GND}
N 160 90 270 90 {
lab=GND}
N 160 -20 160 15 {
lab=VSS}
N 135 -20 160 -20 {
lab=VSS}
N 170 -290 170 -240 {
lab=vin}
N 270 -290 280 -290 {
lab=DVDD}
N 280 -320 280 -290 {
lab=DVDD}
N 270 -320 280 -320 {
lab=DVDD}
N 270 -220 280 -220 {
lab=DVSS}
N 280 -220 280 -190 {
lab=DVSS}
N 270 -190 280 -190 {
lab=DVSS}
N 270 -260 270 -250 {
lab=ASIG5V}
N 230 -290 230 -220 {
lab=vin}
N 270 -370 270 -320 {
lab=DVDD}
N 270 -250 410 -250 {
lab=ASIG5V}
N 370 -190 370 -130 {
lab=DVSS}
N 270 -190 270 -130 {
lab=DVSS}
N 270 75 270 90 {
lab=GND}
C {devices/code.sym} -180 -280 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice moscap_typical
"}
C {devices/code_shown.sym} 490 -570 0 0 {name=DUT only_toplevel=true
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
C {devices/vsource.sym} 270 45 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} 270 95 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 270 -25 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 330 45 0 0 {name=V2 value=3.3}
C {devices/lab_wire.sym} 330 -25 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 170 -210 0 1 {name=Vin value="pulse(0 3.3 50p 50p 50p 1u 3u)"}
C {devices/capa.sym} 370 -220 0 0 {name=C1
m=1
value=10a
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} -165 -90 0 0 {name=NGSPICE only_toplevel=true
value="

.control
 save all
 tran 100n 10u
 
 write inverter_pads_tran.raw

.endc

"}
C {devices/lab_wire.sym} 400 -30 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 160 45 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} 140 -20 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 170 -160 0 0 {name=p7 sig_type=std_logic lab=DVSS}
C {devices/lab_wire.sym} 270 -135 0 0 {name=p9 sig_type=std_logic lab=DVSS}
C {devices/lab_wire.sym} 370 -135 0 0 {name=p11 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 400 45 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 410 -250 0 1 {name=p5 sig_type=std_logic lab=ASIG5V}
C {symbols/nfet_03v3.sym} 250 -220 0 0 {name=M1
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
C {symbols/pfet_03v3.sym} 250 -290 0 0 {name=M2
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
C {devices/lab_wire.sym} 270 -365 0 0 {name=p8 sig_type=std_logic lab=DVDD}
C {devices/lab_wire.sym} 190 -290 0 0 {name=p6 sig_type=std_logic lab=vin}
C {devices/launcher.sym} 555 -265 0 0 {name=h1
descr="Load/unload waveforms in graph."
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw
"
}
