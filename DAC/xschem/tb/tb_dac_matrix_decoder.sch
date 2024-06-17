v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {devices/code_shown.sym} 720 -180 2 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.include /home/junbeom/pico/designs/xschem/dac_matrix_decoder.spice
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/vsource.sym} 110 -620 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 110 -590 0 1 {name=p10 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 110 -650 0 1 {name=p11 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 190 -620 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 190 -590 0 1 {name=p12 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 190 -650 0 1 {name=p13 sig_type=std_logic lab=DVSS}
C {devices/simulator_commands.sym} 80 -475 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
	tran 0.1n 50n
	plot v(j0)
	plot v(j1)
	plot v(j2)
	plot v(j3)
	plot v(j4)
	plot v(j5)
	plot v(j6)
	write tb_dac_matrix_decoder.raw
.endc
.save all

"}
C {devices/lab_pin.sym} 890 -280 2 1 {name=p1 sig_type=std_logic lab=D[0]}
C {devices/lab_pin.sym} 890 -300 2 1 {name=p2 sig_type=std_logic lab=D[1]}
C {devices/lab_pin.sym} 890 -320 0 0 {name=p18 sig_type=std_logic lab=D[2]}
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
C {devices/lab_pin.sym} 110 -760 0 1 {name=p9 sig_type=std_logic lab=D[0]}
C {devices/lab_pin.sym} 110 -850 0 1 {name=p19 sig_type=std_logic lab=D[1]}
C {devices/lab_pin.sym} 110 -940 0 1 {name=p23 sig_type=std_logic lab=D[2]}
C {devices/lab_pin.sym} 110 -700 2 1 {name=p20 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1040 -240 0 1 {name=p3 sig_type=std_logic lab=J0}
C {devices/lab_pin.sym} 1040 -260 0 1 {name=p4 sig_type=std_logic lab=J1}
C {devices/lab_pin.sym} 1040 -280 0 1 {name=p5 sig_type=std_logic lab=J2}
C {devices/lab_pin.sym} 1040 -300 0 1 {name=p6 sig_type=std_logic lab=J3}
C {devices/lab_pin.sym} 1040 -320 0 1 {name=p7 sig_type=std_logic lab=J4}
C {devices/lab_pin.sym} 1040 -340 0 1 {name=p8 sig_type=std_logic lab=J5}
C {devices/lab_pin.sym} 1040 -360 0 1 {name=p14 sig_type=std_logic lab=J6}
C {dac_matrix_decoder.sym} 970 -300 0 0 {name=x2 DVDD=DVDD DVSS=DVSS}
