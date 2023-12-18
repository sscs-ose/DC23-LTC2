v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {IREF is 4x bias current} 1120 -700 0 0 0.4 0.4 {}
N 760 -490 760 -470 { lab=V3V3}
N 760 -410 760 -390 { lab=GND}
N 1280 -40 1280 -20 { lab=GND}
N 1280 -120 1280 -100 { lab=#net1}
N 750 -160 750 -140 { lab=GND}
N 750 -240 750 -220 { lab=#net2}
N 750 -320 750 -300 { lab=INP}
N 750 -320 770 -320 { lab=INP}
N 1260 -520 1260 -500 { lab=GND}
N 1120 -520 1120 -500 { lab=V3V3}
N 1000 -360 1020 -360 { lab=INP}
N 1000 -280 1020 -280 { lab=INM}
N 1710 -230 1710 -210 { lab=GND}
N 1710 -320 1710 -290 { lab=OUT}
N 1280 -140 1280 -120 { lab=#net1}
N 1440 -320 1440 -280 { lab=OUT}
N 1440 -140 1440 -100 { lab=INM}
N 1440 -40 1440 -20 { lab=GND}
N 1440 -120 1460 -120 { lab=INM}
N 1440 -220 1440 -200 { lab=#net3}
N 1360 -320 1440 -320 { lab=OUT}
N 1440 -320 1710 -320 { lab=OUT}
C {devices/code_shown.sym} 68.75 -841.875 0 0 {name=NGSPICE
only_toplevel=true
value="
.param CM_VOLTAGE = 1.65
.param OUTPUT_VOLTAGE = 1.8
.control
save all
ac dec 200 10 1000Meg
settype decibel out
plot vdb(out)
let phase_val = 180/PI*cph(out)
let phase_margin_val = 180 + 180/PI*cph(out)
settype phase phase_val
plot phase_val
meas ac phase_margin find phase_margin_val when vdb(out)=0
meas ac crossover_freq WHEN vdb(out)=0
op

let id1  = @m.x1.xm1.m0[id]
let id2  = @m.x1.xm2.m0[id]
let id3  = @m.x1.xm3.m0[id]
let id4  = @m.x1.xm4.m0[id]
let id7  = @m.x1.xm7.m0[id]
let id8  = @m.x1.xm8.m0[id]

let gm1  = @m.x1.xm1.m0[gm]
let gm2  = @m.x1.xm2.m0[gm]
let gm3  = @m.x1.xm3.m0[gm]
let gm4  = @m.x1.xm4.m0[gm]
let gm7  = @m.x1.xm7.m0[gm]
let gm8  = @m.x1.xm8.m0[gm]

let vgs1  = @m.x1.xm1.m0[vgs]
let vth1  = @m.x1.xm1.m0[vth]
let vov1 = vgs1 - vth1
let vds1  = @m.x1.xm1.m0[vds]
let vdsat1  = @m.x1.xm1.m0[vdsat]

print v(inp)
print v(inm)
print v(out)
let v_offset = v(inp)-v(inm)
print v_offset

print id1
print id2
print gm1
print gm2
print id3
print id4
print id7
print id8


print v(vgs1)
print v(vth1)
print v(vov1)
print v(vds1)
print v(vdsat1)

.endc
"}
C {devices/vsource.sym} 760 -440 0 0 {name=V1 value=3.3}
C {devices/gnd.sym} 760 -390 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 760 -490 0 0 {name=l3 sig_type=std_logic lab=V3V3
}
C {devices/isource.sym} 1280 -70 2 0 {name=I0 value=1u
}
C {devices/gnd.sym} 1280 -20 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 750 -190 0 0 {name=V2 value=\{CM_VOLTAGE\}}
C {devices/gnd.sym} 750 -140 0 0 {name=l16 lab=GND}
C {devices/vsource.sym} 750 -270 0 0 {name=V3 value="AC 1.8"}
C {devices/lab_pin.sym} 770 -320 2 0 {name=l18 sig_type=std_logic lab=INP
}
C {devices/lab_pin.sym} 1000 -360 0 0 {name=l19 sig_type=std_logic lab=INP
}
C {devices/lab_pin.sym} 1000 -280 0 0 {name=l20 sig_type=std_logic lab=INM
}
C {devices/lab_pin.sym} 1120 -520 0 0 {name=l21 sig_type=std_logic lab=V3V3
}
C {devices/gnd.sym} 1260 -520 2 0 {name=l22 lab=GND}
C {devices/lab_pin.sym} 1710 -320 2 0 {name=l23 sig_type=std_logic lab=OUT
}
C {devices/capa.sym} 1710 -260 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1710 -210 0 0 {name=l24 lab=GND}
C {devices/res.sym} 1440 -170 0 0 {name=R1
value=10E6
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 1440 -250 0 0 {name=V4 value=\{OUTPUT_VOLTAGE-CM_VOLTAGE\}}
C {devices/capa.sym} 1440 -70 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1440 -20 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 1460 -120 0 1 {name=l6 sig_type=std_logic lab=INM
}
C {../../../symbols/stat_preamp.sym} 1180 -320 0 0 {name=x1}
C {devices/code.sym} -181.25 -631.875 0 0 {name=MODELS
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
