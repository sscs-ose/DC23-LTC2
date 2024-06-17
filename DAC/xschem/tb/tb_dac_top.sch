v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 360 -450 630 -450 {
lab=D0}
N 350 -450 360 -450 {
lab=D0}
N 350 -470 630 -470 {
lab=D1}
N 350 -490 630 -490 {
lab=D2}
N 350 -510 630 -510 {
lab=D3}
N 1290 -740 1290 -710 {
lab=VDD}
N 1390 -740 1390 -710 {
lab=VDD}
N 1390 -590 1390 -570 {
lab=OUT-}
N 1390 -570 1390 -540 {
lab=OUT-}
N 350 -530 540 -530 {
lab=D4}
N 540 -530 630 -530 {
lab=D4}
N 350 -550 630 -550 {
lab=D5}
N 350 -570 630 -570 {
lab=D6}
N 350 -590 630 -590 {
lab=D7}
N 350 -610 630 -610 {
lab=D8}
N 350 -630 630 -630 {
lab=D9}
N 350 -420 630 -420 {
lab=CLK}
N 730 -710 730 -670 {
lab=DVDD}
N 760 -710 760 -670 {
lab=VDD}
N 700 -710 700 -670 {
lab=Iref}
N 730 -370 730 -330 {
lab=DVSS}
N 750 -370 750 -330 {
lab=VSS}
N 1390 -540 1390 -490 {
lab=OUT-}
N 1000 -490 1390 -490 {
lab=OUT-}
N 1000 -550 1290 -550 {
lab=OUT+}
N 1290 -590 1290 -550 {
lab=OUT+}
N 990 -550 1000 -550 {
lab=OUT+}
N 990 -490 1000 -490 {
lab=OUT-}
C {devices/vsource.sym} -690 -90 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -690 -60 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -690 -120 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -610 -90 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -610 -60 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -610 -120 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -690 -190 0 0 {name=VDD2 value=3.3}
C {devices/lab_pin.sym} -690 -160 0 1 {name=p22 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -690 -220 0 1 {name=p23 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} -610 -190 0 0 {name=VSS3
value=0}
C {devices/lab_pin.sym} -610 -160 0 1 {name=p24 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -610 -220 0 1 {name=p25 sig_type=std_logic lab=DVSS}
C {devices/isource.sym} -510 -190 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 1290 -740 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1390 -740 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1290 -680 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1390 -680 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1290 -620 0 0 {name=Vout+}
C {devices/ammeter.sym} 1390 -620 0 0 {name=Vout-}
C {devices/lab_pin.sym} 1290 -550 2 0 {name=p14 sig_type=std_logic lab=OUT+}
C {devices/code_shown.sym} -1090 -860 0 0 {name=COMMANDS
only_toplevel=false
value="
.options savecurrents

.control
    tran 1n 25700n
    plot i(Vout+) i(Vout-)
    plot v(out0)+2*v(out1)+4*v(out2)+8*v(out3) v(clk)
    write tb_dac_top.raw
.endc

.save all
"}
C {dac_top.sym} 790 -520 0 0 {name=x6}
C {devices/lab_pin.sym} 1390 -490 0 1 {name=p1 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 350 -420 2 1 {name=p2 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 730 -710 3 1 {name=p3 sig_type=std_logic lab=DVDD}
C {devices/lab_pin.sym} 760 -710 3 1 {name=p7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 730 -330 1 1 {name=p9 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} 750 -330 1 1 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -510 -220 0 1 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 700 -710 3 1 {name=p13 sig_type=std_logic lab=Iref}
C {devices/lab_pin.sym} -510 -160 0 1 {name=p10 sig_type=std_logic lab=Iref}
C {devices/code_shown.sym} -1080 -1070 0 0 {name=MODELS
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
C {10bit_counter.sym} -210 -820 0 0 {name=x1}
C {devices/lab_pin.sym} -60 -90 2 0 {name=p15 sig_type=std_logic lab=CLK}
C {devices/vsource.sym} -220 -60 0 0 {name=VDD1
value="pulse 0 3.3 13n 2n 2n 10.5n 25n"}
C {devices/lab_pin.sym} -220 -30 2 1 {name=p630 sig_type=std_logic lab=0}
C {std_cell/inv_1.sym} -180 -90 0 0 {name=x3 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -60 -360 2 0 {name=p30 sig_type=std_logic lab=D4}
C {devices/lab_pin.sym} -220 -160 0 0 {name=p31 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} -220 -210 0 0 {name=p32 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} -60 -410 2 0 {name=p33 sig_type=std_logic lab=D5}
C {devices/lab_pin.sym} -220 -260 0 0 {name=p35 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} -220 -310 0 0 {name=p36 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} -60 -460 2 0 {name=p34 sig_type=std_logic lab=D6}
C {devices/lab_pin.sym} -60 -510 2 0 {name=p37 sig_type=std_logic lab=D7}
C {std_cell/inv_1.sym} -100 -90 0 0 {name=x4 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -180 -160 0 0 {name=x7 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -160 0 0 {name=x9 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -180 -210 0 0 {name=x10 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -210 0 0 {name=x5 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -180 -260 0 0 {name=x14 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -260 0 0 {name=x15 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -180 -310 0 0 {name=x16 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -310 0 0 {name=x17 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -60 -730 2 0 {name=p16 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} -60 -750 2 0 {name=p19 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} -60 -770 2 0 {name=p20 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} -60 -790 2 0 {name=p21 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} -60 -810 2 0 {name=p27 sig_type=std_logic lab=out4}
C {devices/lab_pin.sym} -60 -830 2 0 {name=p29 sig_type=std_logic lab=out5}
C {devices/lab_pin.sym} -220 -360 0 0 {name=p38 sig_type=std_logic lab=out4}
C {devices/lab_pin.sym} -220 -410 0 0 {name=p39 sig_type=std_logic lab=out5}
C {devices/lab_pin.sym} -60 -560 2 0 {name=p46 sig_type=std_logic lab=D8}
C {devices/lab_pin.sym} -60 -610 2 0 {name=p47 sig_type=std_logic lab=D9}
C {std_cell/inv_1.sym} -180 -360 0 0 {name=x18 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -360 0 0 {name=x19 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -180 -410 0 0 {name=x20 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -410 0 0 {name=x21 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} 350 -530 2 1 {name=p40 sig_type=std_logic lab=D4}
C {devices/lab_pin.sym} 350 -550 2 1 {name=p41 sig_type=std_logic lab=D5}
C {devices/lab_pin.sym} 350 -570 2 1 {name=p42 sig_type=std_logic lab=D6}
C {devices/lab_pin.sym} 350 -590 2 1 {name=p43 sig_type=std_logic lab=D7}
C {devices/lab_pin.sym} 350 -610 2 1 {name=p44 sig_type=std_logic lab=D8}
C {devices/lab_pin.sym} 350 -630 2 1 {name=p45 sig_type=std_logic lab=D9}
C {devices/lab_pin.sym} -60 -850 2 0 {name=p48 sig_type=std_logic lab=out6}
C {devices/lab_pin.sym} -60 -870 2 0 {name=p49 sig_type=std_logic lab=out7}
C {devices/lab_pin.sym} -60 -890 2 0 {name=p50 sig_type=std_logic lab=out8}
C {devices/lab_pin.sym} -60 -910 2 0 {name=p51 sig_type=std_logic lab=out9}
C {devices/lab_pin.sym} -220 -460 0 0 {name=p52 sig_type=std_logic lab=out6}
C {devices/lab_pin.sym} -220 -510 0 0 {name=p53 sig_type=std_logic lab=out7}
C {std_cell/inv_1.sym} -180 -460 0 0 {name=x2 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -460 0 0 {name=x8 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -180 -510 0 0 {name=x11 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -510 0 0 {name=x12 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -220 -560 0 0 {name=p54 sig_type=std_logic lab=out8}
C {devices/lab_pin.sym} -220 -610 0 0 {name=p55 sig_type=std_logic lab=out9}
C {std_cell/inv_1.sym} -180 -560 0 0 {name=x13 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -560 0 0 {name=x22 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -180 -610 0 0 {name=x23 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -100 -610 0 0 {name=x24 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -60 -160 2 0 {name=p56 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} -60 -210 2 0 {name=p57 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} -60 -260 2 0 {name=p58 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} -60 -310 2 0 {name=p59 sig_type=std_logic lab=D3}
C {devices/lab_pin.sym} 350 -510 2 1 {name=p17 sig_type=std_logic lab=D3}
C {devices/lab_pin.sym} 350 -490 2 1 {name=p18 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 350 -470 2 1 {name=p60 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 350 -450 2 1 {name=p61 sig_type=std_logic lab=D0}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
