v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 0 90 0 {
lab=vin}
N 30 -50 30 -40 {
lab=gnd}
N -0 -50 30 -50 {
lab=gnd}
N -0 -50 0 -40 {
lab=gnd}
N 90 -50 90 -40 {
lab=vdd}
N 90 -50 120 -50 {
lab=vdd}
N 120 -50 120 -40 {
lab=vdd}
C {devices/ipin.sym} 0 -40 0 0 {name=p1 lab=gnd}
C {devices/ipin.sym} 120 -40 2 0 {name=p2 lab=vdd}
C {devices/ipin.sym} 60 0 3 0 {name=p3 lab=vin}
C {devices/opin.sym} 60 -40 3 0 {name=p4 lab=vout}
C {devices/code.sym} -320 -220 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 30 -20 3 0 {name=M1
L=0.28u
W=4u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 90 -20 3 0 {name=M2
L=0.28u
W=4u
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
