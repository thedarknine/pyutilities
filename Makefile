.DEFAULT_GOAL := help
SHELL := /bin/bash

.PHONY: *

## BUILD ==============================================================

## Install dependencies
install:
	poetry install

## Lint code
cs:
	poetry run pylint --output-format=colorized pyutilities_thedarknine/*.py
	poetry run black pyutilities_thedarknine/*.py --diff

## Lint docstrings
cs-doc:
	poetry run ruff check

## Run tests
test:
	poetry run pytest

## Run tests with coverage report
test-report:
	poetry run pytest -v --cov=pyutilities_thedarknine/ --cov-report=html:./.tmp/coverage


## FORMATTER ==========================================================

# APPLICATION
APPLICATION := Product Migration

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

TARGET_MAX_CHAR_NUM=20
## Show this help
help:
	@echo '# ${YELLOW}${APPLICATION}${RESET} / ${GREEN}${ENV}${RESET}'
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			gsub(":", " ", helpCommand); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort