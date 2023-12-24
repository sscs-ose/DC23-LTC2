from pandas.io.parsers.readers import validate_header_arg
import pandas as pd
import matplotlib.pyplot as plt
import os
import numpy as np
import shutil


def write_spice():
    f = open("gmid.spice", "w")
    f.write(
        "** sch_path: /workspaces/DC23-LTC2/LDO/xschem/pmos/pmos_charac_gf180_3p3V.sch\n.include /home/designer/.volare/gf180mcuD/libs.tech/ngspice/design.ngspice\n.lib /home/designer/.volare/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical\n"
    )
    f.write(
        ".lib /home/designer/.volare/gf180mcuD/libs.tech/ngspice/sm141064.ngspice moscap_typical\n"
    )
    f.write("\n")
    f.write(
        "XM1 d1 g1 vsup d1 pfet_03v3 L="
        + L
        + "u W=5u nf=5 ad='int((nf+1)/2) * W/nf * 0.18u' as='int((nf+2)/2) * W/nf * 0.18u'"
    )
    f.write("\n")
    f.write(
        "+ pd='2*int((nf+1)/2) * (W/nf + 0.18u)' ps='2*int((nf+2)/2) * (W/nf + 0.18u)' nrd='0.18u / W' nrs='0.18u / W'"
    )
    f.write("\n")
    f.write("+ sa=0 sb=0 sd=0 m=1\n")
    f.write("\n")

    f.write("vsup vsup 0 dc=3.3\n")
    f.write("vsg vsup g1 dc=2\n")
    f.write("vsd vsup d1 dc=3.3\n")
    f.write("\n")
    f.write(".control\n")
    f.write("save all\n")
    f.write("save @m.xm1.m0[id]\n")
    f.write("save @m.xm1.m0[gm]\n")
    f.write("dc vsg 0 3.3 0.01\n")
    f.write("\nlet idn = @m.xm1.m0[id]\n")
    f.write("let gmn = @m.xm1.m0[gm]\n")
    f.write("let vthn = @m.xm1.m0[vth]\n")
    f.write("let vgsn = @m.xm1.m0[vgs]\n")
    f.write("let vdsatn = @m.xm1.m0[vdsat]\n")
    f.write("let vov2 = 2*idn/gmn\n")
    # f.write("plot idn\n")
    # f.write("plot gmn vs vov2\n")
    f.write("let W = 5e-6\n")
    f.write("let a = gmn/idn\n")
    f.write("setscale a\n")
    f.write("wrdata data_id_w_M0.csv idn/W\n")
    f.write("wrdata data_gm_vov_M0.csv vov2\n")
    f.write(".endc\n")
    f.write(".end")


L = "1"
write_spice()

os.system("ngspice -b gmid.spice")

id_vov_file = "data_gm_vov_M0.csv"
data_gm_vov = pd.read_csv(id_vov_file, delim_whitespace=True, header=None)
num_rows, num_cols = data_gm_vov.shape
data_gm_vov.columns = ["gm/id", "vov"]
fig, ax = plt.subplots()
print(data_gm_vov)
ax.scatter(data_gm_vov["id"], data_gm_vov["vov"], marker="D")
plt.show()

id_vov_file = "data_id_w_M0.csv"
data_id_w = pd.read_csv(id_vov_file, delim_whitespace=True, header=None)
num_rows, num_cols = data_id_w.shape
data_id_w.columns = ["gm/id", "w/id"]
fig, ax = plt.subplots()
print(data_id_w)
ax.scatter(data_id_w["id"], data_id_w["vov"], marker="D")
plt.show()
