# Files, directories and Aliases
################################

MAGIC_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-magic-$(TOP).log
MAGIC_LVS_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-magic-lvs-$(TOP).log
MAGIC_PEX_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-magic-pex-$(TOP).log

#MAGIC=LAYOUT=$(notdir $(TOP_GDS)) TOP=$(TOP) magic -rcfile $(MAGIC_RCFILE) -noconsole
MAGIC=PEX_DIR=$(dir $(TOP_GDS)) LVS_DIR=$(dir $(TOP_GDS)) LAYOUT=$(TOP_GDS) TOP=$(TOP) magic -rcfile $(MAGIC_RCFILE) -noconsole
MAGIC_BATCH=$(MAGIC) -nowrapper -nowindow -D -dnull


# Rules
#######

.PHONY: magic-validation
magic-validation:
ifeq (,$(wildcard $(MAGIC_LVS_SCRIPT)))
	$(call ERROR_MESSAGE, [magic] There's no magic lvs script)
endif
ifeq (,$(wildcard $(MAGIC_PEX_SCRIPT)))
	$(call ERROR_MESSAGE, [magic] There's no magic pex script)
endif
	$(call INFO_MESSAGE, [magic] top:       $(TOP))
	$(call INFO_MESSAGE, [magic] directory: $(dir $(TOP_GDS)))
	$(call INFO_MESSAGE, [magic] gds:       $(TOP_GDS))
	$(call INFO_MESSAGE, [magic] rcfile:    $(MAGIC_RCFILE))

# TODO: Magic DRC
# TODO: Do pex extraction include resistances?


.PHONY: magic
magic: magic-edit


.PHONY: magic-edit
magic-edit: magic-validation
	$(MAGIC) $(TOP_GDS) |& tee $(MAGIC_LOG)


# Working on the TOP_DIR for simplicity, maybe we can change a internal variable to write all there.
.PHONY: magic-lvs
magic-lvs: magic-validation
	cd $(dir $(TOP_GDS)) && $(MAGIC_BATCH) $(MAGIC_LVS_SCRIPT) |& tee $(MAGIC_LVS_LOG)


.PHONY: magic-pex
magic-pex: magic-validation
	cd $(dir $(TOP_GDS)) && $(MAGIC_BATCH) $(MAGIC_PEX_SCRIPT) |& tee $(MAGIC_PEX_LOG)
