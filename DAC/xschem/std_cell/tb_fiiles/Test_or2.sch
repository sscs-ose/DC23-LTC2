v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 160 -720 960 -320 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10e-6
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=""
color=""
dataset=-1
unitx=1
logx=0
logy=0
}
N 440 -160 520 -160 {
lab=CNTL}
N 440 -160 440 -110 {
lab=CNTL}
N 490 -120 520 -120 {
lab=#net1}
N 490 -120 490 -80 {
lab=#net1}
N 440 -110 440 -80 {
lab=CNTL}
N 640 -140 680 -140 {
lab=vout}
N 680 -140 680 -130 {
lab=vout}
N 490 -80 490 -20 {
lab=#net1}
N 490 -20 490 0 {
lab=#net1}
C {devices/vsource.sym} 440 -50 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 490 30 0 0 {name=VIN2 value=0}
C {devices/lab_pin.sym} 440 -20 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 490 60 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 680 -130 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/simulator_commands.sym} -600 -125 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	tran 0.1n 50n
	*dc vin1 0 3.3 0.1
	plot v(CNTL) V(vout)
	plot v(vout)
	write test_and.raw

.endc
.save all

"}
C {devices/lab_pin.sym} 440 -110 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/code_shown.sym} 0 -230 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_REF_7T5V0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/vsource.sym} 210 -50 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 210 -20 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 210 -80 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 290 -50 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 290 -20 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 290 -80 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 60 -50 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 60 -20 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 60 -80 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 140 -50 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 140 -20 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 140 -80 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {devices/launcher.sym} -100 -710 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/Test_and.raw tran"
}
C {std_cells/or2_1.sym} 580 -140 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
