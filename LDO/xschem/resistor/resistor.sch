v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1140 -510 1140 -480 {
lab=VDD}
N 1140 -320 1230 -320 {
lab=OUT}
N 1140 -170 1140 -140 {
lab=VSS}
N 1080 -450 1120 -450 {
lab=BULK}
N 1080 -200 1120 -200 {
lab=BULK}
N 1140 -140 1140 -120 {
lab=VSS}
N 1080 -450 1080 -200 {
lab=BULK}
N 1140 -420 1140 -230 {
lab=OUT}
C {symbols/ppolyf_u.sym} 1140 -450 0 0 {name=R1
W=1e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=10}
C {symbols/ppolyf_u.sym} 1140 -200 0 0 {name=R2
W=1e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=6}
C {devices/iopin.sym} 1230 -320 0 0 {name=p2 lab=OUT}
C {devices/iopin.sym} 1140 -120 0 0 {name=p4 lab=VSS}
C {devices/iopin.sym} 1140 -510 0 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 1080 -330 2 0 {name=p5 lab=BULK}
