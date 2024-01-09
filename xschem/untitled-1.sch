v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {symbols/nfet_03v3.sym} 60 -50 0 0 {name=M1
L=0.28u
W=0.22u
nf=nf
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
C {devices/code.sym} -610 -125 0 0 {name=COMMANDS
only_toplevel=false
value="
.param nf=1
.options savecurrents
.control

.endc

.save all
"}
C {devices/code_shown.sym} -610 -370 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
