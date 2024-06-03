# Copyright 2024 Chip USM - UTFSM
# Developed by: Aquiles Viza
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

all: print_vars
_IC_MAKEFILE=$(realpath ../LDO/scripts/ic-makefile)
include $(_IC_MAKEFILE)/base.mk


# User controllable variables

TOP=UNDEFINED
TEST=UNDEFINED
RTL=UNDEFINED

MODULE_SOURCE_DIR=$(realpath .)

MODULE_CONFIG_FILES=$(word 1, $(MODULE_SOURCE_DIR))
_FIRST_TOP_MODULE_DIR=$(word 1, $(MODULE_SOURCE_DIR))

# Tool configuration files

PDK=gf180mcuD
PYTHON=python

## XSCHEM
XSCHEM_RCFILE=$(realpath $(MODULE_CONFIG_FILES)/xschemrc)

## MAGIC
MAGIC_RCFILE=$(realpath $(MODULE_CONFIG_FILES)/magicrc)

## NETGEN
NETGEN_RCFILE=$(realpath $(PDK_ROOT)/$(PDK)/libs.tech/netgen/setup.tcl)

## NGSPICE
NGSPICE_RCDIR=$(realpath $(MODULE_CONFIG_FILES))

## EBC
EBC_DIR=$(realpath $(_IC_MAKEFILE)/extra_be_checks)
EBC_UPRJ_ROOT=$(realpath $(MODULE_CONFIG_FILES))
EBC_CONFIG=$(realpath $(MODULE_CONFIG_FILES)/lvs_config.json)

## KLAYOUT
KLAYOUT_HOME=$(PDK_ROOT)/$(PDK)/libs.tech/klayout
KLAYOUT_RCFILE=$(realpath $(MODULE_CONFIG_FILES)/klayoutrc)

# Documentation

define PARAMETER_ENTRY +=

Makefile variables:
  TOP: Indicates the top module, from a list of modules
  TEST: Each TOP could have multiple tests

  ex: make TOP=inv_sample TEST=test_2

endef


define HELP_ENTRIES +=
Help message for Makefile
  to execute any command, the syntax is

    $$ make TOP=<component> <command>

  for example:

    $$ make TOP=resistor klayout-drc
    $$ make TOP=ldo-top xschem
	$$ make TOP=ldo-top print-GDS_DIR

  clean:          Removes intermediate files.
  print-%:        For every variable, prints it's value
  print-vars:     Shows some variable values
  help:           Shows this help
  xschem:         Alias for xschem-sch
  klayout:        Alias for klayout-edit
  magic:          Alias for magic-edit
  create-module:  Generates empty files that conforms a basic module

endef

## Files related with the TOP

MODULES= $(foreach \
	module, \
	$(MODULE_SOURCE_DIR), \
	$(shell find $(module) -maxdepth 1 -mindepth 1 -type d -print) \
)

ifeq (UNDEFINED,$(TOP))

$(call WARNING_MESSAGE,TOP not defined. Using default values)
SCH=0_top.sch

else # ifeq (UNDEFINED,$(TOP))

# TOP defined: Define directories

MODULE_DIR=$(filter %/$(TOP),$(MODULES))
ifneq (,$(word 2,$(MODULE_DIR)))
$(call ERROR_MESSAGE,Multiple modules found $(MODULE_DIR))
endif

OUTPUT_DIR:=$(abspath $(MODULE_DIR)/output)

GDS_DIR:=$(abspath        $(MODULE_DIR)/layout)
REPORT_DIR:=$(abspath     $(OUTPUT_DIR)/reports)
EXTRACTION_DIR:=$(abspath $(OUTPUT_DIR)/extraction)
CODEMODELS_DIR:=$(abspath $(OUTPUT_DIR)/code_models)

SCH_DIR:=$(abspath $(EXTRACTION_DIR)/schematic)
TB_DIR:=$(abspath  $(EXTRACTION_DIR)/test)

# TOP defined: Enforce module structure

ifneq (,$(MODULE_DIR))
$(call INFO_MESSAGE,Module "$(TOP)" in directory $(MODULE_DIR))
$(shell mkdir -p $(OUTPUT_DIR))
$(shell mkdir -p $(REPORT_DIR))
$(shell mkdir -p $(EXTRACTION_DIR)/schematic)
$(shell mkdir -p $(EXTRACTION_DIR)/layout_clean)
$(shell mkdir -p $(EXTRACTION_DIR)/layout_pex)
$(shell mkdir -p $(TB_DIR))
endif

