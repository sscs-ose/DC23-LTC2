v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {#reference current source = 2uA

#nominal current
for 4LSB, binary coded
1x=10uA, 2x=20uA, 4x=40uA, 8x=80uA

for 6MSB, thermometer coded 
16x=160uA} 40 -1250 0 0 1 1 {}
N 340 -320 340 -300 {
lab=#net1}
N 340 -140 340 -110 {
lab=VSS}
N 340 -270 450 -270 {
lab=VSS}
N 340 -170 450 -170 {
lab=VSS}
N 340 -220 340 -200 {
lab=#net2}
N 340 -240 340 -220 {
lab=#net2}
N 220 -410 220 -390 {
lab=#net1}
N 460 -410 460 -390 {
lab=#net1}
N 220 -390 460 -390 {
lab=#net1}
N 150 -440 180 -440 {
lab=Q+}
N 220 -440 300 -440 {
lab=VSS}
N 390 -440 460 -440 {
lab=VSS}
N 500 -440 530 -440 {lab=Q-}
N 340 -330 340 -320 {
lab=#net1}
N 340 -390 340 -330 {
lab=#net1}
N 460 -700 460 -470 {
lab=OUT-}
N 330 -110 340 -110 {
lab=VSS}
N 250 -270 300 -270 {
lab=Vb2}
N 260 -170 300 -170 {
lab=Vb1}
N 250 -170 260 -170 {
lab=Vb1}
N 250 -110 330 -110 {
lab=VSS}
N 60 -270 250 -270 {
lab=Vb2}
N 60 -170 250 -170 {
lab=Vb1}
N 60 -110 250 -110 {
lab=VSS}
N 220 -700 220 -470 {
lab=#net3}
C {devices/ipin.sym} 530 -440 1 0 {name=p2 lab=Q-}
C {devices/ipin.sym} 150 -440 1 0 {name=p3 lab=Q+}
C {symbols/nfet_03v3.sym} 320 -270 0 0 {name=M26
L=0.5u
W=32u
nf=16
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
C {symbols/nfet_03v3.sym} 320 -170 0 0 {name=M27
L=0.5u
W=32u
nf=16
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
C {symbols/nfet_03v3.sym} 200 -440 0 0 {name=M30
L=0.5u
W=16u
nf=8
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
C {symbols/nfet_03v3.sym} 480 -440 0 1 {name=M31
L=0.5u
W=16u
nf=8
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
C {devices/lab_pin.sym} 450 -270 0 1 {name=p63 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 450 -170 0 1 {name=p64 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 300 -440 0 1 {name=p15 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 390 -440 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} 60 -170 0 0 {name=p47 lab=Vb1}
C {devices/ipin.sym} 60 -270 0 0 {name=p46 lab=Vb2}
C {devices/opin.sym} 220 -700 0 1 {name=p16 lab=OUT+}
C {devices/opin.sym} 460 -700 0 0 {name=p18 lab=OUT-}
C {devices/ipin.sym} 60 -110 0 0 {name=p42 lab=VSS}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
