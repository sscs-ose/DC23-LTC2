v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 770 -160 1060 -160 {
lab=#net1}
N 1060 -320 1060 -160 {
lab=#net1}
N 770 -120 1080 -120 {
lab=#net2}
N 1080 -320 1080 -120 {
lab=#net2}
N 1100 -320 1100 -100 {
lab=VSS}
N 680 -80 1100 -80 {
lab=VSS}
N 1100 -100 1100 -80 {
lab=VSS}
N 410 -120 410 -80 {
lab=VSS}
N 430 -80 680 -80 {
lab=VSS}
N 520 -340 680 -340 {
lab=VDD}
N 600 -380 600 -340 {
lab=VDD}
N 1640 -650 1640 -620 {
lab=VDD}
N 1780 -650 1780 -620 {
lab=VDD}
N 1610 -470 1640 -470 {
lab=OUT+}
N 1610 -450 1780 -450 {
lab=OUT-}
N 1780 -500 1780 -480 {
lab=OUT-}
N 1270 -470 1320 -470 {
lab=OUT+}
N 1270 -450 1320 -450 {
lab=OUT-}
N 1550 -470 1610 -470 {
lab=OUT+}
N 1550 -450 1610 -450 {
lab=OUT-}
N 1640 -500 1640 -470 {
lab=OUT+}
N 1780 -480 1780 -450 {
lab=OUT-}
N 1060 -600 1060 -320 {
lab=#net1}
N 1080 -600 1080 -320 {
lab=#net2}
N 1100 -600 1100 -320 {
lab=VSS}
N 1190 -740 1290 -740 {
lab=OUT+}
N 1290 -740 1290 -470 {
lab=OUT+}
N 1190 -720 1300 -720 {
lab=OUT-}
N 1300 -720 1300 -450 {
lab=OUT-}
N 410 -80 430 -80 {
lab=VSS}
N 580 -300 600 -300 {
lab=#net3}
N 500 -340 520 -340 {
lab=VDD}
N 1180 -980 1300 -980 {
lab=OUT+}
N 1290 -980 1290 -740 {
lab=OUT+}
N 1180 -960 1300 -960 {
lab=OUT-}
N 1300 -960 1300 -720 {
lab=OUT-}
N 1100 -840 1100 -600 {
lab=VSS}
N 1060 -840 1060 -600 {
lab=#net1}
N 1080 -840 1080 -600 {
lab=#net2}
N 890 -940 1010 -940 {
lab=C}
N 980 -940 980 -720 {
lab=C}
N 980 -720 1010 -720 {
lab=C}
N 890 -910 950 -910 {
lab=D}
N 950 -910 950 -700 {
lab=D}
N 950 -700 1010 -700 {
lab=D}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
C {10bit_counter.sym} 560 -560 0 0 {name=x2}
C {devices/vsource.sym} -410 -90 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -410 -60 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -410 -120 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -340 -90 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -340 -60 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -340 -120 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -560 -90 0 0 {name=VDD2 value=3.3}
C {devices/lab_pin.sym} -560 -60 0 1 {name=p22 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -560 -120 0 1 {name=p23 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} -490 -90 0 0 {name=VSS3
value=0}
C {devices/lab_pin.sym} -490 -60 0 1 {name=p24 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -490 -120 0 1 {name=p25 sig_type=std_logic lab=DVSS}
C {dac_local_current_mirror.sym} 580 -30 0 0 {name=x3}
C {dac_global_current_mirror.sym} 530 -100 0 0 {name=x4}
C {devices/isource.sym} 410 -390 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 410 -420 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 600 -380 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 430 -80 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1320 -470 0 1 {name=p12 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1320 -450 0 1 {name=p13 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 1640 -650 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1780 -650 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1640 -590 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1780 -590 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1640 -530 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 1780 -530 0 0 {name=Vmeas-}
C {devices/lab_pin.sym} 1550 -470 0 0 {name=p14 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1550 -450 0 0 {name=p15 sig_type=std_logic lab=OUT-}
C {devices/code_shown.sym} -600 -490 0 0 {name=COMMANDS
only_toplevel=false
value="
.options savecurrents

.control
    tran 1n 300n
    plot i(Vmeas+) i(Vmeas-)
    plot v(CLK0) v(out0) v(out1) v(out2)
    plot v(C) v(D) v(CLK0)
    write tb_dac_lsb.raw
.endc

.save all
"}
C {dac_msb_cell.sym} 1160 -690 0 0 {name=x5 DVDD=DVDD DVSS=VSS}
C {devices/lab_pin.sym} 1010 -650 2 1 {name=p16 sig_type=std_logic lab=CLK0}
C {devices/lab_pin.sym} 120 -170 2 1 {name=p27 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 120 -230 2 0 {name=p29 sig_type=std_logic lab=B}
C {devices/vsource.sym} 120 -200 0 0 {name=VDD3
value=3.3}
C {devices/lab_pin.sym} 1010 -960 2 1 {name=p30 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} 710 -470 2 0 {name=p31 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} 710 -490 0 1 {name=p32 sig_type=std_logic lab=out1}
C {devices/code_shown.sym} 80 -620 2 0 {name=MODELS1
only_toplevel=true
format="tcleval( @value )"
value="
.include /home/junbeom/pico/designs/klayout/ext2spice/dac_msb_cell/dac_msb_cell_pex_extracted.spice
.include /home/junbeom/pico/designs/xschem/dac_matrix_decoder.spice
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {dac_msb_cell.sym} 1160 -930 0 0 {name=x1 DVDD=DVDD DVSS=VSS}
C {devices/lab_pin.sym} 1070 -780 2 1 {name=p1 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} 1070 -1020 2 1 {name=p2 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} 1010 -890 2 1 {name=p3 sig_type=std_logic lab=CLK0}
C {devices/vsource.sym} -80 -70 0 0 {name=VDD4 value="pulse 0 3.3 20n 3n 3n 9.5n 25n"}
C {devices/lab_pin.sym} -80 -40 0 1 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -80 -100 2 1 {name=p17 sig_type=std_logic lab=CLK0}
C {dac_matrix_decoder.sym} 750 -740 0 0 {name=x13 DVDD=DVDD DVSS=DVSS}
C {devices/lab_pin.sym} 770 -1050 1 0 {name=p18 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} 810 -1050 1 0 {name=p21 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} 850 -1050 1 0 {name=p33 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 710 -510 2 0 {name=p34 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 900 -940 2 0 {name=p35 sig_type=std_logic lab=C}
C {devices/lab_pin.sym} 900 -910 2 0 {name=p36 sig_type=std_logic lab=D}
