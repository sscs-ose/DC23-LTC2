v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 460 -270 460 -220 {
lab=CNTL}
N 510 -230 540 -230 {
lab=#net1}
N 510 -230 510 -190 {
lab=#net1}
N 460 -220 460 -190 {
lab=CNTL}
N 660 -270 700 -270 {
lab=vout}
N 460 -310 460 -270 {
lab=CNTL}
N 460 -310 540 -310 {
lab=CNTL}
N 510 -270 510 -230 {
lab=#net1}
N 510 -270 520 -270 {
lab=#net1}
N 520 -270 540 -270 {
lab=#net1}
N 510 -190 510 -120 {
lab=#net1}
C {devices/vsource.sym} 460 -160 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 510 -90 0 0 {name=VIN2 value=3.3}
C {devices/lab_pin.sym} 460 -130 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 510 -60 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 700 -270 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 460 -220 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/vsource.sym} 230 -160 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 230 -130 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 230 -190 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 310 -160 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 310 -130 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 310 -190 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 80 -160 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 80 -130 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 80 -190 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 160 -160 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 160 -130 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 160 -190 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {std_cell/and3_1.sym} 600 -270 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/code_shown.sym} -660 -195 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
    tran 0.1n 50n
    plot v(CNTL) V(vout)
    write tb_and3.raw
.endc
.save all

"}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
C {devices/code_shown.sym} -660 -380 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
