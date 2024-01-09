v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 -190 490 -190 {
lab=#net1}
N 160 -170 490 -170 {
lab=#net2}
N 490 -220 500 -230 {
lab=CLK}
N 500 -230 780 -230 {
lab=CLK}
N 490 -170 500 -180 {
lab=#net2}
N 430 -360 490 -360 {
lab=#net3}
N 430 -340 490 -340 {
lab=#net4}
N 430 -320 490 -320 {
lab=#net5}
N 430 -300 490 -300 {
lab=#net6}
N 430 -280 490 -280 {
lab=#net7}
N 430 -260 490 -260 {
lab=#net8}
N 430 -240 490 -240 {
lab=#net9}
N 180 -110 540 -110 {
lab=VSS}
N 170 -110 180 -110 {
lab=VSS}
N 160 -110 170 -110 {
lab=VSS}
N 150 -120 160 -110 {
lab=VSS}
N 130 -120 150 -120 {
lab=VSS}
N 90 -120 130 -120 {
lab=VSS}
N 80 -110 90 -120 {
lab=VSS}
N 60 -110 80 -110 {
lab=VSS}
N 60 -120 60 -110 {
lab=VSS}
N 540 -450 540 -410 {
lab=#net10}
N 560 -450 560 -410 {
lab=#net11}
N 580 -450 580 -410 {
lab=#net12}
N 600 -450 600 -410 {
lab=#net13}
N 620 -450 620 -410 {
lab=#net14}
N 640 -450 640 -410 {
lab=#net15}
N 660 -450 660 -410 {
lab=#net16}
N 780 -230 790 -220 {
lab=CLK}
N 790 -220 890 -220 {
lab=CLK}
N 500 -180 780 -180 {
lab=#net2}
N 780 -180 790 -170 {
lab=#net2}
N 790 -170 890 -170 {
lab=#net2}
N 490 -190 500 -200 {
lab=#net1}
N 500 -200 780 -200 {
lab=#net1}
N 780 -200 790 -190 {
lab=#net1}
N 790 -190 890 -190 {
lab=#net1}
N 540 -110 950 -110 {
lab=VSS}
N 790 -360 900 -360 {
lab=OUT-}
N 900 -360 920 -360 {
lab=OUT-}
N 920 -360 1180 -360 {
lab=OUT-}
N 1180 -360 1190 -350 {
lab=OUT-}
N 790 -380 1180 -380 {
lab=OUT+}
N 1180 -380 1190 -370 {
lab=OUT+}
N 890 -560 890 -370 {
lab=D3}
N 880 -350 890 -350 {
lab=D2}
N 870 -330 890 -330 {
lab=D1}
N 860 -310 890 -310 {
lab=D0}
N 100 -430 100 -380 {
lab=VDD}
N 120 -430 120 -380 {
lab=BGR}
N 260 -330 270 -330 {
lab=D7}
N 260 -600 260 -330 {
lab=D7}
N 240 -300 270 -300 {
lab=D8}
N 240 -600 240 -300 {
lab=D8}
N 220 -270 270 -270 {
lab=D9}
N 220 -600 220 -270 {
lab=D9}
N 570 -670 570 -610 {
lab=D4}
N 600 -670 600 -610 {
lab=D5}
N 630 -670 630 -610 {
lab=D6}
N 260 -670 260 -600 {
lab=D7}
N 240 -670 240 -600 {
lab=D8}
N 220 -670 220 -600 {
lab=D9}
N 870 -350 880 -350 {
lab=D2}
N 870 -560 870 -350 {
lab=D2}
N 850 -330 870 -330 {
lab=D1}
N 850 -560 850 -330 {
lab=D1}
N 830 -310 860 -310 {
lab=D0}
N 830 -560 830 -310 {
lab=D0}
N 830 -670 830 -560 {
lab=D0}
N 850 -670 850 -560 {
lab=D1}
N 870 -670 870 -560 {
lab=D2}
N 890 -670 890 -560 {
lab=D3}
N 1190 -370 1240 -370 {
lab=OUT+}
N 1190 -350 1240 -350 {
lab=OUT-}
N 1360 -600 1360 -570 {
lab=VDD}
N 1500 -600 1500 -570 {
lab=VDD}
N 1310 -370 1360 -370 {
lab=OUT+}
N 1360 -450 1360 -370 {
lab=OUT+}
N 1310 -350 1500 -350 {
lab=OUT-}
N 1500 -450 1500 -350 {
lab=OUT-}
N 1240 -370 1310 -370 {
lab=OUT+}
N 1240 -350 1310 -350 {
lab=OUT-}
C {devices/title.sym} 160 0 0 0 {name=l1 author="Junbeom Park"}
C {digital_cell/dac_decoder.sym} 350 -300 2 1 {name=x3 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
C {digital_cell/dac_decoder.sym} 600 -530 1 0 {name=x4 VDD=DVDD VNW=DVNW VPW=DVPW VSS=DVSS}
C {devices/vsource.sym} -640 -540 0 0 {name=VDD6 
value="pulse 0 3.3 760n 10n 10n 790n 1600n"
*value=0}
C {devices/vsource.sym} -640 -630 0 0 {name=VDD7 
value="pulse 0 3.3 1560n 10n 10n 1590n 3200n"
*value=0}
C {devices/lab_pin.sym} -640 -600 2 1 {name=p609 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -640 -510 2 1 {name=p610 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -640 -570 0 1 {name=p613 sig_type=std_logic lab=D4}
C {devices/lab_pin.sym} -640 -660 0 1 {name=p614 sig_type=std_logic lab=D5}
C {devices/vsource.sym} -340 -30 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -340 0 0 1 {name=p15 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -340 -60 0 1 {name=p16 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -270 -30 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -270 0 0 1 {name=p17 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -270 -60 0 1 {name=p18 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -490 -30 0 0 {name=VDD1 value=3.3}
C {devices/lab_pin.sym} -490 0 0 1 {name=p19 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -490 -60 0 1 {name=p20 sig_type=std_logic lab=DVNW}
C {devices/vsource.sym} -420 -30 0 0 {name=VSS2
value=0}
C {devices/lab_pin.sym} -420 0 0 1 {name=p21 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -420 -60 0 1 {name=p22 sig_type=std_logic lab=DVPW}
C {devices/vsource.sym} -630 -30 0 0 {name=VDD2 value=3.3}
C {devices/lab_pin.sym} -630 0 0 1 {name=p23 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -630 -60 0 1 {name=p24 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} -560 -30 0 0 {name=VSS3
value=0}
C {devices/lab_pin.sym} -560 0 0 1 {name=p25 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -560 -60 0 1 {name=p26 sig_type=std_logic lab=DVSS}
C {devices/vsource.sym} -640 -360 0 0 {name=V1
value="pulse 0 3.3 160n 10n 10n 190n 400n"}
C {devices/lab_pin.sym} -640 -330 2 1 {name=p31 sig_type=std_logic lab=0}
C {devices/vsource.sym} -640 -270 0 0 {name=V2
value="pulse 0 3.3 60n 10n 10n 90n 200n"
}
C {devices/lab_pin.sym} -640 -240 2 1 {name=p32 sig_type=std_logic lab=0}
C {devices/vsource.sym} -640 -180 0 0 {name=V3
value="pulse 0 3.3 10n 10n 10n 40n 100n"
}
C {devices/lab_pin.sym} -640 -150 2 1 {name=p34 sig_type=std_logic lab=0}
C {devices/vsource.sym} -640 -450 0 0 {name=V4
value="pulse 0 3.3 360n 10n 10n 390n 800n"}
C {devices/lab_pin.sym} -640 -420 2 1 {name=p36 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -640 -480 0 1 {name=p30 sig_type=std_logic lab=D3}
C {devices/lab_pin.sym} -640 -390 0 1 {name=p33 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} -640 -210 0 1 {name=p37 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} -320 -150 2 1 {name=p27 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -320 -210 2 1 {name=p28 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} -640 -300 0 1 {name=p29 sig_type=std_logic lab=D1}
C {devices/vsource.sym} -320 -180 0 0 {name=VDD5 value="pulse 0 3.3 22n 5n 5n 20n 50n"
*value="pwl 0 0 9.9n 0 10n 3.3"}
C {devices/vsource.sym} -640 -730 0 0 {name=VDD3 
value="pulse 0 3.3 3160n 10n 10n 3190n 6400n"
*value=0}
C {devices/vsource.sym} -640 -830 0 0 {name=VDD4 
value="pulse 0 3.3 6360n 10n 10n 6390n 12800n"
*value=0}
C {devices/lab_pin.sym} -640 -800 2 1 {name=p35 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -640 -700 2 1 {name=p38 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -640 -760 0 1 {name=p39 sig_type=std_logic lab=D6}
C {devices/lab_pin.sym} -640 -860 0 1 {name=p40 sig_type=std_logic lab=D7}
C {devices/isource.sym} -90 -440 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} -90 -470 0 1 {name=p41 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -90 -410 0 1 {name=p42 sig_type=std_logic lab=BGR}
C {devices/vsource.sym} -640 -930 0 0 {name=VDD8 
value="pulse 0 3.3 12760n 10n 10n 12790n 25600n"
*value=0}
C {devices/vsource.sym} -640 -1030 0 0 {name=VDD9 
value="pulse 0 3.3 25560n 10n 10n 25590n 51200n"
*value=0}
C {devices/lab_pin.sym} -640 -1000 2 1 {name=p43 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -640 -900 2 1 {name=p44 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -640 -960 0 1 {name=p45 sig_type=std_logic lab=D8}
C {devices/lab_pin.sym} -640 -1060 0 1 {name=p46 sig_type=std_logic lab=D9}
C {devices/code_shown.sym} -740 -1230 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/simulator_commands.sym} 5 -1220 0 0 {name=COMMANDS1
only_toplevel=false
value="

.control
	tran 5n 51200n
	plot v(D0) v(D1) v(D2) v(D3) v(D4) v(D5) v(CLK)
	plot i(Vmeas+) i(Vmeas-)
	write test_dac_top.raw
.endc
.save all

"}
C {devices/lab_pin.sym} 1360 -450 0 1 {name=p47 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1500 -450 0 1 {name=p48 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 1360 -600 0 1 {name=p49 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1500 -600 0 1 {name=p50 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1360 -540 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1500 -540 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1360 -480 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 1500 -480 0 0 {name=Vmeas-}
C {devices/lab_pin.sym} 490 -220 2 1 {name=p13 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 60 -120 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 100 -430 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 120 -430 0 1 {name=p2 sig_type=std_logic lab=BGR}
C {devices/lab_pin.sym} 830 -670 3 1 {name=p3 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} 850 -670 3 1 {name=p4 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 870 -670 3 1 {name=p5 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 890 -670 3 1 {name=p6 sig_type=std_logic lab=D3}
C {devices/lab_pin.sym} 570 -670 3 1 {name=p7 sig_type=std_logic lab=D4}
C {devices/lab_pin.sym} 600 -670 3 1 {name=p8 sig_type=std_logic lab=D5}
C {devices/lab_pin.sym} 630 -670 3 1 {name=p9 sig_type=std_logic lab=D6}
C {devices/lab_pin.sym} 260 -670 3 1 {name=p10 sig_type=std_logic lab=D7}
C {devices/lab_pin.sym} 240 -670 3 1 {name=p11 sig_type=std_logic lab=D8}
C {devices/lab_pin.sym} 220 -670 3 1 {name=p12 sig_type=std_logic lab=D9}
C {dac_current_mirror.sym} 110 -240 0 0 {name=x1}
C {dac_lsb_matrix.sym} 1040 -260 0 0 {name=x2 DVDD=DVDD DVNW=DVNW DVPW=DVPW DVSS=DVSS}
C {dac_msb_matrix.sym} 640 -210 0 0 {name=x5 DVDD=DVDD DVNW=DVNW DVPW=DVPW DVSS=DVSS}
