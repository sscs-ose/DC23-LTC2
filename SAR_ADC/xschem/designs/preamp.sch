v {xschem version=3.1.0 file_version=1.2 
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
lab=#net1}
N 300 -130 540 -130 {
lab=GND}
N 350 -350 400 -350 {
lab=Vin2}
N 440 -380 450 -380 {
lab=Vout1}
N 540 -160 540 -130 {
lab=GND}
N 540 -190 600 -190 {
lab=GND}
N 600 -190 600 -130 {
lab=GND}
N 460 -510 460 -500 {
lab=Vout1}
N 550 -540 630 -540 {
lab=V}
N 550 -570 550 -540 {
lab=V}
N 540 -320 540 -220 {
lab=#net1}
N 540 -350 650 -350 {
lab=GND}
N 690 -350 780 -350 {
lab=Vin1}
N 450 -500 450 -460 {
lab=Vout1}
N 630 -510 630 -450 {
lab=Vout2}
N 540 -130 600 -130 {
lab=GND}
N 460 -540 550 -540 {
lab=V}
N 440 -320 540 -320 {
lab=#net1}
N 440 -350 540 -350 {
lab=GND}
N 540 -570 630 -570 {
lab=V}
N 460 -570 540 -570 {
lab=V}
N 480 -190 500 -190 {
lab=clk}
N 390 -540 420 -540 {
lab=clk}
N 280 -130 300 -130 {
lab=GND}
N 270 -170 270 -130 {
lab=GND}
N 270 -130 280 -130 {
lab=GND}
N 640 -630 640 -600 {
lab=V}
N 600 -600 640 -600 {
lab=V}
N 600 -600 600 -570 {
lab=V}
N 670 -540 760 -540 {
lab=clk}
N 760 -660 760 -540 {
lab=clk}
N 390 -660 760 -660 {
lab=clk}
N 390 -660 390 -540 {
lab=clk}
N 480 -280 480 -190 {
lab=clk}
N 190 -280 480 -280 {
lab=clk}
N 190 -620 190 -280 {
lab=clk}
N 190 -620 390 -620 {
lab=clk}
N 690 -280 690 -130 {
lab=GND}
N 600 -130 690 -130 {
lab=GND}
N 350 -370 350 -350 {
lab=Vin2}
N 780 -380 780 -350 {
lab=Vin1}
N 290 -430 290 -400 {
lab=GND}
N 160 -400 290 -400 {
lab=GND}
N 770 -420 960 -420 {
lab=GND}
N 290 -490 450 -490 {
lab=Vout1}
N 630 -480 770 -480 {
lab=Vout2}
N 160 -170 270 -170 {
lab=GND}
N 160 -400 160 -170 {
lab=GND}
N 690 -280 960 -280 {
lab=GND}
N 960 -420 960 -280 {
lab=GND}
N 580 -350 580 -270 {
lab=GND}
N 580 -270 690 -270 {
lab=GND}
C {symbols/nfet_03v3.sym} 670 -350 0 1 {name=M26
L=.28u
W=4u
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
L=.28u
W=4u
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
C {symbols/nfet_03v3.sym} 520 -190 0 0 {name=M28
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
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 440 -540 0 0 {name=M24
L=0.28u
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
C {symbols/nfet_03v3.sym} 650 -540 0 1 {name=M25
L=0.28u
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
C {devices/iopin.sym} 640 -630 0 0 {name=p1 lab=V
W=3u}
C {devices/iopin.sym} 270 -170 0 0 {name=p2 lab=GND
W=20u}
C {devices/iopin.sym} 630 -450 0 0 {name=p8 lab=Vout2}
C {devices/iopin.sym} 450 -460 0 1 {name=p6 lab=Vout1}
C {devices/iopin.sym} 190 -440 0 1 {name=p3 lab=clk}
C {devices/iopin.sym} 350 -370 0 1 {name=p7 lab=Vin2}
C {devices/iopin.sym} 780 -380 0 0 {name=p9 lab=Vin1}
