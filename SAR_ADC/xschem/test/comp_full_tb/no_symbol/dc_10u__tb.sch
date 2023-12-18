v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 600 -100 1150 -100 {
lab=GND}
N 600 -150 600 -100 {
lab=GND}
N 890 -180 890 -100 {
lab=GND}
N 600 -330 1150 -330 {
lab=V}
N 600 -330 600 -320 {
lab=V}
N 890 -330 890 -320 {
lab=V}
N 960 -290 1070 -290 {
lab=Vout1comp}
N 950 -280 960 -280 {
lab=Vout1comp}
N 960 -290 960 -280 {
lab=Vout1comp}
N 950 -220 1070 -220 {
lab=Vout2comp}
N 750 -210 840 -210 {
lab=clk}
N 1230 -290 1260 -290 {
lab=#net1}
N 880 -370 910 -370 {
lab=V}
N 880 -370 880 -330 {
lab=V}
N 910 -100 910 -70 {
lab=GND}
N 470 -240 520 -240 {
lab=Vin2}
N 470 -290 520 -290 {
lab=Vin1}
N -250 -530 -210 -530 {
lab=Vindiff}
N -340 -530 -310 -530 {
lab=Vin1}
N -340 -490 -310 -490 {
lab=Vin2}
N -210 -550 -210 -530 {
lab=Vindiff}
N 720 -650 760 -650 {
lab=Voutpreamp}
N 630 -650 660 -650 {
lab=Vout1preamp}
N 630 -610 660 -610 {
lab=Vout2preamp}
N 760 -670 760 -650 {
lab=Voutpreamp}
N 990 -650 1030 -650 {
lab=Voutcomp}
N 900 -650 930 -650 {
lab=Vout1comp}
N 900 -610 930 -610 {
lab=Vout2comp}
N 1030 -670 1030 -650 {
lab=Voutcomp}
N 680 -220 680 -190 {
lab=Vout2preamp}
N 680 -230 680 -220 {
lab=Vout2preamp}
N 650 -10 740 -10 {
lab=clk}
N 740 -210 750 -210 {
lab=clk}
N 480 -10 650 -10 {
lab=clk}
N -150 -160 -150 -150 {
lab=V}
N -230 -160 -230 -150 {
lab=clk}
N -300 -160 -300 -150 {
lab=Vin2}
N -380 -160 -380 -150 {
lab=Vin1}
N 740 -210 740 -150 {
lab=clk}
N 520 -200 520 -10 {
lab=clk}
N 740 -150 740 -110 {
lab=clk}
N 740 -110 740 -10 {
lab=clk}
N 1150 -100 1300 -100 {
lab=GND}
N 1150 -330 1300 -330 {
lab=V}
N 1060 -220 1060 -180 {
lab=Vout2comp}
N 1120 -140 1120 -100 {
lab=GND}
N 1420 -290 1500 -290 {
lab=#net2}
N 1500 -290 1500 -280 {
lab=#net2}
N 1500 -220 1500 -180 {
lab=#net3}
N 1380 -180 1500 -180 {
lab=#net3}
N 1300 -100 1580 -100 {
lab=GND}
N 1580 -180 1580 -100 {
lab=GND}
N 1280 -140 1280 -100 {
lab=GND}
N 1300 -330 1320 -330 {
lab=V}
N 1580 -340 1580 -320 {
lab=V}
N 1320 -330 1580 -330 {
lab=V}
N 800 -230 840 -230 {
lab=Vout2preamp}
N 680 -290 840 -290 {
lab=Vout1preamp}
N 680 -230 800 -230 {
lab=Vout2preamp}
C {devices/gnd.sym} 910 -70 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} 470 -290 0 0 {name=p10 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 470 -240 0 0 {name=p11 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 480 -10 0 0 {name=p12 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 910 -370 0 0 {name=p14 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} -340 -530 0 0 {name=p15 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} -340 -490 0 0 {name=p16 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} -280 -470 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} -210 -550 0 0 {name=p17 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 1660 -280 0 0 {name=p18 sig_type=std_logic lab=outcomp
}
C {devices/code_shown.sym} 70 -640 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 50p 50n

plot \{vindiff * 100000\} \{voutpreamp * 100\} clk
plot \{vindiff * 100000\} outcomp clk
plot \{voutpreamp * 100\} voutcomp clk
plot \{voutpreamp / (10u) \} \{1000* clk\}

.endc"}
C {devices/code.sym} -510 -560 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/lab_wire.sym} 630 -650 0 0 {name=p1 sig_type=std_logic lab=Vout1preamp}
C {devices/lab_wire.sym} 630 -610 0 0 {name=p2 sig_type=std_logic lab=Vout2preamp}
C {devices/gnd.sym} 690 -590 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 760 -670 0 0 {name=p3 sig_type=std_logic lab=Voutpreamp
}
C {devices/lab_wire.sym} 900 -650 0 0 {name=p7 sig_type=std_logic lab=Vout1comp}
C {devices/lab_wire.sym} 900 -610 0 0 {name=p8 sig_type=std_logic lab=Vout2comp}
C {devices/gnd.sym} 960 -590 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} 1030 -670 0 0 {name=p9 sig_type=std_logic lab=Voutcomp
}
C {devices/lab_wire.sym} 680 -290 0 0 {name=p19 sig_type=std_logic lab=Vout1preamp}
C {devices/lab_wire.sym} 680 -190 0 0 {name=p20 sig_type=std_logic lab=Vout2preamp}
C {devices/lab_wire.sym} 1050 -290 0 0 {name=p21 sig_type=std_logic lab=Vout1comp}
C {devices/lab_wire.sym} 1050 -220 0 0 {name=p22 sig_type=std_logic lab=Vout2comp}
C {devices/vsource.sym} -380 -120 0 0 {name=V1 value=1u}
C {devices/vsource.sym} -300 -120 0 0 {name=V2 value=1.6}
C {devices/vsource.sym} -230 -120 0 0 {name=V3 value="PULSE(0 3 0 10p 10p 5n 10n)"}
C {devices/gnd.sym} -300 -90 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} -230 -90 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} -380 -160 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} -300 -160 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} -230 -160 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} -150 -120 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} -150 -90 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} -150 -160 0 0 {name=p13 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1120 -220 0 0 {name=p23 sig_type=std_logic lab=V
}
C {devices/gnd.sym} 1130 -250 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} 1280 -220 0 0 {name=p24 sig_type=std_logic lab=V
}
C {devices/gnd.sym} 1320 -250 0 0 {name=l10 lab=GND}
C {devices/lab_wire.sym} -380 -90 0 0 {name=p25 sig_type=std_logic lab=Vin2}
C {../../../../symbols/Vdiffmeter.sym} 660 -590 0 0 {name=X2}
C {../../../../symbols/Vdiffmeter.sym} 930 -590 0 0 {name=X6}
C {../../../../symbols/Vdiffmeter.sym} -310 -470 0 0 {name=X5}
C {../../../../symbols/inv.sym} 1320 -290 0 0 {name=x9 cl=0.28u wp=0.44u wn=0.22u}
C {../../../../symbols/inv.sym} 1130 -290 0 0 {name=x7 cl=0.28u wp=0.44u wn=0.22u}
C {../../../../symbols/inv.sym} 1120 -180 0 0 {name=x8 cl=0.28u wp=0.44u wn=0.22u}
C {../../../../symbols/inv.sym} 1280 -180 0 0 {name=x10 cl=0.28u wp=0.44u wn=0.22u}
C {../../../../symbols/SR_nor.sym} 1540 -200 0 0 {name=X11}
C {../../../../symbols/preamp.sym} 530 -170 0 0 {name=X1}
C {../../../../symbols/strongarm.sym} 850 -190 0 0 {name=X12}
