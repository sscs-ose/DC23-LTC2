v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 920 -690 1720 -290 {flags=graph
y1=-0.049
y2=3.4
ypos1=-0.049
ypos2=3.4
divy=5
subdivy=1
unity=1
x1=0
x2=5e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="o0
o1
o2
o3
o4
o5
o6"
color="4 5 6 7 8 9 10"
dataset=-1
unitx=1
logx=0
logy=0
digital=1}
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
C {devices/vsource.sym} 170 -120 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 170 -90 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 170 -150 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 250 -120 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 250 -90 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 250 -150 0 1 {name=p8 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 20 -120 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 20 -90 0 1 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 20 -150 0 1 {name=p10 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 100 -120 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 100 -90 0 1 {name=p11 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 100 -150 0 1 {name=p12 sig_type=std_logic lab=VNW
}
C {designs/digital_cell/dec3_7.sym} 190 -520 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS}
C {devices/simulator_commands.sym} -630 -125 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
	tran 0.1n 50n
	plot v(O6)
	plot v(O5)
	plot V(O4)
	plot v(O3)
	plot v(O2)
	plot v(O1)
	plot v(O0)
	write Test_dec3_7.raw
.endc
.save all

"}
C {devices/lab_pin.sym} 100 -480 0 0 {name=p14 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} 100 -520 0 0 {name=p18 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 100 -560 0 0 {name=p19 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 280 -580 0 1 {name=p20 sig_type=std_logic lab=O6}
C {devices/lab_pin.sym} 280 -560 0 1 {name=p21 sig_type=std_logic lab=O5}
C {devices/lab_pin.sym} 280 -540 0 1 {name=p22 sig_type=std_logic lab=O4}
C {devices/lab_pin.sym} 280 -520 0 1 {name=p23 sig_type=std_logic lab=O3}
C {devices/lab_pin.sym} 280 -500 0 1 {name=p24 sig_type=std_logic lab=O2}
C {devices/lab_pin.sym} 280 -480 0 1 {name=p25 sig_type=std_logic lab=O1}
C {devices/lab_pin.sym} 280 -460 0 1 {name=p26 sig_type=std_logic lab=O0}
C {devices/vsource.sym} 670 -510 0 0 {name=V2
value="pulse 0 3.3 16n 1n 1n 19n 40n"}
C {devices/lab_pin.sym} 670 -480 2 1 {name=p626 sig_type=std_logic lab=0}
C {devices/vsource.sym} 670 -420 0 0 {name=V1
value="pulse 0 3.3 6n 1n 1n 9n 20n"
}
C {devices/lab_pin.sym} 670 -390 2 1 {name=p628 sig_type=std_logic lab=0}
C {devices/vsource.sym} 670 -330 0 0 {name=V0
value="pulse 0 3.3 1n 1n 1n 4n 10n"
}
C {std_cells/inv_1.sym} 710 -540 0 0 {name=x12 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/inv_1.sym} 790 -540 0 0 {name=x13 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/inv_1.sym} 710 -450 0 0 {name=x14 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/inv_1.sym} 790 -450 0 0 {name=x17 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/inv_1.sym} 710 -360 0 0 {name=x18 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cells/inv_1.sym} 790 -360 0 0 {name=x19 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} 830 -360 0 1 {name=p1 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} 830 -450 0 1 {name=p2 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 830 -540 0 1 {name=p4 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 670 -300 2 1 {name=p5 sig_type=std_logic lab=0}
