v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 230 -60 250 -60 {
lab=Q}
N 230 -60 230 -10 {
lab=Q}
N 310 -10 340 -10 {
lab=nQ}
C {designs/std_cells/dlxtp_1.sym} 140 -50 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/simulator_commands.sym} -1070 -145 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	tran 0.1n 50n
	plot v(D) V(E)
	plot v(Q) v(nQ)
.endc
.save all

"}
C {devices/code_shown.sym} -470 -250 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_REF_7T5V0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/vsource.sym} -260 -70 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -260 -40 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -260 -100 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -180 -70 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -180 -40 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -180 -100 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -410 -70 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} -410 -40 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -410 -100 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} -330 -70 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} -330 -40 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -330 -100 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {devices/vsource.sym} -260 -170 0 0 {name=VIN1 *value=1
value="pulse 0 5 0 1n 1n 18n 40n"}
C {devices/lab_pin.sym} -260 -140 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -60 -140 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -260 -200 0 1 {name=p4 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 50 -60 0 0 {name=p5 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 50 -40 0 0 {name=p13 sig_type=std_logic lab=E}
C {devices/lab_pin.sym} -60 -200 0 0 {name=p14 sig_type=std_logic lab=E}
C {devices/vsource.sym} -60 -170 0 0 {name=VIN2 *value=1
value="pulse 0 5 0 1n 1n 8n 20n"}
C {devices/lab_pin.sym} 250 -60 0 1 {name=p15 sig_type=std_logic lab=Q}
C {designs/std_cells/inv_1.sym} 270 -10 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} 340 -10 0 1 {name=p16 sig_type=std_logic lab=nQ}
