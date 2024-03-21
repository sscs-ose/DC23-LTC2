v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 480 -0 500 0 {
lab=compout}
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
N 390 35 390 50 {
lab=gnd}
N 390 -60 390 -30 {
lab=vdd}
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
N -280 -20 130 -20 {
lab=compp}
N 130 -20 310 -20 {
lab=compp}
N 130 20 300 20 {
lab=compn}
N -570 -360 -570 -220 {
lab=samplex}
N 420 0 470 -0 {
lab=compout}
N 470 0 480 0 {
lab=compout}
N -60 0 320 -0 {
lab=#net1}
N 420 50 420 90 {
lab=vpp}
N 440 50 440 90 {
lab=vpn}
N 440 40 440 50 {
lab=vpn}
N 420 40 420 50 {
lab=vpp}
N -60 -70 -60 -0 {
lab=#net1}
C {cdac.sym} 130 160 1 1 {name=x1 cu=5u}
C {cdac.sym} 130 -160 1 0 {name=x2 cu=5u}
C {devices/ipin.sym} -450 110 0 0 {name=p1 lab=vinn}
C {devices/ipin.sym} -450 -70 0 0 {name=p2 lab=vinp}
C {Preamp-Strong-Latch.sym} 340 30 0 0 {name=X5}
C {sar_logic.sym} 520 250 0 0 {name=X6}
C {devices/ipin.sym} 560 -270 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 580 -270 1 0 {name=p5 lab=rst}
C {devices/ipin.sym} 620 -270 1 0 {name=p6 lab=vdd}
C {devices/ipin.sym} 560 270 0 0 {name=p7 lab=gnd}
C {devices/opin.sym} 680 10 0 0 {name=p25 sig_type=std_logic lab=d[0]}
C {devices/opin.sym} 680 30 0 0 {name=p26 sig_type=std_logic lab=d[1]}
C {devices/opin.sym} 680 50 0 0 {name=p27 sig_type=std_logic lab=d[2]}
C {devices/opin.sym} 680 70 0 0 {name=p28 sig_type=std_logic lab=d[3]}
C {devices/opin.sym} 680 90 0 0 {name=p29 sig_type=std_logic lab=d[4]}
C {devices/opin.sym} 680 110 0 0 {name=p30 sig_type=std_logic lab=d[5]}
C {devices/opin.sym} 680 130 0 0 {name=p31 sig_type=std_logic lab=d[6]}
C {devices/opin.sym} 680 150 0 0 {name=p32 sig_type=std_logic lab=d[7]}
C {devices/opin.sym} 680 170 0 0 {name=p33 sig_type=std_logic lab=d[8]}
C {devices/opin.sym} 680 190 0 0 {name=p34 sig_type=std_logic lab=d[9]}
C {devices/opin.sym} 680 210 0 0 {name=p35 sig_type=std_logic lab=d[10]}
C {devices/opin.sym} 680 230 0 0 {name=p36 sig_type=std_logic lab=d[11]}
C {devices/opin.sym} 300 -50 3 0 {name=p4 sig_type=std_logic lab=compp}
C {devices/opin.sym} 300 50 1 0 {name=p8 sig_type=std_logic lab=compn}
C {devices/opin.sym} 470 -50 3 0 {name=p9 sig_type=std_logic lab=compout}
C {devices/opin.sym} 620 270 2 1 {name=p10 sig_type=std_logic lab=eoc}
C {devices/lab_pin.sym} -10 -180 0 0 {name=p11 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -10 180 0 0 {name=p13 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -10 140 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -10 -140 0 0 {name=p18 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 390 50 0 0 {name=p20 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} 390 -60 0 0 {name=p21 sig_type=std_logic lab=vdd}
C {bootstrap_sw.sym} -390 -110 0 0 {name=x3}
C {bootstrap_sw.sym} -390 70 0 0 {name=x4}
C {devices/lab_pin.sym} -330 90 0 1 {name=p19 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} -330 -90 0 1 {name=p22 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} -370 170 0 1 {name=p39 sig_type=std_logic lab=nsample}
C {devices/lab_pin.sym} -570 -300 0 0 {name=p42 sig_type=std_logic lab=samplex}
C {devices/lab_pin.sym} -250 -360 0 1 {name=p47 sig_type=std_logic lab=sample}
C {devices/lab_pin.sym} -90 -220 2 0 {name=p23 sig_type=std_logic lab=nsample}
C {devices/lab_pin.sym} -390 170 3 0 {name=p37 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -370 -10 0 1 {name=p24 sig_type=std_logic lab=nsample}
C {inv.sym} -510 -220 0 0 {name=x8 cl=0.28u wp=0.44u wn=0.22u}
C {devices/lab_pin.sym} -510 -180 0 0 {name=p40 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -510 -260 0 0 {name=p41 sig_type=std_logic lab=vdd}
C {inv.sym} -350 -220 0 0 {name=x9 cl=0.28u wp=0.44u wn=.22u}
C {devices/lab_pin.sym} -350 -180 0 0 {name=p48 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -350 -260 0 0 {name=p49 sig_type=std_logic lab=vdd}
C {inv.sym} -190 -220 0 0 {name=x10 cl=0.28u wp=0.44u wn=1u}
C {devices/lab_pin.sym} -190 -180 0 0 {name=p50 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -190 -260 0 0 {name=p53 sig_type=std_logic lab=vdd}
C {inv.sym} -510 -360 0 0 {name=x12 cl=0.28u wp=0.44u wn=1u}
C {devices/lab_pin.sym} -510 -320 0 0 {name=p56 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -510 -400 0 0 {name=p57 sig_type=std_logic lab=vdd}
C {inv.sym} -350 -360 0 0 {name=x13 cl=0.28u wp=0.44u wn=1u}
C {devices/lab_pin.sym} -350 -320 0 0 {name=p58 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -350 -400 0 0 {name=p59 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -410 -10 3 0 {name=p17 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 20 280 1 1 {name=l37 sig_type=std_logic lab=d[0]}
C {devices/lab_pin.sym} 40 280 1 1 {name=l38 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 60 280 1 1 {name=l39 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 80 280 1 1 {name=l40 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 100 280 1 1 {name=l41 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 120 280 1 1 {name=l42 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 140 280 1 1 {name=l43 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 160 280 1 1 {name=l44 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 180 280 1 1 {name=l45 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 200 280 1 1 {name=l46 sig_type=std_logic lab=d[9]}
C {devices/lab_pin.sym} 220 280 1 1 {name=l47 sig_type=std_logic lab=d[10]}
C {devices/lab_pin.sym} 240 280 1 1 {name=l48 sig_type=std_logic lab=d[11]}
C {devices/lab_pin.sym} 680 -230 2 0 {name=l13 sig_type=std_logic lab=d[0]b}
C {devices/lab_pin.sym} 680 -210 2 0 {name=l14 sig_type=std_logic lab=d[1]b}
C {devices/lab_pin.sym} 680 -190 2 0 {name=l15 sig_type=std_logic lab=d[2]b}
C {devices/lab_pin.sym} 680 -170 2 0 {name=l16 sig_type=std_logic lab=d[3]b}
C {devices/lab_pin.sym} 680 -150 2 0 {name=l17 sig_type=std_logic lab=d[4]b}
C {devices/lab_pin.sym} 680 -130 2 0 {name=l18 sig_type=std_logic lab=d[5]b}
C {devices/lab_pin.sym} 680 -110 2 0 {name=l19 sig_type=std_logic lab=d[6]b}
C {devices/lab_pin.sym} 680 -90 2 0 {name=l20 sig_type=std_logic lab=d[7]b}
C {devices/lab_pin.sym} 680 -70 2 0 {name=l21 sig_type=std_logic lab=d[8]b}
C {devices/lab_pin.sym} 680 -50 2 0 {name=l22 sig_type=std_logic lab=d[9]b}
C {devices/lab_pin.sym} 680 -30 2 0 {name=l23 sig_type=std_logic lab=d[10]b}
C {devices/lab_pin.sym} 680 -10 2 0 {name=l24 sig_type=std_logic lab=d[11]b}
C {devices/lab_pin.sym} 20 -280 1 0 {name=l1 sig_type=std_logic lab=d[0]b}
C {devices/lab_pin.sym} 40 -280 1 0 {name=l2 sig_type=std_logic lab=d[1]b}
C {devices/lab_pin.sym} 60 -280 1 0 {name=l3 sig_type=std_logic lab=d[2]b}
C {devices/lab_pin.sym} 80 -280 1 0 {name=l4 sig_type=std_logic lab=d[3]b}
C {devices/lab_pin.sym} 100 -280 1 0 {name=l5 sig_type=std_logic lab=d[4]b}
C {devices/lab_pin.sym} 120 -280 1 0 {name=l6 sig_type=std_logic lab=d[5]b}
C {devices/lab_pin.sym} 140 -280 1 0 {name=l7 sig_type=std_logic lab=d[6]b}
C {devices/lab_pin.sym} 160 -280 1 0 {name=l8 sig_type=std_logic lab=d[7]b}
C {devices/lab_pin.sym} 180 -280 1 0 {name=l9 sig_type=std_logic lab=d[8]b}
C {devices/lab_pin.sym} 200 -280 1 0 {name=l10 sig_type=std_logic lab=d[9]b}
C {devices/lab_pin.sym} 220 -280 1 0 {name=l11 sig_type=std_logic lab=d[10]b}
C {devices/lab_pin.sym} 240 -280 1 0 {name=l12 sig_type=std_logic lab=d[11]b}
C {devices/lab_pin.sym} -390 -10 3 0 {name=p14 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -410 170 3 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 500 180 3 0 {name=p38 sig_type=std_logic lab=samplex}
C {inv.sym} -160 -70 0 0 {name=x7 cl=0.28u wp=0.44u wn=10u}
C {devices/lab_pin.sym} -160 -30 0 0 {name=p43 sig_type=std_logic lab=gnd}
C {devices/lab_pin.sym} -160 -110 0 0 {name=p44 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -220 -70 0 0 {name=p16 sig_type=std_logic lab=clk}
C {devices/opin.sym} 420 90 1 0 {name=p45 sig_type=std_logic lab=vpp}
C {devices/opin.sym} 440 90 1 0 {name=p46 sig_type=std_logic lab=vpn}
