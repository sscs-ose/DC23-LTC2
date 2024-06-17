v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 860 -460 880 -460 {
lab=#net1}
N 840 -440 880 -440 {
lab=#net2}
N 820 -420 880 -420 {
lab=#net3}
N 800 -400 880 -400 {
lab=#net4}
N 840 -250 840 -230 {
lab=#net5}
N 170 -570 210 -570 {
lab=D3}
N 170 -550 210 -550 {
lab=CLK3}
N 170 -450 210 -450 {
lab=D2}
N 170 -430 210 -430 {
lab=CLK2}
N 170 -350 210 -350 {
lab=D1}
N 170 -330 210 -330 {
lab=CLK1}
N 170 -230 210 -230 {
lab=D0}
N 170 -210 210 -210 {
lab=CLK0}
N 840 -340 880 -340 {
lab=#net5}
N 840 -310 840 -250 {
lab=#net5}
N 840 -340 840 -310 {
lab=#net5}
N 820 -360 820 -330 {
lab=#net6}
N 820 -360 880 -360 {
lab=#net6}
N 800 -380 800 -350 {
lab=#net7}
N 800 -380 880 -380 {
lab=#net7}
N 860 -570 860 -460 {
lab=#net1}
N 960 -260 960 -220 {
lab=Vb1}
N 940 -260 940 -220 {
lab=Vb2}
N 980 -260 980 -220 {
lab=VSS}
N 1140 -460 1180 -460 {
lab=OUT+}
N 1140 -440 1180 -440 {
lab=OUT-}
N 210 -430 280 -430 {
lab=CLK2}
N 210 -550 280 -550 {
lab=CLK3}
N 210 -330 280 -330 {
lab=CLK1}
N 210 -210 280 -210 {
lab=CLK0}
N 210 -570 330 -570 {
lab=D3}
N 280 -550 340 -550 {
lab=CLK3}
N 330 -570 340 -570 {
lab=D3}
N 210 -450 340 -450 {
lab=D2}
N 280 -430 340 -430 {
lab=CLK2}
N 210 -350 340 -350 {
lab=D1}
N 280 -330 340 -330 {
lab=CLK1}
N 210 -230 340 -230 {
lab=D0}
N 280 -210 340 -210 {
lab=CLK0}
N 820 -450 820 -420 {
lab=#net3}
N 800 -430 800 -400 {
lab=#net4}
N 520 -570 560 -570 {
lab=#net1}
N 640 -570 680 -570 {
lab=#net1}
N 680 -570 860 -570 {
lab=#net1}
N 840 -540 840 -440 {
lab=#net2}
N 520 -450 560 -450 {
lab=#net3}
N 640 -450 820 -450 {
lab=#net3}
N 540 -430 550 -430 {
lab=#net3}
N 540 -450 540 -430 {
lab=#net3}
N 520 -350 560 -350 {
lab=#net7}
N 540 -350 540 -330 {
lab=#net7}
N 640 -350 800 -350 {
lab=#net7}
N 520 -230 560 -230 {
lab=#net5}
N 640 -230 840 -230 {
lab=#net5}
N 540 -570 540 -550 {
lab=#net1}
N 840 -550 840 -540 {
lab=#net2}
N 860 -320 860 -210 {
lab=#net8}
N 860 -320 880 -320 {
lab=#net8}
N 560 -230 640 -230 {
lab=#net5}
N 540 -230 540 -210 {
lab=#net5}
N 540 -210 560 -210 {
lab=#net5}
N 640 -210 860 -210 {
lab=#net8}
N 560 -350 640 -350 {
lab=#net7}
N 540 -330 560 -330 {
lab=#net7}
N 640 -330 820 -330 {
lab=#net6}
N 550 -430 560 -430 {
lab=#net3}
N 640 -430 800 -430 {
lab=#net4}
N 560 -450 640 -450 {
lab=#net3}
N 560 -570 630 -570 {
lab=#net1}
N 630 -570 640 -570 {
lab=#net1}
N 540 -550 560 -550 {}
N 640 -550 840 -550 {}
C {devices/ipin.sym} 170 -570 0 0 {name=p17 lab=D3}
C {devices/ipin.sym} 170 -450 0 0 {name=p18 lab=D2}
C {devices/ipin.sym} 170 -350 0 0 {name=p19 lab=D1}
C {devices/ipin.sym} 170 -230 0 0 {name=p20 lab=D0}
C {devices/ipin.sym} 170 -550 0 0 {name=p21 lab=CLK3}
C {devices/ipin.sym} 170 -430 0 0 {name=p22 lab=CLK2}
C {devices/ipin.sym} 170 -330 0 0 {name=p23 lab=CLK1}
C {devices/ipin.sym} 170 -210 0 0 {name=p24 lab=CLK0}
C {devices/ipin.sym} 980 -220 3 0 {name=p25 lab=VSS}
C {devices/ipin.sym} 940 -220 3 0 {name=p26 lab=Vb2}
C {devices/ipin.sym} 960 -220 3 0 {name=p27 lab=Vb1}
C {devices/opin.sym} 1180 -460 0 0 {name=p28 lab=OUT+}
C {devices/opin.sym} 1180 -440 0 0 {name=p29 lab=OUT-}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
C {devices/code_shown.sym} 680 -80 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_STDCELLS/cdl/gf180mcu_fd_sc_mcu7t5v0.cdl
"}
C {dac_lsb_analog.sym} 1010 -380 0 0 {name=x1}
C {std_cell/dffq_1.sym} 430 -560 0 0 {name=x6 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} 600 -550 0 0 {name=x7 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/dffq_1.sym} 430 -440 0 0 {name=x4 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} 600 -430 0 0 {name=x5 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/dffq_1.sym} 430 -340 0 0 {name=x3 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} 600 -330 0 0 {name=x8 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/dffq_1.sym} 430 -220 0 0 {name=x2 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} 600 -210 0 0 {name=x9 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
