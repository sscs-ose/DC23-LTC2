v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 720 -470 990 -470 {
lab=#net1}
N 710 -470 720 -470 {
lab=#net1}
N 710 -490 990 -490 {
lab=#net2}
N 710 -510 990 -510 {
lab=#net3}
N 710 -530 990 -530 {
lab=#net4}
N 770 -160 1060 -160 {
lab=#net5}
N 1060 -320 1060 -160 {
lab=#net5}
N 770 -120 1080 -120 {
lab=#net6}
N 1080 -320 1080 -120 {
lab=#net6}
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
N 1530 -990 1530 -960 {
lab=VDD}
N 1670 -990 1670 -960 {
lab=VDD}
N 1500 -810 1530 -810 {
lab=OUT+}
N 1500 -790 1670 -790 {
lab=OUT-}
N 1670 -840 1670 -820 {
lab=OUT-}
N 1260 -800 1310 -800 {
lab=OUT+}
N 1260 -780 1310 -780 {
lab=OUT-}
N 1440 -810 1500 -810 {
lab=OUT+}
N 1440 -790 1500 -790 {
lab=OUT-}
N 1530 -840 1530 -810 {
lab=OUT+}
N 1670 -820 1670 -790 {
lab=OUT-}
N 1060 -600 1060 -320 {
lab=#net5}
N 1080 -600 1080 -320 {
lab=#net6}
N 1100 -600 1100 -320 {
lab=VSS}
N 900 -720 900 -550 {
lab=#net4}
N 410 -80 430 -80 {
lab=VSS}
N 580 -300 600 -300 {
lab=#net7}
N 500 -340 520 -340 {
lab=VDD}
N 900 -800 900 -720 {
lab=#net4}
N 900 -800 1000 -800 {
lab=#net4}
N 920 -760 1000 -760 {
lab=#net3}
N 920 -760 920 -510 {
lab=#net3}
N 900 -550 900 -530 {
lab=#net4}
N 940 -720 1000 -720 {
lab=#net2}
N 940 -720 940 -490 {
lab=#net2}
N 960 -680 1000 -680 {
lab=#net1}
N 960 -680 960 -470 {
lab=#net1}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
C {10bit_counter.sym} 560 -560 0 0 {name=x2}
C {devices/code_shown.sym} -610 -690 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
.include "/home/junbeom/pico/designs/klayout/ext2spice/dac_lsb_analog.spice"
"}
C {devices/vsource.sym} -410 -90 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -410 -60 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -410 -120 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -340 -90 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -340 -60 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -340 -120 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 40 -70 2 1 {name=p17 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 40 -130 2 0 {name=p18 sig_type=std_logic lab=CLK0}
C {devices/vsource.sym} 40 -100 0 0 {name=VDD5
value="pulse 0 3.3 22n 2n 2n 23n 50n"}
C {dac_local_current_mirror.sym} 580 -30 0 0 {name=x3}
C {dac_global_current_mirror.sym} 530 -100 0 0 {name=x4}
C {devices/isource.sym} 410 -390 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 410 -420 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 600 -380 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 430 -80 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1310 -800 0 1 {name=p12 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1310 -780 0 1 {name=p13 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 1530 -990 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1670 -990 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1530 -930 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1670 -930 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1530 -870 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 1670 -870 0 0 {name=Vmeas-}
C {devices/lab_pin.sym} 1440 -810 0 0 {name=p14 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1440 -790 0 0 {name=p15 sig_type=std_logic lab=OUT-}
C {devices/code_shown.sym} -600 -490 0 0 {name=COMMANDS
only_toplevel=false
value="
.options savecurrents

.control
    tran 1n 1000n
    plot i(Vmeas+) i(Vmeas-)
    write posim_tb_dac_lsb_analog.raw
.endc

.save all
"}
C {posim/posim_dac_lsb_analog.sym} 1130 -720 0 0 {name=x1}
