# Golang module support using good ol `go mod`

VENDOR_DIR ?= vendor# The directory where vendored dependencies live

# Using regular go mod
_pre_depend:
	@echo "_pre_depend: nothing to do"
.PHONY: _pre_depend

_depend: # Fetch modules with `go mod download`
	go mod download
.PHONY: _depend

_update_depend: # Update (I think) modules with `go mod tidy`
	go mod tidy
.PHONY: _update_depend

_clean_depend:
	@echo "_clean_depend: this command has not been implemented"
.PHONY: _clean_depend
