v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -170 -130 -170 -110 {
lab=VDD}
N -170 -50 -170 -30 {
lab=GND}
N 240 -220 380 -220 {
lab=VDD}
N 380 -220 380 -200 {
lab=VDD}
N 380 -170 390 -170 {
lab=VDD}
N 390 -210 390 -170 {
lab=VDD}
N 380 -210 390 -210 {
lab=VDD}
N 380 -60 380 -40 {
lab=GND}
N 240 -40 380 -40 {
lab=GND}
N 380 -140 380 -120 {
lab=#net1}
N 240 -230 240 -210 {
lab=VDD}
N 240 -50 240 -30 {
lab=GND}
N 300 -170 340 -170 {}
C {devices/code.sym} -120 -120 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice bjt_typical
* .lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/gnd.sym} 240 -30 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -200 -450 0 0 {name=control only_toplevel=false 
value=".include ~/cs_vthref_3ho_pex_extracted.spice
.control
save all
dc Vdd 3 3.6 0.1
plot i(Vout1) 
dc temp -50 125 5
plot i(Vout1) 
wrdata ~/cs_vthref_3ho.txt i(Vout1)  
write cs_thref_3ho.raw
.endc" }
C {devices/vdd.sym} -170 -130 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} -170 -30 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -170 -80 0 0 {name=Vdd value=3.3 savecurrent=false}
C {devices/vdd.sym} 240 -230 0 0 {name=l4 lab=VDD}
C {devices/lab_pin.sym} 320 -170 3 1 {name=p1 sig_type=std_logic lab=vb}
C {symbols/pfet_03v3.sym} 360 -170 0 0 {name=M4
L=0.56u
W=5.6u
nf=1
m=8
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/ammeter.sym} 380 -90 0 0 {name=Vout1 savecurrent=true}
C {cs_vthref_3ho.sym} 160 -30 0 0 {name=x1 prefix=cs_vthref_3ho}
