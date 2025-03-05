v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 350 -90 380 -90 {
lab=pll_freerun}
N 350 -130 380 -130 {
lab=pll_disable}
N 350 -250 380 -250 {
lab=pll_vctrl}
N 350 -310 380 -310 {
lab=pll_ref_clk}
N 70 -30 70 -10 {
lab=vss}
N 70 -10 600 -10 {
lab=vss}
N 600 -20 600 -10 {
lab=vss}
N 600 -10 600 10 {
lab=vss}
N 600 10 610 10 {
lab=vss}
N 70 -420 70 -190 {
lab=vdd}
N 70 -420 600 -420 {
lab=vdd}
N 600 -420 600 -410 {
lab=vdd}
N 600 -450 600 -420 {
lab=vdd}
N 600 -450 610 -450 {
lab=vdd}
N 130 -150 150 -150 {
lab=mon_vout}
N 860 -310 900 -310 {
lab=#net1}
N 980 -310 1000 -310 {
lab=#net2}
N 1080 -310 1100 -310 {
lab=#net3}
N 980 -210 1000 -210 {
lab=#net4}
N 1080 -210 1100 -210 {
lab=#net5}
N 880 -210 900 -210 {
lab=#net1}
N 880 -310 880 -210 {
lab=#net1}
N 1180 -210 1200 -210 {
lab=pll_clk_out}
C {/home/tsuchiya/chipathon/DC23-LTC2/BGR/xschem/bgr_diode.sym} 10 -10 0 0 {name=X1}
C {devices/iopin.sym} 610 -450 0 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 610 10 0 0 {name=p2 lab=vss}
C {devices/ipin.sym} 350 -310 0 0 {name=p3 lab=pll_ref_clk}
C {devices/ipin.sym} 350 -250 0 0 {name=p4 lab=pll_vctrl}
C {devices/ipin.sym} 350 -130 0 0 {name=p5 lab=pll_disable}
C {devices/ipin.sym} 350 -90 0 0 {name=p6 lab=pll_freerun}
C {devices/opin.sym} 150 -150 0 0 {name=p7 lab=mon_vout}
C {devices/opin.sym} 1200 -210 0 0 {name=p8 lab=pll_clk_out}
C {clkbuf_1.sym} 940 -310 0 0 {name=x2 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_4.sym} 1040 -310 0 0 {name=x3 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_16.sym} 1140 -310 0 0 {name=x4 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_1.sym} 940 -210 0 0 {name=x5 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_4.sym} 1040 -210 0 0 {name=x6 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkbuf_16.sym} 1140 -210 0 0 {name=x7 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {/home/tsuchiya/chipathon/gf180_pll_3v3/shipped/pll_sw.sym} 220 50 0 0 {}
