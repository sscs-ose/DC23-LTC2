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
	$(foreach module,$(MODULES),$(wildcard $(module)/layout/*.nodes))

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

# Some variables are created on included makefiles
MAKE=make TOP=$(TOP) TEST=$(TEST) GND_NAME=$(GND_NAME)


.PHONY: print_vars
print_vars : \
	print_MAKE \
	print_TOP \
	print_MODULE_DIR \
	print_SCH \
	print_SYM \
	print_TB \
	print_GDS \
	print_GDS_CELL \
	print_TBS \
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


.PHONY: extensive-test
extensive-test:
	$(MAKE) klayout-drc-only     |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_extensive_test_$(TOP).log
	$(MAKE) klayout-lvs-only     |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_extensive_test_$(TOP).log
	$(MAKE) netgen-lvs-klayout   |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_extensive_test_$(TOP).log
	$(MAKE) netgen-lvs-magic     |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_extensive_test_$(TOP).log
	$(MAKE) magic-pex-extraction |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_extensive_test_$(TOP).log


.PHONY: drc
drc:
	$(MAKE) klayout-drc


lvs:
	$(MAKE) klayout-lvs-only   |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_lvs_$(TOP).log
	$(MAKE) netgen-lvs-magic   |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_lvs_$(TOP).log
	$(MAKE) netgen-lvs-klayout |& tee -a $(LOG_DIR)/$(TIMESTAMP_TIME)_lvs_$(TOP).log


pex:
	$(MAKE) magic-pex-extraction

IO_GDS:=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds
IO_SPICE:=$(PDK_ROOT)/$(PDK)/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
GDS_IO_CELLS:= \
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


klayout-io:
	$(KLAYOUT) -e -t $(IO_GDS)


extract-lvs-pads:
	$(MAKE) TOP=dummy create-schematic

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__asig_5p0 magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__asig_5p0_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__bi_t magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__bi_t_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__bi_24t magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__bi_24t_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__brk2 magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__brk2_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__brk5 magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__brk5_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__cor magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__cor_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__dvdd magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__dvdd_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__dvss magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__dvss_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fill1 magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__fill1_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fill5 magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__fill5_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fill10 magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__fill10_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fillnc magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__fillnc_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__in_c magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__in_c_clean.spice
	
	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__in_s magic-lvs-extraction
	mv ./dummy/output/extraction/layout_clean/dummy_clean.spice  ./spice/gf180mcu_fd_io__in_s_clean.spice


extract-pex-pads:
	$(MAKE) TOP=dummy create-schematic

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__asig_5p0 magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__bi_t magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__bi_24t magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__brk2 magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__brk5 magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__cor magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__dvdd magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__dvss magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fill1 magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fill5 magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fill10 magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__fillnc magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__in_c magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/

	$(MAKE) TOP=dummy GDS=$(IO_GDS) SCH_NETLIST_NOPREFIX=$(IO_SPICE) GDS_CELL=gf180mcu_fd_io__in_s magic-pex-extraction
	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/
	

# extract-io-pads:
# 	$(MAKE) TOP=dummy create-schematic
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__asig_5p0 magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__asig_5p0 magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__asig_5p0.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__asig_5p0_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__bi_t magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__bi_t magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__bi_t.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__bi_t_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__bi_24t magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__bi_24t magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__bi_24t.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__bi_24t_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__brk2 magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__brk2 magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__brk2.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__brk2_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__brk5 magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__brk5 magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__brk5.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__brk5_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__cor magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__cor magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__cor.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__cor_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__dvdd magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__dvdd magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__dvdd.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__dvdd_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__dvss magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__dvss magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__dvss.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__dvss_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fill1 magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fill1 magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__fill1.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__fill1_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fill5 magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fill5 magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__fill5.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__fill5_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fill10 magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fill10 magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__fill10.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__fill10_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fillnc magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__fillnc magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__fillnc.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__fillnc_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__in_c magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__in_c magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__in_c.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__in_c_pex.spice

# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__in_s magic-lvs-extraction
# 	$(MAKE) TOP=dummy GDS=$(IO_GDS) GDS_CELL=gf180mcu_fd_io__in_s magic-pex-extraction
# 	mv ./dummy/output/extraction/layout_clean/*.spice  ./spice/gf180mcu_fd_io__in_s.spice
# 	mv ./dummy/output/extraction/layout_pex/*.spice    ./spice/gf180mcu_fd_io__in_s_pex.spice