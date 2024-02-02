v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -40 180 -40 240 {
lab=cgnd}
N -100 260 -20 260 {
lab=vdd}
N -20 -140 -10 -140 {
lab=vdd}
N 480 -0 500 0 {
lab=compout}
N 130 -20 300 -20 {
lab=compp}
N 280 -160 280 0 {
lab=clk}
N 280 -160 560 -160 {
lab=clk}
N 560 -160 560 -150 {
lab=clk}
N 580 -340 580 -150 {
lab=rst}
N 620 150 620 320 {
lab=eoc}
N -180 260 -100 260 {
lab=vdd}
N -220 -0 320 0 {
lab=clk}
N -220 160 -160 160 {
lab=vinn}
N -220 -160 -160 -160 {
lab=vinp}
N 620 -180 620 -150 {
lab=vdd}
N 560 150 560 340 {
lab=gnd}
N 400 340 560 340 {
lab=gnd}
N -80 340 400 340 {
lab=gnd}
N -120 320 620 320 {
lab=eoc}
N -180 -340 -180 260 {
lab=vdd}
N -200 -260 -200 240 {
lab=gnd}
N -220 -260 -200 -260 {
lab=gnd}
N 300 -20 320 -20 {
lab=compp}
N 300 20 320 20 {
lab=compn}
N 390 -340 390 -50 {
lab=vdd}
N -220 -340 390 -340 {
lab=vdd}
N 300 -50 300 -20 {
lab=compp}
N 300 20 300 50 {
lab=compn}
N 470 -50 470 0 {
lab=compout}
N 390 -180 620 -180 {
lab=vdd}
N 620 180 680 180 {
lab=eoc}
N 390 -50 390 -35 {
lab=vdd}
N 390 35 390 50 {
lab=gnd}
N 430 -0 480 0 {
lab=compout}
N -100 340 -80 340 {
lab=gnd}
N -100 -100 -100 -70 {
lab=gnd}
N -200 -70 -100 -70 {
lab=gnd}
N -80 -100 -80 -50 {
lab=vdd}
N -80 220 -60 260 {
lab=vdd}
N -100 220 -100 240 {
lab=gnd}
N -200 340 -100 340 {
lab=gnd}
N -200 240 -200 340 {
lab=gnd}
N -350 140 -160 140 {
lab=eoc}
N -350 -180 -350 140 {
lab=eoc}
N -350 -180 -160 -180 {
lab=eoc}
N -590 -100 -120 -100 {
lab=#net1}
N -590 220 -120 220 {
lab=#net1}
N -590 90 -580 90 {
lab=eoc}
N -520 -290 -520 50 {
lab=vdd}
N -520 -290 -180 -290 {
lab=vdd}
N -520 130 -520 180 {
lab=gnd}
N -520 180 -200 180 {
lab=gnd}
N -40 180 -10 180 {
lab=cgnd}
N -20 40 -20 140 {
lab=vdd}
N -180 60 -20 60 {
lab=vdd}
N 130 20 310 20 {
lab=compn}
N -20 -340 -20 -140 {
lab=vdd}
N -20 140 -10 140 {
lab=vdd}
N -40 -180 -10 -180 {
lab=cgnd}
N -40 -20 130 -20 {
lab=compp}
N -40 -160 -40 -20 {
lab=compp}
N -50 20 130 20 {
lab=compn}
N -50 20 -50 150 {
lab=compn}
N -50 150 -40 150 {
lab=compn}
N -40 150 -40 160 {
lab=compn}
N -420 -100 -420 90 {
lab=#net1}
N -180 -50 -80 -50 {
lab=vdd}
N -690 -100 -580 -100 {
lab=#net1}
N -690 -100 -690 220 {
lab=#net1}
N -690 220 -580 220 {
lab=#net1}
N -350 140 -350 200 {
lab=eoc}
N -600 200 -350 200 {
lab=eoc}
N -600 90 -600 200 {
lab=eoc}
N -600 90 -590 90 {
lab=eoc}
N -550 320 -120 320 {
lab=eoc}
N 390 40 390 340 {
lab=gnd}
N -550 200 -550 320 {
lab=eoc}
N -200 240 -100 240 {
lab=gnd}
N -40 -260 -40 -180 {
lab=cgnd}
N -450 530 -130 530 {
lab=eoc}
N -310 440 -190 440 {
lab=#net1}
N -190 440 -170 450 {
lab=#net1}
N -50 470 -50 610 {
lab=cgnd}
N -110 530 -110 670 {
lab=gnd}
N -90 530 -90 670 {
lab=vdd}
N -210 590 -170 590 {
lab=eoc}
N -210 530 -210 590 {
lab=eoc}
N -290 670 -130 670 {
lab=#net1}
N -290 440 -290 670 {
lab=#net1}
N -110 470 -110 530 {
lab=gnd}
N -110 340 -110 470 {
lab=gnd}
N -240 650 -110 650 {
lab=gnd}
N -250 650 -240 650 {
lab=gnd}
N -90 260 -90 530 {
lab=vdd}
N -250 470 -170 470 {
lab=#net2}
N -170 610 -110 610 {
lab=gnd}
N -310 220 -310 440 {
lab=#net1}
N -460 200 -460 530 {
lab=eoc}
N -460 530 -450 530 {
lab=eoc}
N -250 470 -250 590 {
lab=#net2}
C {cdac.sym} 130 160 1 1 {name=x1 cu=5u}
C {cdac.sym} 130 -160 1 0 {name=x2 cu=5u}
C {devices/ipin.sym} -220 160 0 0 {name=p1 lab=vinn}
C {devices/ipin.sym} -220 -160 0 0 {name=p2 lab=vinp}
C {Preamp-Strong-Latch.sym} 340 30 0 0 {name=X5}
C {sar_logic.sym} 520 130 0 0 {name=X6}
C {devices/ipin.sym} -220 0 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 580 -340 1 0 {name=p5 lab=rst}
C {devices/ipin.sym} -220 -340 0 0 {name=p6 lab=vdd}
C {devices/ipin.sym} -220 -260 0 0 {name=p7 lab=gnd}
C {devices/lab_pin.sym} 20 -280 1 0 {name=l1 sig_type=std_logic lab=d[0]}
C {devices/lab_pin.sym} 40 -280 1 0 {name=l2 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 60 -280 1 0 {name=l3 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 80 -280 1 0 {name=l4 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 100 -280 1 0 {name=l5 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 120 -280 1 0 {name=l6 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 140 -280 1 0 {name=l7 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 160 -280 1 0 {name=l8 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 180 -280 1 0 {name=l9 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 200 -280 1 0 {name=l10 sig_type=std_logic lab=d[9]}
C {devices/lab_pin.sym} 220 -280 1 0 {name=l11 sig_type=std_logic lab=d[10]}
C {devices/lab_pin.sym} 240 -280 1 0 {name=l12 sig_type=std_logic lab=d[11]}
C {devices/lab_pin.sym} 20 280 1 1 {name=l13 sig_type=std_logic lab=d[0]}
C {devices/lab_pin.sym} 40 280 1 1 {name=l14 sig_type=std_logic lab=d[1]}
C {devices/lab_pin.sym} 60 280 1 1 {name=l15 sig_type=std_logic lab=d[2]}
C {devices/lab_pin.sym} 80 280 1 1 {name=l16 sig_type=std_logic lab=d[3]}
C {devices/lab_pin.sym} 100 280 1 1 {name=l17 sig_type=std_logic lab=d[4]}
C {devices/lab_pin.sym} 120 280 1 1 {name=l18 sig_type=std_logic lab=d[5]}
C {devices/lab_pin.sym} 140 280 1 1 {name=l19 sig_type=std_logic lab=d[6]}
C {devices/lab_pin.sym} 160 280 1 1 {name=l20 sig_type=std_logic lab=d[7]}
C {devices/lab_pin.sym} 180 280 1 1 {name=l21 sig_type=std_logic lab=d[8]}
C {devices/lab_pin.sym} 200 280 1 1 {name=l22 sig_type=std_logic lab=d[9]}
C {devices/lab_pin.sym} 220 280 1 1 {name=l23 sig_type=std_logic lab=d[10]}
C {devices/lab_pin.sym} 240 280 1 1 {name=l24 sig_type=std_logic lab=d[11]}
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
C {devices/opin.sym} 680 180 2 1 {name=p10 sig_type=std_logic lab=eoc}
C {bootstrap_sw.sym} -100 -200 0 1 {name=x3}
C {inv.sym} -520 90 0 0 {name=x4 cl=0.28u wp=0.44u wn=0.22u}
C {bootstrap_sw.sym} -100 120 0 1 {name=x7}
C {devices/lab_pin.sym} -40 -260 0 0 {name=p11 sig_type=std_logic lab=cgnd}
C {devices/lab_pin.sym} -40 240 0 1 {name=p12 sig_type=std_logic lab=cgnd}
C {bootstrap_sw.sym} -110 430 0 1 {name=x8}
C {devices/lab_pin.sym} -50 470 0 1 {name=p13 sig_type=std_logic lab=cgnd}
C {bootstrap_sw.sym} -110 570 0 1 {name=x9}
C {devices/vsource.sym} -250 620 0 0 {name=V1 value=1.8 savecurrent=false}
