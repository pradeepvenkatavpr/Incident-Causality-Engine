SHELL := /bin/bash

.DEFAULT_GOAL := help
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:

PROJECT_NAME := ai-devops-causality-engine
PYTHON ?= python3
PIP := $(PYTHON) -m pip
DOCKER_COMPOSE ?= docker compose

.PHONY: help install install-dev check lint format test run docker-build up down logs ps restart \
        validate-compose prometheus-check clean

help: ## Show available commands
	@grep -E '^[a-zA-Z0-9_.-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

install: ## Install application dependencies
	$(PIP) install -r requirements.txt

install-dev: ## Install application and development tools
	$(PIP) install -r requirements.txt
	$(PIP) install ruff pytest pytest-cov

check: ## Compile Python files to catch syntax errors
	$(PYTHON) -m compileall -q main.py

lint: ## Run Ruff lint checks (requires Ruff)
	$(PYTHON) -m ruff check main.py

format: ## Format Python code with Ruff (requires Ruff)
	$(PYTHON) -m ruff format main.py

test: ## Run tests if a tests directory exists
	@if [ -d tests ]; then \
		$(PYTHON) -m pytest -q; \
	else \
		echo "No tests/ directory found; skipping tests."; \
	fi

run: ## Run the FastAPI application locally
	$(PYTHON) -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload

docker-build: ## Build the API Docker image
	$(DOCKER_COMPOSE) build api

up: ## Start the application and observability stack
	$(DOCKER_COMPOSE) up -d --build

down: ## Stop the stack
	$(DOCKER_COMPOSE) down

logs: ## Follow logs from all services
	$(DOCKER_COMPOSE) logs -f --tail=100

ps: ## Show service status
	$(DOCKER_COMPOSE) ps

restart: ## Restart the API service
	$(DOCKER_COMPOSE) restart api

validate-compose: ## Validate Docker Compose configuration
	$(DOCKER_COMPOSE) config -q

prometheus-check: ## Validate Prometheus configuration inside the running container
	$(DOCKER_COMPOSE) exec prometheus promtool check config /etc/prometheus/prometheus.yml

clean: ## Remove Python caches and temporary test artifacts
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
	find . -type f -name '*.py[cod]' -delete
	rm -rf .pytest_cache .ruff_cache htmlcov .coverage
