v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 580 -330 1380 70 {flags=graph,unlocked
y1=-1.3
y2=4e-33
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=-3.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1

rawfile=$netlist_dir/rawspice.raw
sim_type=dc





color=4
node="\\"Id vs Vgs (Spice);i(vids1)\\""
}
B 2 1400 -330 2200 70 {flags=graph,unlocked
y1=-1.3
y2=0
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=-3.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1

rawfile=$netlist_dir/rawspice.raw
sim_type=dc





color=4
node="\\"Id vs Vgs (Clean extraction);i(vids2)\\""
}
B 2 2220 -330 3020 70 {flags=graph,unlocked
y1=0
y2=0.01
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=-3.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1

rawfile=$netlist_dir/rawspice.raw
sim_type=dc





color=4
node="\\"Id vs Vgs (PEX extraction);i(vids3)\\""
}
B 2 580 120 1380 520 {flags=graph,unlocked
y1=-1.3
y2=4e-33
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=-3.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1

rawfile=$netlist_dir/rawspice.raw
sim_type=dc





color=4
node="\\"Id vs Vgs (Spice);i(vids1)\\""
}
B 2 1400 120 2200 520 {flags=graph,unlocked
y1=-1.9e-12
y2=0.00023
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
x2=-3.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=1

rawfile=$netlist_dir/rawspice.raw
sim_type=dc





color=4
node="\\"Difference spice vs clean;i(vids1) i(vids2) -\\""
}
N -400 -230 -400 -220 {
lab=GND}
N -340 -230 -340 -220 {
lab=GND}
N -400 -220 -340 -220 {
lab=GND}
N -370 -220 -370 -210 {
lab=GND}
N -340 -320 -340 -290 {
lab=d}
N -400 -320 -400 -290 {
lab=g}
N -200 -200 -200 -170 {
lab=d_spice}
N -200 -140 -180 -140 {
lab=GND}
N -200 -110 -200 -90 {
lab=GND}
N -260 -140 -240 -140 {
lab=g}
N -180 -140 -180 -100 {
lab=GND}
N -200 -100 -180 -100 {
lab=GND}
C {devices/gnd.sym} -200 -90 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} -370 -210 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -400 -260 0 0 {name=vgs value=-3.3 savecurrent=false}
C {devices/vsource.sym} -340 -260 0 0 {name=vds value=-3.3 savecurrent=false}
C {devices/lab_pin.sym} -340 -320 0 0 {name=p4 sig_type=std_logic lab=d}
C {devices/lab_pin.sym} -400 -320 0 0 {name=p3 sig_type=std_logic lab=g}
C {devices/code_shown.sym} 100 -220 0 0 {name="dc: voltage transference curve"
only_toplevel=true
spice_ignore=0
value="
.control
dc vds 0 -3.3 -0.01 vgs 0 -3.3 -0.55

plot -i(vids1) -i(vids2) -i(vids3)

plot -i(vids1)
plot -i(vids2)
plot -i(vids3)

write
.endc
" }
C {devices/launcher.sym} 430 -330 0 0 {name=h2
descr="Load TRAN"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath tran
"
}
C {devices/launcher.sym} 430 -430 0 0 {name=h5
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
C {devices/launcher.sym} 430 -370 0 0 {name=h1
descr="Load DC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath dc
"
}
C {devices/launcher.sym} 430 -290 0 0 {name=h3
descr="Load AC"
tclcommand="
set filepath $\{netlist_dir\}/rawspice.raw
puts $filepath

xschem raw_clear
xschem raw_read $filepath ac
"
}
C {devices/code_shown.sym} 420 -510 0 0 {name="Setup testbench"
only_toplevel=false
place=header
format="tcleval( @value )"
value=".control
write
set appendwrite
.endc"}
C {devices/code_shown.sym} -460 -50 0 0 {name="Extracted devices"
only_toplevel=false
spice_ignore=0
value="
xclean GND g d_clean GND waffle_1984_clean
*xpex   GND g d_pex   GND waffle_1984_pex

.include ../layout_clean/waffle_1984_clean.spice
.include ../layout_pex/waffle_1984_pex.spice
"
}
C {devices/ammeter.sym} -190 -330 0 0 {name=vids1 savecurrent=true}
C {devices/ammeter.sym} -90 -330 0 0 {name=vids2 savecurrent=true}
C {symbols/pfet_03v3.sym} -220 -140 0 0 {name=M1
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
C {devices/code.sym} -400 -510 0 0 {name=GF_MODELS
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
C {devices/ammeter.sym} -10 -330 0 0 {name=vids3 savecurrent=true}
C {devices/lab_pin.sym} -260 -140 0 0 {name=p11 sig_type=std_logic lab=g}
C {devices/lab_pin.sym} -190 -360 0 0 {name=p1 sig_type=std_logic lab=d}
C {devices/lab_pin.sym} -90 -360 0 0 {name=p2 sig_type=std_logic lab=d}
C {devices/lab_pin.sym} -10 -360 0 0 {name=p5 sig_type=std_logic lab=d}
C {devices/lab_pin.sym} -190 -300 0 0 {name=p6 sig_type=std_logic lab=d_spice}
C {devices/lab_pin.sym} -90 -300 0 0 {name=p7 sig_type=std_logic lab=d_clean}
C {devices/lab_pin.sym} -10 -300 0 0 {name=p8 sig_type=std_logic lab=d_pex}
C {devices/lab_pin.sym} -200 -200 0 0 {name=p9 sig_type=std_logic lab=d_spice}
