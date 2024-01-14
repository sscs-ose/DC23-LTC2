KLAYOUT=klayout -t

KLAYOUT_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-$(TOP).log
KLAYOUT_LVS_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-lvs-$(TOP).log
KLAYOUT_DRC_EFABLES_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-drc-efabless-$(TOP).log
KLAYOUT_DRC_PRECHECK_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-drc-precheck-$(TOP).log


.PHONY: klayout-validation
klayout-validation:
ifeq (,$(wildcard $(TOP_GDS)))
	$(error $(COLOR_ERROR)GDS file $(TOP_GDS) doesn't exist$(COLOR_END))
else
	$(info $(COLOR_SUCCESS)GDS file $(TOP_GDS) exist$(COLOR_END))
endif

ifeq (,$(wildcard $(TOP_NETLIST_SCH)))
	$(warning $(COLOR_WARNING)Netlist from schematic $(TOP_GDS) doesn't exist$(COLOR_END))
else
	$(info $(COLOR_SUCCESS)Netlist from schematic $(TOP_GDS) exist$(COLOR_END))
endif


.PHONY: klayout
klayout: klayout-view


.PHONY: klayout-view
klayout-view: klayout-validation
	$(KLAYOUT) -ne $(TOP_GDS) |& tee $(KLAYOUT_LOG)


.PHONY: klayout-edit
klayout-edit: klayout-validation
	$(KLAYOUT) -e $(TOP_GDS) |& tee $(KLAYOUT_LOG)


# KLAYOUT LVS
#############
# --help -h                           Print this help message.
# --layout=<layout_path>              The input GDS file path.
# --netlist=<netlist_path>            The input netlist file path.
# --variant=<combined_options>        Select combined options of metal_top, mim_option, and metal_level. Allowed values (A, B, C, D).
# --thr=<thr>                         The number of threads used in run.
# --run_dir=<run_dir_path>            Run directory to save all the results [default: pwd]
# --topcell=<topcell_name>            Topcell name to use.
# --run_mode=<run_mode>               Select klayout mode Allowed modes (flat , deep, tiling). [default: deep]
# --lvs_sub=<sub_name>                Substrate name used in your design.
# --verbose                           Detailed rule execution log for debugging.
# --schematic_simplify                Enable schematic simplification in input netlist.

## Operations in extracted netlist
# --no_net_names                      In extracted netlist Discard net names.
# --spice_comments                    In extracted netlist Enable netlist comments.
# --scale                             In extracted netlist Enable scale of 1e6.
# --net_only                          In extracted netlist Enable netlist object creation only.
# --top_lvl_pins                      In extracted netlist Enable top level pins only.
# --combine                           In extracted netlist Enable netlist combine only.
# --purge                             In extracted netlist Enable netlist purge all only.
# --purge_nets                        In extracted netlist Enable netlist purge nets only.

.PHONY: klayout-lvs-help
klayout-lvs-help:
	python $(KLAYOUT_HOME)/lvs/run_lvs.py --help

# LVS RULES
###########

.PHONY: klayout-lvs-view
klayout-lvs-view: klayout-validation
	$(KLAYOUT) -e $(TOP_GDS) \
		-mn $(dir $(TOP_GDS))/$(TOP).lvsdb


.PHONY: klayout-lvs-only
klayout-lvs-only: klayout-validation
	python $(KLAYOUT_HOME)/lvs/run_lvs.py \
		--variant=D \
		--run_mode=flat \
		--verbose \
		--run_dir=$(dir $(TOP_GDS)) \
		--layout=$(TOP_GDS) \
		--netlist=$(TOP_NETLIST_SCH) \
		--top_lvl_pins \
		--combine || true |& $(KLAYOUT_LVS_LOG)


.PHONY: klayout-lvs
klayout-lvs: klayout-lvs-only
	make TOP=$(TOP) klayout-lvs-view

# DRC RULES
###########

.PHONY: klayout-drc-view
klayout-drc-view: klayout-validation
	$(KLAYOUT) -e $(TOP_GDS) \
		-m $(TOP)/$(TOP)_antenna.lyrdb \
		-m $(TOP)/$(TOP)_density.lyrdb \
		-m $(TOP)/$(TOP)_main.lyrdb \
		-m $(TOP)/precheck_$(TOP).lyrdb


.PHONY: klayout-drc-only
klayout-drc-only: klayout-validation
	$(RM) $(dir $(TOP_GDS))/*.lyrdb

	python $(KLAYOUT_HOME)/drc/run_drc.py \
		--path $(TOP_GDS) \
		--variant=D \
		--topcell=$(TOP) \
		--run_dir=$(dir $(TOP_GDS)) \
		--run_mode=flat \
		--antenna \
		--density \
		--verbose || true |& $(KLAYOUT_DRC_EFABLES_LOG)

	$(KLAYOUT) -b -r $(KLAYOUT_HOME)/drc/gf180mcuD_mr.drc \
		-rd input=$(TOP_GDS) \
		-rd topcell=$(TOP) \
		-rd report=precheck_$(TOP).lyrdb \
		-rd conn_drc=true \
		-rd split_deep=true \
		-rd wedge=true \
		-rd ball=true \
		-rd gold=true \
		-rd mim_option=B \
		-rd offgrid=true \
		-rd verbose=true \
		-rd run_mode=flat \
		-rd feol=true \
		-rd beol=true || true |& $(KLAYOUT_DRC_PRECHECK_LOG)


.PHONY: klayout-drc
klayout-drc: klayout-drc-only
	make TOP=$(TOP) klayout-drc-view


.PHONY: klayout-eval
klayout-eval: klayout-drc-only klayout-lvs-only