MAGIC=LAYOUT=$(notdir $(TOP_GDS)) TOP=$(TOP) magic -rcfile $(MAGIC_RCFILE) -noconsole
MAGIC_BATCH=$(MAGIC) -nowrapper -nowindow -D -dnull


MAGIC_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-magic-$(TOP).log
MAGIC_LVS_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-magic-lvs-$(TOP).log
MAGIC_PEX_LOG=$(LOG_DIR)/$(TIMESTAMP_TIME)-magic-pex-$(TOP).log


.PHONY: magic
magic: magic-edit


.PHONY: magic-edit
magic-edit:
	$(MAGIC) $(TOP_GDS) |& tee $(MAGIC_LOG)


# Working on the TOP_DIR for simplicity, maybe we can change a internal variable to write all there.
.PHONY: magic-lvs
magic-lvs:
	cd $(TOP_DIR) && $(MAGIC_BATCH) $(MAGIC_LVS) |& tee $(MAGIC_LVS_LOG)


.PHONY: magic-pex
magic-pex:
	cd $(TOP_DIR) && $(MAGIC_BATCH) $(MAGIC_PEX) |& tee $(MAGIC_PEX_LOG)
