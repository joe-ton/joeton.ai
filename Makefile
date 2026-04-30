# Makefile for joeton-blog (Astro + pnpm)

.PHONY: run r dev build install clean

# Default target
all: run

## Run the development server
run:
	pnpm dev

## Shortcut for run
r: run

## Alias for run (common in many projects)
dev: run

## Build for production
build:
	pnpm build

## Install dependencies
install:
	pnpm install

## Clean build artifacts and node_modules (use with caution)
clean:
	rm -rf dist .astro node_modules/.vite

# Help
help:
	@echo "Available commands:"
	@echo "  make run    - Start dev server (pnpm dev)"
	@echo "  make r      - Shortcut for run"
	@echo "  make build  - Build for production"
	@echo "  make install - Install dependencies"
	@echo "  make clean  - Remove build artifacts"
