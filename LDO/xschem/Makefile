# User parameters
#################

PDK=gf180mcuD

# We assume that all relevant spices share the same name
TOP=
LVS_SCH_TOP:=$(TOP)
LVS_LAY_TOP:=$(TOP)

# TODO: Are we catching stderr into log files?
# TODO: Can we replace TOP from cli?  (make TOP=cell magic)?


TIMESTAMP_DAY=$$(date +%Y-%m-%d)
TIMESTAMP_TIME=$$(date +%H-%M-%S)


# Getting source file
#####################

## 1. Get all files ##

ALL_FILES:=$(wildcard ./bandgap/*) \
		   $(wildcard ./isource/*) \
		   $(wildcard ./ldo/*) \
		   $(wildcard ./ldo-top/*) \
		   $(wildcard ./ota-bandgap/*) \
		   $(wildcard ./ota-ldo/*) \
		   $(wildcard ./pmos/*) \
		   $(wildcard ./resistor/*) \
		   $(wildcard ./resistor_core/*)


## 2. Filter by type #

ALL_SCH:=$(filter %.sch,$(ALL_FILES))

ALL_LAYOUT:=$(filter %.gds,$(ALL_FILES))

ALL_NETLIST:=$(filter %.netlist,$(ALL_FILES))

ALL_CIR:=$(filter %.cir,$(ALL_FILES))


## 3. Filter by subtype ##

# Schematics
SCH:=$(filter-out %-test.sch,$(ALL_SCH))

# Testbenches
TB:=$(filter %-test.sch,$(ALL_SCH))

# Layout (gds)
GDS:=$(filter %.gds,$(ALL_LAYOUT))


## 3. Files related with the TOP

TOP_SCH:=$(filter %$(TOP).sch,$(SCH))

TOP_TB:=$(filter %$(TOP)-test.sch,$(TB))

TOP_GDS:=$(filter %$(TOP).gds,$(GDS))

TOP_NETLIST_SCH:=$(filter %$(TOP).netlist,$(ALL_NETLIST))

# Klayout calls it with .cir
TOP_NETLIST_GDS:=$(filter %$(TOP).cir,$(ALL_CIR))


# Relevant directories
#################

LOGDIR=logs/$(TIMESTAMP_DAY)

MAGIC_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-magic.log
XSCHEM_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-xschem.log
NETGEN_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-netgen.log
KLAYOUT_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-klayout.log

MAGIC_LVS_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-magic-lvs.log
MAGIC_PARASITIC_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-magic-pex.log
XSCHEM_LVS_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-xschem-lvs.log
KLAYOUT_LVS_LOG=$(LOGDIR)/$(TIMESTAMP_TIME)-klayout-lvs.log

OUTDIR=output

# Configuration files
#####################

#XSCHEM_RCFILE=$(PDK_ROOT)/$(PDK)/libs.tech/xschem/xschemrc
XSCHEM_RCFILE=xschemrc

MAGIC_RCFILE=$(PDK_ROOT)/$(PDK)/libs.tech/magic/$(PDK).magicrc
MAGIC_LVS=./scripts/magic_lvs.tcl
MAGIC_PARASITIC=./scripts/magic_parasitic.tcl

NETGEN_RCFILE=$(PDK_ROOT)/$(PDK)/libs.tech/netgen/setup.tcl



# Program Aliases
#################

GREP=grep --color=auto
RM=rm -rf

# https://xschem.sourceforge.io/stefan/xschem_man/developer_info.html
XSCHEM=xschem --rcfile $(XSCHEM_RCFILE)
XSCHEM=xschem --rcfile ./xschemrc
XSCHEM_NETLIST=$(XSCHEM) --netlist --netlist_path $(TOP) --netlist_filename $(TOP).netlist --preinit 'set lvs_netlist 1' --no_x --quit

KLAYOUT=klayout -t -d 1

MAGIC=magic -rcfile $(MAGIC_RCFILE) -noconsole
MAGIC_BATCH=$(MAGIC) -nowrapper -nowindow -D -dnull

NETGEN=netgen -batch lvs

############
## Utilities
############

all: xschem


.PHONY: clean
clean:
	$(RM) *.lyrdb
	$(RM) logs
	$(RM) *.ext
	$(RM) comp.out
	$(RM) *.sim *.nodes
	$(RM) output/*_lay.spice output/*_sch.spice output/*_parasitic.spice 


.PHONY: logdir
logdir:
	mkdir -p $(LOGDIR)


.PHONY: outdir
outdir:
	mkdir -p $(OUTDIR)


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
	print-TOP_NETLIST_GDS


#########
## Xschem
#########


.PHONY:xschem
xschem:
	$(XSCHEM) $(TOP_SCH)


.PHONY: xschem-sch
xschem-sch: logdir outdir
	$(XSCHEM) $(TOP_SCH) |& tee $(XSCHEM_LOG)


.PHONY: xschem-tb
xschem-tb: logdir outdir
	$(XSCHEM) $(TOP_TB) |& tee $(XSCHEM_LOG)


.PHONY: xschem-lvs
xschem-lvs: logdir outdir
	$(XSCHEM_NETLIST) $(TOP_SCH) |& tee $(XSCHEM_LVS_LOG)


##########
## Klayout
##########

# TODO: This rules are not verified
# TODO: Klayout DRC
# TODO: Klayout LVS

.PHONY: klayout
klayout: klayout-view


.PHONY: klayout-view
klayout-view: logdir outdir
	$(KLAYOUT) -ne $(TOP_GDS) |& tee $(KLAYOUT_LOG)


.PHONY: klayout-edit
klayout-edit: logdir outdir
	$(KLAYOUT) -e $(TOP_GDS) |& tee $(KLAYOUT_LOG)


.PHONY: klayout-lvs
klayout-lvs: logdir outdir xschem-lvs
	python $(KLAYOUT_HOME)/lvs/run_lvs.py --layout=$(TOP_GDS) --netlist=$(TOP_NETLIST_SCH) --run_mode=flat --spice_comments --variant=D --run_dir=$(TOP) --verbose


.PHONY: klayout-drc
klayout-drc: logdir outdir
	python $(KLAYOUT_HOME)/drc/run_drc.py --help


########
## Magic
########

# TODO: Magic DRC
# TODO: Do pex extraction include resistances?

.PHONY: magic
magic: magic-edit


.PHONY: magic-edit
magic-edit: logdir
	$(MAGIC) $(MAG) |& tee $(MAGIC_LOG)


.PHONY: magic-lvs
magic-lvs: logdir outdir
	LAYOUT=$(TOP_GDS) TOP=$(TOP) $(MAGIC_BATCH) $(MAGIC_LVS) |& tee $(MAGIC_LVS_LOG)


.PHONY: magic-pex
magic-pex: logdir outdir
	LAYOUT=$(TOP_GDS) TOP=$(TOP) $(MAGIC_BATCH) $(MAGIC_PARASITIC) |& tee $(MAGIC_PARASITIC_LOG)

#########
## Netgen
#########

.PHONY: netgen-lvs
netgen-lvs: logdir magic-lvs xschem-lvs
	$(NETGEN) "$(TOP_NETLIST_GDS) $(LVS_LAY_TOP)" "$(TOP_NETLIST_SCH) $(LVS_SCH_TOP)" $(NETGEN_RCFILE) |& tee $(NETGEN_LOG) || true
	grep "Netlist" comp.out


##########
## Aliases
##########

# TODO: Alias for drc

.PHONY: lvs
lvs: netgen-lvs


.PHONY: pex
pex: magic-pex