v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -2120 -4360 -2040 -4360 {
lab=out}
N -2240 -4230 -2150 -4230 {
lab=in}
N -2240 -4360 -2240 -4230 {
lab=in}
N -2250 -4360 -2240 -4360 {
lab=in}
N -2250 -4490 -2150 -4490 {
lab=in}
N -2250 -4490 -2250 -4360 {
lab=in}
N -2120 -4450 -2120 -4270 {
lab=out}
N -2150 -4450 -2150 -4410 {
lab=gnd}
N -2180 -4450 -2180 -4410 {
lab=gnd}
N -2180 -4410 -2150 -4410 {
lab=gnd}
N -2150 -4290 -2150 -4270 {
lab=V}
N -2180 -4290 -2180 -4270 {
lab=V}
N -2180 -4290 -2150 -4290 {
lab=V}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -2150 -4470 1 0 {name=M1
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
C {devices/iopin.sym} -2250 -4360 0 1 {name=p3 lab=in}
C {devices/iopin.sym} -2040 -4360 0 0 {name=p4 lab=out}
C {devices/iopin.sym} -2150 -4410 3 1 {name=p6 lab=gnd}
C {devices/iopin.sym} -2150 -4290 1 1 {name=p7 lab=V}
