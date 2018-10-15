# Gingko BDD Testing Framework
# http://onsi.github.io/ginkgo/
# http://onsi.github.io/gomega/

GO ?= go
GOGET ?=$(GO) get -u
CURL ?= curl -sfL# The command to download files

COVERAGE ?= coverage# Name of the coverage file to generate

TEST_BINARY ?= ginkgo# Name of the test runner
TEST_OPTS ?= -p -r -race -randomizeAllSpecs -randomizeSuites -failOnPending -trace# Options to pass to the test binary

_pre_test:
ifeq (,$(shell command -v $(TEST_BINARY)))
	$(GOGET) github.com/onsi/ginkgo/ginkgo
endif
.PHONY: _install_test

_test:
	$(TEST_BINARY) $(TEST_OPTS)
.PHONY: _test

_test_changed: _test
	@echo "_test_changed: Not implemented yet!"
.PHONY: _test_changed

_clean_test:
	@echo "_clean_test: Nothing to do"
.PHONY: _clean_test

_pre_coverage: _install_test
_coverage:
	$(TEST_BINARY) -r -covermode=atomic
	echo "mode: atomic" > $(COVERAGE)
	tail -q -n+2 $$(find -name "*\.coverprofile") >> $(COVERAGE)
.PHONY: _install_coverage _coverage

_clean_coverage:
	rm -fv $(COVERAGE)
	find -type f -name "*\.coverprofile" -not -path ".git" -delete
