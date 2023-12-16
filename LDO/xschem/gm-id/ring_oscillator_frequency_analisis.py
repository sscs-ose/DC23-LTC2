from pandas.io.parsers.readers import validate_header_arg
import math
import pandas as pd
import matplotlib.pyplot as plt
import os
import numpy as np
import shutil


#%%
inv_2 ='sky130_fd_sc_hd__inv_2'
nand4_4 ='sky130_fd_sc_hd__nand4_4'
vss = 'vss'
vcc = 'vcc'


def write_inv2(name, input, VGND, VNB, VPB, VPWR, out, cell):
    return name+' '+input+' '+VGND+' '+VNB+' '+VPB+' '+VPWR+' '+out+' '+cell+'\n'


def write_nand4(name, input, VGND, VNB, VPB, VPWR, out):
    return name+' '+input+' '+' '+input+' '+' '+input+' '+' '+input+' '+VGND+' '+VNB+' '+VPB+' '+VPWR+' '+out+' '+'sky130_fd_sc_hd__nand4_4\n'

def write_spice(cell, temp, corner):
    if cell == inv_2:
        f = open("ro_sim.spice", "w")
        f.write('.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice '+corner+' \n.include /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice \n')

        num = 99
        for i in range(num):
            if i == 0:
                f.write(write_inv2('x'+str(i), 'in'+str(0), vss, vss, vcc, vcc, 'out'+str(0), cell))
            elif i == num-1:
                f.write(write_inv2('x'+str(i), 'out'+str(i-1), vss, vss, vcc, vcc, 'in'+str(0), cell))
            else:
                f.write(write_inv2('x'+str(i), 'out'+str(i-1), vss, vss, vcc, vcc, 'out'+str(i), cell))

        f.write('vvcc vcc 0 dc 1.8 \nvvss vss 0 0 \n.option temp = '+str(temp)+' \n.ic v(in0) = 0 \n.ic v(in1) = 1.8 \n')
        f.write('.control \n save v(in0) \n tran 50ps 100ns \nwrdata /foss/designs/TT_temptodig_ROstudy/ro_sim.csv v(in0) \n.endc\n')
        f.write('.end')
        f.close()
    else:
        f = open("ro_sim.spice", "w")
        f.write(
            '.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice ' + corner + ' \n.include /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice \n')

        num = 33
        for i in range(num):
            if i == 0:
                f.write(write_nand4('x' + str(i), 'in' + str(0), vss, vss, vcc, vcc, 'out' + str(0)))
            elif i == num - 1:
                f.write(write_nand4('x' + str(i), 'out' + str(i - 1), vss, vss, vcc, vcc, 'in' + str(0)))
            else:
                f.write(write_nand4('x' + str(i), 'out' + str(i - 1), vss, vss, vcc, vcc, 'out' + str(i)))

        f.write('vvcc vcc 0 dc 1.8 \nvvss vss 0 0 \n.option temp = ' + str(temp) + ' \n.ic v(in0) = 0 \n.ic v(in1) = 1.8 \n')
        f.write('.control \n save v(v_out) \n tran 0.001ns 500ns \nwrdata /foss/designs/TT_temptodig_ROstudy/ro_sim.csv v(in0) \n.endc\n')
        f.write('.end')
        f.close()


def get_frequency(file):
    data = pd.read_csv(file, delim_whitespace=True, header=None)
    print(data)
    num_rows, num_cols = data.shape
    data.columns = ["Time [us]", "V(ro)"]

    print(num_rows)
    print(num_cols)
    thres = 1.2
    # sw = [0,2,4,6,8,10,12,14,16,18,20]
    sw = [0]
    frq = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    frq = [0]
    for i in sw:
        x = data["Time [us]"]
        y = data["V(ro)"]
        x = x[~pd.isnull(x)]
        y = y[~pd.isnull(y)]
        kk2 = np.diff(y > thres, prepend=False)
        kk3 = np.argwhere(kk2)[::2, 0]
        half = int(len(kk3)/2)
        kk3 = kk3[half:]
        lgt = kk3.shape
        j = int(i / 2)
        frq[j] = (lgt[0]-1) / (x[kk3[-1]] - x[kk3[0]])
        print(frq[0])
        plt.plot(x, y)
        #plt.show()
    return frq[0]


corners_freq = []
#corners = ['ff', 'fs', 'tt', 'ss', 'sf']
corners = ['tt']
temperatures = np.arange(0, 200, 20)
#temperatures = [200]

for corner in corners:
    frequencies = []
    for temp in temperatures:
        print("Corner: "+corner)
        print(", Temp: "+str(temp)+"\n")
        write_spice(nand4_4, temp, corner)
        os.system('ngspice -b ro_sim.spice')
        frequency = get_frequency("ro_sim.csv")
        shutil.copyfile('./ro_sim.csv', './simulations/ro_sim_'+str(corner)+'_'+str(temp)+'.csv')
        frequencies.append(frequency)
    print(frequencies)
    corners_freq.append(frequencies)


print(corners_freq)
fig, ax = plt.subplots()
ax.scatter(temperatures, corners_freq[0], marker='D')
#ax.scatter(temperatures, corners_freq[1], marker='v')
#ax.scatter(temperatures, corners_freq[2], marker='*')
#ax.scatter(temperatures, corners_freq[3], marker='<')
#ax.scatter(temperatures, corners_freq[4], marker='>')
#plt.legend(['ff', 'fs', 'tt', 'ss', 'sf'])
plt.show()

# fig, ax = plt.subplots()
#
# df = pd.read_csv("ro_sim.csv", delim_whitespace=True, header=None)
#
# df.columns = ["Time [us]", "V(ro)"]
# ax.set_title("Delay in conversion line")
# ax.set_ylabel("Voltage [V]")
# ax.set_xlabel("Time [s]")
# ax.plot(df["Time [us]"], df["V(ro)"], color = 'blue')
# #ax.set_xlim(4.4,4.401)
#
# plt.legend(["V(comp_trigger)","V(clk)"])
# plt.show()

