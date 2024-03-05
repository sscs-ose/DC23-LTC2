#!/bin/bash

RCFILE=../../xschemrc

TOP=cap_mim_2f
TOP_DIR=`realpath .`
TOP_SCH=$TOP.sch
TOP_GDS=$TOP.gds
TOP_NETLIST_SCH=$TOP.spice


xschem --rcfile $RCFILE \
	--netlist \
	--netlist_path $TOP_DIR \
	--netlist_filename $TOP.spice \
	--preinit 'set lvs_netlist 1; set spiceprefix 0' \
	--no_x \
	--quit \
    $TOP_SCH

python $KLAYOUT_HOME/lvs/run_lvs.py \
	--layout=$TOP_GDS \
	--netlist=$TOP_NETLIST_SCH \
	--run_dir=$TOP_DIR \
	--variant=D \
	--verbose \
	--run_mode=flat
	# --spice_comments \
	# --top_lvl_pins \
	# --combine

klayout -e -t $TOP_GDS -mn $TOP_DIR/$TOP.lvsdb

# All capacitors on sm141064_mim.ngspice new_mim_cap

# * OPTION-B [5LM]
# */ MIM Capacitor (1.5fF/um2) subcircuit model for GF's 0.18 Analog CMOS process
# .subckt cap_mim_1f5_m4m5_noshield 1 2  c_length=l c_width=w dtemp=0 par=1

# */ MIM Capacitor (1fF/um2) subcircuit model for GF's 0.18 Analog CMOS process
# .subckt cap_mim_1f0_m4m5_noshield 1 2  c_length=l c_width=w dtemp=0 par=1

# */ MIM Capacitor (2fF/um2) subcircuit model for GF's 0.18 Analog CMOS process M2-M3
# .subckt cap_mim_2f0_m4m5_noshield  1 2  c_length=l  c_width=w dtemp=0 par=1