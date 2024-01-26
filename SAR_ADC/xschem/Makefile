PDK=gf180mcuD

TOP=
XSCHEM=xschem --rcfile ./xschemrc

.PHONY: xschem
xschem:
	PDK=$(PDK) $(XSCHEM) $(TOP)

all: xschem