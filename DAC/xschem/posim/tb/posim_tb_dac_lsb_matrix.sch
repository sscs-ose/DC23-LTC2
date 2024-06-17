v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 700 -520 970 -520 {
lab=out0}
N 690 -520 700 -520 {
lab=out0}
N 690 -540 970 -540 {
lab=out1}
N 690 -560 970 -560 {
lab=out2}
N 690 -580 970 -580 {
lab=out3}
N 750 -210 1040 -210 {
lab=#net1}
N 1040 -370 1040 -210 {
lab=#net1}
N 750 -170 1060 -170 {
lab=#net2}
N 1060 -370 1060 -170 {
lab=#net2}
N 1080 -370 1080 -150 {
lab=VSS}
N 660 -130 1080 -130 {
lab=VSS}
N 1080 -150 1080 -130 {
lab=VSS}
N 390 -170 390 -130 {
lab=VSS}
N 410 -130 660 -130 {
lab=VSS}
N 500 -390 660 -390 {
lab=VDD}
N 580 -430 580 -390 {
lab=VDD}
N 1620 -700 1620 -670 {
lab=VDD}
N 1760 -700 1760 -670 {
lab=VDD}
N 1590 -520 1620 -520 {
lab=OUT+}
N 1590 -500 1760 -500 {
lab=OUT-}
N 1760 -550 1760 -530 {
lab=OUT-}
N 1250 -520 1300 -520 {
lab=OUT+}
N 1250 -500 1300 -500 {
lab=OUT-}
N 1530 -520 1590 -520 {
lab=OUT+}
N 1530 -500 1590 -500 {
lab=OUT-}
N 1620 -550 1620 -520 {
lab=OUT+}
N 1760 -530 1760 -500 {
lab=OUT-}
N 390 -130 410 -130 {
lab=VSS}
N 560 -350 580 -350 {
lab=#net3}
N 480 -390 500 -390 {
lab=VDD}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="JunBeom Park"}
C {10bit_counter.sym} 540 -610 0 0 {name=x2}
C {devices/vsource.sym} -430 -140 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -430 -110 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -430 -170 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -360 -140 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -360 -110 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -360 -170 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -580 -140 0 0 {name=VDD2 value=3.3}
C {devices/lab_pin.sym} -580 -110 0 1 {name=p22 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -580 -170 0 1 {name=p23 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} -510 -140 0 0 {name=VSS3
value=0}
C {devices/lab_pin.sym} -510 -110 0 1 {name=p24 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -510 -170 0 1 {name=p25 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} 20 -120 2 1 {name=p17 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 20 -180 2 0 {name=p18 sig_type=std_logic lab=CLK0}
C {devices/lab_pin.sym} 970 -500 2 1 {name=p1 sig_type=std_logic lab=CLK0}
C {devices/lab_pin.sym} 970 -480 2 1 {name=p2 sig_type=std_logic lab=CLK0}
C {devices/lab_pin.sym} 970 -460 2 1 {name=p3 sig_type=std_logic lab=CLK0}
C {devices/lab_pin.sym} 970 -440 2 1 {name=p7 sig_type=std_logic lab=CLK0}
C {dac_local_current_mirror.sym} 560 -80 0 0 {name=x3}
C {dac_global_current_mirror.sym} 510 -150 0 0 {name=x4}
C {devices/isource.sym} 390 -440 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 390 -470 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 580 -430 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 410 -130 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1300 -520 0 1 {name=p12 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1300 -500 0 1 {name=p13 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 1620 -700 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1760 -700 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1620 -640 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1760 -640 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1620 -580 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 1760 -580 0 0 {name=Vmeas-}
C {devices/lab_pin.sym} 1530 -520 0 0 {name=p14 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1530 -500 0 0 {name=p15 sig_type=std_logic lab=OUT-}
C {devices/code_shown.sym} -620 -540 0 0 {name=COMMANDS
only_toplevel=false
value="
.options savecurrents

.control
    tran 1n 300n
    plot i(Vmeas+) i(Vmeas-)
    plot v(clk0) v(out0)
    write tb_dac_lsb.raw
.endc

.save all
"}
C {devices/lab_pin.sym} 850 -520 3 0 {name=p31 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} 830 -540 3 0 {name=p32 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} 810 -560 3 0 {name=p33 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 790 -580 3 0 {name=p34 sig_type=std_logic lab=out3}
C {posim/dac_lsb_matrix.sym} 1110 -510 0 0 {name=x1 DVDD=DVDD DVSS=VSS}
C {devices/vsource.sym} 20 -150 0 0 {name=VDD4 value="pulse 0 3.3 20n 3n 3n 9.5n 25n"}
C {devices/code_shown.sym} 260 -620 2 0 {name=MODELS1
only_toplevel=true
format="tcleval( @value )"
value="
.include /home/junbeom/pico/designs/klayout/ext2spice/dac_lsb_matrix/dac_lsb_matrix_pex_extracted.spice
.include /home/junbeom/pico/designs/xschem/dac_matrix_decoder.spice
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
