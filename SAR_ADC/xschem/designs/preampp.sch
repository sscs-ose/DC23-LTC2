v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 450 -460 450 -380 {
lab=Vout1}
N 450 -500 460 -500 {
lab=Vout1}
N 630 -450 630 -380 {
lab=Vout2}
N 630 -380 650 -380 {
lab=Vout2}
N 540 -320 650 -320 {
lab=GND}
N 440 -380 450 -380 {
lab=Vout1}
N 460 -510 460 -500 {
lab=Vout1}
N 540 -350 650 -350 {
lab=GND}
N 450 -500 450 -460 {
lab=Vout1}
N 630 -510 630 -450 {
lab=Vout2}
N 440 -320 540 -320 {
lab=GND}
N 440 -350 540 -350 {
lab=GND}
N 390 -540 420 -540 {
lab=Vin2}
N 670 -540 760 -540 {
lab=Vin1}
N 190 -620 190 -280 {
lab=clk}
N 190 -620 390 -620 {
lab=clk}
N 540 -350 540 -320 {
lab=GND}
N 460 -540 630 -540 {
lab=V}
N 460 -570 630 -570 {
lab=#net1}
N 560 -640 560 -570 {
lab=#net1}
N 560 -770 560 -700 {
lab=V}
N 560 -670 590 -670 {
lab=V}
N 390 -670 520 -670 {
lab=clk}
N 390 -670 390 -620 {
lab=clk}
N 190 -280 710 -280 {
lab=clk}
N 710 -360 710 -280 {
lab=clk}
N 690 -350 710 -350 {
lab=clk}
N 400 -350 400 -280 {
lab=clk}
N 530 -320 530 -310 {
lab=GND}
N 590 -730 590 -670 {
lab=V}
N 560 -730 590 -730 {
lab=V}
N 590 -670 590 -540 {
lab=V}
C {symbols/nfet_03v3.sym} 670 -350 0 1 {name=M26
L=.5u
W=.22u
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
C {symbols/nfet_03v3.sym} 420 -350 0 0 {name=M27
L=.5u
W=.22u
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
C {symbols/pfet_03v3.sym} 440 -540 0 0 {name=M24
L=.28u
W=8u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 650 -540 0 1 {name=M25
L=.28u
W=8u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/iopin.sym} 560 -770 0 0 {name=p1 lab=V
W=3u}
C {devices/iopin.sym} 530 -310 0 0 {name=p2 lab=GND
W=20u}
C {devices/iopin.sym} 630 -430 0 0 {name=p8 lab=Vout2}
C {devices/iopin.sym} 450 -420 0 1 {name=p6 lab=Vout1}
C {devices/iopin.sym} 190 -440 0 1 {name=p3 lab=clk}
C {devices/iopin.sym} 390 -540 0 1 {name=p7 lab=Vin2}
C {devices/iopin.sym} 750 -540 0 0 {name=p9 lab=Vin1}
C {symbols/pfet_03v3.sym} 540 -670 2 1 {name=M1
L=.28u
W=.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
