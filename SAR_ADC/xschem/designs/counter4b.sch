v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -2470 -4450 -2470 -4380 {
lab=CE}
N -2470 -4450 -2440 -4450 {
lab=CE}
N -2510 -4490 -2440 -4490 {
lab=Q1}
N -2510 -4490 -2510 -4380 {
lab=Q1}
N -2320 -4460 -2190 -4460 {
lab=#net1}
N -2320 -4470 -2320 -4460 {
lab=#net1}
N -2440 -4600 -2440 -4490 {
lab=Q1}
N -2440 -4600 -1940 -4600 {
lab=Q1}
N -1940 -4600 -1940 -4460 {
lab=Q1}
N -1950 -4460 -1940 -4460 {
lab=Q1}
N -2490 -4260 -2490 -4130 {
lab=#net2}
N -2480 -3870 -2480 -3800 {
lab=#net2}
N -2480 -3870 -2450 -3870 {
lab=#net2}
N -2520 -3910 -2450 -3910 {
lab=Q2}
N -2520 -3910 -2520 -3800 {
lab=Q2}
N -2330 -3880 -2200 -3880 {
lab=#net3}
N -2330 -3890 -2330 -3880 {
lab=#net3}
N -2450 -4020 -2450 -3910 {
lab=Q2}
N -2450 -4020 -1950 -4020 {
lab=Q2}
N -1950 -4020 -1950 -3880 {
lab=Q2}
N -1960 -3880 -1950 -3880 {
lab=Q2}
N -2500 -3680 -2500 -3550 {
lab=#net4}
N -2470 -3240 -2470 -3170 {
lab=#net4}
N -2470 -3240 -2440 -3240 {
lab=#net4}
N -2510 -3280 -2440 -3280 {
lab=Q3}
N -2510 -3280 -2510 -3170 {
lab=Q3}
N -2320 -3250 -2190 -3250 {
lab=#net5}
N -2320 -3260 -2320 -3250 {
lab=#net5}
N -2440 -3390 -2440 -3280 {
lab=Q3}
N -2440 -3390 -1940 -3390 {
lab=Q3}
N -1940 -3390 -1940 -3250 {
lab=Q3}
N -1950 -3250 -1940 -3250 {
lab=Q3}
N -2490 -3050 -2490 -2920 {
lab=#net6}
N -2480 -2660 -2450 -2660 {
lab=#net6}
N -2330 -2670 -2200 -2670 {
lab=#net7}
N -2330 -2680 -2330 -2670 {
lab=#net7}
N -2450 -2810 -2450 -2700 {
lab=Q4}
N -2450 -2810 -1950 -2810 {
lab=Q4}
N -1950 -2810 -1950 -2670 {
lab=Q4}
N -1960 -2670 -1950 -2670 {
lab=Q4}
N -2580 -3830 -2480 -3830 {
lab=#net2}
N -2600 -4130 -2490 -4130 {
lab=#net2}
N -2600 -4130 -2600 -3840 {
lab=#net2}
N -2600 -3840 -2600 -3830 {
lab=#net2}
N -2600 -3830 -2570 -3830 {
lab=#net2}
N -2610 -3210 -2470 -3210 {
lab=#net4}
N -2610 -3570 -2610 -3210 {
lab=#net4}
N -2610 -3570 -2500 -3570 {
lab=#net4}
N -2490 -2660 -2480 -2660 {
lab=#net6}
N -2490 -2920 -2490 -2660 {
lab=#net6}
N -3140 -4030 -2900 -4030 {
lab=GND}
C {and_gate.sym} -2490 -4320 1 0 {name=X1}
C {ffdr.sym} -2180 -4210 0 0 {name=X2}
C {xor_gate.sym} -2380 -4470 0 0 {name=X3}
C {devices/lab_pin.sym} -2530 -4320 0 0 {name=p1 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2130 -4200 0 0 {name=p2 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2380 -4510 0 0 {name=p3 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2010 -4200 0 1 {name=p4 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2450 -4320 0 1 {name=p5 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2380 -4430 0 1 {name=p6 sig_type=std_logic lab=gnd}
C {and_gate.sym} -2500 -3740 1 0 {name=X4}
C {ffdr.sym} -2190 -3630 0 0 {name=X5}
C {xor_gate.sym} -2390 -3890 0 0 {name=X6}
C {devices/lab_pin.sym} -2540 -3740 0 0 {name=p7 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2140 -3620 0 0 {name=p8 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2390 -3930 0 0 {name=p9 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2020 -3620 0 1 {name=p10 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2460 -3740 0 1 {name=p11 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2390 -3850 0 1 {name=p12 sig_type=std_logic lab=gnd}
C {and_gate.sym} -2490 -3110 1 0 {name=X7}
C {ffdr.sym} -2180 -3000 0 0 {name=X8}
C {xor_gate.sym} -2380 -3260 0 0 {name=X9}
C {devices/lab_pin.sym} -2530 -3110 0 0 {name=p13 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2130 -2990 0 0 {name=p14 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2380 -3300 0 0 {name=p15 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2010 -2990 0 1 {name=p16 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2450 -3110 0 1 {name=p17 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2380 -3220 0 1 {name=p18 sig_type=std_logic lab=gnd}
C {ffdr.sym} -2190 -2420 0 0 {name=X11}
C {xor_gate.sym} -2390 -2680 0 0 {name=X12}
C {devices/lab_pin.sym} -2140 -2410 0 0 {name=p20 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2390 -2720 0 0 {name=p21 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -2020 -2410 0 1 {name=p22 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2390 -2640 0 1 {name=p24 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -2070 -4540 3 1 {name=p19 sig_type=std_logic lab=clr}
C {devices/lab_pin.sym} -2190 -4330 0 0 {name=p23 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -2080 -3960 3 1 {name=p25 sig_type=std_logic lab=clr}
C {devices/lab_pin.sym} -2200 -3750 0 0 {name=p26 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -2070 -3330 3 1 {name=p27 sig_type=std_logic lab=clr}
C {devices/lab_pin.sym} -2190 -3120 0 0 {name=p28 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -2080 -2750 3 1 {name=p29 sig_type=std_logic lab=clr}
C {devices/lab_pin.sym} -2200 -2540 0 0 {name=p30 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -1940 -4520 0 1 {name=p31 sig_type=std_logic lab=Q1}
C {devices/lab_pin.sym} -1950 -3930 0 1 {name=p32 sig_type=std_logic lab=Q2}
C {devices/lab_pin.sym} -1940 -3330 0 1 {name=p33 sig_type=std_logic lab=Q3}
C {devices/lab_pin.sym} -1950 -2710 0 1 {name=p34 sig_type=std_logic lab=Q4}
C {devices/lab_pin.sym} -2470 -4450 0 0 {name=p35 sig_type=std_logic lab=CE}
C {devices/code_shown.sym} -3240 -4350 0 0 {name=NGSPICE only_toplevel=false value="

.param period=10n
.param span=4
.param stoptime=\{48*period\}
.tran \{0.1*period\} \{stoptime\}
.include /home/designer/.volare/sky130A/libs.tech/ngspice/sky130.lib.spice TT
.lib /home/designer/.volare/sky130A/libs.tech/ngspice/sky130.lib.spice TT
.control
run
plot \{q1 + 2\} \{q2 + 4\} \{q3 + 6\} \{q4 +8\} \{ce + 10\} \{clk + 12\} 
.endc
"}
C {devices/vsource.sym} -3140 -4060 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/vsource.sym} -3060 -4060 0 0 {name=V2 value=PULSE(1.8 0 \{0*period\} 10ps 10ps \{period/2\} \{period\} 1) savecurrent=false}
C {devices/vsource.sym} -2980 -4060 0 0 {name=V3 value=PULSE(0 1.8 \{0*period\} 10ps 10ps \{period/2\} \{period\} 1) savecurrent=false}
C {devices/vsource.sym} -2900 -4060 0 0 {name=V4 value=PULSE(0 1.8 \{0*period\} 10ps 10ps \{period/2\} \{period\}) savecurrent=false}
C {devices/gnd.sym} -3020 -4030 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -3140 -4090 0 1 {name=p37 sig_type=std_logic lab=V}
C {devices/lab_pin.sym} -3060 -4090 0 1 {name=p38 sig_type=std_logic lab=CE}
C {devices/lab_pin.sym} -2980 -4090 0 1 {name=p39 sig_type=std_logic lab=clr}
C {devices/lab_pin.sym} -2900 -4090 0 1 {name=p40 sig_type=std_logic lab=clk}
C {devices/code.sym} -3260 -3930 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
