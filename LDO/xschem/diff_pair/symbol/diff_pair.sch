v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 120 30 120 60 {
lab=cm}
N -120 60 120 60 {
lab=cm}
N -120 30 -120 60 {
lab=cm}
N -120 -0 120 0 {
lab=vss}
N -180 0 -160 -0 {
lab=vin_n}
N 160 0 180 0 {
lab=vin_p}
N -120 -60 -120 -30 {
lab=vin1}
N 120 -60 120 -30 {
lab=vin2}
N -20 60 -20 100 {
lab=cm}
N 20 0 20 100 {
lab=vss}
N 230 40 230 50 {
lab=cm}
N 230 120 280 120 {
lab=vss}
N 230 110 230 120 {
lab=vss}
N 270 80 280 80 {
lab=vss}
N 280 80 280 120 {
lab=vss}
N 220 80 220 120 {
lab=vss}
N 220 120 230 120 {
lab=vss}
N 220 80 230 80 {
lab=vss}
N 210 120 220 120 {
lab=vss}
C {symbols/nfet_03v3.sym} -140 0 0 0 {name=M2
L=1u
W=10u
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
C {devices/ipin.sym} -180 0 0 0 {name=p4 lab=vin_n}
C {devices/ipin.sym} 180 0 2 0 {name=p5 lab=vin_p}
C {devices/iopin.sym} 20 100 1 0 {name=p7 lab=vss}
C {symbols/nfet_03v3.sym} 140 0 0 1 {name=M1
L=1u
W=10u
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
C {devices/iopin.sym} -120 -60 3 0 {name=p10 lab=vin1}
C {devices/iopin.sym} 120 -60 3 0 {name=p11 lab=vin2}
C {devices/iopin.sym} -20 100 1 0 {name=p1 lab=cm}
C {symbols/nfet_03v3.sym} 250 80 0 1 {name=MD
L=1u
W=10u
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
C {devices/lab_pin.sym} 230 40 2 0 {name=p2 sig_type=std_logic lab=cm}
C {devices/lab_pin.sym} 210 120 0 0 {name=p3 sig_type=std_logic lab=vss}
