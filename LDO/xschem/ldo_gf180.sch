v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 830 -430 830 -410 { lab=GND}
N 450 -470 720 -470 {
lab=#net1}
N 420 -310 420 -290 {
lab=GND}
N 420 -470 420 -370 {
lab=#net1}
N 420 -470 450 -470 {
lab=#net1}
N 830 -620 830 -570 {
lab=vin}
N 920 -500 1010 -500 {
lab=op_out}
N 1150 -470 1150 -450 { lab=out}
N 1150 -300 1150 -280 { lab=pos}
N 1150 -500 1250 -500 { lab=vin}
N 1070 -290 1150 -290 { lab=pos}
N 1150 -320 1150 -310 { lab=pos}
N 1150 -310 1150 -300 { lab=pos}
N 1150 -150 1150 -110 { lab=GND}
N 1150 -110 1150 -100 { lab=GND}
N 1010 -500 1110 -500 { lab=op_out}
N 1150 -600 1150 -530 {
lab=vin}
N 1250 -600 1250 -500 {
lab=vin}
N 1150 -600 1250 -600 {
lab=vin}
N 100 -180 100 -160 {
lab=GND}
N 100 -270 100 -240 {
lab=ref}
N 1150 -450 1150 -420 {
lab=out}
N 1150 -360 1150 -320 {
lab=pos}
N 1150 -280 1150 -250 {
lab=pos}
N 1150 -190 1150 -150 {
lab=GND}
N 190 -180 190 -160 {
lab=GND}
N 190 -270 190 -240 {
lab=V3V3}
N 1390 -490 1390 -470 {
lab=GND}
N 1390 -580 1390 -550 {
lab=vin}
N 1390 -680 1390 -580 {
lab=vin}
N 1150 -680 1390 -680 {
lab=vin}
N 1150 -680 1150 -600 {
lab=vin}
N 830 -680 830 -620 {
lab=vin}
N 830 -680 1145 -680 {
lab=vin}
N 1145 -680 1150 -680 {
lab=vin}
N 1150 -460 1240 -460 {
lab=out}
C {devices/gnd.sym} 830 -410 0 0 {name=l22 lab=GND}
C {devices/isource.sym} 420 -340 2 0 {name=I1 value=1.5u
}
C {devices/gnd.sym} 420 -290 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 1070 -290 1 0 {name=l25 sig_type=std_logic lab=pos}
C {devices/gnd.sym} 1150 -100 0 0 {name=l1 lab=GND}
C {devices/opin.sym} 1240 -460 0 0 {name=p3 lab=out
}
C {devices/lab_pin.sym} 720 -530 0 0 {name=l3 sig_type=std_logic lab=pos}
C {devices/gnd.sym} 100 -160 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 100 -270 1 0 {name=l4 sig_type=std_logic lab=ref
}
C {devices/lab_pin.sym} 720 -500 0 0 {name=l6 sig_type=std_logic lab=ref
}
C {devices/vsource.sym} 100 -210 0 0 {name=V1 value=1.2}
C {devices/code_shown.sym} -771.25 -551.875 0 0 {name=NGSPICE
only_toplevel=true
value="

.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice cap_mim

.param R=36k
*R10 out 0 \{R\}
IL out 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
CL out 0 1p
.options savecurrents

.nodeset v(out)=0
.nodeset v(pos)=0

*TRANSIENT
*.control
*save all
*tran 1ns 2us
*plot v(out) v(ref) v(pos) v(vin)
*plot v(op_out)
*plot v(out)
*plot i(v3)
*plot i(v3)*v(vin)
*.endc

*Stability_Analysis
.control
alter IL 0
alter Vs AC =0
alter Vt AC=1
ac dec 10 1 1G
plot vdb(out)
plot (180/pi)*vp(out)
let ph= (180/pi)*vp(out)
meas ac pm FIND ph WHEN vdb(out)=0
.endc

*SUPPLY SWEEP
*.control
*save all
*dc V3 3.3 0 -0.01
*plot v(out) v(ref) v(pos) v(vin)
*wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vout.dat v(out)
*wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vref.dat v(ref)
*wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vin.dat v(vin)
*plot v(op_out)
*.endc

*PSRR_Analysis
*.control
*save all
*alter V3 AC =1
*ac dec 100 1 1G
*plot vdb(out)
*let gm0=@m.xm0.m0[gm]
*let Zout=(1.5)/(gm0*v(op_out))
*let Zout2=v(out)/gm0
*plot vdb(Zout2)
*wrdata /foss/designs/LDO_Design/data/data_PSRR.dat vdb(out)
*.endc


**Load_Transient
*.control
*alter IL 50u
*alter R10 3600k
*tran 0.1u 100u
*meas TRAN V_ldo_100u FIND v(out) AT=5u
*meas TRAN V_ldo_10m FIND v(out) AT=100u
*let load_reg= V_ldo_100u-V_ldo_10m
*let load_current =(-1*i(V3)-131.8e-6)
*print load_reg
*plot load_current v(out)-1.8
*.endc
"}
C {devices/res.sym} 1150 -390 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1150 -220 0 0 {name=R6
value=2k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 190 -160 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 190 -270 1 0 {name=l8 sig_type=std_logic lab=V3V3
}
C {devices/vsource.sym} 190 -210 0 0 {name=V2 value=3.3}
C {devices/gnd.sym} 1390 -470 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 1390 -520 0 0 {name=V3 value=2}
C {devices/lab_pin.sym} 1390 -680 1 0 {name=l5 sig_type=std_logic lab=vin
}
C {devices/lab_pin.sym} 1015 -500 1 0 {name=l12 sig_type=std_logic lab=op_out

}
C {ota-ldo.sym} 810 -500 0 0 {name=X1}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/pfet_03v3.sym} 1130 -500 0 0 {name=M0
L=0.7u
W=1000u
nf=11
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
C {devices/isource.sym} 1240 -400 0 0 {name=I2 value=10m
}
C {devices/gnd.sym} 1240 -370 0 0 {name=l11 lab=GND}
