SHELL := zsh

all: install

.PHONY: demo
demo: install
	@zgold -b ./demo/*

.PHONY: install
install: /usr/local/bin/zgold.zwc

.PHONY: uninstall
uninstall:
	rm /usr/local/bin/zgold
	rm /usr/local/bin/zgold.zwc

/usr/local/bin/zgold: ./zgold
	@cp -v $< $@

/usr/local/bin/zgold.zwc: /usr/local/bin/zgold
	zcompile $<
