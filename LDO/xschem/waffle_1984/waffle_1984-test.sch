v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 470 -460 1060 0 {flags=graph
y1=-0.000873403
y2=0.0068066
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=m
x1=0
x2=6
divx=5
subdivx=1
node=i(vd)
color=4

unitx=1
dataset=-1}
N -60 -330 -20 -330 {
lab=G}
N 20 -410 20 -360 {
lab=S}
N 20 -330 120 -330 {
lab=B}
N 20 -300 20 -230 {
lab=D}
C {devices/code.sym} -180 -570 0 0 {name=MODELS
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
C {devices/code_shown.sym} -470 -390 0 0 {name=s3 only_toplevel=false value="
.param v_max=3.3
.param t_on=10n
.param t_total=20n
"}
C {devices/lab_pin.sym} -60 -330 0 0 {name=l3 sig_type=std_logic lab=G}
C {devices/lab_pin.sym} 20 -410 0 0 {name=l4 sig_type=std_logic lab=S}
C {devices/lab_pin.sym} 20 -230 0 0 {name=l5 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 120 -330 0 1 {name=l6 sig_type=std_logic lab=B}
C {devices/code_shown.sym} 160 -380 0 0 {name=NGSPICE only_toplevel=true
value="
vg g 0 0
vd d 0 0
vs s 0 6
vb b 0 6
*XDUT0 S G D1   waffle_1984
.control
save all
dc vd 0 6 0.01 vg 0 6 1
write waffle_1984-test.raw
.endc
"}
C {devices/title.sym} 50 50 0 0 {name=l7 author="GlobalFoundries PDK Authors"}
C {devices/launcher.sym} 75 -555 0 0 {name=h1
descr="Click left mouse button here with control key
pressed to load/unload waveforms in graph."
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw
"
}
C {devices/code_shown.sym} -50 -90 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
*.include waffle_1984-noprefix.spice

.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/smbb000149.ngspice typical
"}
C {symbols/pfet_03v3.sym} 0 -330 0 0 {name=M2
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
