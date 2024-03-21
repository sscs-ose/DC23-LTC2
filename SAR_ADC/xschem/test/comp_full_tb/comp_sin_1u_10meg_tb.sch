v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -530 360 -530 {
lab=Vindiff}
N 230 -530 260 -530 {
lab=Vin1}
N 230 -490 260 -490 {
lab=Vin2}
N 390 -340 390 -330 {
lab=V}
N 310 -340 310 -330 {
lab=clk}
N 240 -340 240 -330 {
lab=Vin2}
N 160 -340 160 -330 {
lab=Vin1}
N 360 -550 360 -530 {
lab=Vindiff}
N 600 -690 1150 -690 {
lab=GND}
N 600 -740 600 -690 {
lab=GND}
N 890 -770 890 -690 {
lab=GND}
N 600 -920 1150 -920 {
lab=V}
N 600 -920 600 -910 {
lab=V}
N 890 -920 890 -910 {
lab=V}
N 960 -880 1070 -880 {
lab=Vsap}
N 950 -870 960 -870 {
lab=Vsap}
N 960 -880 960 -870 {
lab=Vsap}
N 750 -800 840 -800 {
lab=clk}
N 750 -800 750 -720 {
lab=clk}
N 470 -720 750 -720 {
lab=clk}
N 470 -790 470 -720 {
lab=clk}
N 470 -790 520 -790 {
lab=clk}
N 910 -690 910 -660 {
lab=GND}
N 470 -830 520 -830 {
lab=Vin2}
N 470 -880 520 -880 {
lab=Vin1}
N 1710 -780 1710 -690 {
lab=GND}
N 1150 -690 1710 -690 {
lab=GND}
N 1290 -920 1710 -920 {
lab=V}
N 1150 -920 1290 -920 {
lab=V}
N 1390 -880 1630 -880 {
lab=#net1}
N 1130 -840 1290 -840 {
lab=GND}
N 1390 -730 1630 -730 {
lab=#net2}
N 1630 -820 1630 -730 {
lab=#net2}
N 1130 -770 1290 -770 {
lab=V}
N 1290 -770 1450 -770 {
lab=V}
N 1450 -920 1450 -770 {
lab=V}
N 950 -730 1070 -730 {
lab=Vsan}
N 950 -810 950 -730 {
lab=Vsan}
N 1130 -840 1130 -810 {
lab=GND}
N 1010 -810 1130 -810 {
lab=GND}
N 1010 -810 1010 -690 {
lab=GND}
N 1010 -890 1010 -880 {
lab=Vsap}
N 680 -880 840 -880 {
lab=Vpap}
N 680 -820 840 -820 {
lab=Vpan}
N 680 -820 680 -780 {
lab=Vpan}
C {devices/vsource.sym} 160 -300 0 0 {name=V1 value="SIN(0 100u  7.81meg)"}
C {devices/vsource.sym} 240 -300 0 0 {name=V2 value=0.2}
C {devices/vsource.sym} 310 -300 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 4n 8n)"}
C {devices/gnd.sym} 910 -660 0 0 {name=l1 lab=GND
wx=1u}
C {devices/gnd.sym} 240 -270 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 310 -270 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 160 -340 0 0 {name=p1 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 240 -340 0 0 {name=p2 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 310 -340 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 470 -760 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 390 -300 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 390 -270 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 390 -340 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 1010 -920 0 0 {name=p8 sig_type=std_logic lab=V
wx=1u}
C {devices/lab_wire.sym} 230 -530 0 0 {name=p9 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 230 -490 0 0 {name=p10 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 290 -470 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 360 -550 0 0 {name=p11 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 1790 -880 0 1 {name=p12 sig_type=std_logic lab=outcomp
}
C {devices/code_shown.sym} 70 -760 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 50p 500n  
plot \{vindiff * 100000\} outcomp \{clk/3.3\}
*plot outcomp
*plot vindiff
*plot outcomp vin1 vin2
plot \{vpap - vpan\}   \{vindiff * 100000\} clk
*plot vsap vsan clk
*plot vpap
*plot vpan
.endc"}
C {devices/code.sym} 60 -560 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {Vdiffmeter.sym} 260 -470 0 0 {name=X2}
C {devices/lab_wire.sym} 160 -270 0 0 {name=p13 sig_type=std_logic lab=Vin2}
C {SR_nor.sym} 1670 -800 0 0 {name=X3}
C {inv.sym} 1290 -880 0 0 {name=x4 cl=0.28u wp=0.44u wn=0.22u
wx=1u}
C {inv.sym} 1130 -880 0 0 {name=x5 cl=0.28u wp=0.44u wn=0.22u
wx=0.5u}
C {inv.sym} 1290 -730 0 0 {name=x6 cl=0.28u wp=0.44u wn=0.22u
wx=1u}
C {inv.sym} 1130 -730 0 0 {name=x7 cl=0.28u wp=0.44u wn=0.22u
wx=0.5u}
C {strongarm.sym} 850 -780 0 0 {name=X8}
C {preamp.sym} 530 -760 0 0 {name=X9}
C {devices/lab_wire.sym} 1010 -890 0 0 {name=p14 sig_type=std_logic lab=Vsap}
C {devices/lab_wire.sym} 950 -730 0 0 {name=p15 sig_type=std_logic lab=Vsan}
C {devices/lab_wire.sym} 680 -880 0 1 {name=p16 sig_type=std_logic lab=Vpap}
C {devices/lab_wire.sym} 680 -780 0 1 {name=p17 sig_type=std_logic lab=Vpan}
C {devices/lab_wire.sym} 470 -880 0 0 {name=p18 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 470 -830 0 0 {name=p19 sig_type=std_logic lab=Vin2}
