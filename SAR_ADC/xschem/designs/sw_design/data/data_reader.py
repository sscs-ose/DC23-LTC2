import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import matplotlib as mpl


plt.rcParams.update({'font.size': 12})
#mpl.rcParams['mathtext.fontset'] = 'cm'

file_path = 'data_vout_m1.dat' # M1
#file_path = 'data_vout_m26.dat' # M26
#file_path = 'data_vout_m35.dat' # M35

data = pd.read_csv(file_path, header=None, delim_whitespace=True,names=['t1','s1','t2','s2'])  #space-separated values
w = [1, 2, 3, 4]
widths = ['$8 \mu m$','$10 \mu m$', '$15 \mu m$', '$20 \mu m$'] # M1 widths
#widths = ['$0.28 \mu m$','$1.5 \mu m$', '$5 \mu m$', '$15 \mu m$'] # M26 widths
#widths = ['$3 \mu m$','$5 \mu m$', '$10 \mu m$', '$20 \mu m$'] # M35 widths
indices = []

for i, number in enumerate(data['t1']):
    if round(number, 14) == 0.000003 and i not in indices:
        row1_signal1 = i
        indices.append(i)
    if round(number, 14) == 0.000005 and i not in indices:
        row2_signal1 = i
        indices.append(i)
        break

time_signal1 = data['t1'].iloc[row1_signal1:row2_signal1]
signal1 = data['s1'].iloc[row1_signal1:row2_signal1]

# Plot V_in
plt.figure(figsize=(8, 6))
plt.plot(time_signal1, signal1, label='$V_{in}$', color='green')

# Plot V_out for different versions with different colors
colors = ['red', 'blue', 'black', 'magenta']

for i in range(len(w)):
    indices = []
    rows_signal2 = []
    for j, number in enumerate(data['t2']):
        if round(number, 14) == 0.000003 and j not in indices:
            row1_signal2 = j
            indices.append(j)
        if round(number, 14) == 0.000005 and j not in indices:
            row2_signal2 = j
            indices.append(j)
            rows_signal2.append((row1_signal2, row2_signal2))

    for index, row_signal2 in enumerate(rows_signal2):
        time_signal2 = data['t2'].iloc[row_signal2[0]:row_signal2[1]]
        signal2 = data['s2'].iloc[row_signal2[0]:row_signal2[1]]

        # Plot V_out for each version in the same figure with different colors
        if index == i:
            plt.plot(time_signal2, signal2, label=r'$V_{out}$'f' - Width = {widths[i]}', color=colors[i])

plt.xlabel('Time (s)')
plt.ylabel('Voltage (V)')

plt.title('$V_{out}$ Comparison for different widths for M1')
#plt.title('$V_{out}$ Comparison for different widths for M2/M6')
#plt.title('$V_{out}$ Comparison for different widths for M3/M5')
plt.legend()
plt.grid(True)
plt.show()
