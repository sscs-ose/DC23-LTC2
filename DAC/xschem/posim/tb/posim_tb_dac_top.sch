v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 370 -450 640 -450 {
lab=#net1}
N 360 -450 370 -450 {
lab=#net1}
N 360 -470 640 -470 {
lab=#net2}
N 360 -490 640 -490 {
lab=#net3}
N 360 -510 640 -510 {
lab=#net4}
N 1290 -740 1290 -710 {
lab=VDD}
N 1390 -740 1390 -710 {
lab=VDD}
N 1390 -590 1390 -570 {
lab=OUT-}
N 1390 -570 1390 -540 {
lab=OUT-}
N 360 -530 550 -530 {
lab=#net5}
N 550 -530 640 -530 {
lab=#net5}
N 360 -550 640 -550 {
lab=#net6}
N 360 -570 640 -570 {
lab=#net7}
N 360 -590 640 -590 {
lab=#net8}
N 360 -610 640 -610 {
lab=#net9}
N 360 -630 640 -630 {
lab=#net10}
N 360 -420 640 -420 {
lab=CLK}
N 730 -710 730 -670 {
lab=DVDD}
N 760 -710 760 -670 {
lab=VDD}
N 700 -710 700 -670 {
lab=BGR}
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
C {10bit_counter.sym} 210 -540 0 0 {name=x2}
C {devices/vsource.sym} 60 -70 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 60 -40 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 60 -100 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 140 -70 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 140 -40 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 140 -100 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 60 -170 0 0 {name=VDD2 value=3.3}
C {devices/lab_pin.sym} 60 -140 0 1 {name=p22 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 60 -200 0 1 {name=p23 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 140 -170 0 0 {name=VSS3
value=0}
C {devices/lab_pin.sym} 140 -140 0 1 {name=p24 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 140 -200 0 1 {name=p25 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} 240 -40 2 1 {name=p17 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 240 -100 2 0 {name=p18 sig_type=std_logic lab=CLK}
C {devices/vsource.sym} 240 -70 0 0 {name=VDD5
value="pulse 0 3.3 20n 2n 2n 23n 50n"}
C {devices/isource.sym} 240 -170 0 0 {name=I0 value=2u}
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
C {devices/ammeter.sym} 1290 -620 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 1390 -620 0 0 {name=Vmeas-}
C {devices/lab_pin.sym} 1290 -550 2 0 {name=p14 sig_type=std_logic lab=OUT+}
C {devices/code_shown.sym} -600 -490 0 0 {name=COMMANDS
only_toplevel=false
value="
.options savecurrents

.control
    tran 1n 5120n
    plot v(CLK)
    plot i(Vmeas+)
    plot i(Vmeas-)
    *plot v(out0)+2*v(out1)+4*v(out2)+8*v(out3) v(clk0)
    write posim_tb_dac_top.raw
.endc

.save all
"}
C {devices/lab_pin.sym} 1390 -490 0 1 {name=p1 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 360 -420 2 1 {name=p2 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 730 -710 3 1 {name=p3 sig_type=std_logic lab=DVDD}
C {devices/lab_pin.sym} 760 -710 3 1 {name=p7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 730 -330 1 1 {name=p9 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} 750 -330 1 1 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 240 -200 0 1 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 700 -710 3 1 {name=p13 sig_type=std_logic lab=BGR}
C {devices/lab_pin.sym} 240 -140 0 1 {name=p10 sig_type=std_logic lab=BGR}
C {devices/code_shown.sym} -790 -730 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
.include "/home/junbeom/pico/designs/klayout/ext2spice/dac_top/TOP_KOREA_pex_extracted.spice"
"}
C {posim/TOP_KOREA.sym} 790 -520 0 0 {name=x1}
