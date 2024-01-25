from pandas.io.parsers.readers import validate_header_arg
import pandas as pd
import matplotlib.pyplot as plt
import os
import numpy as np
import shutil


def write_spice():
    f = open("gmid.spice", "w")

    f.write(
        "XM1 d1 g1 vsup d1 pfet_03v3 L="
        + L
        + "u W=5u nf=5 ad='int((nf+1)/2) * W/nf * 0.18u' as='int((nf+2)/2) * W/nf * 0.18u' pd='2*int((nf+1)/2) * (W/nf + 0.18u)' ps='2*int((nf+2)/2) * (W/nf + 0.18u)' nrd='0.18u / W' nrs='0.18u / W' sa=0 sb=0 sd=0 m=1\n"
    )
    f.write("\n")
    f.write(
        ".include /home/designer/.volare/gf180mcuD/libs.tech/ngspice/design.ngspice\n.lib /home/designer/.volare/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical\n"
    )
    f.write("vsup vsup 0 dc=3.3\n")
    f.write("vsg vsup g1 dc=2\n")
    f.write("vsd vsup d1 dc=3.3\n")
    f.write(".control\n")
    f.write("save all\n")
    f.write("save @m.xm1.m0[id]\n")
    f.write("let gmn = @xm1.pfet_03v3[gm]\n")
    f.write("let vthn = @m.xm1.m0[vth]\n")
    f.write("let vgsn = @m.xm1.m0[vgs]\n")
    f.write("let vdsatn = @m.xm1.m0[vdsat]\n")
    f.write("let vov2 = 2*idn/gmn\n")
    # f.write("plot idn\n")
    # f.write("plot gmn vs vov2\n")
    f.write("let W = 5e-6\n")
    f.write("let a = gmn/idn\n")
    f.write("setscale a\n")
    f.write("wrdata data_id_w_M0.dat idn/W\n")
    f.write("wrdata data_id_vov_M0.dat vov2\n")
    f.write(".endc\n")
    f.write(".end")


L = "1"
write_spice()
os.system("ngspice -b gmid.spice")
