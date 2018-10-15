# Dep
# https://golang.github.io/dep/

OS ?= $(shell uname -s)
CURL ?= curl -sfL# The command to get files

DEP_BINARY ?= dep# The name of the dep binary
VENDOR_DIR ?= vendor# The directory where vendored dependencies live

_pre_depend:
ifeq (,$(shell command -v $(DEP_BINARY)))
ifeq ($(OS), Darwin)
	brew install dep
else
	$(CURL) https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
endif
endif
.PHONY: _pre_depend

_depend:
	$(DEP_BINARY) ensure
.PHONY: _depend

_update_depend:
	@echo "_update_depend: This command has not been implemented yet."
.PHONY: _update_depend

_clean_depend:
	rm -Rf $(VENDOR_DIR)
.PHONY: _clean_depend
