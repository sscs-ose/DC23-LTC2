v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {CMOS implemented PFD} 1180 0 2 0 0.4 0.4 {}
N 320 -620 360 -620 {
lab=#net1}
N 320 -120 360 -120 {
lab=#net2}
N 180 -200 200 -200 {
lab=#net2}
N 180 -240 200 -240 {
lab=#net3}
N 180 -300 200 -300 {
lab=#net4}
N 180 -340 200 -340 {
lab=#net5}
N 180 -400 200 -400 {
lab=#net5}
N 180 -440 200 -440 {
lab=#net6}
N 180 -500 200 -500 {
lab=#net7}
N 180 -540 200 -540 {
lab=#net1}
N 180 -600 200 -600 {
lab=#net8}
N 180 -640 200 -640 {
lab=#net9}
N 340 -140 340 -120 {
lab=#net2}
N 180 -200 180 -180 {
lab=#net2}
N 180 -180 340 -140 {
lab=#net2}
N 180 -260 180 -240 {
lab=#net3}
N 340 -320 340 -300 {
lab=#net3}
N 180 -260 340 -300 {
lab=#net3}
N 180 -300 180 -280 {
lab=#net4}
N 180 -280 340 -240 {
lab=#net4}
N 340 -240 340 -220 {
lab=#net4}
N 340 -440 340 -420 {
lab=#net7}
N 340 -520 340 -500 {
lab=#net6}
N 180 -500 180 -480 {
lab=#net7}
N 180 -460 180 -440 {
lab=#net6}
N 180 -460 340 -500 {
lab=#net6}
N 180 -480 340 -440 {
lab=#net7}
N 180 -400 180 -340 {
lab=#net5}
N 340 -620 340 -600 {
lab=#net1}
N 180 -560 340 -600 {
lab=#net1}
N 180 -560 180 -540 {
lab=#net1}
N 60 -600 100 -600 {
lab=CLK}
N 180 -140 200 -140 {
lab=#net10}
N 440 -620 460 -620 {
lab=#net11}
N 440 -120 460 -120 {
lab=#net12}
N 540 -120 580 -120 {
lab=#net13}
N 540 -620 570 -620 {
lab=#net14}
N 570 -620 580 -620 {
lab=#net14}
N 520 -580 520 -520 {
lab=#net6}
N 520 -580 580 -580 {
lab=#net6}
N 520 -220 520 -160 {
lab=#net4}
N 520 -160 580 -160 {
lab=#net4}
N 560 -540 580 -540 {
lab=#net5}
N 560 -540 560 -200 {
lab=#net5}
N 560 -200 580 -200 {
lab=#net5}
N 540 -360 560 -360 {
lab=#net5}
N 320 -420 340 -420 {
lab=#net7}
N 320 -320 340 -320 {
lab=#net3}
N 320 -520 520 -520 {
lab=#net6}
N 320 -220 520 -220 {
lab=#net4}
N 420 -300 420 -140 {
lab=#net2}
N 340 -140 420 -140 {
lab=#net2}
N 420 -600 420 -420 {
lab=#net1}
N 340 -600 420 -600 {
lab=#net1}
N 380 -380 420 -380 {
lab=#net6}
N 380 -520 380 -380 {
lab=#net6}
N 380 -340 420 -340 {
lab=#net4}
N 380 -340 380 -220 {
lab=#net4}
N 700 -580 740 -580 {
lab=#net9}
N 720 -680 720 -580 {
lab=#net9}
N 180 -680 720 -680 {
lab=#net9}
N 180 -680 180 -640 {
lab=#net9}
N 180 -100 200 -100 {
lab=#net15}
N 180 -100 180 -60 {
lab=#net15}
N 180 -60 720 -60 {
lab=#net15}
N 720 -160 720 -60 {
lab=#net15}
N 700 -160 740 -160 {
lab=#net15}
N 60 -140 100 -140 {
lab=DATA}
N 820 -580 860 -580 {
lab=UP}
N 820 -160 860 -160 {
lab=DOWN}
N 360 -280 560 -280 {
lab=#net5}
N 360 -370 360 -280 {
lab=#net5}
N 190 -370 360 -370 {
lab=#net5}
N 180 -370 190 -370 {
lab=#net5}
C {devices/ipin.sym} 60 -140 0 0 {name=p1 lab=DATA}
C {devices/ipin.sym} 60 -600 0 0 {name=p2 lab=CLK}
C {devices/opin.sym} 860 -580 0 0 {name=p3 lab=UP}
C {devices/opin.sym} 860 -160 0 0 {name=p4 lab=DOWN}
C {nand2_1.sym} 260 -620 0 0 {name=x1 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 140 -600 0 0 {name=x7 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand2_1.sym} 260 -520 0 0 {name=x2 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand2_1.sym} 260 -420 0 0 {name=x3 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand2_1.sym} 260 -320 0 0 {name=x4 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand2_1.sym} 260 -220 0 0 {name=x5 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand2_1.sym} 260 -120 0 0 {name=x6 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 140 -140 0 0 {name=x8 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand3_1.sym} 640 -580 0 0 {name=x13 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand3_1.sym} 640 -160 0 0 {name=x14 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {nand4_1.sym} 480 -360 0 0 {name=x15 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 400 -620 0 0 {name=x9 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 500 -620 0 0 {name=x10 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 400 -120 0 0 {name=x11 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 500 -120 0 0 {name=x12 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 780 -580 0 0 {name=x16 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {clkinv_1.sym} 780 -160 0 0 {name=x17 VDD=VDD VNW=VDD VPW=0 VSS=0 prefix=gf180mcu_fd_sc_mcu7t5v0__ }
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Mizuki Mori"}
