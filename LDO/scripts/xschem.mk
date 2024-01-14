# https://xschem.sourceforge.io/stefan/xschem_man/developer_info.html
#--preinit 'set lvs_netlist 1; set spiceprefix 0'
XSCHEM=xschem --rcfile $(XSCHEM_RCFILE)
XSCHEM_NETLIST=xschem --rcfile ./xschemrc \
	--netlist \
	--netlist_path $(TOP_DIR) \
	--netlist_filename $(TOP).spice \
	--preinit 'set lvs_netlist 1' \
	--no_x \
	--quit

XSCHEM_NETLIST_WITHOUT_SPICEPREFIX=xschem --rcfile ./xschemrc \
	--netlist \
	--netlist_path $(TOP_DIR) \
	--netlist_filename $(TOP).spice \
	--preinit 'set lvs_netlist 1; set spiceprefix 0' \
	--no_x \
	--quit


XSCHEM_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-$(TOP).log
XSCHEM_NETLIST_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-xschem-netlist-$(TOP).log


.PHONY:xschem
xschem: xschem-sch


.PHONY: xschem-sch
xschem-sch:
	$(XSCHEM) $(TOP_SCH) |& tee $(XSCHEM_LOG)


.PHONY: xschem-tb
xschem-tb:
	$(XSCHEM) $(TOP_TB) |& tee $(XSCHEM_LOG)


.PHONY: xschem-lvs
xschem-lvs:
	$(XSCHEM_NETLIST) $(TOP_SCH) |& tee $(XSCHEM_NETLIST_LOG)


.PHONY: xschem-lvs-klayout-compatible
xschem-lvs-klayout-compatible:
	$(XSCHEM_NETLIST_WITHOUT_SPICEPREFIX) $(TOP_SCH) |& tee $(XSCHEM_NETLIST_LOG)
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/c_width/W/' $(TOP_DIR)/$(TOP).spice
	sed -i '/C.*cap_mim_2f0_m4m5_noshield/s/c_length/L/' $(TOP_DIR)/$(TOP).spice
	sed -i '/R.*ppoly/s/r_width/W/' $(TOP_DIR)/$(TOP).spice
	sed -i '/R.*ppoly/s/r_length/L/' $(TOP_DIR)/$(TOP).spice
