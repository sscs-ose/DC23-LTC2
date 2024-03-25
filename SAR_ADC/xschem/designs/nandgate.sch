v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -2120 -4370 -2050 -4370 {
lab=out}
N -2050 -4450 -2040 -4450 {
lab=out}
N -2120 -4270 -2090 -4270 {
lab=#net1}
N -2200 -4270 -2180 -4270 {
lab=V}
N -2050 -4370 -1960 -4370 {
lab=out}
N -2030 -4370 -2030 -4270 {
lab=out}
N -2180 -4450 -2150 -4450 {
lab=out}
N -2150 -4300 -2150 -4270 {
lab=V}
N -2150 -4300 -2060 -4300 {
lab=V}
N -2060 -4300 -2060 -4270 {
lab=V}
N -2180 -4300 -2180 -4270 {
lab=V}
N -2180 -4300 -2150 -4300 {
lab=V}
N -2180 -4450 -2180 -4370 {
lab=out}
N -2180 -4370 -2120 -4370 {
lab=out}
N -1980 -4450 -1980 -4370 {
lab=out}
N -2010 -4450 -2010 -4420 {
lab=out}
N -2150 -4420 -2010 -4420 {
lab=out}
N -2150 -4450 -2150 -4420 {
lab=out}
N -2120 -4450 -2050 -4450 {
lab=out}
N -2080 -4450 -2080 -4420 {
lab=out}
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
C {devices/iopin.sym} -2150 -4490 1 1 {name=p1 lab=A}
C {devices/iopin.sym} -1960 -4370 0 0 {name=p4 lab=out}
C {devices/iopin.sym} -2150 -4230 3 1 {name=p5 lab=A}
C {devices/iopin.sym} -2080 -4420 3 1 {name=p6 lab=gnd}
C {devices/iopin.sym} -2200 -4270 1 1 {name=p7 lab=V}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_03v3_nvt.sym} -2010 -4470 1 0 {name=M3
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} -2060 -4250 3 0 {name=M4
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
C {devices/iopin.sym} -2010 -4490 1 1 {name=p9 lab=B}
C {devices/iopin.sym} -2060 -4230 3 1 {name=p10 lab=B}
