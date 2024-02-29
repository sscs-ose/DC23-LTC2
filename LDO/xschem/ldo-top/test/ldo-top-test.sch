v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 130 -510 130 -490 {
lab=GND}
N 130 -590 130 -570 {
lab=vin}
N 130 -590 170 -590 {
lab=vin}
C {devices/gnd.sym} 260 -540 0 0 {name=l10 lab=GND}
C {devices/opin.sym} 350 -590 0 0 {name=p3 lab=out
}
C {devices/code.sym} 188.75 -791.875 0 0 {name=MODELS
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
C {devices/gnd.sym} 130 -490 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 130 -540 0 0 {name=V3 value=4}
C {devices/code_shown.sym} -541.25 -981.875 0 0 {name=NGSPICE
only_toplevel=true
format="tcleval( @value )"
spice_ignore=false
value="
.param R=66

R10 out 0 \{R\}
*IL out 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
CL out 0 10p

.options savecurrents
.nodeset v(out)=0
.nodeset v(x1.x1.pos)=0

*TRANSIENT
*.control
*save all
*tran 1ns 10us
*plot v(out) v(ref) v(pos) v(vin)
*plot v(op_out)
*plot v(out)
*plot i(v3)
*plot i(v3)*v(vin)
*.endc

*Stability_Analysis
*.control
*alter IL 0
*alter V3 AC =0
*alter V3 AC=1
*ac dec 10 1 1G
*plot vdb(x1.x1.op_out)
*plot (180/pi)*vp(out)
*let ph= (180/pi)*vp(out)
*meas ac pm FIND ph WHEN vdb(out)=0
*.endc

*SUPPLY SWEEP
.control
save all
save v(x1.out) v(x1.x1.ref) v(x1.x1.pos) v(x1.x1.vin) v(x1.x1.op_out) i(x1.x1.v4)
dc V3 4 0 -0.01
plot v(out) v(x1.ref) v(vin) v(x1.x1.op_out) 
*plot i(v.x1.x1.v4)
.endc

*PSRR_Analysis
.control
save all
alter V3 AC =1
ac dec 100 1 1G
plot vdb(out)
plot vdb(x1.x1.op_out)
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
C {symbol/ldo-top.sym} 260 -590 0 0 {name=x1}
C {devices/lab_pin.sym} 130 -590 0 0 {name=p1 sig_type=std_logic lab=vin}
