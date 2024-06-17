v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 -210 520 -210 {
lab=CNTL}
N 440 -210 440 -160 {
lab=CNTL}
N 440 -160 440 -130 {
lab=CNTL}
N 600 -210 640 -210 {
lab=vout}
N 640 -210 640 -200 {
lab=vout}
C {devices/vsource.sym} 440 -100 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/lab_pin.sym} 440 -70 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 640 -200 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 440 -160 0 0 {name=p5 sig_type=std_logic lab=CNTL}
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
C {std_cell/buf_1.sym} 560 -210 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/code_shown.sym} -640 -215 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
    tran 0.1n 50n
    plot v(CNTL) V(vout)
    write tb_buf.raw
.endc
.save all

"}
C {devices/code_shown.sym} -640 -410 0 0 {name=MODELS only_toplevel=true
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
