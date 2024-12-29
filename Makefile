ifeq ($(shell uname),Darwin)
	CMD_PACKAGE_MANAGER := brew
	CMD_PACKAGE_MANAGER_INSTALL := brew install
	PACKAGE_DELTA := git-delta
endif

all: install

.PHONY: install
install: delta /usr/local/bin/gold

/usr/local/bin/gold: ./gold
	@cp -v $< $@

.PHONY: $(CMD_PACKAGE_MANAGER)
# macOS is assumed to always be the case here.
$(CMD_PACKAGE_MANAGER):
	@command -v $(CMD_PACKAGE_MANAGER) > /dev/null || \
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: delta
delta: $(CMD_PACKAGE_MANAGER)
	@command -v delta > /dev/null || $(CMD_PACKAGE_MANAGER_INSTALL) $(PACKAGE_DELTA)
