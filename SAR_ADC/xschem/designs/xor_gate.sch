v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -2420 -4510 -2420 -4470 {
lab=#net1}
N -2420 -4410 -2420 -4360 {
lab=out}
N -2420 -4300 -2420 -4240 {
lab=#net2}
N -2420 -4190 -2240 -4190 {
lab=gnd}
N -2230 -4290 -2230 -4250 {
lab=#net3}
N -2230 -4410 -2230 -4350 {
lab=out}
N -2230 -4500 -2230 -4470 {
lab=#net1}
N -2420 -4560 -2230 -4560 {
lab=V}
N -2420 -4490 -2230 -4490 {
lab=#net1}
N -2420 -4380 -2230 -4380 {
lab=out}
N -2240 -4190 -2230 -4190 {
lab=gnd}
N -2420 -4220 -2230 -4220 {
lab=gnd}
N -2420 -4330 -2250 -4330 {
lab=gnd}
N -2250 -4330 -2250 -4320 {
lab=gnd}
N -2250 -4320 -2230 -4320 {
lab=gnd}
N -2310 -4330 -2310 -4220 {
lab=gnd}
N -2350 -4220 -2350 -4190 {
lab=gnd}
N -2420 -4530 -2230 -4530 {
lab=V}
N -2420 -4440 -2230 -4440 {
lab=V}
N -2330 -4530 -2330 -4440 {
lab=V}
N -2330 -4560 -2330 -4530 {
lab=V}
N -1960 -4390 -1770 -4390 {
lab=gnd}
N -1960 -4560 -1770 -4560 {
lab=V}
N -1770 -4500 -1770 -4450 {
lab=nB}
N -1960 -4500 -1960 -4450 {
lab=nA}
N -1810 -4530 -1810 -4420 {
lab=B}
N -2000 -4530 -2000 -4420 {
lab=A}
N -1960 -4530 -1930 -4530 {
lab=V}
N -1930 -4560 -1930 -4530 {
lab=V}
N -1960 -4420 -1940 -4420 {
lab=gnd}
N -1940 -4420 -1940 -4390 {
lab=gnd}
N -1770 -4420 -1750 -4420 {
lab=gnd}
N -1750 -4420 -1750 -4390 {
lab=gnd}
N -1770 -4390 -1750 -4390 {
lab=gnd}
N -1770 -4530 -1750 -4530 {
lab=V}
N -1750 -4560 -1750 -4530 {
lab=V}
N -1770 -4560 -1750 -4560 {
lab=V}
N -2230 -4560 -1960 -4560 {
lab=V}
N -2230 -4190 -1860 -4190 {
lab=gnd}
N -1860 -4390 -1860 -4190 {
lab=gnd}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -2210 -4320 0 1 {name=M1
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -2440 -4530 0 0 {name=M2
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
C {devices/iopin.sym} -2150 -4610 1 1 {name=p1 lab=A}
C {devices/iopin.sym} -2240 -4380 0 0 {name=p4 lab=out}
C {devices/iopin.sym} -2320 -4190 3 1 {name=p6 lab=gnd}
C {devices/iopin.sym} -2330 -4560 1 1 {name=p7 lab=V}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -2210 -4220 2 0 {name=M3
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -2440 -4440 0 0 {name=M4
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
C {devices/iopin.sym} -2120 -4610 1 1 {name=p9 lab=B}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -2210 -4530 0 1 {name=M5
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -2210 -4440 0 1 {name=M6
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -2440 -4330 0 0 {name=M7
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -2440 -4220 2 1 {name=M8
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
C {devices/lab_pin.sym} -2460 -4440 0 0 {name=p2 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} -2190 -4440 0 1 {name=p3 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} -2190 -4530 0 1 {name=p5 sig_type=std_logic lab=nA}
C {devices/lab_pin.sym} -2460 -4530 0 0 {name=p8 sig_type=std_logic lab=nB}
C {devices/lab_pin.sym} -2190 -4320 0 1 {name=p10 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} -2190 -4220 0 1 {name=p11 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} -2460 -4220 0 0 {name=p12 sig_type=std_logic lab=nA}
C {devices/lab_pin.sym} -2460 -4330 0 0 {name=p13 sig_type=std_logic lab=nB}
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -1980 -4530 0 0 {name=M9
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -1980 -4420 0 0 {name=M10
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -1790 -4530 0 0 {name=M11
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
C {/home/designer/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -1790 -4420 0 0 {name=M12
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
C {devices/lab_pin.sym} -2000 -4480 0 0 {name=p14 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} -1810 -4480 0 0 {name=p15 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} -1960 -4480 0 1 {name=p16 sig_type=std_logic lab=nA}
C {devices/lab_pin.sym} -1770 -4480 0 1 {name=p17 sig_type=std_logic lab=nB}
