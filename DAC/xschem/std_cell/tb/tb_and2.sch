v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 490 -160 520 -160 {
lab=#net1}
N 490 -160 490 -120 {
lab=#net1}
N 440 -200 440 -120 {
lab=CNTL}
N 440 -200 520 -200 {
lab=CNTL}
N 640 -180 680 -180 {
lab=vout}
C {devices/vsource.sym} 440 -90 0 0 {name=VIN1 *value=1
value="pulse 0 3.3 0 1n 1n 8n 20n"}
C {devices/vsource.sym} 490 -90 0 0 {name=VIN2 value=3.3}
C {devices/lab_pin.sym} 440 -60 0 1 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 490 -60 0 1 {name=p2 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 680 -180 0 1 {name=p4 sig_type=std_logic lab=vout}
C {devices/code_shown.sym} -600 -285 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
    tran 0.1n 50n
    plot v(CNTL) V(vout)
    write tb_and2.raw
.endc
.save all

"}
C {devices/lab_pin.sym} 440 -200 0 0 {name=p5 sig_type=std_logic lab=CNTL}
C {devices/code_shown.sym} -620 -480 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/vsource.sym} 210 -90 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 210 -60 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 210 -120 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 290 -90 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 290 -60 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 290 -120 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 60 -90 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 60 -60 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 60 -120 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 140 -90 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 140 -60 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 140 -120 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {std_cell/and2_1.sym} 580 -180 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
