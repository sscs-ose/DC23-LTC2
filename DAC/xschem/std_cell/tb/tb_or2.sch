v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 -300 520 -300 {
lab=CNTL}
N 440 -300 440 -250 {
lab=CNTL}
N 490 -260 520 -260 {
lab=#net1}
N 490 -260 490 -220 {
lab=#net1}
N 440 -250 440 -220 {
lab=CNTL}
N 640 -280 680 -280 {
lab=vout}
N 680 -280 680 -270 {
lab=vout}
N 490 -220 490 -160 {
lab=#net1}
N 490 -160 490 -140 {
lab=#net1}
C {devices/vsource.sym} 440 -190 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 490 -110 0 0 {name=VIN2 value=0}
C {devices/lab_pin.sym} 440 -160 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 490 -80 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 680 -270 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 440 -250 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/vsource.sym} 210 -190 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 210 -160 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 210 -220 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 290 -190 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 290 -160 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 290 -220 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 60 -190 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 60 -160 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 60 -220 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 140 -190 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 140 -160 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 140 -220 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {devices/code_shown.sym} -630 -205 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
    tran 0.1n 50n
    plot v(CNTL) V(vout)
    write tb_buf.raw
.endc
.save all

"}
C {devices/code_shown.sym} -640 -400 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/title.sym} 160 0 0 0 {name=l2 author="JunBeom Park"}
C {std_cell/or2_1.sym} 580 -280 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
