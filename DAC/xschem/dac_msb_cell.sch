v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 680 -350 720 -350 {
lab=#net1}
N 700 -370 700 -350 {
lab=#net1}
N 700 -370 860 -370 {
lab=#net1}
N 800 -350 860 -350 {
lab=#net2}
N 195 -400 260 -400 {
lab=#net3}
N 260 -400 260 -370 {
lab=#net3}
N 40 -330 100 -330 {
lab=Rk}
N 40 -380 95 -380 {
lab=Ri}
N 40 -420 95 -420 {
lab=Cj}
N 100 -330 260 -330 {
lab=Rk}
N 260 -330 340 -330 {
lab=Rk}
N 260 -370 340 -370 {
lab=#net3}
N 460 -350 500 -350 {
lab=#net4}
N 500 -330 500 -280 {
lab=CLK}
N 910 -240 910 -200 {
lab=Vb2}
N 930 -240 930 -200 {
lab=Vb1}
N 950 -240 950 -200 {
lab=DVSS}
N 1040 -370 1080 -370 {
lab=OUT+}
N 1040 -350 1080 -350 {
lab=OUT-}
C {devices/title.sym} 160 0 0 0 {name=l1 author="JunBeom Park"}
C {std_cell/dffq_1.sym} 590 -340 0 0 {name=x2 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/inv_1.sym} 760 -350 0 0 {name=x3 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/ipin.sym} 40 -420 0 0 {name=p5 lab=Cj}
C {devices/ipin.sym} 40 -330 0 0 {name=p15 lab=Rk}
C {devices/ipin.sym} 40 -380 0 0 {name=p9 lab=Ri}
C {devices/ipin.sym} 500 -280 3 0 {name=p1 lab=CLK}
C {devices/ipin.sym} 910 -200 3 0 {name=p2 lab=Vb2}
C {devices/ipin.sym} 930 -200 3 0 {name=p3 lab=Vb1}
C {devices/ipin.sym} 950 -200 3 0 {name=p4 lab=VSS}
C {devices/opin.sym} 1080 -370 0 0 {name=p13 lab=OUT+}
C {devices/opin.sym} 1080 -350 0 0 {name=p6 lab=OUT-}
C {std_cell/and2_1.sym} 150 -400 0 0 {name=x6 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {std_cell/or2_1.sym} 400 -350 0 0 {name=x4 VDD=DVDD VNW=DVDD VPW=DVSS VSS=DVSS prefix=gf180mcu_fd_sc_mcu7t5v0__}
C {devices/code_shown.sym} 1180 -90 2 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_STDCELLS/cdl/gf180mcu_fd_sc_mcu7t5v0.cdl
"}
C {dac_msb_analog.sym} 950 -330 0 0 {name=x1}
