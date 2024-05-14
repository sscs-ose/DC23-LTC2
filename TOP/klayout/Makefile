include base.mk

# == User variables ==

PDK=gf180mcuD

# Relative or absolute path to gds
TOP=
GDS=$(TOP)

# Cell to be evaluated on gds
CELL=

# Sometimes, drc should be performed on FLAT run mode.
DRC_FLAT=

# Preserve state between MAKE invocations
MAKE=make \
	GDS=$(GDS) \
	CELL=$(CELL) \
	KLAYOUT_FLAT=$(KLAYOUT_FLAT) \
	DRC_FLAT=$(DRC_FLAT)

# == Workplace Variables == #

MODULE_DIR=$(dir $(GDS))
REPORT_DIR=$(MODULE_DIR)/reports

GDS_NAME=$(basename $(notdir $(GDS)))

ifeq (,$(CELL))
CELL=$(GDS_NAME)
endif

SUBDIRS:= $(foreach \
	module, \
	$(realpath .), \
	$(shell find $(module) -maxdepth 1 -mindepth 1 -type d -print) \
)

CLEANABLE:= \
	$(foreach module,$(SUBDIRS),$(wildcard $(module)/reports))

# == Klayout variables == #

KLAYOUT_HOME=$(PDK_ROOT)/gf180mcuD/libs.tech/klayout
KLAYOUT_RCFILE=$(wildcard klayoutrc)
ALL_LYRDB:=$(filter %.lyrdb,$(wildcard $(REPORT_DIR)/*))
ALL_LVSDB:=$(filter %.lvsdb,$(wildcard $(REPORT_DIR)/*))

ifneq (,$(wildcard $(KLAYOUT_RCFILE)))
KLAYOUT=klayout -c $(KLAYOUT_RCFILE) -t
else
$(call WARNING_MESSAGE, klayoutrc not found)
KLAYOUT=klayout -t
endif

ifneq (,$(DRC_FLAT))
KLAYOUT_DRC_RUN_MODE=flat
else
KLAYOUT_DRC_RUN_MODE=deep
endif

KLAYOUT_REPORT_PREFIX=drc_efabless_$(GDS_NAME)_$(KLAYOUT_DRC_RUN_MODE)

KLAYOUT_DRC=python3 $(KLAYOUT_HOME)/drc/run_drc.py \
	--variant=D \
	--run_mode=$(KLAYOUT_DRC_RUN_MODE) \
	--verbose \
	--thr=$(NPROCS) \
	--run_dir=$(REPORT_DIR) \
	--topcell=$(CELL) \
	--path $(GDS)

# == Makefile Rules ==

all: drc


dependencies:
ifeq (,$(GDS))
	$(call ERROR_MESSAGE, GDS variable not defined)
endif
	mkdir -p $(REPORT_DIR)


klayout:
	klayout -e -t -c klayoutrc $(GDS)


.PHONY: drc-beol
drc-beol: dependencies
	$(KLAYOUT_DRC) \
		--no_feol \
		--no_offgrid \
		|| true
	mv $(REPORT_DIR)/$(GDS_NAME)_main.lyrdb $(REPORT_DIR)/$(KLAYOUT_REPORT_PREFIX)_beol.lyrdb


.PHONY: drc-feol
drc-feol: dependencies
	$(KLAYOUT_DRC) \
		--no_beol \
		--no_offgrid \
		|| true
	mv $(REPORT_DIR)/$(GDS_NAME)_main.lyrdb $(REPORT_DIR)/$(KLAYOUT_REPORT_PREFIX)_feol.lyrdb


.PHONY: drc-density
drc-density: dependencies
	$(KLAYOUT_DRC) \
		--density_only \
		--no_connectivity \
		--no_offgrid \
		|| true
	mv $(REPORT_DIR)/$(GDS_NAME)_density.lyrdb $(REPORT_DIR)/$(KLAYOUT_REPORT_PREFIX)_density.lyrdb


.PHONY: drc-antenna
drc-antenna: dependencies
	$(KLAYOUT_DRC) \
		--antenna_only \
		--no_offgrid \
		|| true
	mv $(REPORT_DIR)/$(GDS_NAME)_antenna.lyrdb $(REPORT_DIR)/$(KLAYOUT_REPORT_PREFIX)_antenna.lyrdb


.PHONY: drc-offgrid
drc-offgrid: dependencies
	$(KLAYOUT_DRC) \
		--table=geom \
		|| true
	mv $(REPORT_DIR)/$(GDS_NAME)_geom.lyrdb $(REPORT_DIR)/$(KLAYOUT_REPORT_PREFIX)_offgrid.lyrdb


.PHONY: drc-view
drc-view: dependencies
ifeq (,$(ALL_LYRDB))
	$(call ERROR_MESSAGE, [klayout] There's no DRC reports for $(GDS))
else
	$(KLAYOUT) -e $(GDS) $(foreach file,$(ALL_LYRDB),-m $(file))
endif


.PHONY: drc
drc: dependencies
	rm $(ALL_LYRDB) || true
	$(MAKE) DRC_FLAT=Y drc-offgrid  # 
	$(MAKE) DRC_FLAT=N drc-offgrid  # 
	$(MAKE) DRC_FLAT=Y drc-density  # 
	$(MAKE) DRC_FLAT=N drc-density  # 
	$(MAKE) drc-antenna             # 
	$(MAKE) drc-beol                # 
	$(MAKE) drc-feol                # 
	$(MAKE) drc-view                # 


PHONY: layout-drc-evaluation
layout-drc-evaluation:
	make TOP=chile/TOP_CHILE_LDO.gds       drc #
	make TOP=chile/TOP_CHILE_OPEN_LDO.gds  drc #
	make TOP=korea/TOP_KOREA.gds           drc #
	make TOP=japan/TOP_JAPAN.gds           drc #
	make TOP=final/LTC2.gds                drc #


.PHONY: drc-full
drc-full: dependencies
	rm $(ALL_LYRDB) || true
	$(MAKE) drc-offgrid
	$(MAKE) DRC_FLAT=Y drc-density drc-antenna drc-beol drc-feol
	$(MAKE) drc-view


.PHONY: drc-raw
drc-raw: dependencies
	$(KLAYOUT_DRC) --antenna --density || true
	$(MAKE) drc-view


.PHONY: drc-testing
drc-testing: dependencies
	rm $(ALL_LYRDB) || true

	# Don't know
	$(MAKE) DRC_FLAT=Y drc-antenna

	# Fasts
	$(MAKE) drc-offgrid
	$(MAKE) DRC_FLAT=Y drc-density

	# Slow
	$(MAKE) DRC_FLAT=Y drc-beol
	$(MAKE) DRC_FLAT=Y drc-feol

	$(MAKE) drc-view
