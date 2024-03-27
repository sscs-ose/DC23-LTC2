v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {v_ref: 5V 
i_ref: 10uA} -10 -310 0 0 0.4 0.4 {}
N 410 -310 500 -310 {
lab=#net1}
N 500 -310 600 -310 { lab=#net1}
N 640 -260 730 -260 {
lab=out}
N 450 -60 450 -40 {
lab=GND}
N 400 -310 410 -310 {
lab=#net1}
N 170 -330 260 -330 {
lab=v_ref}
N 220 -290 260 -290 {
lab=#net2}
N 300 -250 300 -220 {
lab=i_ref}
N 170 -220 300 -220 {
lab=i_ref}
N 160 -420 640 -420 {
lab=vin}
N 640 -420 640 -340 {
lab=vin}
N 640 -370 670 -370 {
lab=vin}
N 670 -370 670 -310 {
lab=vin}
N 640 -310 670 -310 {
lab=vin}
N 320 -420 320 -360 {
lab=vin}
N 640 -80 640 -60 {
lab=GND}
N 340 -60 640 -60 {
lab=GND}
N 640 -180 640 -140 {
lab=#net2}
N 220 -160 640 -160 {
lab=#net2}
N 600 -210 620 -210 {
lab=GND}
N 600 -210 600 -60 {
lab=GND}
N 620 -110 620 -60 {
lab=GND}
N 340 -270 340 -60 {
lab=GND}
N 220 -290 220 -160 {
lab=#net2}
N 640 -280 640 -240 {
lab=out}
C {devices/gnd.sym} 450 -40 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 170 -330 0 0 {name=l3 sig_type=std_logic lab=v_ref}
C {devices/lab_pin.sym} 160 -420 0 0 {name=l4 sig_type=std_logic lab=vin}
C {symbols/pfet_03v3.sym} 620 -310 0 0 {name=M1
L=0.5u
W=10u
nf=1
m=900
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/ppolyf_u.sym} 640 -210 0 0 {name=R1
W=1e-6
L=164e-6
model=ppolyf_u_2k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 640 -110 0 0 {name=R2
W=1e-6
L=100e-6
model=ppolyf_u_2k
spiceprefix=X
m=1}
C {devices/iopin.sym} 730 -260 0 0 {name=p2 lab=out}
C {symbol/ota_ldo_v2.sym} 320 -310 0 0 {name=x1}
C {devices/lab_pin.sym} 170 -220 0 0 {name=l6 sig_type=std_logic lab=i_ref}
