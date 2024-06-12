v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1090 -360 1140 -360 {
lab=g1}
N 1180 -290 1180 -230 {
lab=d1}
N 1180 -360 1260 -360 {
lab=d1}
N 1260 -360 1260 -290 {
lab=d1}
N 1180 -290 1260 -290 {
lab=d1}
N 1180 -530 1180 -400 {
lab=vsup}
N 1180 -530 1330 -530 {
lab=vsup}
N 1180 -330 1180 -290 {
lab=d1}
N 1180 -400 1180 -390 {
lab=vsup}
C {devices/code_shown.sym} 470 -580 0 0 {name=NGSPICE
only_toplevel=true
value="

vsup vsup 0 dc=3.3
vsg vsup g1 dc=2
vsd vsup d1 dc=3.3

.control
save all

save @m.xm1.m0[id]
save @m.xm1.m0[gm]


dc vsg 0 3.3 0.01

let idn = @m.xm1.m0[id]
let gmn = @m.xm1.m0[gm]
let vthn = @m.xm1.m0[vth]
let vgsn = @m.xm1.m0[vgs]
let vdsatn = @m.xm1.m0[vdsat]
let vov1 = v(vsup)-v(g1) - vthn
let vov2 = 2*idn/gmn

plot idn
*plot idn vs vov1 
*plot idn vs vov2 
*plot vov2
plot gmn vs vov2
*plot idn vs vdsatn

let W = 5e-6
let a = gmn/idn
setscale a
plot idn/W
plot vov2
wrdata foss/designs/LDO_Design/data/data_id_w_M0.dat idn/W
wrdata foss/designs/LDO_Design/data/data_id_vov_M0.dat vov2

*wrdata /foss/designs/IPD413_2023_HW3_git/Data/data_id_w_M34.dat idn/W
*wrdata /foss/designs/IPD413_2023_HW3_git/Data/data_vov_M34.dat vov2

.endc
" }
C {devices/ipin.sym} 1090 -360 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} 1180 -230 0 0 {name=p2 lab=d1}
C {devices/iopin.sym} 1330 -530 0 0 {name=p3 lab=vsup}
C {symbols/pfet_03v3.sym} 1160 -360 0 0 {name=M1
L=0.7u
W=5u
nf=5
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
C {devices/code.sym} 478.75 -801.875 0 0 {name=MODELS
only_toplevel=true
place=header
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
"}
