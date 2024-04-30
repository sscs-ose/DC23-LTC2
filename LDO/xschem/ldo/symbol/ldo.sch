v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 820 -680 820 -630 {
lab=vdd}
N 910 -560 1000 -560 {
lab=op_out}
N 1140 -530 1140 -510 { lab=out}
N 1140 -280 1140 -260 { lab=#net1}
N 1140 -560 1240 -560 { lab=vdd}
N 1140 -300 1140 -290 { lab=#net1}
N 1140 -290 1140 -280 { lab=#net1}
N 1000 -560 1100 -560 { lab=op_out}
N 1140 -660 1140 -590 {
lab=vdd}
N 1240 -660 1240 -560 {
lab=vdd}
N 1140 -510 1140 -480 {
lab=out}
N 1140 -420 1140 -380 {
lab=#net1}
N 1140 -260 1140 -230 {
lab=#net1}
N 1140 -740 1140 -660 {
lab=vdd}
N 820 -740 820 -680 {
lab=vdd}
N 820 -740 1135 -740 {
lab=vdd}
N 1135 -740 1140 -740 {
lab=vdd}
N 1140 -520 1230 -520 {
lab=out}
N 1140 -320 1140 -300 {
lab=#net1}
N 1140 -170 1140 -140 {
lab=vss}
N 980 -760 980 -740 {
lab=vdd}
N 1080 -450 1120 -450 {
lab=vss}
N 1080 -200 1120 -200 {
lab=vss}
N 840 -490 840 -140 {
lab=vss}
N 980 -140 980 -120 {
lab=vss}
N 1080 -450 1080 -200 {
lab=vss}
N 1080 -200 1080 -140 {
lab=vss}
N 1240 -740 1240 -660 {
lab=vdd}
N 1140 -740 1240 -740 {
lab=vdd}
N 840 -520 840 -490 {
lab=vss}
N 840 -140 1140 -140 {
lab=vss}
N 820 -630 820 -610 {
lab=vdd}
N 780 -480 800 -480 {
lab=iref}
N 800 -500 800 -480 {
lab=iref}
N 720 -580 760 -580 {
lab=ref}
N 660 -540 760 -540 {
lab=#net1}
N 660 -270 1140 -270 {
lab=#net1}
N 660 -540 660 -270 {
lab=#net1}
N 900 -560 910 -560 {
lab=op_out}
N 1140 -380 1140 -320 {
lab=#net1}
N 1290 -170 1310 -170 {
lab=vss}
N 1290 -210 1290 -170 {
lab=vss}
N 1270 -210 1290 -210 {
lab=vss}
N 1310 -250 1310 -240 {
lab=vss}
N 1290 -250 1310 -250 {
lab=vss}
N 1290 -250 1290 -210 {
lab=vss}
N 1310 -180 1310 -170 {
lab=vss}
C {devices/iopin.sym} 760 -840 2 0 {name=p6 sig_type=std_logic lab=ref
}
C {devices/lab_pin.sym} 1005 -560 1 0 {name=l12 sig_type=std_logic lab=op_out

}
C {symbol/ota.sym} 820 -560 0 0 {name=X1}
C {symbols/pfet_03v3.sym} 1120 -560 0 0 {name=M1
L=0.5u
W=4.38u
nf=1
m=1984
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/ppolyf_u.sym} 1140 -450 0 0 {name=R1
W=1u
L=200u
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 1140 -200 0 0 {name=R2
W=1u
L=120u
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {devices/iopin.sym} 780 -840 0 0 {name=p2 lab=out}
C {devices/iopin.sym} 760 -860 2 0 {name=p3 lab=iref}
C {devices/iopin.sym} 690 -840 2 0 {name=p4 lab=vss}
C {devices/iopin.sym} 690 -860 2 0 {name=p1 lab=vdd}
C {devices/lab_pin.sym} 720 -580 0 0 {name=p5 sig_type=std_logic lab=ref}
C {devices/lab_pin.sym} 780 -480 0 0 {name=p7 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 980 -760 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 980 -120 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 1230 -520 2 0 {name=p10 sig_type=std_logic lab=out}
C {symbols/ppolyf_u.sym} 1310 -210 0 0 {name=RD
W=2U
L=20U
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {devices/lab_pin.sym} 1270 -210 0 0 {name=p11 sig_type=std_logic lab=vss}
