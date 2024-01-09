v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 710 -210 710 -160 {
lab=CNTL}
N 760 -190 760 -150 {
lab=put}
N 710 -160 710 -130 {
lab=CNTL}
N 970 -250 1010 -250 {
lab=vout}
N 760 -150 760 -80 {
lab=put}
N 760 -250 790 -250 {
lab=put}
N 710 -230 790 -230 {
lab=CNTL}
N 760 -250 760 -190 {
lab=put}
N 710 -230 710 -210 {
lab=CNTL}
C {devices/code_shown.sym} -30 -200 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_REF_7T5V0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/simulator_commands.sym} -630 -135 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	tran 0.1n 5n
	plot v(CNTL) V(vout) V(put)
	plot v(vout)
	write test_and.raw

.endc
.save all

"}
C {devices/vsource.sym} 710 -100 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 760 -50 0 0 {name=VIN2 value="pulse 0 3.3 0 1n 1n 18n 40n"}
C {devices/lab_pin.sym} 710 -70 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 760 -20 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1010 -250 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 710 -160 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/vsource.sym} 480 -100 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 480 -70 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 480 -130 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 560 -100 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 560 -70 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 560 -130 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 330 -100 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 330 -70 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 330 -130 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 410 -100 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 410 -70 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 410 -130 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {std_cells/dffq_1.sym} 880 -240 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/lab_pin.sym} 760 -150 0 1 {name=p13 sig_type=std_logic lab=put}
