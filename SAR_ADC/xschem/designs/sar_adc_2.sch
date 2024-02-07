v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 480 -0 500 0 {
lab=compout}
N 280 -160 280 0 {
lab=clk}
N 280 -160 560 -160 {
lab=clk}
N 560 -160 560 -150 {
lab=clk}
N 580 -340 580 -150 {
lab=rst}
N -220 -0 320 0 {
lab=clk}
N 620 -180 620 -150 {
lab=vdd}
N 300 -20 320 -20 {
lab=compp}
N 300 20 320 20 {
lab=compn}
N 300 -50 300 -20 {
lab=compp}
N 300 20 300 50 {
lab=compn}
N 470 -50 470 0 {
lab=compout}
N 390 -180 620 -180 {
lab=vdd}
N 390 35 390 50 {
lab=gnd}
N 390 -60 390 -30 {
lab=vdd}
N -450 -70 -450 110 {
lab=#net1}
N -280 20 130 20 {
lab=compn}
N -280 20 -280 110 {
lab=compn}
N -330 110 -280 110 {
lab=compn}
N -280 -70 -280 -20 {
lab=compp}
N -330 -70 -280 -70 {
lab=compp}
N -410 -10 -410 170 {
lab=vdd}
N -390 -10 -390 170 {
lab=#net2}
N -90 -200 -10 -200 {
lab=vdd}
N -520 10 -450 10 {
lab=#net1}
N -280 -20 130 -20 {
lab=compp}
N 130 -20 310 -20 {
lab=compp}
N 130 20 300 20 {
lab=compn}
N 410 -690 410 -550 {
lab=#net3}
N 420 0 470 -0 {
lab=compout}
N 740 -400 740 -360 {
lab=sample}
N 740 -350 810 -350 {
lab=sample}
N 740 -370 740 -350 {
lab=sample}
N 810 -350 820 -350 {
lab=sample}
N 470 0 480 0 {
lab=compout}
N -90 -140 -10 -140 {
lab=vdd}
N -90 -200 -90 -140 {
lab=vdd}
N -80 200 -10 200 {
lab=vdd}
N -80 140 -80 200 {
lab=vdd}
N -80 140 -10 140 {
lab=vdd}
C {cdac_2.sym} 130 160 1 1 {name=x1 cu=5u}
C {cdac_2n.sym} 130 -160 1 0 {name=x2 cu=5u}
C {devices/ipin.sym} -10 160 0 0 {name=p1 lab=vinn}
C {devices/ipin.sym} -10 -160 0 0 {name=p2 lab=vinp}
C {Preamp-Strong-Latch.sym} 340 30 0 0 {name=X5}
C {sar_logic.sym} 520 130 0 0 {name=X6}
C {devices/ipin.sym} -220 0 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 580 -340 1 0 {name=p5 lab=rst}
C {devices/ipin.sym} 390 -180 0 0 {name=p6 lab=vdd}
C {devices/ipin.sym} 560 150 0 0 {name=p7 lab=gnd}
C {devices/lab_pin.sym} 240 -280 3 1 {name=l1 sig_type=std_logic lab=d[0]}
C {devices/lab_pin.sym} 220 -280 3 1 {name=l2 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 200 -280 3 1 {name=l3 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 180 -280 3 1 {name=l4 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 160 -280 3 1 {name=l5 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 140 -280 3 1 {name=l6 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 120 -280 3 1 {name=l7 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 100 -280 3 1 {name=l8 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 80 -280 3 1 {name=l9 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 60 -280 3 1 {name=l10 sig_type=std_logic lab=d[9]}
C {devices/lab_pin.sym} 40 -280 3 1 {name=l11 sig_type=std_logic lab=d[10]}
C {devices/lab_pin.sym} 20 -280 3 1 {name=l12 sig_type=std_logic lab=d[11]}
C {devices/lab_pin.sym} 240 280 3 0 {name=l13 sig_type=std_logic lab=d[0]}
C {devices/lab_pin.sym} 220 280 3 0 {name=l14 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 200 280 3 0 {name=l15 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 180 280 3 0 {name=l16 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 160 280 3 0 {name=l17 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 140 280 3 0 {name=l18 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 120 280 3 0 {name=l19 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 100 280 3 0 {name=l20 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 80 280 3 0 {name=l21 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 60 280 3 0 {name=l22 sig_type=std_logic lab=d[9]}
C {devices/lab_pin.sym} 40 280 3 0 {name=l23 sig_type=std_logic lab=d[10]}
C {devices/lab_pin.sym} 20 280 3 0 {name=l24 sig_type=std_logic lab=d[11]}
C {devices/opin.sym} 680 -110 0 0 {name=p25 sig_type=std_logic lab=d[0]}
C {devices/opin.sym} 680 -90 0 0 {name=p26 sig_type=std_logic lab=d[1]}
C {devices/opin.sym} 680 -70 0 0 {name=p27 sig_type=std_logic lab=d[2]}
C {devices/opin.sym} 680 -50 0 0 {name=p28 sig_type=std_logic lab=d[3]}
C {devices/opin.sym} 680 -30 0 0 {name=p29 sig_type=std_logic lab=d[4]}
C {devices/opin.sym} 680 -10 0 0 {name=p30 sig_type=std_logic lab=d[5]}
C {devices/opin.sym} 680 10 0 0 {name=p31 sig_type=std_logic lab=d[6]}
C {devices/opin.sym} 680 30 0 0 {name=p32 sig_type=std_logic lab=d[7]}
C {devices/opin.sym} 680 50 0 0 {name=p33 sig_type=std_logic lab=d[8]}
C {devices/opin.sym} 680 70 0 0 {name=p34 sig_type=std_logic lab=d[9]}
C {devices/opin.sym} 680 90 0 0 {name=p35 sig_type=std_logic lab=d[10]}
C {devices/opin.sym} 680 110 0 0 {name=p36 sig_type=std_logic lab=d[11]}
C {devices/opin.sym} 300 -50 3 0 {name=p4 sig_type=std_logic lab=compp}
C {devices/opin.sym} 300 50 1 0 {name=p8 sig_type=std_logic lab=compn}
C {devices/opin.sym} 470 -50 3 0 {name=p9 sig_type=std_logic lab=compout}
C {devices/opin.sym} 620 150 2 1 {name=p10 sig_type=std_logic lab=eoc}
C {devices/lab_pin.sym} -10 -180 0 0 {name=p11 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -10 180 0 0 {name=p13 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -80 170 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -90 -170 0 0 {name=p18 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 270 -170 0 1 {name=p15 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} 270 170 0 1 {name=p16 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} 390 50 0 0 {name=p20 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 390 -60 0 0 {name=p21 sig_type=std_logic lab=vdd}
C {bootstrap_sw.sym} -390 -110 0 0 {name=x3}
C {bootstrap_sw.sym} -390 70 0 0 {name=x4}
C {devices/lab_pin.sym} -330 90 0 1 {name=p19 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} -330 -90 0 1 {name=p22 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} -370 170 0 1 {name=p39 sig_type=std_logic lab=nsample}
C {devices/lab_pin.sym} 320 -570 0 0 {name=p42 sig_type=std_logic lab=eoc}
C {devices/lab_pin.sym} 890 -550 0 1 {name=p47 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} 730 -690 3 1 {name=p23 sig_type=std_logic lab=nsample}
C {devices/vsource.sym} -520 40 0 0 {name=V1 value=1.65 savecurrent=false}
C {devices/lab_pin.sym} -520 70 0 0 {name=p37 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 240 280 3 0 {name=l25 sig_type=std_logic lab=d[0]}
C {devices/lab_pin.sym} 220 280 3 0 {name=l26 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 200 280 3 0 {name=l27 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 180 280 3 0 {name=l28 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 160 280 3 0 {name=l29 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 140 280 3 0 {name=l30 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 120 280 3 0 {name=l31 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 100 280 3 0 {name=l32 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 80 280 3 0 {name=l33 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 60 280 3 0 {name=l34 sig_type=std_logic lab=d[9]}
C {devices/lab_pin.sym} 40 280 3 0 {name=l35 sig_type=std_logic lab=d[10]}
C {devices/lab_pin.sym} 20 280 3 0 {name=l36 sig_type=std_logic lab=d[11]}
C {devices/lab_pin.sym} -370 -10 0 1 {name=p24 sig_type=std_logic lab=nsample}
C {norgate.sym} 320 -520 0 0 {name=X11}
C {devices/lab_pin.sym} 320 -520 0 0 {name=p46 sig_type=std_logic lab=rst}
C {devices/lab_pin.sym} 360 -570 0 0 {name=p51 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 360 -520 0 0 {name=p52 sig_type=std_logic lab=vdd}
C {inv.sym} 470 -550 0 0 {name=x8 cl=0.28u wp=0.44u wn=0.22u}
C {devices/lab_pin.sym} 470 -510 0 0 {name=p40 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 470 -590 0 0 {name=p41 sig_type=std_logic lab=vdd}
C {inv.sym} 630 -550 0 0 {name=x9 cl=0.28u wp=0.44u wn=1u}
C {devices/lab_pin.sym} 630 -510 0 0 {name=p48 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 630 -590 0 0 {name=p49 sig_type=std_logic lab=vdd}
C {inv.sym} 790 -550 0 0 {name=x10 cl=0.28u wp=0.44u wn=12u}
C {devices/lab_pin.sym} 790 -510 0 0 {name=p50 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 790 -590 0 0 {name=p53 sig_type=std_logic lab=vdd}
C {inv.sym} 470 -690 0 0 {name=x12 cl=0.28u wp=0.44u wn=1u}
C {devices/lab_pin.sym} 470 -650 0 0 {name=p56 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 470 -730 0 0 {name=p57 sig_type=std_logic lab=vdd}
C {inv.sym} 630 -690 0 0 {name=x13 cl=0.28u wp=0.44u wn=12u}
C {devices/lab_pin.sym} 630 -650 0 0 {name=p58 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 630 -730 0 0 {name=p59 sig_type=std_logic lab=vdd}
C {inv.sym} 880 -350 0 0 {name=x14 cl=0.28u wp=0.44u wn=.22u}
C {devices/lab_pin.sym} 880 -310 0 0 {name=p43 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 880 -390 0 0 {name=p60 sig_type=std_logic lab=vdd}
C {inv.sym} 1040 -350 0 0 {name=x19 cl=0.28u wp=0.44u wn=12u}
C {devices/lab_pin.sym} 1040 -310 0 0 {name=p68 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 1040 -390 0 0 {name=p69 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 740 -390 0 1 {name=p70 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} 1140 -350 0 1 {name=p71 sig_type=std_logic lab=sampled}
C {devices/lab_pin.sym} 980 -290 0 0 {name=p38 sig_type=std_logic lab=gnd}
C {devices/capa.sym} 980 -320 0 0 {name=C1
m=1
value=.3p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -410 20 0 0 {name=p17 sig_type=std_logic lab=vdd}
