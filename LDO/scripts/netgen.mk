# Files, directories and Aliases
################################

NETGEN_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-netgen-$(TOP).log
NETGEN_WORK_DIR=$(realpath $(TOP_GDS))

NETGEN=netgen -batch lvs


# Rules
#######

.PHONY: netgen-lvs
netgen-lvs: magic-lvs xschem-netlist
	cd $(NETGEN_WORK_DIR) && $(NETGEN) "$(notdir $(TOP_NETLIST_GDS)) $(TOP)" "$(notdir $(TOP_NETLIST_SCH)) $(TOP)" $(NETGEN_RCFILE) |& tee $(NETGEN_LOG) || true
	cd $(NETGEN_WORK_DIR) && grep "Netlist" comp.out


.PHONY: netgen-magic-lvs
netgen-magic-lvs: magic-lvs xschem-netlist
	cd $(NETGEN_WORK_DIR) && $(NETGEN) "$(notdir $(TOP_NETLIST_GDS)) $(TOP)_flat" "$(notdir $(TOP_NETLIST_SCH)) $(TOP)" $(NETGEN_RCFILE) |& tee $(NETGEN_LOG) || true
	cd $(NETGEN_WORK_DIR) && grep "Netlist" comp.out
