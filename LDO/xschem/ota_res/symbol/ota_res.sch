v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -30 -50 -10 -50 {
lab=vss}
N 10 -100 10 -80 {
lab=vin}
N 10 -20 10 -0 {
lab=vout}
N 220 -10 240 -10 {
lab=vss}
N 220 -50 220 -10 {
lab=vss}
N 200 -50 220 -50 {
lab=vss}
N 240 -90 240 -80 {
lab=vss}
N 220 -90 240 -90 {
lab=vss}
N 220 -90 220 -50 {
lab=vss}
N 240 -20 240 -10 {
lab=vss}
C {devices/ipin.sym} 10 -100 0 0 {name=p4 lab=vin}
C {devices/iopin.sym} -30 -50 2 0 {name=p7 lab=vss}
C {devices/opin.sym} 10 0 0 0 {name=p8 lab=vout}
C {symbols/ppolyf_u.sym} 10 -50 0 0 {name=R2
W=1U
L=10U
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 240 -50 0 0 {name=RD
W=2U
L=5U
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {devices/lab_pin.sym} 200 -50 0 0 {name=p1 sig_type=std_logic lab=vss}
