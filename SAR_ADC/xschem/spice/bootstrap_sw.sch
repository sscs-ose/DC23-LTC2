v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -220 -130 -210 -130 {
lab=#net1}
N -210 -130 -140 -100 {
lab=#net1}
N -190 -130 -180 -130 {
lab=#net2}
N -260 -100 -190 -130 {
lab=#net2}
N -260 120 -140 120 {
lab=phi_neg}
N -260 -40 -260 120 {
lab=phi_neg}
N -180 -180 -180 -130 {
lab=#net2}
N -180 -180 -40 -180 {
lab=#net2}
N -40 -180 -40 -130 {
lab=#net2}
N -140 -190 -140 -160 {
lab=vdd}
N -260 -190 -260 -160 {
lab=vdd}
N -260 -190 -140 -190 {
lab=vdd}
N -140 120 -40 120 {
lab=phi_neg}
N 0 -40 0 90 {
lab=#net3}
N -140 -190 0 -190 {
lab=vdd}
N 0 -190 0 -160 {
lab=vdd}
N 0 90 110 90 {
lab=#net3}
N 110 70 110 90 {
lab=#net3}
N 0 -190 110 -190 {
lab=vdd}
N 110 -190 110 -10 {
lab=vdd}
N 0 -100 180 -100 {
lab=#net4}
N 210 -60 210 30 {
lab=#net5}
N 110 90 210 90 {
lab=#net3}
N 330 90 350 90 {
lab=vin}
N 210 90 270 90 {
lab=#net3}
N 250 50 250 60 {
lab=#net6}
N 250 50 300 50 {
lab=#net6}
N 300 50 380 50 {
lab=#net6}
N 410 90 440 90 {
lab=vout}
N 270 -190 270 -140 {
lab=vdd}
N 110 -190 270 -190 {
lab=vdd}
N 330 -150 330 -140 {
lab=phi_neg}
N 330 -150 400 -150 {
lab=phi_neg}
N -300 120 -260 120 {
lab=phi_neg}
N -300 -190 -260 -190 {
lab=vdd}
N 340 90 340 140 {
lab=vin}
N -280 -130 -260 -130 {
lab=gnd}
N -140 -130 -120 -130 {
lab=gnd}
N -0 120 10 120 {
lab=gnd}
N 10 120 10 150 {
lab=gnd}
N 0 150 10 150 {
lab=gnd}
N 0 -130 20 -130 {
lab=gnd}
N 20 -130 210 -130 {
lab=gnd}
N 210 -130 210 -100 {
lab=gnd}
N 190 60 210 60 {
lab=gnd}
N 270 -100 270 -80 {
lab=gnd}
N 330 -100 330 -80 {
lab=gnd}
N 270 -80 300 -80 {
lab=gnd}
N 300 -80 330 -80 {
lab=gnd}
C {/foss/designs/sar_adc/xschem/spice/inv.sym} -140 60 3 0 {name=x1}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/cap_mim_2p0fF.sym} -140 -70 0 0 {name=C1
W=CW
L=CL
model=cap_mim_1f5fF
m=1}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/cap_mim_2p0fF.sym} -260 -70 0 1 {name=C2
W=CW
L=CL
model=cap_mim_1f5fF
m=1}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} -160 -130 0 0 {name=M1
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} -240 -130 0 1 {name=M2
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} -20 -130 0 0 {name=M4
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/cap_mim_2p0fF.sym} 0 -70 0 0 {name=C3
W=CW
L=CL
model=cap_mim_1f5fF
m=1}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} -20 120 0 0 {name=M5
L=0.28u
W=0.22u
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
C {devices/ipin.sym} -240 -280 0 0 {name=p1 lab=phi}
C {/foss/designs/sar_adc/xschem/spice/inv.sym} 110 30 0 0 {name=x2}
C {/foss/designs/sar_adc/xschem/spice/inv.sym} -180 -280 0 0 {name=x3}
C {devices/gnd.sym} -180 -240 0 0 {name=l2 lab=GND}
C {devices/ipin.sym} -180 60 1 0 {name=p3 lab=vdd}
C {devices/ipin.sym} -300 -190 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 50 30 0 0 {name=p5 lab=phi}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 210 -80 3 0 {name=M3
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 230 60 2 0 {name=M6
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 300 70 1 0 {name=M7
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 380 70 1 0 {name=M8
L=0.28u
W=0.22u
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
C {devices/ipin.sym} 340 140 3 0 {name=p6 lab=vin}
C {devices/opin.sym} 440 90 0 0 {name=p7 lab=vout}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 330 -120 1 0 {name=M9
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/nfet_03v3.sym} 270 -120 1 0 {name=M10
L=0.28u
W=0.22u
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
C {devices/lab_pin.sym} -80 -280 2 0 {name=p2 sig_type=std_logic lab=phi_neg}
C {devices/ipin.sym} -180 -320 1 0 {name=p8 lab=vdd}
C {devices/lab_pin.sym} -300 120 0 0 {name=p9 sig_type=std_logic lab=phi_neg}
C {devices/lab_pin.sym} 400 -150 2 0 {name=p10 sig_type=std_logic lab=phi_neg}
C {devices/ipin.sym} -280 -130 3 0 {name=p11 lab=gnd}
C {devices/ipin.sym} -120 -130 3 0 {name=p12 lab=gnd}
C {devices/ipin.sym} 0 150 3 0 {name=p13 lab=gnd}
C {devices/ipin.sym} 20 -130 3 0 {name=p14 lab=gnd}
C {devices/ipin.sym} 300 90 3 0 {name=p15 lab=gnd}
C {devices/ipin.sym} 380 90 3 0 {name=p16 lab=gnd}
C {devices/ipin.sym} 190 60 1 1 {name=p17 lab=gnd}
C {devices/ipin.sym} 300 -80 3 0 {name=p18 lab=gnd}
C {devices/ipin.sym} -100 60 3 0 {name=p19 lab=gnd}
