v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 300 -200 310 -200 {
lab=out9}
N 300 -180 310 -180 {
lab=out8}
N 300 -160 310 -160 {
lab=out7}
N 300 -140 310 -140 {
lab=out6}
N 300 -120 310 -120 {
lab=out5}
N 300 -100 310 -100 {
lab=out4}
N 300 -80 310 -80 {
lab=out3}
N 300 -60 310 -60 {
lab=out2}
N 300 -40 310 -40 {
lab=out1}
N 300 -20 310 -20 {
lab=out0}
C {10bit_counter.sym} 150 -110 0 0 {name=x1}
C {devices/simulator_commands.sym} -155 -140 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	tran 1n 25600n
	plot v(out0)+2*v(out1)+4*v(out2)+8*v(out3)+16*v(out4)+32*v(out5)+64*v(out6)+128*v(out7)+256*v(out8)+512*v(out9)
	write tb_10bit_counter.raw
.endc
.save all

"}
C {devices/lab_pin.sym} 310 -200 0 1 {name=p1 sig_type=std_logic lab=out9}
C {devices/lab_pin.sym} 310 -180 0 1 {name=p2 sig_type=std_logic lab=out8}
C {devices/lab_pin.sym} 310 -160 0 1 {name=p3 sig_type=std_logic lab=out7}
C {devices/lab_pin.sym} 310 -140 0 1 {name=p4 sig_type=std_logic lab=out6}
C {devices/lab_pin.sym} 310 -120 0 1 {name=p5 sig_type=std_logic lab=out5}
C {devices/lab_pin.sym} 310 -100 0 1 {name=p6 sig_type=std_logic lab=out4}
C {devices/lab_pin.sym} 310 -80 0 1 {name=p7 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} 310 -60 0 1 {name=p8 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 310 -40 0 1 {name=p9 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} 310 -20 0 1 {name=p10 sig_type=std_logic lab=out0}
