# Files, directories and Aliases
################################

KLAYOUT_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-$(TOP).log
KLAYOUT_LVS_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-lvs-$(TOP).log
KLAYOUT_DRC_EFABLES_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-drc-efabless-$(TOP).log
KLAYOUT_DRC_PRECHECK_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-klayout-drc-precheck-$(TOP).log

TOP_GDS_DIR:=$(dir $(TOP_GDS))
TOP_GDS_CELL:=$(basename $(notdir $(TOP_GDS)))

TOP_ALL_LYRDB:=$(filter %.lyrdb,$(ALL_FILES))
TOP_ALL_LVSDB:=$(filter %.lvsdb,$(ALL_FILES))

KLAYOUT=klayout -t

define HELP_ENTRIES +=
	$(call INFO_MESSAGE,)
	$(call INFO_MESSAGE, Klayout related rules:)
	$(call INFO_MESSAGE,  klayout-validation: Evaluates relevant file existence.)
	$(call INFO_MESSAGE,                      Is used by other rules.)
	$(call INFO_MESSAGE,  klayout:            Alias for `klayout-view`)
	$(call INFO_MESSAGE,  klayout-view:       Opens klayout in view mode)
	$(call INFO_MESSAGE,  klayout-edit:       Opens klayout in edit mode)
    $(call INFO_MESSAGE,  klayout-lvs-help:   Shows lvs help documentation)
    $(call INFO_MESSAGE,  klayout-lvs-view:   Opens klayout in edit mode and with)
	$(call INFO_MESSAGE,                      lvs reports.)
    $(call INFO_MESSAGE,  klayout-lvs-only:   Runs LVS from command line)
    $(call INFO_MESSAGE,  klayout-lvs:        Run klayout lvs and open the reports)
    $(call INFO_MESSAGE,  klayout-drc-view:   Open DRC reports on graphical interface)
    $(call INFO_MESSAGE,  klayout-drc-only:   Runs DRC from efabless and precheck)
	$(call INFO_MESSAGE,                      from command line)
    $(call INFO_MESSAGE,  klayout-drc:        Runs DRC and open reports on graphical)
	$(call INFO_MESSAGE,                      interface)
    $(call INFO_MESSAGE,  klayout-eval:       Runs DRC and LVS)
endef


# Rules
#######

.PHONY: klayout-validation
klayout-validation:
ifeq (,$(wildcard $(TOP_GDS)))
	$(call ERROR_MESSAGE, GDS file $(TOP_GDS) doesn't exist$)
endif
	
	$(call INFO_MESSAGE, [klayout] GDS:               $(TOP_GDS))

ifeq (,$(wildcard $(TOP_NETLIST_SCH)))
	$(call WARNING_MESSAGE, Schematic netlist doesn't exist$)
else
	$(call INFO_MESSAGE, Netlist from schematic  exist)
endif

	$(call INFO_MESSAGE, [klayout] directory:         $(TOP_GDS_DIR))
	$(call INFO_MESSAGE, [klayout] schematic netlist: $(TOP_NETLIST_SCH))
	$(call INFO_MESSAGE, [klayout] gds netlist:       $(TOP_NETLIST_GDS))


# Visualization
###############

.PHONY: klayout
klayout: klayout-view


.PHONY: klayout-view
klayout-view: klayout-validation
	$(KLAYOUT) -ne $(TOP_GDS) |& tee $(KLAYOUT_LOG)


.PHONY: klayout-edit
klayout-edit: klayout-validation
	$(KLAYOUT) -e $(TOP_GDS) |& tee $(KLAYOUT_LOG)


# LVS RULES
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


.PHONY: klayout-lvs-view
klayout-lvs-view: klayout-validation
	$(KLAYOUT) -e $(TOP_GDS) $(foreach file,$(TOP_ALL_LVSDB),-mn $(file))


.PHONY: klayout-lvs-only
klayout-lvs-only: klayout-validation
	python $(KLAYOUT_HOME)/lvs/run_lvs.py \
		--variant=D \
		--run_mode=flat \
		--verbose \
		--run_dir=$(TOP_GDS_DIR) \
		--layout=$(TOP_GDS) \
		--netlist=$(TOP_NETLIST_SCH) \
		--top_lvl_pins \
		--combine |& tee $(KLAYOUT_LVS_LOG) || true


.PHONY: klayout-lvs
klayout-lvs: klayout-lvs-only
	make TOP=$(TOP) klayout-lvs-view


# DRC RULES
###########

.PHONY: klayout-drc-view
klayout-drc-view: klayout-validation
	$(KLAYOUT) -e $(TOP_GDS) $(foreach file,$(TOP_ALL_LYRDB),-m $(file))


.PHONY: klayout-drc-only
klayout-drc-only: klayout-validation
	$(RM) $(TOP_GDS_DIR)/*.lyrdb

	python $(KLAYOUT_HOME)/drc/run_drc.py \
		--path $(TOP_GDS) \
		--variant=D \
		--topcell=$(TOP_GDS_CELL) \
		--run_dir=$(TOP_GDS_DIR) \
		--run_mode=flat \
		--antenna \
		--density \
		--thr=$(NPROCS) \
		--verbose |& tee $(KLAYOUT_DRC_EFABLES_LOG) || true

	$(KLAYOUT) -b -r $(KLAYOUT_HOME)/drc/gf180mcuD_mr.drc \
		-rd input=$(TOP_GDS) \
		-rd topcell=$(TOP_GDS_CELL) \
		-rd report=$(TOP_GDS_DIR)/precheck_$(TOP).lyrdb \
		-rd thr=$(NPROCS) \
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
		-rd beol=true |& tee $(KLAYOUT_DRC_PRECHECK_LOG) || true


.PHONY: klayout-drc
klayout-drc: klayout-drc-only
	make TOP=$(TOP) klayout-drc-view


.PHONY: klayout-eval
klayout-eval: klayout-drc-only klayout-lvs-only