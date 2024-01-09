v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 460 -190 460 -140 {
lab=CNTL}
N 510 -170 510 -130 {
lab=put}
N 460 -140 460 -110 {
lab=CNTL}
N 720 -230 760 -230 {
lab=vout+}
N 510 -130 510 -60 {
lab=put}
N 510 -230 540 -230 {
lab=put}
N 460 -210 540 -210 {
lab=CNTL}
N 510 -230 510 -170 {
lab=put}
N 460 -210 460 -190 {
lab=CNTL}
N 720 -210 760 -210 {
lab=vout-}
C {devices/code_shown.sym} -280 -200 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_REF_7T5V0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/simulator_commands.sym} -880 -135 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	*tran interval duration
	tran 1n 100n

	*dc vin1 0 3.3 0.1
	plot v(CNTL) V(put) v(vout+) v(vout-)
	plot v(vout+) v(vout-)
	write test_and.raw

.endc
.save all

"}
C {devices/vsource.sym} 460 -80 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 510 -30 0 0 {name=VIN2 value="pulse 0 3.3 0 1n 1n 18n 40n"}
C {devices/lab_pin.sym} 460 -50 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 510 0 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 760 -230 0 1 {name=p4 sig_type=std_logic lab=vout+}
C {devices/lab_pin.sym} 460 -140 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/vsource.sym} 230 -80 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 230 -50 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 230 -110 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 310 -80 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 310 -50 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 310 -110 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 80 -80 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 80 -50 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 80 -110 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 160 -80 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 160 -50 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 160 -110 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {devices/lab_pin.sym} 510 -130 0 1 {name=p13 sig_type=std_logic lab=put}
C {devices/lab_pin.sym} 760 -210 0 1 {name=p14 sig_type=std_logic lab=vout-}
C {designs/std_cells/dlxbp_1.sym} 630 -220 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
