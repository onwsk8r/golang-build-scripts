## Golang-ci Lint
# https://github.com/golangci/golangci-lint

OS ?= $(shell uname -s)
GO ?= go
GOGET ?= $(GO) get -u
LINTER_OPTIONS ?= run --enable-all# Arguments to golangci-lint
LINTER_BINARY ?= golangci-lint# Name of the binary of this linter

_pre_lint:
ifeq (,$(shell command -v $(LINTER_BINARY)))
ifeq ($(OS), Darwin)
	brew install golangci/tap/golangci-lint
else
	$(GOGET) github.com/golangci/golangci-lint/cmd/golangci-lint
endif
endif
.PHONY: _install_lint

_lint:
	$(LINTER_BINARY) $(LINTER_OPTIONS) ./...
.PHONY: _lint

_lint_changed: _lint
	@echo "_lint_changed: This job has not been implemented yet."
.PHONY: _lint_changed

_clean_lint:
	@echo "_clean_lint: Nothing to do."
.PHONY: _clean_lint
