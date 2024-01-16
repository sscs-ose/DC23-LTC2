# Files, directories and Aliases
################################

XSCHEM_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-$(TOP).log
XSCHEM_NETLIST_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-netlist-$(TOP).log
XSCHEM_NETLIST_PREFIX_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-netlist-prefix-$(TOP).log
XSCHEM_NETLIST_NOPREFIX_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-netlist-noprefix-$(TOP).log

TOP_SCH_DIR:=$(abspath $(dir $(TOP_SCH)))

# https://xschem.sourceforge.io/stefan/xschem_man/developer_info.html
#--preinit 'set lvs_netlist 1; set spiceprefix 0'
XSCHEM=xschem --rcfile $(XSCHEM_RCFILE) \
	--netlist \
	--netlist_path $(dir $(TOP_SCH)) \
	--netlist_filename $(TOP).spice

XSCHEM_BATCH=$(XSCHEM) \
	--no_x \
	--quit

define HELP_ENTRIES +=
	$(call INFO_MESSAGE,)
	$(call INFO_MESSAGE, Magic related rules:)
    $(call INFO_MESSAGE,  xschem-validation:            Evaluate file existence.)
	$(call INFO_MESSAGE,                                Is used by other rules.)
    $(call INFO_MESSAGE,  xschem-sch:                   Open schematic asociated with TOP )
    $(call INFO_MESSAGE,  xschem-tb:                    Open testbench asociated with TOP )
    $(call INFO_MESSAGE,  xschem-netlist:               Generates a plain netlist executable by )
	$(call INFO_MESSAGE,                                ngspice)
    $(call INFO_MESSAGE,  xschem-netlist-lvs-prefix:    Generates an lvs netlist usable by magic)
    $(call INFO_MESSAGE,  xschem-netlist-lvs-noprefix:  Generates an lvs netlist usable by klayout)
	$(call INFO_MESSAGE,                                Applies the "fix-parameters" rule)
    $(call INFO_MESSAGE,  xschem-netlist-lvs-noprefix-fixed: Klayout LVS requires some patches over)
	$(call INFO_MESSAGE,                                the netlist generated with xschem)
	$(call INFO_MESSAGE,                                This functions is applied by noprefix rule)
endef

# Rules
#######

.PHONY: xschem-validation
xschem-validation:
ifeq (,$(TOP_SCH))
	$(call ERROR_MESSAGE, [xschem] There's no schematic for $(TOP))
endif

	$(call INFO_MESSAGE, [xschem] rcfile:               $(XSCHEM_RCFILE))
	$(call INFO_MESSAGE, [xschem] directory:            $(TOP_SCH_DIR))
	$(call INFO_MESSAGE, [xschem] schematic:            $(TOP_SCH))

ifeq (,$(TOP_TB))
	$(call WARNING_MESSAGE, [xschem] There's no testbench for $(TOP))
else
	$(call INFO_MESSAGE, [xschem] testbench:            $(TOP_TB))
endif

	$(call INFO_MESSAGE, [xschem] netlist:              $(TOP_NETLIST_SCH))
	$(call INFO_MESSAGE, [xschem] netlist lvs noprefix: $(TOP_NETLIST_LVS_NOPREFIX))
	$(call INFO_MESSAGE, [xschem] netlist lvs prefix:   $(TOP_NETLIST_LVS_PREFIX))


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


.PHONY: xschem-netlist
xschem-netlist: xschem-validation
	$(XSCHEM_BATCH) \
		$(TOP_SCH) |& tee $(XSCHEM_NETLIST_LOG)


# Used in Magic
.PHONY: xschem-netlist-lvs-prefix
xschem-netlist-lvs-prefix: xschem-validation
	$(XSCHEM_BATCH) \
		--preinit 'set lvs_netlist 1' \
		--netlist_filename $(TOP_NETLIST_LVS_PREFIX) \
		$(TOP_SCH) |& tee $(XSCHEM_NETLIST_PREFIX_LOG)


# Used in Klayout
.PHONY: xschem-netlist-lvs-noprefix
xschem-netlist-lvs-noprefix: xschem-validation
	$(XSCHEM_BATCH) \
		--preinit 'set lvs_netlist 1; set spiceprefix 0' \
		--netlist_filename $(TOP_NETLIST_LVS_NOPREFIX) \
		$(TOP_SCH) |& tee $(XSCHEM_NETLIST_NOPREFIX_LOG)


.PHONY: xschem-netlist-lvs-noprefix-fixed
xschem-netlist-lvs-noprefix-fixed: xschem-validation xschem-netlist-lvs-noprefix
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/c_width/W/' $(TOP_NETLIST_LVS_NOPREFIX)
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/c_length/L/' $(TOP_NETLIST_LVS_NOPREFIX)
	sed -i '/R.*ppoly/s/r_width/W/' $(TOP_NETLIST_LVS_NOPREFIX)
	sed -i '/R.*ppoly/s/r_length/L/' $(TOP_NETLIST_LVS_NOPREFIX)
