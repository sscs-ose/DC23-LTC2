# Files, directories and Aliases
################################

NETGEN_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-netgen-$(TOP).log

NETGEN=netgen -batch lvs


# Rules
#######

.PHONY: netgen-validation
netgen-validation:
ifeq (,$(wildcard $(TOP_GDS)))
	$(call ERROR_MESSAGE, [netgen] GDS file $(TOP_GDS) doesn't exist$)
endif	
	$(call INFO_MESSAGE, [netgen] directory:                 $(TOP_GDS_DIR))
	$(call INFO_MESSAGE, [netgen] GDS:                       $(TOP_GDS))
	$(call INFO_MESSAGE, [netgen] xschem netlist w/prefix:   $(TOP_NETLIST_LVS_PREFIX))
	$(call INFO_MESSAGE, [netgen] xschem netlist wo/prefix:  $(TOP_NETLIST_LVS_NOPREFIX))
	$(call INFO_MESSAGE, [netgen] magic extracted netlist:   $(TOP_EXTRACTED_MAGIC))
	$(call INFO_MESSAGE, [netgen] klayout extracted netlist: $(TOP_EXTRACTED_KLAYOUT))
	$(call INFO_MESSAGE, [netgen] rc file:                   $(NETGEN_RCFILE))


.PHONY: netgen-lvs
netgen-lvs-magic: netgen-validation magic-lvs xschem-netlist-lvs-prefix
	cd $(TOP_GDS_DIR) && $(NETGEN) \
		"$(TOP_NETLIST_LVS_PREFIX) $(TOP)" \
		"$(TOP_EXTRACTED_MAGIC) $(TOP)-extracted" \
		$(NETGEN_RCFILE) |& tee $(NETGEN_LOG) || true

	cd $(TOP_GDS_DIR) && grep "Netlist" comp.out

.PHONY: netgen-lvs
netgen-lvs-klayout: netgen-validation xschem-netlist-lvs-noprefix
ifeq (,$(TOP_EXTRACTED_KLAYOUT))
	$(call ERROR_MESSAGE, There's no klayout extracted netlist. run `klayout-lvs`)
endif
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/W/c_width/' $(TOP_EXTRACTED_KLAYOUT)
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/L/c_length/' $(TOP_EXTRACTED_KLAYOUT)
	sed -i '/R.*ppoly/s/W/r_width/' $(TOP_EXTRACTED_KLAYOUT)
	sed -i '/R.*ppoly/s/L/r_length/' $(TOP_EXTRACTED_KLAYOUT)
	
	cd $(TOP_GDS_DIR) && $(NETGEN) \
		"$(TOP_NETLIST_LVS_NOPREFIX) $(TOP)" \
		"$(TOP_EXTRACTED_KLAYOUT) $(TOP)" \
		$(NETGEN_RCFILE) |& tee $(NETGEN_LOG) || true

	cd $(TOP_GDS_DIR) && grep "Netlist" comp.out