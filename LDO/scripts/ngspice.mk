# Files, directories and Aliases
################################

NGSPICE_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-ngspice-$(TOP).log

NGSPICE=SPICE_USERINIT_DIR=$(PWD) ngspice -a --define=num_threads=$(NPROCS)


# Rules
#######

.PHONY: ngspice-sim
ngspice-sim: xschem-netlist
	cd $(dir $(TOP_SCH)) && $(NGSPICE) $(TOP_NETLIST_SCH) |& tee $(NGSPICE_LOG)
