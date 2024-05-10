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
_IC_MAKEFILE=$(realpath ../scripts/ic-makefile)
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
	$(foreach module,$(MODULES),$(wildcard $(module)/layout/extfiles))

FULL_CLEANABLE:= $(CLEANABLE) \
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
include $(_IC_MAKEFILE)/cace.mk

# Some variables are created on included makefiles
MAKE=make TOP=$(TOP) TEST=$(TEST) GND_NAME=$(GND_NAME) MAGIC_FORCE_FLAT=$(MAGIC_FORCE_FLAT)


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
ifndef TEST
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


drc-with-klayout-deep:
	# OTA COMPONENTS
	make TOP=cm_nmos              GND_NAME=vss DRC_FLAT=N  klayout-drc # 
	make TOP=cm_pmos              GND_NAME=vss DRC_FLAT=N  klayout-drc # 
	make TOP=out_pmos             GND_NAME=vss DRC_FLAT=N  klayout-drc # 
	make TOP=diff_pair            GND_NAME=vss DRC_FLAT=N  klayout-drc # 
	make TOP=ota_res              GND_NAME=vss DRC_FLAT=N  klayout-drc # 

	# LDO
	make TOP=ota                  GND_NAME=vss DRC_FLAT=N  klayout-drc # 
	make TOP=resistor             GND_NAME=B   DRC_FLAT=N  klayout-drc # 
	make TOP=waffle_1984          GND_NAME=S   DRC_FLAT=N  klayout-drc # 
	make TOP=ldo                  GND_NAME=vss DRC_FLAT=N  klayout-drc # Density/195
	make TOP=open_ldo             GND_NAME=vss DRC_FLAT=N  klayout-drc # Density/198

	# INTEGRATION
	make TOP=TOP_CHILE_LDO        GND_NAME=vss DRC_FLAT=N  klayout-drc # Density/695
	make TOP=TOP_CHILE_OPEN_LDO   GND_NAME=vss DRC_FLAT=N  klayout-drc # Density/711


drc-with-klayout-flat:
	$(call ERROR_MESSAGE,FLAT is not recommended)
	# OTA COMPONENTS
	make TOP=cm_nmos              GND_NAME=vss klayout-drc-full # 
	make TOP=cm_pmos              GND_NAME=vss klayout-drc-full # 
	make TOP=out_pmos             GND_NAME=vss klayout-drc-full # 
	make TOP=diff_pair            GND_NAME=vss klayout-drc-full # 
	make TOP=ota_res              GND_NAME=vss klayout-drc-full # 

	# LDO
	make TOP=ota                  GND_NAME=vss klayout-drc-full # 
	make TOP=resistor             GND_NAME=B   klayout-drc-full # 
	make TOP=waffle_1984          GND_NAME=S   klayout-drc-full # 
	make TOP=ldo                  GND_NAME=vss klayout-drc-full # Density/1164
	make TOP=open_ldo             GND_NAME=vss klayout-drc-full # Density/1166

	# INTEGRATION
	make full-clean && \
	make TOP=TOP_CHILE_LDO        GND_NAME=vss DRC_FLAT=Y  \
		klayout-drc-offgrid \
		klayout-drc-density \
		klayout-drc-antenna && \
	make TOP=TOP_CHILE_OPEN_LDO   GND_NAME=vss DRC_FLAT=Y  \
		klayout-drc-offgrid \
		klayout-drc-density \
		klayout-drc-antenna

	make TOP=TOP_CHILE_LDO       klayout-drc-view # Density/70
	make TOP=TOP_CHILE_OPEN_LDO  klayout-drc-view # Density/72


lvs-with-klayout-deep:
	# OTA COMPONENTS
	make TOP=cm_nmos              GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # 
	make TOP=cm_pmos              GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # 
	make TOP=out_pmos             GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # 
	make TOP=diff_pair            GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # 
	make TOP=ota_res              GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # 

	# LDO
	make TOP=ota                  GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # 
	make TOP=resistor             GND_NAME=B   LVS_FLAT=N  klayout-lvs-only # 
	make TOP=waffle_1984          GND_NAME=S   LVS_FLAT=N  klayout-lvs-only # 
	make TOP=ldo                  GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # Match
	make TOP=open_ldo             GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # Match

	# INTEGRATION
	make TOP=TOP_CHILE_LDO        GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # Match
	make TOP=TOP_CHILE_OPEN_LDO   GND_NAME=vss LVS_FLAT=N  klayout-lvs-only # Match


