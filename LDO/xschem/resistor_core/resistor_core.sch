v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1140 -510 1140 -480 {
lab=A}
N 1080 -450 1120 -450 {
lab=BULK}
N 1140 -420 1140 -380 {
lab=B}
C {devices/iopin.sym} 1140 -380 0 0 {name=p2 lab=B}
C {devices/iopin.sym} 1140 -510 0 0 {name=p3 lab=A}
C {devices/iopin.sym} 1080 -450 2 0 {name=p5 lab=BULK}
C {symbols/ppolyf_u.sym} 1140 -450 0 0 {name=R2
W=1e-6
L=1e-20
model=ppolyf_u
spiceprefix=X
m=1}
