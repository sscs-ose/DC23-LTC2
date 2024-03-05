#!/bin/bash

RCFILE=../../xschemrc

TOP=resistor_core
TOP_DIR=`realpath .`
TOP_SCH=$TOP.sch
TOP_GDS=$TOP.gds
TOP_NETLIST_SCH=$TOP.spice


xschem \
	--netlist \
	--netlist_path $TOP_DIR \
	--netlist_filename $TOP.spice \
	--preinit 'set lvs_netlist 1; set spiceprefix 0' \
	--no_x \
	--quit \
    $TOP_SCH

python $KLAYOUT_HOME/lvs/run_lvs.py \
	--variant=D \
	--run_mode=flat \
	--spice_comments \
	--verbose \
	--run_dir=$TOP_DIR \
	--layout=$TOP_GDS \
	--netlist=$TOP_NETLIST_SCH \
	--top_lvl_pins \
	--lvs_sub=B \
	--purge \
	--combine

klayout -e -t $TOP_GDS -mn $TOP_DIR/$TOP.lvsdb