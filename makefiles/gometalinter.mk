## Gometalinter
# https://github.com/alecthomas/gometalinter

CURL ?= curl -sfL# The command to get files
LINTER_OPTIONS ?= --deadline 599s# Arguments to golangci-lint
LINTER_BINARY ?= gometalinter# Name of the binary of this linter

_pre_lint:
ifeq (,$(shell command $(LINTER_BINARY)))
	$(CURL) https://git.io/vp6lP | sh
endif
.PHONY: _install_lint

_lint:
	$(LINTER_BINARY) $(LINTER_OPTIONS) ./...
.PHONY: _lint

_lint_changed: lint
	@echo "_lint_changed is not implemented. Fell back to _lint."
.PHONY: _lint_changed

_clean_lint:
	@echo "_clean_lint: Nothing to do."
.PHONY: _clean_lint
