v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 230 -160 290 -160 {
lab=GND}
N 160 -200 160 -160 {
lab=out}
N 160 -200 230 -200 {
lab=out}
N 160 -160 190 -160 {
lab=out}
N 230 -290 230 -280 {
lab=VDD}
N 230 -220 230 -200 {
lab=out}
N 230 -200 230 -190 {
lab=out}
N 230 -130 230 -120 {
lab=#net1}
N 230 -200 300 -200 {
lab=out}
N 610 -100 610 -80 {
lab=GND}
N 610 -180 610 -160 {
lab=#net2}
N 610 -260 610 -240 {
lab=VDD}
N 140 -250 210 -250 {
lab=GND}
N 300 -200 340 -200 {
lab=out}
N 380 -200 460 -200 {
lab=GND}
N 380 -260 380 -230 {
lab=#net3}
N 380 -360 380 -330 {
lab=VDD}
N 380 -270 380 -260 {
lab=#net3}
N 230 -30 230 0 {
lab=GND}
N 230 -60 290 -60 {
lab=GND}
N 290 -60 290 0 {
lab=GND}
N 160 -100 160 -60 {
lab=#net1}
N 160 -100 230 -100 {
lab=#net1}
N 160 -60 190 -60 {
lab=#net1}
N 230 0 290 0 {
lab=GND}
N 230 -120 230 -100 {
lab=#net1}
N 230 -100 230 -90 {
lab=#net1}
N 230 0 230 10 {
lab=GND}
N 230 -100 300 -100 {
lab=#net1}
N 300 -100 340 -100 {
lab=#net1}
N 290 0 380 0 {
lab=GND}
N 380 -100 460 -100 {
lab=GND}
N 460 -100 460 0 {
lab=GND}
N 380 0 460 0 {
lab=GND}
N 380 -40 380 0 {
lab=GND}
N 380 -70 380 -40 {
lab=GND}
N 460 -130 460 -100 {
lab=GND}
N 140 -130 140 0 {
lab=GND}
N 140 0 230 0 {
lab=GND}
N 380 -170 380 -130 {
lab=#net4}
N 460 -200 460 -130 {
lab=GND}
N 140 -250 140 -130 {
lab=GND}
N 290 -160 290 -60 {
lab=GND}
N 380 -300 460 -300 {
lab=GND}
N 460 -300 460 -200 {
lab=GND}
N 330 -300 340 -300 {
lab=VDD}
N 330 -340 330 -300 {
lab=VDD}
N 330 -340 380 -340 {
lab=VDD}
C {symbols/nfet_03v3.sym} 210 -160 0 0 {name=M8
L=2u
W=1u
nf=1
m=10
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/ppolyf_u.sym} 230 -250 0 0 {name=R8
W=10e-6
L=50e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {devices/code_shown.sym} -170 -290 0 0 {name=NGSPICE
only_toplevel=true
value="

*TRANSIENT
.control
save all
tran 1ns 2us
let i1 = @m.xm8.m0[id]
let i2 = @m.xm1.m0[id]
print i1
print i2
plot v(out)
.endc

*SUPPLY SWEEP
.control
save all
dc V1 4 0 -0.01
let i1 = @m.xm8.m0[id]
let i2 = @m.xm1.m0[id]
plot i1 i2
*plot v(out) VDD
.endc

"}
C {devices/code.sym} 40 -470 0 0 {name=MODELS
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
C {devices/opin.sym} 250 -200 2 1 {name=p13 sig_type=std_logic lab=out
}
C {devices/vsource.sym} 610 -130 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/gnd.sym} 610 -80 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 610 -260 0 0 {name=l5 sig_type=std_logic lab=VDD
}
C {devices/vsource.sym} 610 -210 0 0 {name=V3 value="AC 1"}
C {devices/lab_pin.sym} 230 -290 0 0 {name=l1 sig_type=std_logic lab=VDD
}
C {symbols/nfet_03v3.sym} 360 -200 0 0 {name=M1
L=2u
W=0.5u
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
C {devices/lab_pin.sym} 380 -360 0 0 {name=l2 sig_type=std_logic lab=VDD
}
C {symbols/nfet_03v3.sym} 210 -60 0 0 {name=M2
L=2u
W=1u
nf=1
m=10
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/gnd.sym} 230 10 0 0 {name=l4 lab=GND}
C {symbols/nfet_03v3.sym} 360 -100 0 0 {name=M3
L=2u
W=0.5u
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
C {symbols/nfet_03v3.sym} 360 -300 0 0 {name=M4
L=0.8u
W=0.5u
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
