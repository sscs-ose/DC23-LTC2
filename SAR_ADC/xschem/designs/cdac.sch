v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 80 -160 80 -140 {
lab=in}
N -70 -160 -70 -130 {
lab=in}
N 50 -100 60 -100 {
lab=d[0]}
N 210 -160 210 -140 {
lab=in}
N 180 -100 190 -100 {
lab=d[1]}
N 340 -160 340 -140 {
lab=in}
N 310 -100 320 -100 {
lab=d[2]}
N 470 -160 470 -140 {
lab=in}
N 440 -100 450 -100 {
lab=d[3]}
N 600 -160 600 -140 {
lab=in}
N 570 -100 580 -100 {
lab=d[4]}
N 730 -160 730 -140 {
lab=in}
N 700 -100 710 -100 {
lab=d[5]}
N 910 -160 910 -140 {
lab=xd}
N 880 -100 890 -100 {
lab=d[6]}
N 1040 -160 1040 -140 {
lab=xd}
N 1010 -100 1020 -100 {
lab=d[7]}
N 1170 -160 1170 -140 {
lab=xd}
N 1140 -100 1150 -100 {
lab=d[8]}
N 1300 -160 1300 -140 {
lab=xd}
N 1270 -100 1280 -100 {
lab=d[9]}
N 1430 -160 1430 -140 {
lab=xd}
N 1400 -100 1410 -100 {
lab=d[10]}
N 1560 -160 1560 -140 {
lab=xd}
N 1530 -100 1540 -100 {
lab=d[11]}
N 80 -70 80 -40 {
lab=vdd}
N 210 -70 210 -50 {
lab=vdd}
N 80 -40 80 -20 {
lab=vdd}
N 230 -70 230 -30 {
lab=gnd}
N 1560 -70 1560 -50 {
lab=vdd}
N 1430 -70 1430 -50 {
lab=vdd}
N 1300 -70 1300 -50 {
lab=vdd}
N 1170 -70 1170 -50 {
lab=vdd}
N 1040 -70 1040 -50 {
lab=vdd}
N 910 -70 910 -50 {
lab=vdd}
N 730 -70 730 -50 {
lab=vdd}
N 600 -70 600 -50 {
lab=vdd}
N 470 -70 470 -50 {
lab=vdd}
N 340 -70 340 -50 {
lab=vdd}
N 1580 -70 1580 -30 {
lab=gnd}
N 1450 -70 1450 -30 {
lab=gnd}
N 1320 -70 1320 -30 {
lab=gnd}
N 1190 -70 1190 -30 {
lab=gnd}
N 1060 -70 1060 -30 {
lab=gnd}
N 930 -70 930 -30 {
lab=gnd}
N 750 -70 750 -30 {
lab=gnd}
N 620 -70 620 -30 {
lab=gnd}
N 490 -70 490 -30 {
lab=gnd}
N 360 -70 360 -30 {
lab=gnd}
N -70 -70 -70 -20 {
lab=gnd}
N -70 -30 1580 -30 {
lab=gnd}
N 730 -210 730 -160 {
lab=in}
N 730 -210 790 -210 {
lab=in}
N 850 -210 910 -210 {
lab=xd}
N 910 -210 910 -160 {
lab=xd}
N -90 -160 -70 -160 {
lab=in}
N 80 -50 1560 -50 {
lab=vdd}
N 100 -70 100 -30 {
lab=gnd}
N -90 -160 730 -160 {
lab=in}
N -120 -160 -90 -160 {
lab=in}
N 1040 -160 1560 -160 {
lab=xd}
N 910 -160 1050 -160 {
lab=xd}
N 1290 -220 1290 -160 {
lab=xd}
N 1290 -230 1290 -210 {
lab=xd}
N 1290 -230 1330 -230 {
lab=xd}
N 750 -270 880 -270 {
lab=xd}
N 880 -270 880 -210 {
lab=xd}
N -110 -200 -110 -160 {
lab=in}
C {cdac_line.sym} 80 -90 0 0 {name=x1
CW=\{sqrt(2)*cu\}
CL=\{sqrt(2)*cu\}}
C {cdac_line.sym} 210 -90 0 0 {name=x2
CW=\{sqrt(3)*cu\}
CL=\{sqrt(3)*cu\}}
C {cdac_line.sym} 340 -90 0 0 {name=x3
CW=\{sqrt(4)*cu\}
CL=\{sqrt(4)*cu\}}
C {cdac_line.sym} 470 -90 0 0 {name=x4
CW=\{sqrt(8)*cu\}
CL=\{sqrt(8)*cu\}}
C {cdac_line.sym} 600 -90 0 0 {name=x5
CW=\{sqrt(16)*cu\}
CL=\{sqrt(16)*cu\}}
C {cdac_line.sym} 730 -90 0 0 {name=x6
CW=\{sqrt(32)*cu\}
CL=\{sqrt(32)*cu\}}
C {symbols/cap_mim_2f0fF.sym} 820 -210 1 0 {name=CA
W=\{cu\}
L=\{cu\}
model=cap_mim_2f0fF
m=1}
C {cdac_line.sym} 910 -90 0 0 {name=x7
CW=\{sqrt(1)*cu\}
CL=\{sqrt(1)*cu\}}
C {cdac_line.sym} 1040 -90 0 0 {name=x8
CW=\{sqrt(2)*cu\}
CL=\{sqrt(2)*cu\}}
C {cdac_line.sym} 1170 -90 0 0 {name=x9
CW=\{sqrt(4)*cu\}
CL=\{sqrt(4)*cu\}}
C {cdac_line.sym} 1300 -90 0 0 {name=x10
CW=\{sqrt(8)*cu\}
CL=\{sqrt(8)*cu\}}
C {cdac_line.sym} 1430 -90 0 0 {name=x11
CW=\{sqrt(16)*cu\}
CL=\{sqrt(16)*cu\}}
C {cdac_line.sym} 1560 -90 0 0 {name=x12
CW=\{sqrt(32)*cu\}
CL=\{sqrt(32)*cu\}}
C {devices/ipin.sym} 50 -100 1 0 {name=p1 lab=d[0]}
C {devices/ipin.sym} 180 -100 1 0 {name=p2 lab=d[1]}
C {devices/ipin.sym} 310 -100 1 0 {name=p3 lab=d[2]}
C {devices/ipin.sym} 440 -100 1 0 {name=p4 lab=d[3]}
C {devices/ipin.sym} 570 -100 1 0 {name=p5 lab=d[4]}
C {devices/ipin.sym} 700 -100 1 0 {name=p6 lab=d[5]}
C {devices/ipin.sym} 880 -100 1 0 {name=p7 lab=d[6]}
C {devices/ipin.sym} 1010 -100 1 0 {name=p8 lab=d[7]}
C {devices/ipin.sym} 1140 -100 1 0 {name=p9 lab=d[8]}
C {devices/ipin.sym} 1270 -100 1 0 {name=p10 lab=d[9]}
C {devices/ipin.sym} 1400 -100 1 0 {name=p11 lab=d[10]}
C {devices/ipin.sym} 1530 -100 1 0 {name=p12 lab=d[11]}
C {devices/iopin.sym} 80 -20 3 1 {name=p13 lab=vdd}
C {devices/iopin.sym} -70 -30 1 0 {name=p14 lab=gnd}
C {symbols/cap_mim_2f0fF.sym} -70 -100 0 0 {name=C1
W=\{cu\}
L=\{cu\}
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {devices/iopin.sym} -110 -200 0 0 {name=p15 lab=in}
C {devices/iopin.sym} 1330 -230 0 0 {name=p16 lab=xd}
C {devices/res.sym} 750 -240 0 0 {name=R1
value=1T
footprint=1206
device=resistor
m=1}
