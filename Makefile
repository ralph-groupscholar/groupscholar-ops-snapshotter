SHELL := /bin/zsh

BIN_DIR := bin
BIN := $(BIN_DIR)/ops-snapshotter
SRC := src/ops_snapshotter.s

.PHONY: all build clean test

all: build

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

build: $(BIN_DIR)
	clang -arch arm64 -o $(BIN) $(SRC)

clean:
	rm -rf $(BIN_DIR)

test: build
	./tests/test_smoke.sh $(BIN)
