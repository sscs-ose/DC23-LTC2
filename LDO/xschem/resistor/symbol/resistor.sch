v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1140 -510 1140 -480 {
lab=IN1}
N 1140 -340 1230 -340 {
lab=OUT1}
N 1140 -170 1140 -140 {
lab=IN2}
N 1080 -450 1120 -450 {
lab=B}
N 1080 -200 1120 -200 {
lab=B}
N 1140 -140 1140 -120 {
lab=IN2}
N 1080 -450 1080 -200 {
lab=B}
N 1140 -310 1230 -310 {
lab=xxx}
N 1140 -420 1140 -340 {
lab=OUT1}
N 1140 -310 1140 -230 {
lab=xxx}
N 1050 -450 1080 -450 {
lab=B}
N 1050 -200 1080 -200 {
lab=B}
N 1080 -480 1080 -450 {
lab=B}
N 1080 -200 1080 -170 {
lab=B}
N 1030 -480 1080 -480 {
lab=B}
N 1030 -230 1080 -230 {
lab=B}
N 1030 -420 1080 -420 {
lab=B}
N 1030 -170 1080 -170 {
lab=B}
C {devices/iopin.sym} 990 -560 0 0 {name=p2 lab=OUT1}
C {devices/iopin.sym} 930 -540 0 0 {name=p4 lab=IN2}
C {devices/iopin.sym} 930 -560 0 0 {name=p3 lab=IN1}
C {devices/iopin.sym} 910 -550 2 0 {name=p5 lab=B}
C {devices/iopin.sym} 990 -540 0 0 {name=p1 lab=OUT2}
C {symbols/ppolyf_u_1k.sym} 1140 -450 0 0 {name=R5
W=1u
L=200u
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 1030 -450 2 0 {name=R7
W=1u
L=20u
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 1030 -200 2 0 {name=R8
W=1u
L=20u
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 1140 -200 0 0 {name=R1
W=1u
L=120u
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {devices/lab_pin.sym} 1230 -340 2 0 {name=p6 sig_type=std_logic lab=OUT1}
C {devices/lab_pin.sym} 1230 -310 2 0 {name=p7 sig_type=std_logic lab=OUT2}
C {devices/lab_pin.sym} 1140 -510 2 0 {name=p8 sig_type=std_logic lab=IN1}
C {devices/lab_pin.sym} 1140 -120 2 0 {name=p9 sig_type=std_logic lab=IN2}
C {devices/lab_pin.sym} 1080 -320 0 0 {name=p10 sig_type=std_logic lab=B}
