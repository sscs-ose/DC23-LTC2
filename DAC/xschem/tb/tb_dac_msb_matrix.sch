v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 2130 -1170 2130 -1140 {
lab=VDD}
N 2270 -1170 2270 -1140 {
lab=VDD}
N 2100 -1020 2130 -1020 {
lab=OUT+}
N 2100 -1000 2270 -1000 {
lab=OUT-}
N 2270 -1020 2270 -1000 {
lab=OUT-}
N 2010 -1020 2100 -1020 {
lab=OUT+}
N 2010 -1000 2100 -1000 {
lab=OUT-}
N 150 -400 150 -360 {
lab=VSS}
N 460 -710 460 -660 {
lab=VSS}
N 1790 -710 1790 -660 {
lab=VSS}
N 920 -690 920 -660 {
lab=VSS}
N 350 -930 380 -930 {
lab=#net1}
N 350 -930 350 -920 {
lab=#net1}
N 1970 -1000 2010 -1000 {
lab=OUT-}
N 1970 -1020 2010 -1020 {
lab=OUT+}
N 1870 -930 1900 -930 {
lab=#net1}
N 350 -580 1900 -580 {
lab=#net1}
N 1440 -1020 1970 -1020 {
lab=OUT+}
N 1440 -1000 1970 -1000 {
lab=OUT-}
N 550 -970 810 -970 {
lab=#net2}
N 550 -970 550 -790 {
lab=#net2}
N 600 -930 810 -930 {
lab=#net3}
N 600 -930 600 -750 {
lab=#net3}
N 550 -750 600 -750 {
lab=#net3}
N 800 -870 820 -870 {
lab=#net4}
N 800 -840 820 -840 {
lab=#net5}
N 800 -810 820 -810 {
lab=#net6}
N 800 -780 820 -780 {
lab=DVSS}
N 930 -1350 930 -1320 {
lab=#net7}
N 960 -1350 960 -1320 {
lab=#net8}
N 990 -1350 990 -1320 {
lab=#net9}
N 1130 -1350 1130 -1320 {
lab=#net10}
N 1270 -1350 1270 -1320 {
lab=#net11}
N 1300 -1350 1300 -1320 {
lab=#net12}
N 1330 -1350 1330 -1320 {
lab=#net13}
N 1360 -1350 1360 -1320 {
lab=DVSS}
N 1700 -970 1700 -790 {
lab=#net14}
N 1440 -970 1700 -970 {
lab=#net14}
N 1670 -750 1700 -750 {
lab=#net15}
N 1660 -930 1660 -750 {
lab=#net15}
N 1660 -750 1670 -750 {
lab=#net15}
N 1440 -930 1660 -930 {
lab=#net15}
N 800 -1240 820 -1240 {
lab=DVDD}
N 800 -1210 820 -1210 {
lab=#net16}
N 800 -1180 820 -1180 {
lab=#net17}
N 800 -1150 820 -1150 {
lab=#net18}
N 880 -690 880 -380 {
lab=CLK}
N 800 -1010 820 -1010 {
lab=#net19}
N 810 -970 820 -970 {
lab=#net2}
N 810 -930 820 -930 {
lab=#net3}
N 650 -1470 820 -1470 {
lab=D4}
N 650 -1430 820 -1430 {
lab=D5}
N 650 -1390 820 -1390 {
lab=D6}
N 680 -1490 680 -1320 {
lab=D7}
N 720 -1490 720 -1320 {
lab=D8}
N 760 -1490 760 -1320 {
lab=D9}
N 150 -700 150 -640 {
lab=#net20}
N 240 -650 240 -620 {
lab=VDD}
N 240 -660 240 -650 {
lab=VDD}
N 710 -1090 820 -1090 {
lab=#net2}
N 710 -1090 710 -970 {
lab=#net2}
N 730 -1050 820 -1050 {
lab=#net3}
N 730 -1050 730 -930 {
lab=#net3}
N 1440 -1090 1480 -1090 {
lab=#net14}
N 1480 -1090 1480 -970 {
lab=#net14}
N 1440 -1050 1500 -1050 {
lab=#net15}
N 1500 -1050 1500 -930 {
lab=#net15}
N 1900 -930 1900 -580 {
lab=#net1}
N 460 -990 460 -970 {
lab=VDD}
N 1790 -990 1790 -970 {
lab=VDD}
N 320 -580 350 -580 {
lab=#net1}
N 350 -920 350 -580 {
lab=#net1}
C {devices/vsource.sym} -340 -50 0 0 {name=VDD10 value=3.3}
C {devices/lab_pin.sym} -340 -20 0 1 {name=p621 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -340 -80 0 1 {name=p622 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -260 -50 0 0 {name=VDD15 value=0}
C {devices/lab_pin.sym} -260 -20 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -260 -80 0 1 {name=p9 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -170 -50 0 0 {name=VDD16 value=3.3}
C {devices/lab_pin.sym} -170 -20 0 1 {name=p10 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -170 -80 0 1 {name=p11 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} -80 -50 0 0 {name=VDD19 value=0}
C {devices/lab_pin.sym} -80 -20 0 1 {name=p16 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -80 -80 0 1 {name=p17 sig_type=std_logic lab=DVSS}
C {devices/isource.sym} 150 -730 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 150 -760 0 1 {name=p19 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2130 -1020 0 1 {name=p20 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 2270 -1020 0 1 {name=p21 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 2130 -1170 0 1 {name=p22 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2270 -1170 0 1 {name=p23 sig_type=std_logic lab=VDD}
C {devices/res.sym} 2130 -1110 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 2270 -1110 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 2130 -1050 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 2270 -1050 0 0 {name=Vmeas-}
C {devices/code_shown.sym} -1285 -690 0 0 {name=COMMANDS
only_toplevel=false
value="

.control
    tran 1n 1650n
    plot i(Vmeas+) i(Vmeas-)
    write test_dac_msb_matrix.raw
.endc
.save all

"}
C {dac_global_current_mirror.sym} 270 -380 0 0 {name=x1}
C {dac_local_current_mirror.sym} 360 -660 0 0 {name=x6}
C {dac_local_current_mirror.sym} 1890 -660 0 1 {name=x8}
C {devices/lab_pin.sym} 460 -660 3 0 {name=p25 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 920 -660 3 0 {name=p40 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 460 -990 0 0 {name=p42 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1790 -660 3 0 {name=p43 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1790 -990 0 1 {name=p45 sig_type=std_logic lab=VDD}
C {dac_msb_matrix.sym} 1140 -1010 0 0 {name=x11 DVDD=DVDD DVSS=DVSS}
C {dac_matrix_decoder.sym} 1130 -1490 3 1 {name=x12 DVDD=DVDD DVSS=DVSS}
C {dac_matrix_decoder.sym} 660 -1010 0 0 {name=x13 DVDD=DVDD DVSS=DVSS}
C {devices/lab_pin.sym} 1360 -1350 1 0 {name=p53 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} 800 -780 0 0 {name=p54 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} 800 -1240 0 0 {name=p55 sig_type=std_logic lab=DVDD}
C {10bit_counter.sym} -250 -670 0 0 {name=x2}
C {devices/lab_pin.sym} 240 -660 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 150 -360 0 1 {name=p18 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 880 -380 0 1 {name=p29 sig_type=std_logic lab=CLK}
C {devices/code_shown.sym} -1280 -910 0 0 {name=MODELS
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
C {devices/lab_pin.sym} -130 -200 2 0 {name=p24 sig_type=std_logic lab=CLK}
C {devices/vsource.sym} -290 -170 0 0 {name=VDD5
value="pulse 0 3.3 13n 2n 2n 10.5n 25n"}
C {devices/lab_pin.sym} -290 -140 2 1 {name=p630 sig_type=std_logic lab=0}
C {std_cell/inv_1.sym} -250 -200 0 0 {name=x3 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -130 -270 2 0 {name=p30 sig_type=std_logic lab=D4}
C {devices/lab_pin.sym} -290 -270 0 0 {name=p31 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} -290 -320 0 0 {name=p32 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} -130 -320 2 0 {name=p33 sig_type=std_logic lab=D5}
C {devices/lab_pin.sym} -290 -370 0 0 {name=p35 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} -290 -420 0 0 {name=p36 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} -130 -370 2 0 {name=p34 sig_type=std_logic lab=D6}
C {devices/lab_pin.sym} -130 -420 2 0 {name=p37 sig_type=std_logic lab=D7}
C {std_cell/inv_1.sym} -170 -200 0 0 {name=x4 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -250 -270 0 0 {name=x7 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -170 -270 0 0 {name=x9 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -250 -320 0 0 {name=x10 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -170 -320 0 0 {name=x5 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -250 -370 0 0 {name=x14 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -170 -370 0 0 {name=x15 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -250 -420 0 0 {name=x16 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -170 -420 0 0 {name=x17 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -100 -580 2 0 {name=p3 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} -100 -600 2 0 {name=p12 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} -100 -620 2 0 {name=p13 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} -100 -640 2 0 {name=p14 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} -100 -660 2 0 {name=p15 sig_type=std_logic lab=out4}
C {devices/lab_pin.sym} -100 -680 2 0 {name=p28 sig_type=std_logic lab=out5}
C {devices/lab_pin.sym} -290 -470 0 0 {name=p38 sig_type=std_logic lab=out4}
C {devices/lab_pin.sym} -290 -520 0 0 {name=p39 sig_type=std_logic lab=out5}
C {devices/lab_pin.sym} -130 -470 2 0 {name=p46 sig_type=std_logic lab=D8}
C {devices/lab_pin.sym} -130 -520 2 0 {name=p47 sig_type=std_logic lab=D9}
C {std_cell/inv_1.sym} -250 -470 0 0 {name=x18 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -170 -470 0 0 {name=x19 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -250 -520 0 0 {name=x20 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -170 -520 0 0 {name=x21 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} 650 -1470 2 1 {name=p4 sig_type=std_logic lab=D4}
C {devices/lab_pin.sym} 650 -1430 2 1 {name=p5 sig_type=std_logic lab=D5}
C {devices/lab_pin.sym} 650 -1390 2 1 {name=p6 sig_type=std_logic lab=D6}
C {devices/lab_pin.sym} 680 -1490 1 0 {name=p7 sig_type=std_logic lab=D7}
C {devices/lab_pin.sym} 720 -1490 1 0 {name=p26 sig_type=std_logic lab=D8}
C {devices/lab_pin.sym} 760 -1490 1 0 {name=p27 sig_type=std_logic lab=D9}
C {devices/title.sym} 160 0 0 0 {name=l2 author="JunBeom Park"}
