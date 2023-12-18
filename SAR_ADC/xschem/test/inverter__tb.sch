v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 340 -170 340 -160 {
lab=V}
C {devices/vsource.sym} 110 -130 0 0 {name=V1 value="pulse(0 1.5 0 100p 100p 2.5n 5n)"}
C {devices/vsource.sym} 340 -130 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 340 -100 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 340 -170 0 0 {name=p13 sig_type=std_logic lab=V
}
C {devices/code_shown.sym} 110 -670 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 100n  
plot vin 
plot vout
.endc"}
C {devices/code.sym} 10 -390 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {devices/lab_wire.sym} 520 -290 0 0 {name=p1 sig_type=std_logic lab=V
}
C {devices/gnd.sym} 520 -210 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 110 -100 0 0 {name=l2 lab=GND}
C {devices/lab_wire.sym} 110 -160 0 0 {name=p2 sig_type=std_logic lab=Vin
}
C {devices/lab_wire.sym} 460 -250 0 0 {name=p3 sig_type=std_logic lab=Vin
}
C {devices/lab_wire.sym} 620 -250 0 0 {name=p4 sig_type=std_logic lab=Vout
}
C {../../symbols/inv.sym} 520 -250 0 0 {name=x1 cl=0.28u wp=0.44u wn=0.22u}
