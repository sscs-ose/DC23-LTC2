v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -2180 -4450 -2180 -4270 {
lab=A}
N -2120 -4450 -2120 -4270 {
lab=B}
N -2250 -4360 -2180 -4360 {
lab=A}
N -2120 -4360 -2040 -4360 {
lab=B}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -2150 -4470 3 1 {name=M1
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
body=GND}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -2150 -4250 3 0 {name=M2
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
body=GND}
C {devices/iopin.sym} -2150 -4490 1 1 {name=p1 lab=ctrl}
C {devices/iopin.sym} -2250 -4360 0 1 {name=p3 lab=A}
C {devices/iopin.sym} -2040 -4360 0 0 {name=p4 lab=B}
C {devices/iopin.sym} -2150 -4230 3 1 {name=p5 lab=nctrl}
C {devices/iopin.sym} -2150 -4450 3 1 {name=p6 lab=GND}
C {devices/iopin.sym} -2150 -4270 1 1 {name=p7 lab=V}
