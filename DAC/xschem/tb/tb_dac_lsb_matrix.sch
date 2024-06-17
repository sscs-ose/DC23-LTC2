v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 370 -470 640 -470 {
lab=D0}
N 360 -470 370 -470 {
lab=D0}
N 360 -490 640 -490 {
lab=D1}
N 360 -510 640 -510 {
lab=D2}
N 360 -530 640 -530 {
lab=D3}
N 420 -160 710 -160 {
lab=#net1}
N 710 -320 710 -160 {
lab=#net1}
N 420 -120 730 -120 {
lab=#net2}
N 730 -320 730 -120 {
lab=#net2}
N 750 -320 750 -100 {
lab=VSS}
N 330 -80 750 -80 {
lab=VSS}
N 750 -100 750 -80 {
lab=VSS}
N 60 -120 60 -80 {
lab=VSS}
N 80 -80 330 -80 {
lab=VSS}
N 170 -340 330 -340 {
lab=VDD}
N 250 -380 250 -340 {
lab=VDD}
N 1290 -650 1290 -620 {
lab=VDD}
N 1430 -650 1430 -620 {
lab=VDD}
N 1260 -470 1290 -470 {
lab=#net3}
N 1260 -450 1430 -450 {
lab=#net4}
N 1430 -500 1430 -480 {
lab=#net4}
N 920 -470 970 -470 {
lab=#net3}
N 920 -450 970 -450 {
lab=#net4}
N 1200 -470 1260 -470 {
lab=#net3}
N 1200 -450 1260 -450 {
lab=#net4}
N 1290 -500 1290 -470 {
lab=#net3}
N 1430 -480 1430 -450 {
lab=#net4}
N 60 -80 80 -80 {
lab=VSS}
N 230 -300 250 -300 {
lab=#net5}
N 150 -340 170 -340 {
lab=VDD}
N 970 -470 1200 -470 {
lab=#net3}
N 970 -450 1200 -450 {
lab=#net4}
N 620 -450 620 -420 {
lab=CLK}
N 620 -450 640 -450 {
lab=CLK}
N 620 -430 640 -430 {
lab=CLK}
N 620 -410 640 -410 {
lab=CLK}
N 620 -420 620 -410 {
lab=CLK}
N 620 -390 640 -390 {
lab=CLK}
N 620 -410 620 -390 {
lab=CLK}
N 600 -420 620 -420 {
lab=CLK}
N 60 -80 60 -50 {
lab=VSS}
N 360 -420 600 -420 {}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
C {10bit_counter.sym} -230 -580 0 0 {name=x2}
C {devices/code_shown.sym} -1100 -710 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/vsource.sym} -150 -50 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} -150 -20 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -150 -80 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -80 -50 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} -80 -20 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -80 -80 0 1 {name=p5 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -300 -50 0 0 {name=VDD2 value=3.3}
C {devices/lab_pin.sym} -300 -20 0 1 {name=p22 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -300 -80 0 1 {name=p23 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} -230 -50 0 0 {name=VSS3
value=0}
C {devices/lab_pin.sym} -230 -20 0 1 {name=p24 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -230 -80 0 1 {name=p25 sig_type=std_logic lab=DVSS}
C {devices/lab_pin.sym} -80 -200 2 0 {name=p18 sig_type=std_logic lab=CLK}
C {devices/vsource.sym} -240 -170 0 0 {name=VDD5
value="pulse 0 3.3 13n 2n 2n 10.5n 25n"}
C {devices/lab_pin.sym} 360 -420 2 1 {name=p2 sig_type=std_logic lab=CLK}
C {dac_local_current_mirror.sym} 230 -30 0 0 {name=x3}
C {dac_global_current_mirror.sym} 180 -100 0 0 {name=x4}
C {devices/isource.sym} 60 -390 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 60 -420 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 250 -380 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 60 -50 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1290 -650 0 1 {name=p26 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1430 -650 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1290 -590 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1430 -590 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1290 -530 0 0 {name=Vout+}
C {devices/ammeter.sym} 1430 -530 0 0 {name=Vout-}
C {devices/code_shown.sym} -1100 -530 0 0 {name=COMMANDS
only_toplevel=false
value="
.options savecurrents

.control
    tran 1n 400n
    ****plot output currents****
    plot i(Vout+) i(Vout-)
    ****plot input and clock signals****
    plot v(out0)+2*v(out1)+4*v(out2)+8*v(out3) v(clk)
    write tb_dac_lsb.raw
.endc

.save all
"}
C {dac_lsb_matrix.sym} 780 -460 0 0 {name=x1 DVDD=DVDD DVSS=DVSS}
C {devices/lab_pin.sym} -80 -530 2 0 {name=p33 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} -80 -550 2 0 {name=p34 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} -240 -140 2 1 {name=p630 sig_type=std_logic lab=0}
C {std_cell/inv_1.sym} -200 -200 0 0 {name=x8 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/lab_pin.sym} -80 -490 2 0 {name=p12 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} -80 -510 2 0 {name=p13 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} -80 -270 2 0 {name=p14 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} -240 -270 0 0 {name=p15 sig_type=std_logic lab=out0}
C {devices/lab_pin.sym} -240 -320 0 0 {name=p17 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} -80 -320 2 0 {name=p31 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} -240 -370 0 0 {name=p35 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} -240 -420 0 0 {name=p36 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} -80 -370 2 0 {name=p32 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} -80 -420 2 0 {name=p37 sig_type=std_logic lab=D3}
C {devices/lab_pin.sym} 360 -530 2 1 {name=p1 sig_type=std_logic lab=D3}
C {devices/lab_pin.sym} 360 -510 2 1 {name=p3 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 360 -490 2 1 {name=p7 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 360 -470 2 1 {name=p38 sig_type=std_logic lab=D0}
C {std_cell/inv_1.sym} -120 -200 0 0 {name=x6 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -200 -270 0 0 {name=x7 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -120 -270 0 0 {name=x9 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -200 -320 0 0 {name=x10 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -120 -320 0 0 {name=x11 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -200 -370 0 0 {name=x12 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -120 -370 0 0 {name=x13 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -200 -420 0 0 {name=x14 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} -120 -420 0 0 {name=x15 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
