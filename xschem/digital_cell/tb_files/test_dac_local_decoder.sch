v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1910 -810 2710 -410 {flags=graph
y1=0
y2=2
ypos1=0.58408
ypos2=2.58408
divy=5
subdivy=1
unity=1
x1=-1.82182e-08
x2=3.17818e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="Rk,cntl

OUT,vout"
color="4 7"
dataset=-1
unitx=1
logx=0
logy=0
digital=1}
N 1610 -510 1610 -470 {
lab=0}
N 1760 -530 1800 -530 {
lab=vout}
N 1610 -550 1610 -510 {
lab=0}
N 1610 -470 1610 -400 {
lab=0}
N 1610 -550 1640 -550 {
lab=0}
N 1610 -590 1700 -590 {
lab=0}
N 1610 -590 1610 -550 {
lab=0}
N 1640 -510 1640 -360 {
lab=CNTL}
C {devices/code_shown.sym} 660 -300 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_REF_7T5V0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/simulator_commands.sym} 60 -225 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	tran 0.1n 50n
	plot v(CNTL) V(vout)
	plot v(vout)
	write test_dac_local_decoder.raw

.endc
.save all

"}
C {devices/vsource.sym} 1640 -330 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/lab_pin.sym} 1610 -400 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1800 -530 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 1640 -440 0 1 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/vsource.sym} 1330 -440 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 1330 -410 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1330 -470 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 1410 -440 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 1410 -410 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1410 -470 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 1180 -440 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 1180 -410 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1180 -470 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 1260 -440 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 1260 -410 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1260 -470 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {dac_local_decoder.sym} 1660 -490 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS}
C {devices/lab_pin.sym} 1640 -300 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/title-2.sym} 0 0 0 0 {name=l1 author="Stefan Schippers" rev=1.0 lock=false}
