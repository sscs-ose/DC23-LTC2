v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 430 -240 430 -190 {
lab=CNTL}
N 480 -220 480 -180 {
lab=put}
N 430 -190 430 -160 {
lab=CNTL}
N 690 -280 730 -280 {
lab=vout}
N 480 -180 480 -110 {
lab=put}
N 480 -280 510 -280 {
lab=put}
N 430 -260 510 -260 {
lab=CNTL}
N 480 -280 480 -220 {
lab=put}
N 430 -260 430 -240 {
lab=CNTL}
C {devices/vsource.sym} 430 -130 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 480 -80 0 0 {name=VIN2 value="pulse 0 3.3 0 1n 1n 18n 40n"}
C {devices/lab_pin.sym} 430 -100 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 480 -50 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 730 -280 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 430 -190 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/vsource.sym} 210 -100 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 210 -70 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 210 -130 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 290 -100 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 290 -70 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 290 -130 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 60 -100 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 60 -70 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 60 -130 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 140 -100 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 140 -70 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 140 -130 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {devices/lab_pin.sym} 480 -180 0 1 {name=p13 sig_type=std_logic lab=put}
C {std_cell/dffq_1.sym} 600 -270 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/code_shown.sym} -630 -235 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
    tran 0.1n 50n
    plot v(CNTL) V(vout)
    write tb_dffq_1.raw
.endc
.save all

"}
C {devices/code_shown.sym} -630 -430 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
