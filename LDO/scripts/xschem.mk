# Files, directories and Aliases
################################

TOP_SCH_DIR:=$(dir $(TOP_SCH))

XSCHEM_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-$(TOP).log
XSCHEM_NETLIST_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-netlist-$(TOP).log


# https://xschem.sourceforge.io/stefan/xschem_man/developer_info.html
#--preinit 'set lvs_netlist 1; set spiceprefix 0'
XSCHEM=xschem --rcfile $(XSCHEM_RCFILE) \
	--netlist \
	--netlist_path $(dir $(TOP_SCH)) \
	--netlist_filename $(TOP).spice

XSCHEM_BATCH=$(XSCHEM) \
	--no_x \
	--quit


# Rules
#######

.PHONY: xschem-validation
xschem-validation:
ifeq (,$(TOP_SCH))
	$(call ERROR_MESSAGE, [xschem] There's no schematic for $(TOP))
endif

	$(call INFO_MESSAGE, schematic: $(TOP_SCH))

ifeq (,$(TOP_TB))
	$(call WARNING_MESSAGE, [xschem] There's no testbench for $(TOP))
else
	$(call INFO_MESSAGE, testbench: $(TOP_TB))
endif

ifeq (,$(TOP_NETLIST_SCH))
	$(call WARNING_MESSAGE, [xschem] There's no netlist for $(TOP))
else
	$(call INFO_MESSAGE, netlist:   $(TOP_NETLIST_SCH))
endif

	$(call INFO_MESSAGE, directory: $(TOP_SCH_DIR))
	$(call INFO_MESSAGE, rcfile:    $(XSCHEM_RCFILE))


.PHONY:xschem
xschem: xschem-sch


.PHONY: xschem-sch
xschem-sch: xschem-validation
ifeq (,$(TOP))
	$(XSCHEM) 0_top.sch |& tee $(XSCHEM_LOG)
else
	$(XSCHEM) $(TOP_SCH) |& tee $(XSCHEM_LOG)
endif


.PHONY: xschem-tb
xschem-tb: xschem-validation
	$(XSCHEM) $(TOP_TB) |& tee $(XSCHEM_LOG)


.PHONY: xschem-netlist-lvs
xschem-netlist: xschem-validation
	$(XSCHEM_BATCH) \
		$(TOP_SCH) |& tee $(XSCHEM_LVS_LOG)


.PHONY: xschem-netlist-lvs
xschem-netlist-lvs: xschem-validation
	$(XSCHEM_BATCH) \
		--preinit 'set lvs_netlist 1' \
		$(TOP_SCH) |& tee $(XSCHEM_LVS_LOG)


.PHONY: xschem-netlist-lvs-klayout
xschem-netlist-lvs-klayout: xschem-validation
	$(XSCHEM_BATCH) \
		--preinit 'set lvs_netlist 1; set spiceprefix 0' \
		$(TOP_SCH) |& tee $(XSCHEM_LVS_LOG)

	make TOP=$(TOP) xschem-netlist-lvs-klayout-clean


# Variable TOP_NETLIST_SCH could not exists in the makefile...
# But it's supossed that TOP_NETLIST_SCH would be reevaluated...
.PHONY: xschem-netlist-lvs-klayout-clean
xschem-netlist-lvs-klayout-clean: xschem-validation
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/c_width/W/' $(TOP_NETLIST_SCH)
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/c_length/L/' $(TOP_NETLIST_SCH)
	sed -i '/R.*ppoly/s/r_width/W/' $(TOP_NETLIST_SCH)
	sed -i '/R.*ppoly/s/r_length/L/' $(TOP_NETLIST_SCH)
