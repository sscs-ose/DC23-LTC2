v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 750 -1050 1530 -630 {flags=graph






unity=1




xlabmag=1.0

node="pad
y0"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=1e-07
digital=0
subdivx=5

divx=5
rainbow=0

linewidth_mult=4
ylabmag=0.7

subdivy=10
divy=2
y1=-0.088
y2=3.5}
B 2 1532.5 -1048.75 2312.5 -628.75 {flags=graph






unity=1




xlabmag=1.0

node="\\"y0 y1 -\\""
color=4
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=1e-07
digital=0
subdivx=5

divx=5
rainbow=0

linewidth_mult=4
ylabmag=0.7

subdivy=10
divy=2
y1=-0.0049
y2=4e-05}
B 2 1532.5 -626.25 2312.5 -206.25 {flags=graph






unity=1




xlabmag=1.0

node="\\"y0 y2 -\\""
color=4
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=1e-07
digital=0
subdivx=5

divx=5
rainbow=0

linewidth_mult=4
ylabmag=0.7

subdivy=10
divy=2
y1=-0.003
y2=0.041}
B 2 1533.75 -202.5 2313.75 217.5 {flags=graph






unity=1




xlabmag=1.0

node="\\"y0 y3 -\\""
color=4
dataset=-1
unitx=1
logx=0
logy=0



x1=0




x2=1e-07
digital=0
subdivx=5

divx=5
rainbow=0

linewidth_mult=4
ylabmag=0.7

subdivy=10
divy=2
y1=-1.5e-06
y2=1.1e-08}
N -210 -640 -210 -620 {
lab=GND}
N -210 -760 -210 -700 {
lab=DVDD}
N -150 -640 -150 -620 {
lab=GND}
N -150 -760 -150 -700 {
lab=VDD}
N -210 -620 -150 -620 {
lab=GND}
N -90 -640 -90 -620 {
lab=GND}
N -90 -760 -90 -700 {
lab=DVSS}
N -30 -640 -30 -620 {
lab=GND}
N -30 -760 -30 -700 {
lab=VSS}
N -90 -620 -30 -620 {
lab=GND}
N -150 -620 -90 -620 {
lab=GND}
N 70 -475 70 -455 {
lab=GND}
N 70 -595 70 -535 {
lab=PAD}
N 150 -640 150 -620 {
lab=GND}
N 150 -760 150 -700 {
lab=IE}
N 210 -640 210 -620 {
lab=GND}
N 150 -620 210 -620 {
lab=GND}
N 210 -760 210 -700 {
lab=OE}
N 270 -640 270 -620 {
lab=GND}
N 210 -620 270 -620 {
lab=GND}
N 270 -760 270 -700 {
lab=PU}
N 330 -640 330 -620 {
lab=GND}
N 270 -620 330 -620 {
lab=GND}
N 330 -760 330 -700 {
lab=PD}
N 390 -640 390 -620 {
lab=GND}
N 330 -620 390 -620 {
lab=GND}
N 390 -760 390 -700 {
lab=SL}
N 450 -640 450 -620 {
lab=GND}
N 390 -620 450 -620 {
lab=GND}
N 450 -760 450 -700 {
lab=CS}
N -30 -620 150 -620 {
lab=GND}
C {devices/code_shown.sym} 580 -950 0 0 {name=s1
only_toplevel=false
value="
.control
save all

tran 100p 100n
plot PAD Y0

remzerovec
write
.endc
"}
C {devices/code_shown.sym} -260 -890 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
spice_ignore=1
value="
*****  DVDD DVSS PAD PD   PU   VDD VSS Y  gf180mcu_fd_io__in_c
xdut0  DVDD DVSS PAD DVSS DVSS VDD VSS Y0 gf180mcu_fd_io__in_c
xdut1  DVDD DVSS PAD DVSS DVDD VDD VSS Y1 gf180mcu_fd_io__in_c
xdut2  DVDD DVSS PAD DVDD DVSS VDD VSS Y2 gf180mcu_fd_io__in_c
xdut3  DVDD DVSS PAD DVDD DVDD VDD VSS Y3 gf180mcu_fd_io__in_c
"
}
C {devices/vsource.sym} -210 -670 0 0 {name=V1 value=3.3
}
C {devices/gnd.sym} -210 -620 0 0 {name=l1 lab=GND
}
C {devices/lab_wire.sym} -210 -740 0 0 {name=p1 sig_type=std_logic lab=DVDD
}
C {devices/vsource.sym} -150 -670 0 0 {name=V2 value=3.3
}
C {devices/lab_wire.sym} -150 -740 0 0 {name=p2 sig_type=std_logic lab=VDD
}
C {devices/vsource.sym} -90 -670 0 0 {name=V3 value=0
}
C {devices/lab_wire.sym} -90 -740 0 0 {name=p3 sig_type=std_logic lab=DVSS
}
C {devices/vsource.sym} -30 -670 0 0 {name=V4 value=0
}
C {devices/lab_wire.sym} -30 -740 0 0 {name=p4 sig_type=std_logic lab=VSS
}
C {devices/vsource.sym} 70 -505 0 0 {name=V5 value="PULSE(0 3.3 10n 100p 100p 10n 20n)"
}
C {devices/lab_wire.sym} 70 -575 0 0 {name=p5 sig_type=std_logic lab=PAD
}
C {devices/vsource.sym} 150 -670 0 0 {name=V7 value=3.3
}
C {devices/lab_wire.sym} 150 -740 0 0 {name=p7 sig_type=std_logic lab=IE
}
C {devices/vsource.sym} 210 -670 0 0 {name=V8 value=3.3
}
C {devices/lab_wire.sym} 210 -740 0 0 {name=p8 sig_type=std_logic lab=OE
}
C {devices/vsource.sym} 270 -670 0 0 {name=V9 value=0
}
C {devices/lab_wire.sym} 270 -740 0 0 {name=p9 sig_type=std_logic lab=PU
}
C {devices/vsource.sym} 330 -670 0 0 {name=V10 value=0
}
C {devices/lab_wire.sym} 330 -740 0 0 {name=p10 sig_type=std_logic lab=PD
}
C {devices/vsource.sym} 390 -670 0 0 {name=V11 value=0
}
C {devices/lab_wire.sym} 390 -740 0 0 {name=p11 sig_type=std_logic lab=SL
}
C {devices/gnd.sym} 70 -455 0 0 {name=l2 lab=GND
}
C {devices/vsource.sym} 450 -670 0 0 {name=V13 value=3.3
}
C {devices/lab_wire.sym} 450 -740 0 0 {name=p13 sig_type=std_logic lab=CS
}
C {devices/code.sym} 1000 -1290 0 0 {name=GF_MODELS
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

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
"}
C {devices/launcher.sym} 810 -1080 0 0 {name=h1
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 810 -1180 0 0 {name=h6
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
C {devices/launcher.sym} 810 -1120 0 0 {name=h7
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 800 -1290 0 0 {name=Setup testbench1
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc"}
C {devices/launcher.sym} 1010 -1120 0 0 {name=h8
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
C {devices/code_shown.sym} -260 -370 0 0 {name=DUT1 only_toplevel=true
format="tcleval( @value )"
value="
.include ../../../../spice/gf180mcu_fd_io__in_c_clean.spice
*****  DVDD DVSS PAD PD   PU   VDD VSS Y  gf180mcu_fd_io__in_c_clean
xdut0  DVDD DVSS PAD DVDD DVDD VDD VSS Y0 gf180mcu_fd_io__in_c_clean
"
}
