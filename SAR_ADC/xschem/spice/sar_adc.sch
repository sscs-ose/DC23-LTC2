v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -40 160 -10 160 {
lab=#net1}
N -20 140 -10 140 {
lab=gnd}
N -40 180 -10 180 {
lab=vdd}
N -120 220 -120 240 {
lab=vdd}
N -120 240 -40 240 {
lab=vdd}
N -40 180 -40 240 {
lab=vdd}
N -20 140 -20 260 {
lab=gnd}
N -100 260 -20 260 {
lab=gnd}
N -100 220 -100 260 {
lab=gnd}
N -40 -160 -10 -160 {
lab=#net2}
N -20 -140 -10 -140 {
lab=gnd}
N -40 -180 -10 -180 {
lab=vdd}
N -40 -240 -40 -180 {
lab=vdd}
N -120 -240 -40 -240 {
lab=vdd}
N -120 -240 -120 -220 {
lab=vdd}
N -20 -260 -20 -140 {
lab=gnd}
N -100 -260 -20 -260 {
lab=gnd}
N -100 -260 -100 -220 {
lab=gnd}
N 480 -0 500 0 {
lab=#net3}
N 130 -20 300 -20 {
lab=#net4}
N 300 -30 300 -20 {
lab=#net4}
N 300 -30 320 -30 {
lab=#net4}
N 130 20 300 20 {
lab=#net5}
N 300 20 300 40 {
lab=#net5}
N 300 40 320 40 {
lab=#net5}
N 30 -290 690 -290 {bus=true
lab=[11]}
N 690 -290 690 100 {bus=true
lab=[11]}
N 30 290 690 290 {bus=true
lab=[11]}
N 690 100 690 290 {bus=true
lab=[11]}
N -120 -340 -120 -240 {
lab=vdd}
N -120 -340 400 -340 {
lab=vdd}
N 400 -340 400 -70 {
lab=vdd}
N -100 260 -100 340 {
lab=gnd}
N -100 340 400 340 {
lab=gnd}
N 400 70 400 340 {
lab=gnd}
N 280 -160 280 0 {
lab=clk}
N 280 -160 560 -160 {
lab=clk}
N 560 -160 560 -150 {
lab=clk}
N 580 -340 580 -150 {
lab=rst}
N -80 -320 -80 -220 {
lab=#net6}
N -80 220 -80 320 {
lab=#net6}
N 620 150 620 320 {
lab=#net6}
N 440 -320 440 180 {
lab=#net6}
N -80 -320 440 -320 {
lab=#net6}
N 690 -290 760 -290 {bus=true
lab=[11]}
N -220 -340 -120 -340 {
lab=vdd}
N -220 -260 -100 -260 {
lab=gnd}
N -200 240 -120 240 {
lab=vdd}
N -200 -340 -200 240 {
lab=vdd}
N -180 -260 -180 260 {
lab=gnd}
N -180 260 -100 260 {
lab=gnd}
N -220 -0 320 0 {
lab=clk}
N -220 160 -160 160 {
lab=vinn}
N -220 -160 -160 -160 {
lab=vinp}
N 400 -180 620 -180 {
lab=vdd}
N 620 -180 620 -150 {
lab=vdd}
N -80 320 620 320 {
lab=#net6}
N 440 180 620 180 {
lab=#net6}
N 560 150 560 340 {
lab=gnd}
N 400 340 560 340 {
lab=gnd}
C {../spice/cdac.sym} 130 160 1 1 {name=x1 cu=5u}
C {../spice/cdac.sym} 130 -160 1 0 {name=x2 cu=5u}
C {/foss/designs/sar_adc/xschem/spice/bootstrap_sw.sym} -100 -120 2 1 {name=x3}
C {/foss/designs/sar_adc/xschem/spice/bootstrap_sw.sym} -100 120 0 0 {name=x4}
C {devices/ipin.sym} -220 160 0 0 {name=p1 lab=vinn}
C {devices/ipin.sym} -220 -160 0 0 {name=p2 lab=vinp}
C {../spice/Preamp-Strong-Latch.sym} -4020 3650 0 0 {name=X5}
C {../spice/sar_logic.sym} 520 130 0 0 {name=X6}
C {devices/ipin.sym} -220 0 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 580 -340 1 0 {name=p5 lab=rst}
C {devices/bus_connect.sym} 240 280 2 1 {name=l13 lab=[11]}
C {devices/bus_connect.sym} 220 280 2 1 {name=l14 lab=[10]}
C {devices/bus_connect.sym} 200 280 2 1 {name=l15 lab=[9]}
C {devices/bus_connect.sym} 180 280 2 1 {name=l16 lab=[8]}
C {devices/bus_connect.sym} 160 280 2 1 {name=l17 lab=[7]}
C {devices/bus_connect.sym} 140 280 2 1 {name=l18 lab=[6]}
C {devices/bus_connect.sym} 120 280 2 1 {name=l19 lab=[5]}
C {devices/bus_connect.sym} 100 280 2 1 {name=l20 lab=[4]}
C {devices/bus_connect.sym} 80 280 2 1 {name=l21 lab=[3]}
C {devices/bus_connect.sym} 60 280 2 1 {name=l22 lab=[2]}
C {devices/bus_connect.sym} 40 280 2 1 {name=l23 lab=[1]}
C {devices/bus_connect.sym} 20 280 2 1 {name=l24 lab=[0]}
C {devices/bus_connect.sym} 240 -280 0 0 {name=l25 lab=[11]}
C {devices/bus_connect.sym} 220 -280 0 0 {name=l26 lab=[10]}
C {devices/bus_connect.sym} 200 -280 0 0 {name=l27 lab=[9]}
C {devices/bus_connect.sym} 180 -280 0 0 {name=l28 lab=[8]}
C {devices/bus_connect.sym} 160 -280 0 0 {name=l29 lab=[7]}
C {devices/bus_connect.sym} 140 -280 0 0 {name=l30 lab=[6]}
C {devices/bus_connect.sym} 120 -280 0 0 {name=l31 lab=[5]}
C {devices/bus_connect.sym} 100 -280 0 0 {name=l32 lab=[4]}
C {devices/bus_connect.sym} 80 -280 0 0 {name=l33 lab=[3]}
C {devices/bus_connect.sym} 60 -280 0 0 {name=l34 lab=[2]}
C {devices/bus_connect.sym} 40 -280 0 0 {name=l35 lab=[1]}
C {devices/bus_connect.sym} 20 -280 0 0 {name=l36 lab=[0]}
C {devices/opin.sym} 760 -290 0 0 {name=p4 lab=d[11:0]}
C {devices/ipin.sym} -220 -340 0 0 {name=p6 lab=vdd}
C {devices/ipin.sym} -220 -260 0 0 {name=p7 lab=gnd}
C {devices/bus_connect.sym} 680 110 2 1 {name=l1 lab=[11]}
C {devices/bus_connect.sym} 680 90 2 1 {name=l2 lab=[10]}
C {devices/bus_connect.sym} 680 70 2 1 {name=l3 lab=[9]}
C {devices/bus_connect.sym} 680 50 2 1 {name=l4 lab=[8]}
C {devices/bus_connect.sym} 680 30 2 1 {name=l5 lab=[7]}
C {devices/bus_connect.sym} 680 10 2 1 {name=l6 lab=[6]}
C {devices/bus_connect.sym} 680 -10 2 1 {name=l7 lab=[5]}
C {devices/bus_connect.sym} 680 -30 2 1 {name=l8 lab=[4]}
C {devices/bus_connect.sym} 680 -50 2 1 {name=l9 lab=[3]}
C {devices/bus_connect.sym} 680 -70 2 1 {name=l10 lab=[2]}
C {devices/bus_connect.sym} 680 -90 2 1 {name=l11 lab=[1]}
C {devices/bus_connect.sym} 680 -110 2 1 {name=l12 lab=[0]}
