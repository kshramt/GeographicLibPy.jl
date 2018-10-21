# Constants
export JULIA := julia


# Configurations
.SUFFIXES:
.DELETE_ON_ERROR:
.SECONDARY:
.ONESHELL:
export SHELL := /bin/bash
export SHELLOPTS := pipefail:errexit:noclobber


# Tasks
.PHONY: all check
.DEFAULT_TARGET: all


all: check


check: test/runtests.jl.done


test/%.jl.done: test/%.jl src/GeographicLibPy.jl
	JULIA_LOAD_PATH="$(CURDIR)/src:$${JULIA_LOAD_PATH:-}" $(JULIA) $< && touch $@
