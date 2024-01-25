all: print-vars
include ../scripts/base.mk

# User parameters
#################

PDK=gf180mcuD
TOP=

TIMESTAMP_DAY=$$(date +%Y-%m-%d)
TIMESTAMP_TIME=$$(date +%H-%M-%S)

# TOP is a directory that contains relevant files that share the same name.
# - TOP/TOP.sch
# - TOP/TOP.sym
# - TOP/TOP-test.sch
# - TOP/TOP.gds

# Getting Files
###############

## 1. Get all files ##

ALL_FILES:= \
	$(wildcard ./*) \
	$(wildcard ./bandgap/*) \
	$(wildcard ./isource/*) \
	$(wildcard ./waffle/*) \
	$(wildcard ./ldo/*) \
	$(wildcard ./ldo-top/*) \
	$(wildcard ./ota-bandgap/*) \
	$(wildcard ./ota-ldo/*) \
	$(wildcard ./resistor/*) \
	$(wildcard ./waffle_1984/*) \
	$(wildcard ./ldo_layout/*) \
	$(wildcard ./test/resistor_core/*) \
	$(wildcard ./test/pmos1f/*) \
	$(wildcard ./test/pmos/*) \
	$(wildcard ./test/bjt/*) \
	$(wildcard ./test/cap_mim_2f/*) \
	$(wildcard ./test/pmos-automated/*) \
	$(wildcard ./test/waffle-12x12/*) \
	$(wildcard ./test/waffle-26x26/*) \
	$(wildcard ./PLL_TOP_MUX_7/*)


## 2. Filter by type #

ALL_SCH:=$(filter %.sch,$(ALL_FILES))

ALL_LAYOUT:=$(filter %.gds,$(ALL_FILES))

ALL_NETLIST:= \
	$(filter %.spice,$(ALL_FILES)) \
	$(filter %.cdl,$(ALL_FILES)) \
	$(filter %.cir,$(ALL_FILES))


## 3. Filter by subtype ##

# Schematics
SCH:=$(filter-out %-test.sch,$(ALL_SCH))
SYM:=$(filter %.sym,$(ALL_FILES))

# Testbenches
TB:=$(filter %-test.sch,$(ALL_SCH))

# Parasitix extraction (pex)
PEX:=$(filter %.pex,$(ALL_FILES))

# Layout (gds)
GDS:=$(filter %.gds,$(ALL_LAYOUT))

# Garbage
CLEANABLE:= \
	$(filter %.log,$(ALL_FILES)) \
	$(filter %comp.out,$(ALL_FILES)) \
	$(filter %.ext,$(ALL_FILES)) \
	$(filter %.sim,$(ALL_FILES)) \
	$(filter %.nodes,$(ALL_FILES)) \
	$(filter %.drc,$(ALL_FILES))
# $(filter %.lyrdb,$(ALL_FILES))
# $(filter %.lvsdb,$(ALL_FILES))

## 3. Files related with the TOP

ifeq (,$(TOP))
# NEVER define TOP in this section. Empty TOP is useful as an indicator
$(warning $(COLOR_YELLOW)TOP not defined, using default values$(COLOR_END))
TOP_SCH=0_top.sch
else
TOP_SCH:=$(realpath $(filter %/$(TOP).sch,$(SCH)))

TOP_TB:=$(realpath $(filter %/$(TOP)-test.sch,$(TB)))

TOP_GDS:=$(realpath $(filter %/$(TOP).gds,$(GDS)))
TOP_GDS_CELL:=$(basename $(notdir $(TOP_GDS)))

TOP_GDS_DIR:=$(abspath $(dir $(TOP_GDS)))
TOP_SCH_DIR:=$(abspath $(dir $(TOP_SCH)))

# Extracted from schematics (xschem)
TOP_NETLIST_SCH:=$(realpath $(filter %/$(TOP).spice,$(ALL_NETLIST)))
TOP_NETLIST_LVS_NOPREFIX:=$(TOP_SCH_DIR)/$(TOP)-noprefix.spice
TOP_NETLIST_LVS_PREFIX:=$(TOP_SCH_DIR)/$(TOP)-prefix.spice

# Extracted from layout
# (klayout)
TOP_EXTRACTED_KLAYOUT:=$(realpath $(filter %/$(TOP).cir,$(wildcard $(TOP_GDS_DIR)/*)))
# (magic)
TOP_EXTRACTED_MAGIC:=$(realpath $(filter %/$(TOP)-extracted.spice,$(wildcard $(TOP_GDS_DIR)/*)))
TOP_EXTRACTED_PEX:=$(realpath $(filter %/$(TOP)-pex.spice,$(wildcard $(TOP_GDS_DIR)/*)))

endif

# Relevant directories
##################

LOG_DIR=$(abspath logs)/$(TIMESTAMP_DAY)
ifeq (,$(wildcard $(LOG_DIR)))
$(shell mkdir -p $(LOG_DIR))
endif

XSCHEM_RCFILE=$(realpath ./xschemrc)

MAGIC_RCFILE=$(realpath ./magicrc)
MAGIC_LVS_SCRIPT=$(realpath ../scripts/magic_lvs.tcl)
MAGIC_PEX_SCRIPT=$(realpath ../scripts/magic_pex.tcl)

NETGEN_RCFILE=$(realpath $(PDK_ROOT)/$(PDK)/libs.tech/netgen/setup.tcl)

# Rules
#######

define HELP_ENTRIES =
Help message for Makefile
  to execute any command, the syntax is

    $$ make TOP=<component> <command>

  for example:

    $$ make TOP=resistor klayout-drc
    $$ make TOP=ldo-top xschem
	$$ make TOP=ldo-top print-TOP_GDS_DIR

  clean:          Removes intermediate files.
  print-%:        For every variable, prints it's value
  print-vars:     Shows some variable values
  help:           Shows this help
  xschem:         Alias for xschem-sch
  klayout:        Alias for klayout-edit
  magic:          Alias for magic-edit
  create-module:  Generates empty files that conforms a basic module

endef


include ../scripts/xschem.mk
include ../scripts/klayout.mk
include ../scripts/magic.mk
include ../scripts/netgen.mk
include ../scripts/ngspice.mk


.PHONY: help
help:
	$(call INFO_MESSAGE, $(HELP_ENTRIES))



.PHONY: clean
clean:
	$(RM) $(CLEANABLE)


# https://www.cmcrossroads.com/article/printing-value-makefile-variable
# https://stackoverflow.com/questions/16467718/how-to-print-out-a-variable-in-makefile
print-% : ; $(info $*: $(flavor $*) variable - $($*)) @true


.PHONY: print-vars
print-vars : \
	print-TOP \
	print-TOP_SCH \
	print-TOP_TB \
	print-TOP_GDS \
 	print-TOP_NETLIST_SCH \
	print-TOP_NETLIST_GDS \
	print-TOP_NETLIST_PEX


.PHONY: xschem
xschem: xschem-sch


.PHONY: klayout
klayout: klayout-edit


.PHONY: magic
magic: magic-edit


.PHONY: create-module
create-module:
ifeq (,$(TOP))
	$(call ERROR_MESSAGE, TOP not defined, couldn't create any design)
endif
	mkdir -p $(TOP)
ifneq (,$(wildcard $(TOP)/$(TOP).sch))
	$(call WARNING_MESSAGE, schematic already exists)
else
	xschem --rcfile $(XSCHEM_RCFILE) \
	--no_x \
	--quit \
	--command "xschem clear; xschem saveas $(TOP)/$(TOP).sch"
endif

ifneq (,$(wildcard $(TOP)/$(TOP)-test.sch))
	$(call WARNING_MESSAGE, schematic testbench already exists)
else
	xschem --rcfile $(XSCHEM_RCFILE) \
	--no_x \
	--quit \
	--command "xschem clear; xschem saveas $(TOP)/$(TOP)-test.sch"
endif

ifneq (,$(wildcard $(TOP)/$(TOP).gds))
	$(call WARNING_MESSAGE, layout already exists)
else
	klayout -t -e -zz -r ../scripts/empty-gds.py -rd filepath=$(TOP)/$(TOP).gds
endif
