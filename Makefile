SHELL := zsh

ifeq ($(shell uname),Darwin)
	CMD_PACKAGE_MANAGER := brew
	CMD_PACKAGE_MANAGER_INSTALL := brew install
	PACKAGE_DELTA := git-delta
endif

all: install

.PHONY: test
test: install
	@zgold -b ./test/*

.PHONY: install
install: delta /usr/local/bin/zgold /usr/local/bin/zgold.zwc

/usr/local/bin/zgold: ./zgold
	@cp -v $< $@

/usr/local/bin/zgold.zwc: /usr/local/bin/zgold
	zcompile $<

.PHONY: $(CMD_PACKAGE_MANAGER)
# macOS is assumed to always be the case here.
$(CMD_PACKAGE_MANAGER):
	@command -v $(CMD_PACKAGE_MANAGER) > /dev/null || \
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: delta
delta: $(CMD_PACKAGE_MANAGER)
	@command -v delta > /dev/null || $(CMD_PACKAGE_MANAGER_INSTALL) $(PACKAGE_DELTA)
