v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 290 -640 290 -590 {
lab=vin}
N 380 -520 470 -520 {
lab=op_out}
N 610 -490 610 -470 { lab=out}
N 610 -240 610 -220 { lab=pos}
N 610 -520 710 -520 { lab=vin}
N 610 -260 610 -250 { lab=pos}
N 610 -250 610 -240 { lab=pos}
N 470 -520 570 -520 { lab=op_out}
N 610 -620 610 -550 {
lab=vin}
N 710 -620 710 -520 {
lab=vin}
N 610 -470 610 -440 {
lab=out}
N 610 -380 610 -340 {
lab=#net1}
N 610 -220 610 -190 {
lab=pos}
N 610 -700 610 -620 {
lab=vin}
N 290 -700 290 -640 {
lab=vin}
N 290 -700 605 -700 {
lab=vin}
N 605 -700 610 -700 {
lab=vin}
N 610 -480 700 -480 {
lab=out}
N 610 -280 610 -260 {
lab=pos}
N 610 -130 610 -100 {
lab=GND}
N 50 -550 50 -230 {
lab=#net2}
N 50 -550 180 -550 {
lab=#net2}
N 450 -720 450 -700 {
lab=vin}
N 550 -410 590 -410 {
lab=GND}
N 550 -160 590 -160 {
lab=GND}
N 290 -100 610 -100 {
lab=GND}
N 290 -450 290 -100 {
lab=GND}
N 450 -100 450 -80 {
lab=GND}
N 550 -410 550 -160 {
lab=GND}
N 550 -160 550 -100 {
lab=GND}
N 710 -700 710 -620 {
lab=vin}
N 610 -700 710 -700 {
lab=vin}
N -20 -330 -20 -310 {
lab=GND}
N -20 -490 -20 -390 {
lab=#net3}
N -20 -490 10 -490 {
lab=#net3}
N -130 -320 -130 -300 {
lab=GND}
N -130 -520 10 -520 {
lab=ref}
N -130 -520 -130 -380 {
lab=ref}
N 10 -520 180 -520 {
lab=ref}
N 10 -490 180 -490 {
lab=#net3}
N 580 -770 580 -750 {
lab=GND}
N 580 -850 580 -830 {
lab=vin}
N 450 -850 580 -850 {
lab=vin}
N 450 -850 450 -720 {
lab=vin}
N 460 -230 610 -230 {
lab=pos}
N 780 -300 780 -280 {
lab=GND}
N 700 -480 780 -480 {
lab=out}
N 780 -480 920 -480 {
lab=out}
N 870 -480 870 -410 {
lab=out}
N 870 -350 870 -310 {
lab=GND}
N 780 -310 870 -310 {
lab=GND}
N 780 -480 780 -450 {
lab=out}
N 450 -230 460 -230 {
lab=pos}
N 780 -320 780 -300 {
lab=GND}
N 780 -390 780 -380 {
lab=GND}
N 50 -230 80 -230 {
lab=#net2}
N 140 -230 440 -230 {
lab=pos}
N 440 -230 450 -230 {
lab=pos}
N 780 -380 780 -320 {
lab=GND}
C {devices/code.sym} -211.25 -751.875 0 0 {name=MODELS
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
C {devices/lab_pin.sym} 475 -520 1 0 {name=l12 sig_type=std_logic lab=op_out

}
C {symbols/pfet_03v3.sym} 590 -520 0 0 {name=M1
L=0.5u
W=100u
nf=1
m=30
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/ppolyf_u.sym} 610 -410 0 0 {name=R1
W=1e-6
L=164e-6
model=ppolyf_u_2k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 610 -160 0 0 {name=R2
W=1e-6
<<<<<<< HEAD
<<<<<<< HEAD
L=100e-6
=======
L=120e-6
>>>>>>> bde7524 (Some python scripts that simplifies setup of design)
=======
L=120e-6
>>>>>>> c4eedb243bdbc3c400050f018e6f3286c0e02044
model=ppolyf_u_2k
spiceprefix=X
m=1}
C {devices/vsource.sym} 610 -310 0 0 {name=v4 value=0}
C {devices/iopin.sym} 920 -480 0 0 {name=p2 lab=out}
C {devices/lab_pin.sym} 465 -230 1 0 {name=l1 sig_type=std_logic lab=pos

}
C {devices/code_shown.sym} -831.25 -801.875 0 0 {name=NGSPICE
only_toplevel=true
format="tcleval( @value )"
spice_ignore=false
value="
.param R=1000
*R10 out 0 \{R\}
*IL out 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
*IL out 0 PULSE (0 30m 2n 2n 2n 50u 100u)
*CL out 0 100p
.options savecurrents

*.nodeset v(out)=0
*.nodeset v(x1.pos)=0

*TRANSIENT
*.control
*save all
*tran 1ns 10us
*plot v(out) v(ref) v(pos) v(vin)
*plot v(op_out)
*plot v(out) v(v3)
*plot i(out)
*plot i(v3)*v(vin)
*.endc

*Stability_Analysis
*.control
*alter IL 0
*alter Vs AC =0
*alter Vt AC=1
*ac dec 10 1 1G
*plot vdb(out)
*plot (180/pi)*vp(out)
*let ph= (180/pi)*vp(out)
*meas ac pm FIND ph WHEN vdb(out)=0
*.endc

*SUPPLY SWEEP
*.control
*save all
*save v(out) v(ref) v(x1.pos) v(vin) v(x1.op_out) i(x1.v4)
*dc V2 4 0 -0.01
*plot v(out) v(ref) v(x1.pos) v(vin)
*plot v(x1.op_out)
*plot i(v.x1.v4)
*.endc


*PSRR_Analysis
.control
save all
alter V2 AC =1
ac dec 100 1 1G
plot vdb(out)
plot (180/pi)*vp(out)
*let gm0=@m.xm0.m0[gm]
*let Zout=(1.5)/(gm0*v(op_out))
*let Zout2=v(out)/gm0
*plot vdb(Zout2)
*wrdata /foss/designs/LDO_Design/data/data_PSRR.dat vdb(out)
.endc


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
C {ota-ldo.sym} 270 -520 0 0 {name=X1}
C {devices/isource.sym} -20 -360 2 0 {name=I1 value=100u
}
C {devices/gnd.sym} -20 -310 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} -130 -300 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -130 -350 0 0 {name=V1 value=1.25}
C {devices/lab_pin.sym} -60 -520 1 0 {name=l3 sig_type=std_logic lab=ref}
C {devices/gnd.sym} 580 -750 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 580 -800 0 0 {name=V3 value=3.5}
C {devices/lab_pin.sym} 450 -790 2 0 {name=l4 sig_type=std_logic lab=vin}
C {devices/gnd.sym} 450 -80 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 110 -230 3 0 {name=V2 value=0}
C {devices/capa.sym} 780 -420 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 870 -380 0 0 {name=R3
value=1000
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 780 -280 0 0 {name=l7 lab=GND}
