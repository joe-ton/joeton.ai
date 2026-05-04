# Makefile for joeton-blog (Astro + pnpm)

.PHONY: run r dev build install clean new n new-post

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

## Create a new blog post for Astro (prompts for title + opens in nvim)
new:
	@read -p "Enter post title: " title; \
	if [ -z "$$title" ]; then echo "Error: Title cannot be empty"; exit 1; fi; \
	slug=$$(echo "$$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$$//'); \
	date=$$(date +%Y-%m-%d); \
	dir="src/data/blog"; \
	mkdir -p $$dir; \
	filename="$$dir/$$slug.md"; \
	if [ -f "$$filename" ]; then echo "Error: File already exists: $$filename"; exit 1; fi; \
	echo '---' > $$filename; \
	echo "title: '$$title'" >> $$filename; \
	echo "description: 'Write a compelling description here...'" >> $$filename; \
	echo "pubDatetime: $$date" >> $$filename; \
	echo "updatedDate: ''" >> $$filename; \
	echo "heroImage: '/images/hero-placeholder.jpg'" >> $$filename; \
	echo "tags: []" >> $$filename; \
	echo '---' >> $$filename; \
	echo '' >> $$filename; \
	echo '<!-- Start writing your blog post here using Markdown -->' >> $$filename; \
	echo '' >> $$filename; \
	echo "✅ Created new post: $$filename"; \
	nvim $$filename

## Shortcut for new (like r for run)
n: new

## Backward-compatible alias
new-post: new

# Help
help:
	@echo "Available commands:"
	@echo "  make run      - Start dev server (pnpm dev)"
	@echo "  make r        - Shortcut for run"
	@echo "  make build    - Build for production"
	@echo "  make install  - Install dependencies"
	@echo "  make clean    - Remove build artifacts"
	@echo "  make new      - Create new Astro blog post (prompts title, opens in nvim)"
	@echo "  make n        - Shortcut for new"
	@echo "  make new-post - Alias for new (backward compatible)"