lvs-with-klayout-flat:
	$(call ERROR_MESSAGE,FLAT is not recommended)
	# OTA COMPONENTS
	make TOP=cm_nmos              GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	make TOP=cm_pmos              GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	make TOP=out_pmos             GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	# diff_pair: Source is connected to cm, not vss. Difficult
	make TOP=diff_pair            GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	make TOP=ota_res              GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	# LDO
	make TOP=ota                  GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	make TOP=resistor             GND_NAME=B   LVS_FLAT=Y  klayout-lvs-only #
	make TOP=waffle_1984          GND_NAME=S   LVS_FLAT=Y  klayout-lvs-only #
	make TOP=ldo                  GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	make TOP=open_ldo             GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	# INTEGRATION
	make TOP=TOP_CHILE_LDO        GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #
	make TOP=TOP_CHILE_OPEN_LDO   GND_NAME=vss LVS_FLAT=Y  klayout-lvs-only #


extraction-with-magic:
	# OTA COMPONENTS
	make TOP=cm_nmos              GND_NAME=vss  magic-lvs-extraction #
	make TOP=cm_pmos              GND_NAME=vss  magic-lvs-extraction #
	make TOP=out_pmos             GND_NAME=vss  magic-lvs-extraction #
	make TOP=diff_pair            GND_NAME=vss  magic-lvs-extraction #
	make TOP=ota_res              GND_NAME=vss  magic-lvs-extraction #
	# LDO
	make TOP=ota                  GND_NAME=vss  magic-lvs-extraction #
	make TOP=resistor             GND_NAME=B    magic-lvs-extraction #
	make TOP=waffle_1984          GND_NAME=S    magic-lvs-extraction #
	make TOP=ldo                  GND_NAME=vss  magic-lvs-extraction #
	make TOP=open_ldo             GND_NAME=vss  magic-lvs-extraction #
	# INTEGRATION
	make TOP=TOP_CHILE_LDO        GND_NAME=vss  magic-lvs-extraction #
	make TOP=TOP_CHILE_OPEN_LDO   GND_NAME=vss  magic-lvs-extraction #


lvs-with-magic:
	# OTA COMPONENTS
	make TOP=cm_nmos              GND_NAME=vss  netgen-lvs-script #
	make TOP=cm_pmos              GND_NAME=vss  netgen-lvs-script #
	make TOP=out_pmos             GND_NAME=vss  netgen-lvs-script #
	make TOP=diff_pair            GND_NAME=vss  netgen-lvs-script #
	make TOP=ota_res              GND_NAME=vss  netgen-lvs-script #
	# LDO
	# Caps have inverted polarity on klayout and xschem
	make TOP=ota                  GND_NAME=vss  netgen-lvs-script #
	make TOP=resistor             GND_NAME=B    netgen-lvs-script #
	make TOP=waffle_1984          GND_NAME=S    netgen-lvs-script #
	make TOP=ldo                  GND_NAME=vss  netgen-lvs-script #
	make TOP=open_ldo             GND_NAME=vss  netgen-lvs-script #
	# INTEGRATION
	make TOP=TOP_CHILE_LDO        GND_NAME=vss  netgen-lvs-script #
	make TOP=TOP_CHILE_OPEN_LDO   GND_NAME=vss  netgen-lvs-script #


comparison-klayout-magic-extraction:
	# OTA COMPONENTS
	make TOP=cm_nmos              GND_NAME=vss  netgen-compare-magic-klayout #
	make TOP=cm_pmos              GND_NAME=vss  netgen-compare-magic-klayout #
	make TOP=out_pmos             GND_NAME=vss  netgen-compare-magic-klayout #
	make TOP=diff_pair            GND_NAME=vss  netgen-compare-magic-klayout #
	make TOP=ota_res              GND_NAME=vss  netgen-compare-magic-klayout #
	# LDO
	make TOP=ota                  GND_NAME=vss  netgen-compare-magic-klayout #
	make TOP=resistor             GND_NAME=B    netgen-compare-magic-klayout #
	make TOP=waffle_1984          GND_NAME=S    netgen-compare-magic-klayout #
	make TOP=ldo                  GND_NAME=vss  netgen-compare-magic-klayout #
	make TOP=open_ldo             GND_NAME=vss  netgen-compare-magic-klayout #
	# INTEGRATION
	make TOP=TOP_CHILE_LDO        GND_NAME=vss  netgen-compare-magic-klayout #
	make TOP=TOP_CHILE_OPEN_LDO   GND_NAME=vss  netgen-compare-magic-klayout #