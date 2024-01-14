NETGEN=netgen -batch lvs


NETGEN_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-netgen-$(TOP).log


.PHONY: netgen-lvs
netgen-lvs: magic-lvs xschem-lvs
	cd $(TOP_DIR) && $(NETGEN) "$(notdir $(TOP_NETLIST_GDS)) $(TOP)" "$(notdir $(TOP_NETLIST_SCH)) $(TOP)" $(NETGEN_RCFILE) |& tee $(NETGEN_LOG) || true
	cd $(TOP_DIR) && grep "Netlist" comp.out


.PHONY: netgen-magic-lvs
netgen-magic-lvs: magic-lvs xschem-lvs
	cd $(TOP_DIR) && $(NETGEN) "$(notdir $(TOP_NETLIST_GDS)) $(TOP)_flat" "$(notdir $(TOP_NETLIST_SCH)) $(TOP)" $(NETGEN_RCFILE) |& tee $(NETGEN_LOG) || true
	cd $(TOP_DIR) && grep "Netlist" comp.out