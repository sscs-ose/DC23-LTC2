v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_03v3_nvt.sym} -2150 -4470 3 1 {name=M1
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_03v3_nvt
spiceprefix=X
}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} -2150 -4250 3 0 {name=M2
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/iopin.sym} -2150 -4490 1 1 {name=p1 lab=ctrl}
C {devices/iopin.sym} -2250 -4360 0 1 {name=p3 lab=in}
C {devices/iopin.sym} -2040 -4360 0 0 {name=p4 lab=out}
C {devices/iopin.sym} -2150 -4230 3 1 {name=p5 lab=nctrl}
C {devices/iopin.sym} -2150 -4450 3 1 {name=p6 lab=gnd}
C {devices/iopin.sym} -2150 -4270 1 1 {name=p7 lab=V}
