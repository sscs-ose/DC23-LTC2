v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 4300 -3480 4460 -3480 {
lab=#net1}
N 4320 -3420 4460 -3420 {
lab=#net2}
N 4320 -3420 4320 -3380 {
lab=#net2}
N 4300 -3380 4320 -3380 {
lab=#net2}
N 4770 -3380 4770 -3290 {
lab=GND}
N 4220 -3290 4770 -3290 {
lab=GND}
N 4220 -3340 4220 -3290 {
lab=GND}
N 4510 -3370 4510 -3290 {
lab=GND}
N 4220 -3520 4770 -3520 {
lab=V}
N 4220 -3520 4220 -3510 {
lab=V}
N 4510 -3520 4510 -3510 {
lab=V}
N 4580 -3480 4690 -3480 {
lab=#net3}
N 4570 -3470 4580 -3470 {
lab=#net3}
N 4580 -3480 4580 -3470 {
lab=#net3}
N 4570 -3410 4690 -3410 {
lab=#net4}
N 4690 -3420 4690 -3410 {
lab=#net4}
N 4370 -3400 4460 -3400 {
lab=clk}
N 4370 -3400 4370 -3320 {
lab=clk}
N 4090 -3320 4370 -3320 {
lab=clk}
N 4090 -3390 4090 -3320 {
lab=clk}
N 4090 -3390 4140 -3390 {
lab=clk}
N 4850 -3480 4880 -3480 {
lab=OUT}
N 4500 -3560 4530 -3560 {
lab=V}
N 4500 -3560 4500 -3520 {
lab=V}
N 4530 -3290 4530 -3260 {
lab=GND}
N 4090 -3430 4140 -3430 {
lab=Vinn}
N 4090 -3480 4140 -3480 {
lab=Vinp}
C {../spice/SR_nor.sym} 2530 -1620 0 0 {name=X1}
C {../spice/preamp.sym} 3760 -2920 0 0 {name=X3}
C {../spice/strongarm.sym} 2570 -1890 0 0 {name=X4}
C {devices/iopin.sym} 4530 -3560 0 0 {name=p1 lab=V}
C {devices/iopin.sym} 4530 -3260 0 0 {name=p2 lab=GND}
C {devices/iopin.sym} 4090 -3480 0 1 {name=p7 lab=Vinp}
C {devices/iopin.sym} 4090 -3430 0 1 {name=p8 lab=Vinn}
C {devices/iopin.sym} 4090 -3340 0 0 {name=p9 lab=clk}
C {devices/iopin.sym} 4870 -3480 0 0 {name=p3 lab=OUT}
C {devices/code.sym} 4880 -3350 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
