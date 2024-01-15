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
	$(wildcard ./test/resistor_core/*) \
	$(wildcard ./test/pmos1f/*) \
	$(wildcard ./test/pmos/*) \
	$(wildcard ./test/bjt/*) \
	$(wildcard ./test/cap_mim_2f/*) \
	$(wildcard ./test/pmos-automated/*) \
	$(wildcard ./test/waffle-12x12/*) \
	$(wildcard ./test/waffle-26x26/*)


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
$(warning $(COLOR_YELLOW)TOP not defined, using default values$(COLOR_END))
TOP_SCH=0_top.sch
else
TOP_SCH:=$(realpath $(filter %$(TOP).sch,$(SCH)))

TOP_TB:=$(realpath $(filter %$(TOP)-test.sch,$(TB)))

TOP_GDS:=$(realpath $(filter %$(TOP).gds,$(GDS)))

# TODO: This two variables are necessary?
TOP_PEX:=$(realpath $(filter %$(TOP).pex,$(PEX)))
TOP_PEX_SYM:=$(realpath $(filter %$(TOP)_flat.sym,$(SYM)))

TOP_NETLIST_SCH:=$(realpath $(filter %$(TOP).spice,$(ALL_NETLIST)))
TOP_NETLIST_GDS:=$(realpath $(filter %$(TOP).cir,$(ALL_NETLIST)))
TOP_NETLIST_PEX:=$(realpath $(filter %$(TOP).pex,$(ALL_NETLIST)))
TOP_NETLIST_PEX_SYM:=$(realpath $(filter %$(TOP)_flat.sym,$(SYM)))
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
	$(call INFO_MESSAGE, Help message for Makefile)
	$(call INFO_MESSAGE, to execute any command, the syntax is)
	$(call INFO_MESSAGE,)
	$(call INFO_MESSAGE,    $$ make TOP=<component> <command>)
	$(call INFO_MESSAGE,)
	$(call INFO_MESSAGE, for example:)
	$(call INFO_MESSAGE,)
	$(call INFO_MESSAGE,    $$ make TOP=resistor klayout-drc)
	$(call INFO_MESSAGE,    $$ make TOP=ldo-top xschem)
endef

include ../scripts/xschem.mk
include ../scripts/klayout.mk
include ../scripts/magic.mk
include ../scripts/netgen.mk
include ../scripts/ngspice.mk


.PHONY: clean
clean:
	$(RM) $(CLEANABLE)


.PHONY: print-vars
print-vars : \
	print-TOP \
	print-TOP_SCH \
	print-TOP_TB \
	print-TOP_GDS \
 	print-TOP_NETLIST_SCH \
	print-TOP_NETLIST_GDS \
	print-TOP_NETLIST_PEX


help:
	$(call HELP_ENTRIES)