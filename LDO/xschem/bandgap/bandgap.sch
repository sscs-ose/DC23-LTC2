v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 -660 170 -620 {
lab=VDD}
N 550 -660 550 -620 {
lab=VDD}
N 550 -560 550 -530 {
lab=#net1}
N 170 -560 170 -530 {
lab=out}
N 170 -470 170 -360 {
lab=#net2}
N 170 -360 340 -360 {
lab=#net2}
N 340 -390 340 -360 {
lab=#net2}
N 370 -390 370 -360 {
lab=#net3}
N 370 -360 550 -360 {
lab=#net3}
N 550 -470 550 -360 {
lab=#net3}
N 170 -360 170 -320 {
lab=#net2}
N 170 -260 170 -230 {
lab=vbe}
N 550 -360 550 -230 {
lab=#net3}
N 210 -200 510 -200 {
lab=VSS}
N 170 -170 170 -140 {
lab=VSS}
N 170 -140 550 -140 {
lab=VSS}
N 550 -170 550 -140 {
lab=VSS}
N 360 -200 360 -140 {
lab=VSS}
N 370 -700 370 -660 {
lab=VDD}
N 360 -140 360 -100 {
lab=VSS}
N 280 -500 300 -500 {
lab=VDD}
N 440 -500 460 -500 {
lab=VSS}
N 110 -590 170 -590 {
lab=VDD}
N 110 -630 110 -590 {
lab=VDD}
N 110 -630 170 -630 {
lab=VDD}
N 550 -590 610 -590 {
lab=VDD}
N 610 -630 610 -590 {
lab=VDD}
N 550 -630 610 -630 {
lab=VDD}
N -50 -250 -50 -230 {
lab=vbe}
N -50 -250 170 -250 {
lab=vbe}
N -330 -250 -50 -250 {
lab=vbe}
N -330 -250 -330 -230 {
lab=vbe}
N -190 -250 -190 -230 {
lab=vbe}
N -330 -170 -330 -140 {
lab=VSS}
N -330 -140 170 -140 {
lab=VSS}
N -50 -170 -50 -140 {
lab=VSS}
N -190 -170 -190 -140 {
lab=VSS}
N -110 -200 -90 -200 {
lab=VSS}
N -110 -200 -110 -140 {
lab=VSS}
N -250 -200 -230 -200 {
lab=VSS}
N -250 -200 -250 -140 {
lab=VSS}
N -390 -200 -370 -200 {
lab=VSS}
N -390 -200 -390 -140 {
lab=VSS}
N -390 -140 -330 -140 {
lab=VSS}
N -480 -170 -480 -140 {
lab=VSS}
N -480 -140 -390 -140 {
lab=VSS}
N -630 -170 -630 -140 {
lab=VSS}
N -630 -140 -480 -140 {
lab=VSS}
N -480 -250 -480 -230 {
lab=vbe}
N -480 -250 -330 -250 {
lab=vbe}
N -630 -250 -630 -230 {
lab=vbe}
N -630 -250 -480 -250 {
lab=vbe}
N -540 -200 -520 -200 {
lab=VSS}
N -540 -200 -540 -140 {
lab=VSS}
N -690 -200 -670 -200 {
lab=VSS}
N -690 -200 -690 -150 {
lab=VSS}
N -690 -150 -690 -140 {
lab=VSS}
N -690 -140 -630 -140 {
lab=VSS}
N -770 -170 -770 -140 {
lab=VSS}
N -920 -170 -920 -140 {
lab=VSS}
N -920 -140 -770 -140 {
lab=VSS}
N -770 -250 -770 -230 {
lab=vbe}
N -920 -250 -920 -230 {
lab=vbe}
N -920 -250 -770 -250 {
lab=vbe}
N -830 -200 -810 -200 {
lab=VSS}
N -830 -200 -830 -140 {
lab=VSS}
N -980 -200 -960 -200 {
lab=VSS}
N -980 -200 -980 -150 {
lab=VSS}
N -980 -150 -980 -140 {
lab=VSS}
N -980 -140 -920 -140 {
lab=VSS}
N -770 -140 -690 -140 {
lab=VSS}
N -770 -250 -630 -250 {
lab=vbe}
N 90 -550 170 -550 {
lab=out}
N 280 -660 280 -500 {
lab=VDD}
N 210 -590 370 -590 {
lab=#net4}
N 370 -590 510 -590 {
lab=#net4}
N 170 -660 550 -660 {
lab=VDD}
N 400 -390 400 -340 {
lab=CUR}
N 460 -500 460 -140 {
lab=VSS}
C {symbols/pfet_03v3.sym} 530 -590 0 0 {name=M1
L=2u
W=3u
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
C {symbols/pfet_03v3.sym} 190 -590 0 1 {name=M2
L=2u
W=3u
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
C {../ota-bandgap/ota-bandgap.sym} 370 -480 3 0 {name=X1}
C {symbols/pnp_10p00x10p00.sym} 190 -200 0 1 {name=Q1
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {symbols/pnp_10p00x10p00.sym} 530 -200 0 0 {name=Q2
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {devices/iopin.sym} 370 -700 2 0 {name=p1 sig_type=std_logic lab=VDD
}
C {devices/iopin.sym} 360 -100 0 0 {name=p2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 150 -290 0 0 {name=l9 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 150 -500 0 0 {name=l11 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 530 -500 0 0 {name=l12 sig_type=std_logic lab=VDD
}
C {devices/iopin.sym} 90 -550 0 1 {name=p13 sig_type=std_logic lab=out
}
C {symbols/pnp_10p00x10p00.sym} -70 -200 0 0 {name=Q3
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {symbols/pnp_10p00x10p00.sym} -210 -200 0 0 {name=Q4
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {symbols/pnp_10p00x10p00.sym} -350 -200 0 0 {name=Q5
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {symbols/pnp_10p00x10p00.sym} -500 -200 0 0 {name=Q6
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {symbols/pnp_10p00x10p00.sym} -650 -200 0 0 {name=Q7
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {symbols/pnp_10p00x10p00.sym} -790 -200 0 0 {name=Q8
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {symbols/pnp_10p00x10p00.sym} -940 -200 0 0 {name=Q9
model=pnp_10p00x10p00
spiceprefix=X
m=1}
C {devices/lab_pin.sym} 170 -250 2 0 {name=l20 sig_type=std_logic lab=vbe
}
C {symbols/ppolyf_u.sym} 550 -500 0 0 {name=R8
W=1e-6
L=10e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 170 -500 0 0 {name=R1
W=1e-6
L=10e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 170 -290 0 0 {name=R2
W=1e-6
L=10e-6
model=ppolyf_u_1k
spiceprefix=X
m=9}
C {devices/code.sym} -110 -570 0 0 {name=MODELS
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
C {devices/iopin.sym} 400 -340 1 0 {name=p3 sig_type=std_logic lab=CUR}
