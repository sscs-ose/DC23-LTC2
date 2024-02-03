# Files, directories and Aliases
################################

NGSPICE_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)_ngspice_$(TOP).log

NGSPICE=SPICE_USERINIT_DIR=$(PWD) ngspice -a --define=num_threads=$(NPROCS)

define HELP_ENTRIES +=

Ngspice related Rules:
  ngspice-sim:  Extracts netlist and performs simulation. This rules works when simulation results on a .raw file

endef


# Rules
#######

.PHONY: ngspice-sim
ngspice-sim: xschem-netlist
	cd $(dir $(TOP_SCH)) && $(NGSPICE) $(TOP_NETLIST_SCH) |& tee $(NGSPICE_LOG)
