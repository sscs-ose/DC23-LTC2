v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 450 -750 450 -720 {
lab=VDD}
N 1110 -840 1110 -810 {
lab=VDD}
N 1250 -840 1250 -810 {
lab=VDD}
N 1080 -690 1110 -690 {
lab=OUT+}
N 1080 -670 1250 -670 {
lab=OUT-}
N 1250 -690 1250 -670 {
lab=OUT-}
N 990 -690 1080 -690 {
lab=OUT+}
N 990 -670 1080 -670 {
lab=OUT-}
N 410 -460 410 -400 {
lab=VSS}
N 410 -400 740 -400 {
lab=VSS}
N 740 -420 740 -400 {
lab=VSS}
C {devices/lab_pin.sym} -240 -600 2 1 {name=p601 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -240 -500 2 1 {name=p602 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -240 -400 2 1 {name=p603 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -240 -460 0 1 {name=p604 sig_type=std_logic lab=Q4}
C {devices/lab_pin.sym} -240 -560 0 1 {name=p605 sig_type=std_logic lab=Q5}
C {devices/lab_pin.sym} -240 -660 0 1 {name=p606 sig_type=std_logic lab=Q6}
C {devices/vsource.sym} -240 -810 0 0 {name=VDD6 
value="pulse 0 3.3 760n 10n 10n 790n 1600n"
*value=0}
C {devices/vsource.sym} -240 -910 0 0 {name=VDD7 
value="pulse 0 3.3 1560n 10n 10n 1590n 3200n"
*value=0}
C {devices/lab_pin.sym} -240 -880 2 1 {name=p609 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -240 -780 2 1 {name=p610 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -240 -700 2 1 {name=p611 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -240 -760 0 1 {name=p612 sig_type=std_logic lab=Q7}
C {devices/lab_pin.sym} -240 -840 0 1 {name=p613 sig_type=std_logic lab=Q8}
C {devices/lab_pin.sym} -240 -940 0 1 {name=p614 sig_type=std_logic lab=Q9}
C {devices/lab_pin.sym} -40 60 0 1 {name=p607 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} -40 120 0 1 {name=p608 sig_type=std_logic lab=0}
C {devices/vsource.sym} 180 90 0 0 {name=VDD10 value=3.3}
C {devices/lab_pin.sym} 180 120 0 1 {name=p621 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 180 60 0 1 {name=p622 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 450 -750 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 260 90 0 0 {name=VDD15 value=0}
C {devices/lab_pin.sym} 260 120 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 260 60 0 1 {name=p9 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 350 90 0 0 {name=VDD16 value=3.3}
C {devices/lab_pin.sym} 350 120 0 1 {name=p10 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 350 60 0 1 {name=p11 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 440 90 0 0 {name=VDD17 value=3.3}
C {devices/lab_pin.sym} 440 120 0 1 {name=p12 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 440 60 0 1 {name=p13 sig_type=std_logic lab=DVNW}
C {devices/vsource.sym} 520 90 0 0 {name=VDD18 value=0}
C {devices/lab_pin.sym} 520 120 0 1 {name=p14 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 520 60 0 1 {name=p15 sig_type=std_logic lab=DVPW}
C {devices/vsource.sym} 610 90 0 0 {name=VDD19 value=0}
C {devices/lab_pin.sym} 610 120 0 1 {name=p16 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 610 60 0 1 {name=p17 sig_type=std_logic lab=DVSS}
C {devices/isource.sym} 470 -750 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 470 -780 0 1 {name=p19 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1110 -690 0 1 {name=p20 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1250 -690 0 1 {name=p21 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 1110 -840 0 1 {name=p22 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1250 -840 0 1 {name=p23 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1110 -780 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1250 -780 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1110 -720 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 1250 -720 0 0 {name=Vmeas-}
C {devices/simulator_commands.sym} -125 -230 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	tran 1n 3200n
	plot i(Vmeas+) i(Vmeas-)
	write test_dac_msb_matrix.raw
.endc
.save all

"}
C {devices/code_shown.sym} -740 -250 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {dac_current_mirror.sym} 460 -580 0 0 {name=x1}
C {devices/lab_pin.sym} 510 -530 0 1 {name=p1 sig_type=std_logic lab=Vb2}
C {devices/lab_pin.sym} 510 -510 0 1 {name=p2 sig_type=std_logic lab=Vb1}
C {digital_cell/dac_decoder.sym} 240 -720 2 1 {name=x3 VDD=VDD VNW=VNW VPW=VPW VSS=VSS}
C {digital_cell/dac_decoder.sym} 440 -920 1 0 {name=x4 VDD=VDD VNW=VNW VPW=VPW VSS=VSS}
C {devices/lab_pin.sym} 160 -690 0 0 {name=p3 sig_type=std_logic lab=Q9}
C {devices/lab_pin.sym} 160 -720 0 0 {name=p4 sig_type=std_logic lab=Q8}
C {devices/lab_pin.sym} 160 -750 0 0 {name=p5 sig_type=std_logic lab=Q7}
C {devices/lab_pin.sym} 470 -1000 3 1 {name=p6 sig_type=std_logic lab=Q6}
C {devices/lab_pin.sym} 440 -1000 3 1 {name=p74 sig_type=std_logic lab=Q5}
C {devices/lab_pin.sym} 410 -1000 1 0 {name=p75 sig_type=std_logic lab=Q4}
C {devices/lab_pin.sym} 380 -840 3 0 {name=p76 sig_type=std_logic lab=C0}
C {devices/lab_pin.sym} 400 -840 3 0 {name=p77 sig_type=std_logic lab=C1}
C {devices/lab_pin.sym} 420 -840 3 0 {name=p78 sig_type=std_logic lab=C2}
C {devices/lab_pin.sym} 440 -840 3 0 {name=p79 sig_type=std_logic lab=C3}
C {devices/lab_pin.sym} 460 -840 3 0 {name=p80 sig_type=std_logic lab=C4}
C {devices/lab_pin.sym} 480 -840 3 0 {name=p81 sig_type=std_logic lab=C5}
C {devices/lab_pin.sym} 500 -840 3 0 {name=p82 sig_type=std_logic lab=C6}
C {devices/lab_pin.sym} 320 -780 0 1 {name=p83 sig_type=std_logic lab=R0}
C {devices/lab_pin.sym} 320 -760 0 1 {name=p84 sig_type=std_logic lab=R1}
C {devices/lab_pin.sym} 320 -740 0 1 {name=p85 sig_type=std_logic lab=R2}
C {devices/lab_pin.sym} 320 -720 0 1 {name=p86 sig_type=std_logic lab=R3}
C {devices/lab_pin.sym} 320 -700 0 1 {name=p87 sig_type=std_logic lab=R4}
C {devices/lab_pin.sym} 320 -680 0 1 {name=p88 sig_type=std_logic lab=R5}
C {devices/lab_pin.sym} 320 -660 0 1 {name=p89 sig_type=std_logic lab=R6}
C {devices/vsource.sym} -240 -630 0 0 {name=V5
value="pulse 0 3.3 160n 10n 10n 190n 400n"}
C {devices/vsource.sym} -240 -530 0 0 {name=V6
value="pulse 0 3.3 60n 10n 10n 90n 200n"
}
C {devices/vsource.sym} -240 -430 0 0 {name=V7
value="pulse 0 3.3 10n 10n 10n 40n 100n"
}
C {devices/vsource.sym} -240 -730 0 0 {name=V8
value="pulse 0 3.3 360n 10n 10n 390n 800n"}
C {devices/vsource.sym} -40 90 0 0 {name=VDD1 value="pulse 0 3.3 22n 5n 5n 20n 50n"
*value="pwl 0 0 9.9n 0 10n 3.3"}
C {dac_msb_matrix.sym} 840 -520 0 0 {name=x2 DVDD=DVDD DVNW=DVNW DVPW=DVPW DVSS=DVSS}
C {devices/lab_pin.sym} 690 -670 0 0 {name=p18 sig_type=std_logic lab=R0}
C {devices/lab_pin.sym} 690 -650 0 0 {name=p24 sig_type=std_logic lab=R1}
C {devices/lab_pin.sym} 690 -630 0 0 {name=p25 sig_type=std_logic lab=R2}
C {devices/lab_pin.sym} 690 -610 0 0 {name=p26 sig_type=std_logic lab=R3}
C {devices/lab_pin.sym} 690 -590 0 0 {name=p27 sig_type=std_logic lab=R4}
C {devices/lab_pin.sym} 690 -570 0 0 {name=p28 sig_type=std_logic lab=R5}
C {devices/lab_pin.sym} 690 -550 0 0 {name=p29 sig_type=std_logic lab=R6}
C {devices/lab_pin.sym} 740 -720 3 1 {name=p30 sig_type=std_logic lab=C0}
C {devices/lab_pin.sym} 760 -720 3 1 {name=p31 sig_type=std_logic lab=C1}
C {devices/lab_pin.sym} 780 -720 3 1 {name=p32 sig_type=std_logic lab=C2}
C {devices/lab_pin.sym} 800 -720 3 1 {name=p33 sig_type=std_logic lab=C3}
C {devices/lab_pin.sym} 820 -720 3 1 {name=p34 sig_type=std_logic lab=C4}
C {devices/lab_pin.sym} 840 -720 3 1 {name=p35 sig_type=std_logic lab=C5}
C {devices/lab_pin.sym} 860 -720 3 1 {name=p36 sig_type=std_logic lab=C6}
C {devices/lab_pin.sym} 410 -400 0 0 {name=p37 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 690 -500 0 0 {name=p39 sig_type=std_logic lab=Vb2}
C {devices/lab_pin.sym} 690 -480 0 0 {name=p40 sig_type=std_logic lab=Vb1}
C {devices/lab_pin.sym} 690 -530 0 0 {name=p41 sig_type=std_logic lab=CLK}
