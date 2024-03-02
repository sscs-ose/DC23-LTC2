v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 750 -1050 1530 -630 {flags=graph






unity=1




xlabmag=1.0

node="a
pad0
y0"
color="4 5 21"
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=1e-07
digital=1
subdivx=5

divx=5
rainbow=0

linewidth_mult=4
ylabmag=0.7
divy=2
subdivy=10}
B 2 750 -630 1530 -210 {flags=graph





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




x2=1e-07
digital=1
subdivx=5

divx=5
rainbow=0
divy=1
linewidth_mult=4
ylabmag=0.7}
B 2 1530 -1050 2310 -630 {flags=graph





subdivy=3
unity=1




xlabmag=1.0

node="pad2
y2"
color="5 21"
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=1e-07
digital=1
subdivx=5

divx=5
rainbow=0
divy=1
linewidth_mult=4
ylabmag=0.7}
B 2 1530 -630 2310 -210 {flags=graph





subdivy=3
unity=1




xlabmag=1.0

node="pad3
y3"
color="5 21"
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=1e-07
digital=1
subdivx=5

divx=5
rainbow=0
divy=1
linewidth_mult=4
ylabmag=0.7}
P 7 7 1660 -1270 1660 -1220 1650 -1220 1660 -1200 1670 -1220 1660 -1220 1660 -1270 {}
T {Change PATH} 1670 -1280 0 0 0.7 0.7 { layer=7}
N 840 -1120 840 -1100 {
lab=GND}
N 840 -1240 840 -1180 {
lab=DVDD}
N 900 -1120 900 -1100 {
lab=GND}
N 900 -1240 900 -1180 {
lab=VDD}
N 840 -1100 900 -1100 {
lab=GND}
N 960 -1120 960 -1100 {
lab=GND}
N 960 -1240 960 -1180 {
lab=DVSS}
N 1020 -1120 1020 -1100 {
lab=GND}
N 1020 -1240 1020 -1180 {
lab=VSS}
N 960 -1100 1020 -1100 {
lab=GND}
N 900 -1100 960 -1100 {
lab=GND}
N 680 -1050 680 -1030 {
lab=GND}
N 680 -1170 680 -1110 {
lab=A}
N 1200 -1120 1200 -1100 {
lab=GND}
N 1200 -1240 1200 -1180 {
lab=IE}
N 1260 -1120 1260 -1100 {
lab=GND}
N 1200 -1100 1260 -1100 {
lab=GND}
N 1260 -1240 1260 -1180 {
lab=OE}
N 1320 -1120 1320 -1100 {
lab=GND}
N 1260 -1100 1320 -1100 {
lab=GND}
N 1320 -1240 1320 -1180 {
lab=PU}
N 1380 -1120 1380 -1100 {
lab=GND}
N 1320 -1100 1380 -1100 {
lab=GND}
N 1380 -1240 1380 -1180 {
lab=PD}
N 1440 -1120 1440 -1100 {
lab=GND}
N 1380 -1100 1440 -1100 {
lab=GND}
N 1440 -1240 1440 -1180 {
lab=SL}
N 1500 -1120 1500 -1100 {
lab=GND}
N 1440 -1100 1500 -1100 {
lab=GND}
N 1500 -1240 1500 -1180 {
lab=CS}
N 1020 -1100 1200 -1100 {
lab=GND}
C {devices/code_shown.sym} 390 -880 0 0 {name=s1
only_toplevel=false
value="
.option klu

.control
save all

tran 100p 100n
remzerovec
write digital_io_switching.raw

.endc
"
}
C {devices/code_shown.sym} 730 -1490 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice diode_typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
"
}
C {devices/code_shown.sym} 1550 -1210 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include "../../../../spice/gf180mcu_fd_io.spice"
XDUT0 A CS DVDD DVSS IE OE PAD0 PD VSS VSS PU SL VDD VSS Y0 gf180mcu_fd_io__bi_t
XDUT1 A CS DVDD DVSS IE OE PAD1 PD VDD VSS PU SL VDD VSS Y1 gf180mcu_fd_io__bi_t
XDUT2 A CS DVDD DVSS IE OE PAD2 PD VSS VDD PU SL VDD VSS Y2 gf180mcu_fd_io__bi_t
XDUT3 A CS DVDD DVSS IE OE PAD3 PD VDD VDD PU SL VDD VSS Y3 gf180mcu_fd_io__bi_t
"
}
C {devices/vsource.sym} 840 -1150 0 0 {name=V1 value=3.3
}
C {devices/gnd.sym} 840 -1100 0 0 {name=l1 lab=GND
}
C {devices/lab_wire.sym} 840 -1220 0 0 {name=p1 sig_type=std_logic lab=DVDD
}
C {devices/vsource.sym} 900 -1150 0 0 {name=V2 value=3.3
}
C {devices/lab_wire.sym} 900 -1220 0 0 {name=p2 sig_type=std_logic lab=VDD
}
C {devices/vsource.sym} 960 -1150 0 0 {name=V3 value=0
}
C {devices/lab_wire.sym} 960 -1220 0 0 {name=p3 sig_type=std_logic lab=DVSS
}
C {devices/vsource.sym} 1020 -1150 0 0 {name=V4 value=0
}
C {devices/lab_wire.sym} 1020 -1220 0 0 {name=p4 sig_type=std_logic lab=VSS
}
C {devices/vsource.sym} 680 -1080 0 0 {name=V5 value="PULSE(0 3.3 10n 100p 100p 10n 20n)"
}
C {devices/lab_wire.sym} 680 -1150 0 0 {name=p5 sig_type=std_logic lab=A
}
C {devices/vsource.sym} 1200 -1150 0 0 {name=V7 value=3.3
}
C {devices/lab_wire.sym} 1200 -1220 0 0 {name=p7 sig_type=std_logic lab=IE
}
C {devices/vsource.sym} 1260 -1150 0 0 {name=V8 value=3.3
}
C {devices/lab_wire.sym} 1260 -1220 0 0 {name=p8 sig_type=std_logic lab=OE
}
C {devices/vsource.sym} 1320 -1150 0 0 {name=V9 value=0
}
C {devices/lab_wire.sym} 1320 -1220 0 0 {name=p9 sig_type=std_logic lab=PU
}
C {devices/vsource.sym} 1380 -1150 0 0 {name=V10 value=0
}
C {devices/lab_wire.sym} 1380 -1220 0 0 {name=p10 sig_type=std_logic lab=PD
}
C {devices/vsource.sym} 1440 -1150 0 0 {name=V11 value=0
}
C {devices/lab_wire.sym} 1440 -1220 0 0 {name=p11 sig_type=std_logic lab=SL
}
C {devices/gnd.sym} 680 -1030 0 0 {name=l2 lab=GND
}
C {devices/vsource.sym} 1500 -1150 0 0 {name=V13 value=3.3
}
C {devices/lab_wire.sym} 1500 -1220 0 0 {name=p13 sig_type=std_logic lab=CS
}
C {devices/launcher.sym} 445 -945 0 0 {name=h1
descr="Load/unload waveforms."
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw
"
}
