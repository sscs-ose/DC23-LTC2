v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Clock divider by 5} 1180 0 2 0 0.4 0.4 {}
N 90 -250 110 -250 {
lab=clk}
N 70 -250 90 -250 {
lab=clk}
N 290 -250 290 -130 {
lab=5f}
N 1090 -230 1110 -230 {
lab=out}
N 350 -310 350 -290 {
lab=#net1}
N 530 -290 570 -290 {
lab=#net2}
N 270 -250 790 -250 {
lab=5f}
N 790 -270 790 -250 {
lab=5f}
N 570 -270 570 -250 {
lab=5f}
N 350 -270 350 -250 {
lab=5f}
N 750 -290 790 -290 {
lab=#net3}
N 370 -430 750 -430 {
lab=#net3}
N 750 -430 750 -290 {
lab=#net3}
N 330 -450 330 -430 {
lab=#net4}
N 970 -450 970 -290 {
lab=#net4}
N 330 -450 970 -450 {
lab=#net4}
N 670 -220 670 -190 {
lab=#net3}
N 670 -220 770 -220 {
lab=#net3}
N 770 -290 770 -220 {
lab=#net3}
N 550 -150 670 -150 {
lab=#net2}
N 550 -290 550 -150 {
lab=#net2}
N 510 -250 510 -90 {
lab=5f}
N 510 -90 630 -90 {
lab=5f}
N 710 -90 790 -90 {
lab=#net5}
N 790 -150 790 -90 {
lab=#net5}
N 970 -290 970 -250 {
lab=#net4}
N 970 -210 970 -170 {
lab=#net6}
C {devices/ipin.sym} 70 -250 0 0 {name=p1 lab=clk}
C {devices/opin.sym} 1110 -230 0 0 {name=p3 lab=out}
C {clkbuf_3.sym} 150 -250 0 0 {name=x10 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_8.sym} 230 -250 0 0 {name=x11 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/opin.sym} 290 -130 0 0 {name=p5 lab=5f}
C {dffq_1.sym} 440 -280 0 0 {name=x1 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand2_1.sym} 350 -370 1 0 {name=x7 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {dffq_1.sym} 660 -280 0 0 {name=x2 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {dffq_1.sym} 880 -280 0 0 {name=x3 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {dffq_1.sym} 880 -160 0 0 {name=x4 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {or2_1.sym} 730 -170 0 0 {name=x5 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 670 -90 0 0 {name=x6 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand2_1.sym} 1030 -230 0 0 {name=x8 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Mizuki Mori"}