# TOP defined: Files

SCH:=$(wildcard $(MODULE_DIR)/symbol/$(TOP).sch)
SYM:=$(wildcard $(MODULE_DIR)/symbol/$(TOP).sym)
GDS:=$(wildcard $(MODULE_DIR)/layout/$(TOP).gds)
GDS_CELL:=$(basename $(notdir $(GDS)))
TBS:=$(wildcard $(MODULE_DIR)/test/*.sch)
ifeq (UNDEFINED,$(TEST))
TB:=$(word 1,$(TBS))
else
TB:=$(filter %/$(TEST).sch,$(TBS))
endif
VERILOGS:=\
	$(wildcard $(MODULE_DIR)/verilog/*.v) \
	$(wildcard $(MODULE_DIR)/verilog/*.sv)
ifeq (UNDEFINED,$(RTL))
VERILOG:=$(word 1,$(VERILOGS))
else
VERILOG=$(filter %/$(RTL).v,$(VERILOGS))
endif

# TOP defined: Extracted netlists

TB_NETLIST:=$(TB_DIR)/$(basename $(notdir $(TB))).spice

SCH_NETLIST_PREFIX:=$(SCH_DIR)/$(TOP)_prefix.spice
SCH_NETLIST_NOPREFIX:=$(SCH_DIR)/$(TOP)_noprefix.spice

LAYOUT_NETLIST_KLAYOUT:=$(EXTRACTION_DIR)/layout_clean/$(TOP).cir
LAYOUT_NETLIST_MAGIC:=$(EXTRACTION_DIR)/layout_clean/$(TOP)_clean.spice
LAYOUT_NETLIST_PEX:=$(EXTRACTION_DIR)/layout_pex/$(TOP)_pex.spice

endif # ifeq (UNDEFINED,$(TOP))

CLEANABLE:= \
	$(foreach module,$(MODULES),$(wildcard $(module)/output/reports/drc_run_*.log)) \
	$(foreach module,$(MODULES),$(wildcard $(module)/output/reports/*.drc)) \
	$(foreach module,$(MODULES),$(wildcard $(module)/layout/*.ext)) \
	$(foreach module,$(MODULES),$(wildcard $(module)/layout/*.sim)) \
	$(foreach module,$(MODULES),$(wildcard $(module)/layout/*.nodes)) \
	$(foreach module,$(MODULES),$(wildcard $(module)/layout/extfiles)) \
	$(foreach module,$(MODULES),$(wildcard $(module)/report/*.log))

FULL_CLEANABLE:= \
	$(foreach module,$(MODULES),$(wildcard $(module)/output))

# Logs

TIMESTAMP_DAY=$(shell date +%Y_%m_%d)
TIMESTAMP_TIME=$(shell date +%H_%M_%S)

LOG_DIR=$(abspath ./logs/$(TIMESTAMP_DAY))
ifeq (,$(wildcard $(LOG_DIR)))
$(shell mkdir -p $(LOG_DIR))
endif

# Include modules

include $(_IC_MAKEFILE)/xschem.mk
include $(_IC_MAKEFILE)/klayout.mk
include $(_IC_MAKEFILE)/magic.mk
include $(_IC_MAKEFILE)/netgen.mk
include $(_IC_MAKEFILE)/ngspice.mk
include $(_IC_MAKEFILE)/extra_be_checks.mk

# Some variables are created on included makefiles
MAKE=make TOP=$(TOP) TEST=$(TEST) GND_NAME=$(GND_NAME)

PDK_IO_SPICE:=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
PDK_IO_BB_SPICE:=$(MODULE_SOURCE_DIR)/spice/$(basename $(notdir $(PDK_IO_SPICE)))_bb.spice
PDK_IO_GDS:=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds

PDK_SC_SPICE:=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
PDK_SC_GDS:=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_sc_mcu7t5v0/gds/gf180mcu_fd_sc_mcu7t5v0.gds


.PHONY: print_vars
print_vars : \
	print_raw_MAKE \
	print_raw_TOP \
	print_MODULE_DIR \
	print_SCH \
	print_SYM \
	print_TB \
	print_GDS \
	print_raw_GDS_CELL \
	print_names_TBS \
	print_SCH_NETLIST \
	print_SCH_NETLIST_NOPREFIX \
	print_SCH_NETLIST_PREFIX \
 	print_LAYOUT_NETLIST_KLAYOUT \
	print_LAYOUT_NETLIST_MAGIC \
	print_LAYOUT_NETLIST_PEX


.PHONY: xschem
xschem: xschem-sch


.PHONY: klayout
klayout: klayout-edit


.PHONY: magic
magic: magic-edit


.PHONY: create-validation
create-validation:
ifeq (UNDEFINED,$(TOP))
	$(call ERROR_MESSAGE, TOP not defined and couldn't create anything)
endif
	mkdir -p $(_FIRST_TOP_MODULE_DIR)/$(TOP)/symbol
	mkdir -p $(_FIRST_TOP_MODULE_DIR)/$(TOP)/layout
	mkdir -p $(_FIRST_TOP_MODULE_DIR)/$(TOP)/test


.PHONY: create-schematic
create-schematic: create-validation
ifneq (,$(wildcard $(_FIRST_TOP_MODULE_DIR)/$(TOP)/symbol/$(TOP).sch))
	$(call ERROR_MESSAGE, schematic already exists)
else
	xschem --rcfile $(XSCHEM_RCFILE) \
	--no_x \
	--quit \
	--command "xschem clear; xschem saveas $(_FIRST_TOP_MODULE_DIR)/$(TOP)/symbol/$(TOP).sch"
endif


.PHONY: create-testbench
create-testbench: create-validation
ifdef TEST
	$(call ERROR_MESSAGE, TEST parameter not defined)
else ifneq (,$(wildcard $(_FIRST_TOP_MODULE_DIR)/$(TOP)/test/$(TEST).sch))
	$(call ERROR_MESSAGE, testbench already exists)
else
	xschem --rcfile $(XSCHEM_RCFILE) \
	--no_x \
	--quit \
	--command "xschem clear; xschem saveas $(_FIRST_TOP_MODULE_DIR)/$(TOP)/test/$(TEST).sch
endif


ifneq (,$(wildcard $(_FIRST_TOP_MODULE_DIR)/$(TOP)/test/$(TOP)-test.sch))
	$(call WARNING_MESSAGE, schematic already exists)
else
	xschem --rcfile $(XSCHEM_RCFILE) \
	--no_x \
	--quit \
	--command "xschem clear; xschem saveas $(_FIRST_TOP_MODULE_DIR)/$(TOP)/symbol/$(TOP).sch"
endif


.PHONY: create-layout
create-layout: create-validation
ifneq (,$(wildcard $(_FIRST_TOP_MODULE_DIR)/$(TOP)/layout/$(TOP).gds))
	$(call WARNING_MESSAGE, layout already exists)
else
	klayout -t -e -zz -r $(_IC_MAKEFILE)/scripts/empty-gds.py -rd filepath=$(_FIRST_TOP_MODULE_DIR)/$(TOP)/layout/$(TOP).gds
endif


.PHONY: create-module
create-module:
	$(MAKE) create-schematic
	$(MAKE) create-layout


# Conclusion: Neiter pad has drc problems
.PHONY: klayout-gf180mcu-drc-view
gf180mcu-drc-view:
	$(MAKE) TOP=gf180mcu_fd_io__asig_5p0 klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__bi_24t   klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__bi_t     klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__brk2     klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__brk5     klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__cor      klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__dvdd     klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__dvss     klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__fill1    klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__fill5    klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__fill10   klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__fillnc   klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__in_c     klayout-drc-view
	$(MAKE) TOP=gf180mcu_fd_io__in_s     klayout-drc-view


.PHONY: klayout-gf180mcu-drc
gf180mcu-drc:
	$(MAKE) TOP=gf180mcu_fd_io__asig_5p0 klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__bi_24t   klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__bi_t     klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__brk2     klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__brk5     klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__cor      klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__dvdd     klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__dvss     klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__fill1    klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__fill5    klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__fill10   klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__fillnc   klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__in_c     klayout-drc-only
	$(MAKE) TOP=gf180mcu_fd_io__in_s     klayout-drc-only


.PHONY: klayout-gf180mcu-clean-extraction
gf180mcu-clean-extraction:
	$(MAKE) TOP=gf180mcu_fd_io__asig_5p0 magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__bi_24t   magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__bi_t     magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__brk2     magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__brk5     magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__cor      magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__dvdd     magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__dvss     magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fill1    magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fill5    magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fill10   magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fillnc   magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__in_c     magic-lvs-extraction
	$(MAKE) TOP=gf180mcu_fd_io__in_s     magic-lvs-extraction


.PHONY: klayout-gf180mcu-pex-extraction
gf180mcu-pex-extraction:
	$(MAKE) TOP=gf180mcu_fd_io__asig_5p0 magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__bi_24t   magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__bi_t     magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__brk2     magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__brk5     magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__cor      magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__dvdd     magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__dvss     magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fill1    magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fill5    magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fill10   magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__fillnc   magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__in_c     magic-pex-extraction
	$(MAKE) TOP=gf180mcu_fd_io__in_s     magic-pex-extraction

define netgen_lvs =
	make \
		TOP=$(1) \
		SCH_NETLIST_PREFIX=$(PDK_IO_SPICE) \
		SCH_NETLIST_NOPREFIX=$(PDK_IO_SPICE) \
		LEF=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_io/lef/$(1).lef \
		netgen-lvs-magic
endef
# && mv $(MODULE_SOURCE_DIR)/$(1)/output/reports/lvs_magic_comp.out reports/$(1)_netgen_lvs.log \ 
# && mv $(MODULE_SOURCE_DIR)/$(1)/output/extraction/layout_clean/$(1)_clean.spice reports/$(1)_clean.spice

define netgen_analyze =
	echo $(1) && \
	grep "Device classes" $(wildcard report/$(1)_netgen_lvs.log) && \
	grep "Final result:"  $(wildcard report/$(1)_netgen_lvs.log)

endef


PADS= \
	gf180mcu_fd_io__asig_5p0 \
	gf180mcu_fd_io__bi_24t \
	gf180mcu_fd_io__bi_t \
	gf180mcu_fd_io__brk2 \
	gf180mcu_fd_io__brk5 \
	gf180mcu_fd_io__cor \
	gf180mcu_fd_io__dvdd \
	gf180mcu_fd_io__dvss \
	gf180mcu_fd_io__fill1 \
	gf180mcu_fd_io__fill5 \
	gf180mcu_fd_io__fill10 \
	gf180mcu_fd_io__fillnc \
	gf180mcu_fd_io__in_c \
	gf180mcu_fd_io__in_s

PDK_IO_LEF:=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_io/lef/$(TOP).lef

SHARED_GDS_DIR=$(MODULE_SOURCE_DIR)/magic_output

# $(foreach pad,$(PADS),make GDS_DIR=$(SHARED_GDS_DIR) TOP=$(pad) SCH_NETLIST_PREFIX=$(PDK_IO_SPICE) SCH_NETLIST_NOPREFIX=$(PDK_IO_SPICE) netgen-lvs-magic; )
.PHONY: gf180mcu-lvs
#$(foreach pad,$(PADS),$(call netgen_lvs,$(pad)))

# asig_5p0  Final result: Circuits match uniquely.
# bi_24t    Final result: Circuits match uniquely. Property errors were found.
# bi_t      Final result: Circuits match uniquely. Property errors were found.
# brk2      Final result: Verify:  cell has no elements and/or nodes.  Not checked.
# brk5      Final result: Verify:  cell has no elements and/or nodes.  Not checked.
# cor       Final result: Circuits match uniquely.
# dvdd      Final result: Circuits match uniquely.
# dvss      Final result: Circuits match uniquely.
# fill1     Final result: Verify:  cell has no elements and/or nodes.  Not checked.
# fill5     Final result: Circuits match uniquely.
# fill10    Final result: Circuits match uniquely.
# fillnc    Final result: Verify:  cell has no elements and/or nodes.  Not checked.
# in_c      Final result: Circuits match uniquely. Property errors were found.
# in_s      Final result: Circuits match uniquely. Property errors were found.

gf180mcu-lvs:
	mkdir -p reports/
	$(foreach pad,$(PADS),$(call netgen_lvs,$(pad));)


gf180mcu-lvs-analyze:
	$(foreach pad,$(PADS),$(call netgen_analyze,$(pad)))


gf180mcu-extract-sc:
	make GDS=$(PDK_SC_GDS) GDS_DIR=. klayout-extract-topcells


gf180mcu-extract-io:
	make GDS=$(PDK_IO_GDS) GDS_DIR=. klayout-extract-topcells


gf180mcu-klayout-io:
	$(KLAYOUT) -e -t $(PDK_IO_GDS)


gf180mcu-klayout-sc:
	$(KLAYOUT) -e -t $(PDK_SC_GDS)

# When extracting io and stdcell, the internal content of each device should be flat
# not have subcells


# TOP=gf180mcu_fd_io__asig_5p0  # Circuits match uniquely.
# TOP=gf180mcu_fd_io__cor       # Circuits match uniquely.
# TOP=gf180mcu_fd_io__dvdd      # Circuits match uniquely.
# TOP=gf180mcu_fd_io__dvss      # Circuits match uniquely.
# TOP=gf180mcu_fd_io__fill5     # Circuits match uniquely.
# TOP=gf180mcu_fd_io__fill10    # Circuits match uniquely.
# TOP=gf180mcu_fd_io__brk2      # contains no devices.
# TOP=gf180mcu_fd_io__brk5      # contains no devices.
# TOP=gf180mcu_fd_io__fill1     # contains no devices.
# TOP=gf180mcu_fd_io__fillnc    # contains no devices.
# TOP=gf180mcu_fd_io__bi_24t    # Circuits match uniquely. Property errors were found.
# TOP=gf180mcu_fd_io__bi_t      # Circuits match uniquely. Property errors were found.
# TOP=gf180mcu_fd_io__in_c      # Circuits match uniquely. Property errors were found.
# TOP=gf180mcu_fd_io__in_s      # Circuits match uniquely. Property errors were found.

verify-pad-extraction:
	$(MAKE) \
		SCH_NETLIST_PREFIX=$(PDK_IO_SPICE) \
		SCH_NETLIST_NOPREFIX=$(PDK_IO_SPICE) \
		netgen-lvs-script

# Padring procedure:
# - Start from a lvs clean spice, that means, the same extracted netlist
# - Clean the re-generated spices
#     - Remove all the subckt that has the same port list as the pdk pad spice
#     - add a prefix to each generated and modified io pad (FALSE_gf180mcu_fd_io__asig_5p0)
#     - Separate and store the important subcells on different files.
#     - For each subckt, group by cell type.
#     - Change the names of power nets. (tail_*, head_*, dvdd_1_*)

## - Separate the cells by power domain, rename nets to make them understandable
## - Replace 


# Match uniquely
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__fill5 NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__fill5
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__fill10 NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__fill10
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__fill10 NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__fillnc
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__dvdd NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__dvdd
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__dvss NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__dvss
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__cor NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__cor
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__asig_5p0 NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__asig_5p0

# Top level failed pin matching
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__bi_t NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__bi_t
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=gf180mcu_fd_io__in_c NETGEN_SCHEMATIC_CELL=gf180mcu_fd_io__in_c

# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=padring_side_right NETGEN_SCHEMATIC_CELL=DELETE_padring_side_right
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=padring_side_top NETGEN_SCHEMATIC_CELL=DELETE_padring_side_top

# Mismatch
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=padring_side_left NETGEN_SCHEMATIC_CELL=DELETE_padring_side_left
# LVS_PADRING_CELL=NETGEN_LAYOUT_CELL=padring_side_bottom NETGEN_SCHEMATIC_CELL=DELETE_padring_side_bottom

lvs-padring:
	$(MAKE) TOP=PADRING_LTC2_V3 netgen-lvs-script \
		SCH_NETLIST_PREFIX=PADRING_LTC2_V3/spice/PADRING_LTC2_V3.spice \
		$(LVS_PADRING_CELL)


lvs-with-spice:
	$(MAKE) \
		SCH_NETLIST_PREFIX=$(MODULE_DIR)/spice/$(TOP).spice \
		SCH_NETLIST_NOPREFIX=$(MODULE_DIR)/spice/$(TOP).spice \
		netgen-lvs-script


padring-extraction:
	make TOP=PADRING_LTC2_V3 GND_NAME=DVSS LVS_FLAT=Y klayout-lvs-only

## PADRING

# ERROR: In /home/designer/.volare/gf180mcuD/libs.tech/klayout/lvs/gf180mcu.lvs: 'netlist': Errors encountered during netlist extraction:
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_top: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_right: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_bottom: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (879.84,0;879.84,350;955.16,350;955.16,0)
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (1679.84,0;1679.84,350;1755.16,350;1755.16,0)
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (2179.84,0;2179.84,350;2255.16,350;2255.16,0)
# [must-connect] In cell padring_side_right: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (1279.84,0;1279.84,350;1355.16,350;1355.16,0)
# [must-connect] In cell padring_side_right: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (779.84,0;779.84,350;855.16,350;855.16,0)
# ...
# (list shortened after 10 errrors, see log for all errors) in LayoutToNetlist::check_extraction_errors
# ERROR: RuntimeError: 'netlist': Errors encountered during netlist extraction:
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_top: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_right: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_bottom: Must-connect nets DVSS of circuit gf180mcu_fd_io__cor are not connected, shape: (0,0;0,355.16;355.16,355.16;355.16,0)
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (879.84,0;879.84,350;955.16,350;955.16,0)
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (1679.84,0;1679.84,350;1755.16,350;1755.16,0)
# [must-connect] In cell padring_side_left: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (2179.84,0;2179.84,350;2255.16,350;2255.16,0)
# [must-connect] In cell padring_side_right: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (1279.84,0;1279.84,350;1355.16,350;1355.16,0)
# [must-connect] In cell padring_side_right: Must-connect nets DVSS of circuit gf180mcu_fd_io__dvss are not connected, shape: (779.84,0;779.84,350;855.16,350;855.16,0)
# ...
# (list shortened after 10 errrors, see log for all errors) in LayoutToNetlist::check_extraction_errors in Executable::execute
#   /home/designer/.volare/gf180mcuD/libs.tech/klayout/lvs/gf180mcu.lvs:358:in `execute'
#   :/built-in-macros/lvs_interpreters.lym:31:in `instance_eval'
#   :/built-in-macros/lvs_interpreters.lym:31:in `execute'
# 2024-05-10 04:57:02 +0000: Memory Usage (765068K) : Starting GF180 LVS comparison section
# Traceback (most recent call last):
#   File "/home/designer/.volare/gf180mcuD/libs.tech/klayout/lvs/run_lvs.py", line 437, in <module>
#     main(lvs_run_dir, arguments)
#   File "/home/designer/.volare/gf180mcuD/libs.tech/klayout/lvs/run_lvs.py", line 401, in main
#     res_db_files = run_check(lvs_rule_deck, layout_path, lvs_run_dir, switches)
#                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#   File "/home/designer/.volare/gf180mcuD/libs.tech/klayout/lvs/run_lvs.py", line 354, in run_check
#     check_call(run_str, shell=True)
#   File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
#     raise CalledProcessError(retcode, cmd)
# subprocess.CalledProcessError: Command 
# klayout \
	-b \
	-r \
	/home/designer/.volare/gf180mcuD/libs.tech/klayout/lvs/gf180mcu.lvs \
	-rd thr=8 \
	-rd run_mode=deep \
	-rd metal_top=11K \
	-rd mim_option=B \
	-rd metal_level=5LM \
	-rd poly_res=1k \
	-rd mim_cap=2 \
	-rd lvs_sub=DVSS \
	-rd verbose=false \
	-rd spice_net_names=true \
	-rd spice_comments=false \
	-rd scale=false \
	-rd schematic_simplify=true \
	-rd net_only=true \
	-rd top_lvl_pins=true \
	-rd combine=true \
	-rd purge=true \
	-rd purge_nets=true \
	-rd topcell=PADRING_LTC2_V3 \
	-rd input=/workspaces/Chipalooza2024_TempSensor_AC3E/PROBLEMS/test/DC23-LTC2-LDO/padframe/PADRING_LTC2_V3/layout/PADRING_LTC2_V3.gds \
	-rd schematic=/workspaces/Chipalooza2024_TempSensor_AC3E/PROBLEMS/test/DC23-LTC2-LDO/padframe/PADRING_LTC2_V3/output/extraction/schematic/PADRING_LTC2_V3_noprefix.spice \
	-rd report=/workspaces/Chipalooza2024_TempSensor_AC3E/PROBLEMS/test/DC23-LTC2-LDO/padframe/PADRING_LTC2_V3/output/reports/PADRING_LTC2_V3.lvsdb \
	-rd target_netlist=/workspaces/Chipalooza2024_TempSensor_AC3E/PROBLEMS/test/DC23-LTC2-LDO/padframe/PADRING_LTC2_V3/output/reports/PADRING_LTC2_V3.cir
	
# returned non-zero exit status 1.



klayout-lvs-over-configured-pads:
	make TOP=bi_t_fast klayout-drc-flat && klayout-drc-view #