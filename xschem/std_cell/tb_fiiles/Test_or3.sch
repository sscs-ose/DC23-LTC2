v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 710 -190 710 -140 {
lab=CNTL}
N 760 -150 790 -150 {
lab=#net1}
N 760 -150 760 -110 {
lab=#net1}
N 710 -140 710 -110 {
lab=CNTL}
N 910 -190 950 -190 {
lab=vout}
N 710 -230 710 -190 {
lab=CNTL}
N 710 -230 790 -230 {
lab=CNTL}
N 760 -190 760 -150 {
lab=#net1}
N 760 -190 770 -190 {
lab=#net1}
N 770 -190 790 -190 {
lab=#net1}
C {std_cells/or3_1.sym} 850 -190 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
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
	*dc vin1 0 3.3 0.1
	plot v(CNTL) V(vout)
	plot v(vout)
	write test_and.raw

.endc
.save all

"}
C {devices/vsource.sym} 710 -80 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 760 -80 0 0 {name=VIN2 value=0}
C {devices/lab_pin.sym} 710 -50 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 760 -50 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 950 -190 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 710 -140 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/vsource.sym} 480 -80 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 480 -50 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 480 -110 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 560 -80 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 560 -50 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 560 -110 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 330 -80 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 330 -50 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 330 -110 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 410 -80 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 410 -50 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 410 -110 0 1 {name=p12 sig_type=std_logic lab=VNW
}
