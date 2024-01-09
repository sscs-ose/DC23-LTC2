v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 880 -1440 1680 -1040 {flags=graph
y1=2.656e-05
y2=0.00018086
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="i(vmeas+)
i(vmeas-)"
color="7 6"
dataset=-1
unitx=1
logx=0
logy=0
}
T {4LSB Matrix consists of 4 current cells(1X, 2X, 4X, 8X)
Each current cell consists of latch and multiplied current cell
 
====VALUES====
bandgap reference current = 2uA
nominal current/1LSB = 9.26uA} 1170 -970 0 0 0.5 0.5 {}
N 1530 -740 1530 -710 {
lab=VDD}
N 1670 -740 1670 -710 {
lab=VDD}
N 1030 -330 1180 -330 {
lab=#net1}
N 1030 -310 1180 -310 {
lab=#net2}
N 1480 -510 1530 -510 {
lab=OUT+}
N 1530 -590 1530 -510 {
lab=OUT+}
N 1480 -490 1670 -490 {
lab=OUT-}
N 1670 -590 1670 -490 {
lab=OUT-}
N 1020 -250 1180 -250 {
lab=VSS}
N 880 -260 930 -260 {
lab=VSS}
N 930 -250 1020 -250 {
lab=VSS}
N 920 -260 930 -250 {
lab=VSS}
N 1180 -250 1240 -250 {
lab=VSS}
C {devices/code.sym} 30 -185 0 0 {name=COMMANDS
only_toplevel=false
value="
.options savecurrents
.save all
.control
	tran 1n 1000n
	plot i(Vmeas+) i(Vmeas-)
	plot v(CLK) v(D0) V(D1) V(D2) V(D3)
	write test_dac_lsb_matrix.raw
.endc
"}
C {devices/vsource.sym} 450 -660 0 0 {name=VDD value=3.3}
C {devices/lab_pin.sym} 450 -630 0 1 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 450 -690 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 520 -660 0 0 {name=VSS
value=0}
C {devices/lab_pin.sym} 520 -630 0 1 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 520 -690 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {devices/code_shown.sym} 40 -360 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.include $::180MCU_STDCELLS/spice/gf180mcu_fd_sc_mcu7t5v0.spice
*.lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {devices/lab_pin.sym} 970 -520 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/isource.sym} 990 -550 0 0 {name=I0 value=2u}
C {devices/lab_pin.sym} 990 -580 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1530 -590 0 1 {name=p16 sig_type=std_logic lab=OUT+}
C {devices/lab_pin.sym} 1670 -590 0 1 {name=p19 sig_type=std_logic lab=OUT-}
C {devices/lab_pin.sym} 1530 -740 0 1 {name=p20 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1670 -740 0 1 {name=p21 sig_type=std_logic lab=VDD}
C {devices/res.sym} 1530 -680 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1670 -680 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 1530 -620 0 0 {name=Vmeas+}
C {devices/ammeter.sym} 1670 -620 0 0 {name=Vmeas-}
C {devices/launcher.sym} 950 -960 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/test_dac_lsb_matrix.raw tran"
}
C {devices/lab_pin.sym} 1180 -450 0 0 {name=p3 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} 1180 -470 0 0 {name=p5 sig_type=std_logic lab=D1}
C {devices/lab_pin.sym} 1180 -490 0 0 {name=p7 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 1180 -510 0 0 {name=p9 sig_type=std_logic lab=D3}
C {dac_current_mirror.sym} 980 -380 0 0 {name=x7}
C {devices/lab_pin.sym} 880 -260 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 300 -660 0 0 {name=VDD1 value=3.3}
C {devices/lab_pin.sym} 300 -630 0 1 {name=p12 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 300 -690 0 1 {name=p13 sig_type=std_logic lab=DVNW}
C {devices/vsource.sym} 370 -660 0 0 {name=VSS2
value=0}
C {devices/lab_pin.sym} 370 -630 0 1 {name=p14 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 370 -690 0 1 {name=p15 sig_type=std_logic lab=DVPW}
C {devices/vsource.sym} 160 -660 0 0 {name=VDD2 value=3.3}
C {devices/lab_pin.sym} 160 -630 0 1 {name=p22 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 160 -690 0 1 {name=p23 sig_type=std_logic lab=DVDD}
C {devices/vsource.sym} 230 -660 0 0 {name=VSS3
value=0}
C {devices/lab_pin.sym} 230 -630 0 1 {name=p24 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 230 -690 0 1 {name=p25 sig_type=std_logic lab=DVSS}
C {dac_lsb_matrix.sym} 1330 -400 0 0 {name=x8 DVDD=DVDD DVNW=DVNW DVPW=DVPW DVSS=DVSS}
C {devices/vsource.sym} 150 -990 0 0 {name=V5
value="pulse 0 3.3 160n 10n 10n 190n 400n"}
C {devices/lab_pin.sym} 150 -960 2 1 {name=p31 sig_type=std_logic lab=0}
C {devices/vsource.sym} 150 -900 0 0 {name=V6
value="pulse 0 3.3 60n 10n 10n 90n 200n"
}
C {devices/lab_pin.sym} 150 -870 2 1 {name=p32 sig_type=std_logic lab=0}
C {devices/vsource.sym} 150 -810 0 0 {name=V7
value="pulse 0 3.3 10n 10n 10n 40n 100n"
}
C {devices/lab_pin.sym} 150 -780 2 1 {name=p34 sig_type=std_logic lab=0}
C {devices/vsource.sym} 150 -1080 0 0 {name=V8
value="pulse 0 3.3 360n 10n 10n 390n 800n"}
C {devices/lab_pin.sym} 150 -1050 2 1 {name=p36 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 150 -1110 0 1 {name=p30 sig_type=std_logic lab=D3}
C {devices/lab_pin.sym} 150 -1020 0 1 {name=p33 sig_type=std_logic lab=D2}
C {devices/lab_pin.sym} 150 -840 0 1 {name=p37 sig_type=std_logic lab=D0}
C {devices/lab_pin.sym} 470 -780 2 1 {name=p17 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 470 -840 2 1 {name=p18 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 1180 -360 2 1 {name=p26 sig_type=std_logic lab=CLK}
C {devices/title.sym} 160 0 0 0 {name=l1 author="Junbeom Park"}
C {devices/lab_pin.sym} 150 -930 0 1 {name=p27 sig_type=std_logic lab=D1}
C {devices/vsource.sym} 470 -810 0 0 {name=VDD5 value="pulse 0 3.3 22n 5n 5n 20n 50n"
*value="pwl 0 0 9.9n 0 10n 3.3"}
