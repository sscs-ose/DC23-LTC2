v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 0 940 10 970 20 {}
B 2 1810 -210 2610 190 {flags=graph


ypos1=0
ypos2=2


unity=n
x1=0.27982

divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0







color="6 5"
node="i(vi_in)
i(vi_in_pad)"
linewidth_mult=4
divy=5
subdivy=3
x2=2.80722
y1=9.7n
y2=10.05n
digital=0
rainbow=0}
P 3 7 970 20 920 20 920 10 900 20 920 30 920 20 970 20 {}
T {This is the PAD conection
ASIG net is supouse to have same signal (minus leak).

Circuit block represented by a simple CM.} 980 -40 0 0 0.4 0.4 { layer=3}
T {Current Source - In} 2410 -250 0 0 0.4 0.4 { layer=6}
T {Current Source - After PAD} 2410 -280 0 0 0.4 0.4 { layer=7}
N 1050 -130 1050 -110 {
lab=GND}
N 1050 -250 1050 -190 {
lab=DVDD}
N 1110 -130 1110 -110 {
lab=GND}
N 1110 -250 1110 -190 {
lab=VDD}
N 1050 -110 1110 -110 {
lab=GND}
N 1170 -130 1170 -110 {
lab=GND}
N 1170 -250 1170 -190 {
lab=DVSS}
N 1230 -130 1230 -110 {
lab=GND}
N 1230 -250 1230 -190 {
lab=VSS}
N 1170 -110 1230 -110 {
lab=GND}
N 1110 -110 1170 -110 {
lab=GND}
N 930 200 970 200 {
lab=ASIG}
N 890 60 890 90 {
lab=ASIG}
N 890 60 950 60 {
lab=ASIG}
N 960 60 960 120 {
lab=ASIG}
N 890 230 890 240 {
lab=GND}
N 890 240 950 240 {
lab=GND}
N 950 240 1010 240 {
lab=GND}
N 1010 230 1010 240 {
lab=GND}
N 890 40 890 60 {
lab=ASIG}
N 1010 150 1010 170 {
lab=vout}
N 870 200 890 200 {
lab=GND}
N 870 200 870 240 {
lab=GND}
N 870 240 890 240 {
lab=GND}
N 1010 200 1030 200 {
lab=GND}
N 1030 200 1030 240 {
lab=GND}
N 1010 240 1030 240 {
lab=GND}
N 1010 120 1010 150 {
lab=vout}
N 890 -30 890 0 {
lab=ASIG}
N 890 -120 890 -90 {
lab=#net1}
N 850 -180 890 -180 {
lab=VDD}
N 850 -190 850 -180 {
lab=VDD}
N 1040 120 1100 120 {
lab=vout}
N 960 120 960 200 {
lab=ASIG}
N 890 150 890 170 {
lab=#net2}
N 950 60 960 60 {
lab=ASIG}
N 1010 120 1040 120 {
lab=vout}
N 890 0 890 40 {
lab=ASIG}
C {devices/code_shown.sym} 1540 -110 0 0 {name="dc"
only_toplevel=false
value="
.option gmin=1e-24
.control
save all

dc Vout 0 3.3 10m

remzerovec 
write
.endc"}
C {devices/code_shown.sym} 810 -460 0 0 {name=DUT only_toplevel=true
format="tcleval( @value )"
value="
.include ../../../../spice/gf180mcu_fd_io__asig_5p0_extracted.spice
.include ../../../../spice/gf180mcu_fd_io__asig_5p0_gab.spice

*.include ../../../../spice/asig5v_io_cell.spice


Xclosed DVSS DVDD VSS VDD ASIG ASIG gf180mcu_fd_io__asig_5p0_extracted
*Xopen DVSS DVDD ASIG DVDD VSS VDD gf180mcu_fd_io__asig_5p0

*Xopen_gab VSS VDD ASIG DVSS DVDD gf180mcu_fd_io__asig_5p0

"}
C {devices/vsource.sym} 1050 -160 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} 1050 -110 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 1050 -230 0 0 {name=p1 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 1110 -160 0 0 {name=V2 value=3.3}
C {devices/lab_wire.sym} 1110 -230 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 1170 -160 0 0 {name=V3 value=0}
C {devices/lab_wire.sym} 1170 -230 0 0 {name=p3 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} 1230 -160 0 0 {name=V4 value=0}
C {devices/lab_wire.sym} 1230 -230 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {symbols/nfet_03v3.sym} 990 200 0 0 {name=M1
L=20u
W=20u
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
C {symbols/nfet_03v3.sym} 910 200 0 1 {name=M4
L=20u
W=20u
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
C {devices/gnd.sym} 950 240 0 0 {name=l3 lab=GND}
C {devices/lab_wire.sym} 890 40 0 0 {name=p7 sig_type=std_logic lab=ASIG}
C {devices/lab_wire.sym} 1010 120 0 0 {name=p6 sig_type=std_logic lab=vout}
C {devices/lab_wire.sym} 850 -190 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 1100 240 0 0 {name=l2 lab=GND}
C {devices/isource.sym} 890 -60 0 0 {name=I0 value=10n}
C {devices/ammeter.sym} 890 -150 0 0 {name=Vi_in}
C {devices/ammeter.sym} 890 120 0 0 {name=Vi_in_pad}
C {devices/ammeter.sym} 1100 210 0 0 {name=Vi_out}
C {devices/vsource.sym} 1100 150 0 0 {name=Vout value=1}
C {devices/launcher.sym} 1870 -250 0 0 {name=h4
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 1870 -350 0 0 {name=h5
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
C {devices/launcher.sym} 1870 -290 0 0 {name=h9
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/code_shown.sym} 1860 -460 0 0 {name=Setup testbench1
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc"}
C {devices/launcher.sym} 2070 -290 0 0 {name=h10
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
C {devices/code.sym} 2050 -470 0 0 {name=GF_MODELS
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
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
"}
