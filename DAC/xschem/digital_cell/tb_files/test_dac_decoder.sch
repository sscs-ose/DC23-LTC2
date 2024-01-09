v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 2090 -900 2890 -500 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=2.5e-09
x2=5.25e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="J0,j0
J1,j1
J2,j2
J3,j3
J4,j4
J6,j5
J7,j6"
color="4 5 6 7 8 9 10"
dataset=-1
unitx=1
logx=0
logy=0
digital=1}
N 1440 -1370 1440 -1300 {
lab=#net1}
N 1440 -1380 1440 -1370 {
lab=#net1}
N 1440 -1380 1520 -1380 {
lab=#net1}
N 1440 -1180 1890 -1180 {
lab=J5}
N 1070 -1420 1520 -1420 {
lab=D2}
N 1070 -1420 1070 -840 {
lab=D2}
N 1110 -1320 1320 -1320 {
lab=D1}
N 1110 -1320 1110 -840 {
lab=D1}
N 1150 -1280 1320 -1280 {
lab=D0}
N 1150 -1280 1150 -840 {
lab=D0}
N 1110 -1200 1320 -1200 {
lab=D1}
N 1070 -1160 1320 -1160 {
lab=D2}
N 1070 -1110 1520 -1110 {
lab=D2}
N 1440 -1070 1520 -1070 {
lab=#net2}
N 1440 -1070 1440 -1030 {
lab=#net2}
N 1110 -1050 1320 -1050 {
lab=D1}
N 1150 -1010 1320 -1010 {
lab=D0}
N 1070 -940 1320 -940 {
lab=D2}
N 1640 -1400 1890 -1400 {
lab=J6}
N 1640 -1090 1890 -1090 {
lab=J4}
N 1440 -820 1440 -760 {
lab=#net3}
N 1450 -820 1540 -820 {
lab=#net3}
N 1070 -860 1540 -860 {
lab=D2}
N 1070 -840 1070 -570 {
lab=D2}
N 1110 -840 1110 -570 {
lab=D1}
N 1150 -840 1150 -570 {
lab=D0}
N 1440 -820 1450 -820 {
lab=#net3}
N 1110 -780 1320 -780 {
lab=D1}
N 1150 -740 1320 -740 {
lab=D0}
N 1070 -650 1320 -650 {
lab=D2}
N 1110 -610 1320 -610 {
lab=D1}
N 1440 -500 1440 -440 {
lab=#net4}
N 1440 -440 1540 -440 {
lab=#net4}
N 1150 -520 1320 -520 {
lab=D0}
N 1150 -570 1150 -520 {
lab=D0}
N 1110 -480 1320 -480 {
lab=D1}
N 1110 -570 1110 -480 {
lab=D1}
N 1070 -570 1070 -400 {
lab=D2}
N 1070 -400 1540 -400 {
lab=D2}
N 820 -520 1150 -520 {
lab=D0}
N 820 -550 1110 -550 {
lab=D1}
N 820 -580 1070 -580 {
lab=D2}
N 1400 -940 1520 -940 {
lab=#net5}
N 1600 -940 1890 -940 {
lab=J3}
N 1660 -840 1890 -840 {
lab=J2}
N 1440 -630 1890 -630 {
lab=J1}
N 1660 -420 1890 -420 {
lab=J0}
C {../std_cells/and2_1.sym} 1580 -1400 0 0 {name=x1 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/and2_1.sym} 1380 -1300 0 0 {name=x2 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/and2_1.sym} 1380 -1180 0 0 {name=x3 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/and2_1.sym} 1580 -1090 0 0 {name=x4 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/or2_1.sym} 1380 -1030 0 0 {name=x5 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/inv_1.sym} 1360 -940 0 0 {name=x6 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/inv_1.sym} 1560 -940 0 0 {name=x7 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/or2_1.sym} 1600 -840 0 0 {name=x8 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/and2_1.sym} 1380 -760 0 0 {name=x9 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/or2_1.sym} 1380 -630 0 0 {name=x10 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/or2_1.sym} 1380 -500 0 0 {name=x11 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/or2_1.sym} 1600 -420 0 0 {name=x12 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/opin.sym} 1890 -420 0 0 {name=p96 lab=J0}
C {devices/code_shown.sym} 720 -180 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_REF_7T5V0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/vsource.sym} 260 -620 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 260 -590 0 1 {name=p10 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 260 -650 0 1 {name=p11 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 340 -620 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 340 -590 0 1 {name=p12 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 340 -650 0 1 {name=p13 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 110 -620 0 0 {name=VDD1 value=0}
C {devices/lab_pin.sym} 110 -590 0 1 {name=p14 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 110 -650 0 1 {name=p15 sig_type=std_logic lab=VPW}
C {devices/vsource.sym} 190 -620 0 0 {name=VSS2
value=3.3}
C {devices/lab_pin.sym} 190 -590 0 1 {name=p16 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 190 -650 0 1 {name=p17 sig_type=std_logic lab=VNW
}
C {devices/simulator_commands.sym} 80 -475 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
	tran 0.1n 50n
	plot v(J0)
	plot v(J1)
	plot v(J2)
	plot v(J3)
	plot v(J4)
	plot v(J5)
	plot v(J6)
	write dac_decoder.raw
.endc
.save all

"}
C {devices/lab_pin.sym} 820 -520 0 0 {name=p1 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} 820 -550 0 0 {name=p2 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 820 -580 0 0 {name=p18 sig_type=std_logic lab=D2}
C {devices/opin.sym} 1890 -630 0 0 {name=p3 lab=J1}
C {devices/opin.sym} 1890 -840 0 0 {name=p4 lab=J2}
C {devices/opin.sym} 1890 -940 0 0 {name=p5 lab=J3}
C {devices/opin.sym} 1890 -1090 0 0 {name=p6 lab=J4}
C {devices/opin.sym} 1890 -1180 0 0 {name=p7 lab=J5}
C {devices/opin.sym} 1890 -1400 0 0 {name=p8 lab=J6}
C {devices/title-2.sym} 0 0 0 0 {name=l1 author="Stefan Schippers" rev=1.0 lock=false}
C {devices/launcher.sym} 2170 -430 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dac_decoder.raw tran"
}
C {devices/vsource.sym} 110 -910 0 0 {name=V2
value="pulse 0 3.3 16n 1n 1n 19n 40n"}
C {devices/lab_pin.sym} 110 -880 2 1 {name=p626 sig_type=std_logic lab=0}
C {devices/vsource.sym} 110 -820 0 0 {name=V1
value="pulse 0 3.3 6n 1n 1n 9n 20n"
}
C {devices/lab_pin.sym} 110 -790 2 1 {name=p628 sig_type=std_logic lab=0}
C {devices/vsource.sym} 110 -730 0 0 {name=V0
value="pulse 0 3.3 1n 1n 1n 4n 10n"
}
C {../std_cells/inv_1.sym} 150 -940 0 0 {name=x13 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/inv_1.sym} 230 -940 0 0 {name=x14 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/inv_1.sym} 150 -850 0 0 {name=x15 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/inv_1.sym} 230 -850 0 0 {name=x17 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/inv_1.sym} 150 -760 0 0 {name=x18 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {../std_cells/inv_1.sym} 230 -760 0 0 {name=x19 VDD=VDD VNW=VNW VPW=VPW VSS=VSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} 270 -760 0 1 {name=p9 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} 270 -850 0 1 {name=p19 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 270 -940 0 1 {name=p23 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 110 -700 2 1 {name=p20 sig_type=std_logic lab=0}
