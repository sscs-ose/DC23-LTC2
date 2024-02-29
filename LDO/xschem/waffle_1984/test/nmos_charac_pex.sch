v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 580 -330 1380 70 {flags=graph,unlocked
y1=-6.5e-46
y2=3000
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0.09
x2=1.89
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





color="4 4"
node="\\"ids1;i(vids1)\\"
\\"ids3;i(vids3)\\""
}
B 2 1400 -330 2200 70 {flags=graph,unlocked
y1=-110
y2=8.1
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0.09
x2=1.89
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






color="4 4"
node="\\"i(vids1) ln()\\"
\\"i(vids2) ln()\\""}
B 2 580 180 1380 580 {flags=graph,unlocked
y1=-6.5e-46
y2=3000
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0.09
x2=1.89
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=0

rawfile=$netlist_dir/rawspice.raw
sim_type=dc





color=4
node="\\"ids1 - ids2;i(vids1) i(vids2) -\\""
}
B 2 1420 180 2220 580 {flags=graph,unlocked
y1=-71
y2=44
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1

x2=1.89
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0



unitx=1
logx=0
logy=0




digital=0
rainbow=0

rawfile=$netlist_dir/rawspice.raw
sim_type=dc





color=4
node="\\"ln(ids1) - ln(ids2);i(vids1) ln() i(vids2) ln() -\\""
x1=0.09}
N -280 -130 -230 -130 {
lab=g1}
N -190 -60 -190 0 {
lab=GND}
N -190 -130 -110 -130 {
lab=GND}
N -110 -130 -110 -60 {
lab=GND}
N -190 -60 -110 -60 {
lab=GND}
N -190 -300 -190 -170 {
lab=#net1}
N -190 -100 -190 -60 {
lab=GND}
N -190 -170 -190 -160 {
lab=#net1}
N -400 -230 -400 -220 {
lab=GND}
N -340 -230 -340 -220 {
lab=GND}
N -400 -220 -340 -220 {
lab=GND}
N -370 -220 -370 -210 {
lab=GND}
N -340 -320 -340 -290 {
lab=d1}
N -400 -320 -400 -290 {
lab=g1}
C {devices/ipin.sym} -280 -130 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} -190 -360 0 0 {name=p2 lab=d1}
C {devices/gnd.sym} -190 0 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} -370 -210 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -400 -260 0 0 {name=vgs value=0.9 savecurrent=false}
C {devices/vsource.sym} -340 -260 0 0 {name=vds value=0.9 savecurrent=false}
C {devices/lab_pin.sym} -340 -320 0 0 {name=p4 sig_type=std_logic lab=d1}
C {devices/lab_pin.sym} -400 -320 0 0 {name=p3 sig_type=std_logic lab=g1}
C {devices/code_shown.sym} 100 -220 0 0 {name="dc: voltage transference curve"
only_toplevel=true
spice_ignore=0
value="
.control
dc vds 0 1.8 0.001 vgs 0.3 1.8 0.5

plot i(vids1)

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
C {devices/code_shown.sym} 50 -450 0 0 {name="Setup testbench"
only_toplevel=false
place=header
format="tcleval( @value )"
value="
.control
write
set appendwrite
.endc

"}
C {devices/code_shown.sym} -60 60 0 0 {name="Extracted devices"
only_toplevel=false
spice_ignore=0
value="
.include ../layout_clean/waffle_1984_extracted.spice
xclean dclean g1 GND GND waffle_1984
"
}
C {devices/ammeter.sym} -190 -330 0 0 {name=vids1 savecurrent=true}
C {devices/iopin.sym} -90 -360 0 0 {name=p5 lab=d1}
C {devices/ammeter.sym} -90 -330 0 0 {name=vids2 savecurrent=true}
C {devices/iopin.sym} -90 -300 0 0 {name=p6 lab=dpex}
C {symbols/pfet_03v3.sym} -210 -130 0 0 {name=M2
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
C {devices/code_shown.sym} -110 200 0 0 {name="Clean Simulation"
spice_ignore=1
value="
.include ../layout_clean/waffle_1984_extracted.spice
.include ../layout_pex/waffle_1984_pex.spice

Xclean  vdd_clean g vss vss waffle_1984

*.save i(vid_clean)
"}
C {devices/iopin.sym} -10 -360 0 0 {name=p7 lab=d1}
C {devices/ammeter.sym} -10 -330 0 0 {name=vids3 savecurrent=true}
C {devices/iopin.sym} -10 -300 0 0 {name=p8 lab=dclean}
