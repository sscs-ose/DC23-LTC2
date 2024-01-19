# SEE THIS: https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents
# https://www.gnu.org/software/make/manual/html_node/Functions.html
# https://stackoverflow.com/questions/24144440/color-highlighting-of-makefile-warnings-and-errors

SHELL:=bash

NPROCS=$(shell grep -c ^processor /proc/cpuinfo)

GREP=grep --color=auto
RM=rm -rf

COLOR_BLACK:=$(shell tput setaf 0)
COLOR_RED:=$(shell tput setaf 1)
COLOR_GREEN:=$(shell tput setaf 2)
COLOR_YELLOW:=$(shell tput setaf 3)
COLOR_BLUE:=$(shell tput setaf 4)
COLOR_MAGENTA:=$(shell tput setaf 5)
COLOR_CYAN:=$(shell tput setaf 6)
COLOR_WHITE:=$(shell tput setaf 7)
COLOR_END:=$(shell tput sgr0 )

define ERROR_MESSAGE =
	$(error $(COLOR_RED)$(1)$(COLOR_END))
endef

define WARNING_MESSAGE =
	$(warning $(COLOR_YELLOW)$(1)$(COLOR_END))
endef

define INFO_MESSAGE =
	$(info $(COLOR_CYAN)$(1)$(COLOR_END))
endef

test-colors:
	@echo -e "$(COLOR_BLACK) hola_0 $(COLOR_END)"
	@echo -e "$(COLOR_RED) hola_1 $(COLOR_END)"
	@echo -e "$(COLOR_GREEN) hola_2 $(COLOR_END)"
	@echo -e "$(COLOR_YELLOW) hola_3 $(COLOR_END)"
	@echo -e "$(COLOR_BLUE) hola_4 $(COLOR_END)"
	@echo -e "$(COLOR_MAGENTA) hola_5 $(COLOR_END)"
	@echo -e "$(COLOR_CYAN) hola_6 $(COLOR_END)"
	@echo -e "$(COLOR_WHITE) hola_7 $(COLOR_END)"
