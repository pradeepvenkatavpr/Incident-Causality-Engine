# 🚨 AI DevOps Production Incident Causality Engine

<div align="center">

![](https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python&logoColor=white)
![](https://img.shields.io/badge/FastAPI-REST_APIs-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![](https://img.shields.io/badge/Prometheus-Metrics-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)
![](https://img.shields.io/badge/Grafana-Observability-F46800?style=for-the-badge&logo=grafana&logoColor=white)
![](https://img.shields.io/badge/Loki-Log_Aggregation-F0A000?style=for-the-badge&logo=grafana&logoColor=white)
![](https://img.shields.io/badge/OpenTelemetry-Observability-7B61A8?style=for-the-badge&logo=opentelemetry&logoColor=white)
![](https://img.shields.io/badge/Redis-Cache-DC382D?style=for-the-badge&logo=redis&logoColor=white)
![](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker&logoColor=white)

</div>

---

# 👨‍💻 Developed By

### Pradeep

---

# 📂 Repository Name

### `ai-devops-causality-engine`

---

# 🚀 About This Project

The AI DevOps Production Incident Causality Engine is an observability-focused backend application designed to help investigate production incidents by bringing together incident information, service signals, metrics, and logs.

Production environments can generate large volumes of telemetry and operational events. During an incident, engineers need to identify relevant signals, understand the likely sequence of failures, and narrow down possible root causes without manually searching every monitoring source.

This project provides a FastAPI-based service for submitting and retrieving incident information, applying heuristic root-cause analysis, and querying configured Prometheus and Loki endpoints for supporting observability data. An optional OpenAI-compatible LLM integration can enhance the analysis when credentials and configuration are supplied.

The project also includes a Docker Compose observability stack with Prometheus, Grafana, Loki, Redis, and an OpenTelemetry Collector configuration.

---

# ❗ Problem Statement

Production incident investigations can be slowed down by challenges such as:

- Operational events and incident details spread across different sources
- Large volumes of logs and metrics to review during an outage
- Difficulty correlating service symptoms with a possible cause
- Time-consuming manual investigation and triage
- Limited visibility into incident patterns and investigation status
- Need for consistent, API-accessible incident analysis

The project addresses these challenges by providing a single API-oriented workflow for recording incident information, evaluating signals, and gathering supporting observability context.

---

# 🎯 System Objectives

- Provide REST APIs for incident intake and retrieval
- Apply heuristic logic to identify possible incident causes
- Query Prometheus for metrics context
- Query Loki for log context when configured
- Offer optional LLM-assisted analysis
- Expose application health and readiness endpoints
- Publish application metrics for Prometheus scraping
- Run the application and observability services with Docker Compose
- Keep configuration and secrets outside source code

---

# ✨ Key Features

## 🚨 Incident Intake and Management

- Accept incident information through API endpoints
- Retrieve and search recorded incident information
- Provide incident details in structured responses
- Include a demo workflow for trying the analysis functionality

## 🧠 Root-Cause Analysis

- Apply heuristic rules to evaluate incident signals
- Produce likely-cause hypotheses and supporting context
- Return structured analysis through the API
- Optionally use an OpenAI-compatible LLM provider to enhance analysis when configured

> Analysis results are investigative hypotheses, not a guarantee of the true production root cause. Engineers should validate findings against their environment and telemetry.

## 📈 Prometheus Metrics Integration

- Query a configured Prometheus endpoint for metric context
- Expose application metrics at `/metrics`
- Allow Prometheus to scrape the API service
- Support operational visibility into application behavior

## 📜 Loki Log Integration

- Query a configured Loki endpoint for relevant log context
- Bring log evidence into the incident investigation workflow
- Keep Loki connectivity configurable through environment settings

## 🩺 Health and Readiness

- Provide health and readiness endpoints
- Support container health checks
- Help operators verify that the API process is responding

## 🐳 Containerized Observability Stack

- Run the API and supporting services with Docker Compose
- Include Prometheus for metrics collection
- Include Grafana for visualization
- Include Loki for log aggregation
- Include Redis as a supporting cache service
- Include OpenTelemetry Collector configuration for telemetry pipelines

## ⚙️ Configuration-Driven Setup

- Keep runtime settings in environment variables
- Use `config.yaml` for the configured telemetry collector
- Provide `.env.example` as the starting point for local configuration
- Keep local secrets out of version control

---

# 🏗️ System Architecture

The project is organized around an API service connected to observability components.

### Core Components

- **FastAPI application:** incident APIs, health endpoints, analysis workflow, and application metrics
- **Heuristic analysis layer:** evaluates available incident information and produces possible causes
- **Prometheus:** collects metrics from configured scrape targets
- **Loki:** provides log-query capabilities
- **Grafana:** provides an observability visualization interface
- **Redis:** supporting cache service in the local stack
- **OpenTelemetry Collector:** configured telemetry collection and export component
- **Docker Compose:** runs the local application and supporting services

### High-Level Flow

```text
Incident Request
      |
      v
FastAPI Application
      |
      +----> Heuristic Root-Cause Analysis
      |
      +----> Prometheus Metrics Query
      |
      +----> Loki Log Query
      |
      +----> Optional LLM-Assisted Analysis
      |
      v
Structured Incident Analysis Response

Prometheus ----> Scrapes API Metrics
Grafana -------> Visualizes Configured Observability Data
OpenTelemetry Collector ---> Configured Telemetry Pipeline
```

---

# ⚙️ Technologies Used

<div align="center">

![](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)
![](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)
![](https://img.shields.io/badge/Loki-F0A000?style=for-the-badge&logo=grafana&logoColor=white)
![](https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=redis&logoColor=white)
![](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

</div>

### Technologies Included

- Python 3.12+
- FastAPI
- Uvicorn
- Pydantic
- HTTPX
- PyYAML
- Prometheus client library
- Prometheus
- Grafana
- Loki
- Redis
- OpenTelemetry Collector
- Docker
- Docker Compose
- Optional OpenAI-compatible LLM API

---

# 📁 File Structure

```text
ai-devops-causality-engine/
│
├── README.md
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── .gitignore
├── main.py
├── config.yaml
├── prometheus.yml
└── Makefile
```

---

# ⚙️ Installation and Setup

## 1️⃣ Prerequisites

Install the following tools before starting:

- Python 3.12 or later
- Docker Engine or Docker Desktop
- Docker Compose
- Git (if cloning the repository)

## 2️⃣ Configure Environment Variables

Copy the example environment file to a local `.env` file.

### Linux / macOS

```bash
cp .env.example .env
```

### Windows PowerShell

```powershell
Copy-Item .env.example .env
```

Review `.env` and update values where needed. In particular, replace example passwords and provide an LLM API key only if you intend to use the optional LLM integration. Do not commit `.env` or real secrets to version control.

## 3️⃣ Start the Application Stack

From the project root, run:

```bash
docker compose up -d --build
```

Check service status:

```bash
docker compose ps
```

Follow service logs:

```bash
docker compose logs -f --tail=100
```

## 4️⃣ Run Locally Without Docker

Create and activate a virtual environment, then install dependencies.

### Windows PowerShell

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

### Linux / macOS

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

When running the API directly on the host, make sure the configured Prometheus, Loki, and Redis URLs are reachable from the host environment.

---

# 🌐 Application Endpoints

With the default API port configured as `8000`, the application is expected to be available at:

| Resource | URL |
|---|---|
| API base | `http://localhost:8000` |
| Interactive API documentation | `http://localhost:8000/docs` |
| Alternative API documentation | `http://localhost:8000/redoc` |
| Health check | `http://localhost:8000/health` |
| Readiness check | `http://localhost:8000/ready` |
| Application metrics | `http://localhost:8000/metrics` |

The exact host ports depend on the values in `.env` and `docker-compose.yml`.

---

# 📊 Observability Interfaces

When the services are running and their configured ports are available, use the following local interfaces:

- **Prometheus:** `http://localhost:9090`
- **Grafana:** `http://localhost:3000`
- **Loki:** `http://localhost:3100`

Use the Grafana credentials configured in `.env`. The actual service availability and dashboards depend on the Compose configuration and service health.

---

# 🔄 System Workflow

### 1️⃣ Incident Submission

An incident is submitted to the API with the available incident details and signals.

### 2️⃣ Incident Processing

The API validates the request and prepares the incident information for analysis.

### 3️⃣ Heuristic Analysis

The analysis logic evaluates the supplied information and generates likely-cause hypotheses.

### 4️⃣ Observability Context

When configured and reachable, Prometheus and Loki are queried for supporting metrics and log context.

### 5️⃣ Optional LLM Enhancement

If an LLM provider and API key are configured, the application can use the compatible provider to enhance its analysis.

### 6️⃣ Structured Response

The API returns the incident information and analysis in a structured response suitable for further investigation.

### 7️⃣ Metrics Collection

Prometheus can scrape the API's metrics endpoint to support application monitoring.

### 8️⃣ Visualization

Grafana can be used to explore configured observability data and dashboards.

---

# 🧪 Validation and Testing

Use the included Makefile for common development and operations commands.

```bash
make help
make check
make validate-compose
make up
make ps
make logs
```

To validate Prometheus configuration after the stack is running:

```bash
make prometheus-check
```

The `make test` target runs pytest if a `tests/` directory is present. This repository layout does not include a `tests/` directory by default, so add tests before treating the project as covered by an automated test suite.

---

# 🛡️ Configuration and Security Notes

- Store local configuration in `.env`; do not commit secrets.
- Replace all example credentials before using the stack beyond local development.
- Restrict API and observability ports when deploying outside a trusted development environment.
- Configure CORS origins to match the clients that should access the API.
- Use least-privilege credentials and secure transport for production integrations.
- Validate analysis results against real metrics, logs, traces, and deployment changes before taking remediation actions.

---

# ⚠️ Current Scope and Limitations

- The incident store is in-memory; incident records are not durable across application restarts.
- Root-cause results are hypotheses generated from available evidence and heuristic logic, with optional LLM assistance.
- Prometheus and Loki features depend on those services being reachable and containing relevant telemetry.
- LLM enhancement depends on valid provider configuration, credentials, and network access.
- The included Compose setup is intended as a local development and demonstration environment, not a complete production deployment.
- Production use would require additional review of authentication, authorization, durable storage, secrets management, resilience, and operational security.

---

# 🚀 Future Improvements

- Add persistent incident storage
- Correlate metrics, logs, traces, and deployment events more deeply
- Add automated regression and integration tests
- Improve service dependency mapping and causal ranking
- Add authentication and role-based access control
- Add incident timelines and investigation history
- Add controlled remediation recommendations with approval gates
- Add CI/CD workflows and production deployment manifests
- Expand dashboards and alerting rules
- Evaluate analysis quality against a curated incident dataset

---

# 🌍 Potential Use Cases

### 🚨 Production Incident Triage

Collect incident context and help engineers narrow down potential causes.

### 📈 Observability-Assisted Investigation

Use available metrics and logs as evidence during incident analysis.

### 🧰 DevOps Engineering Demonstration

Demonstrate how an API, monitoring tools, and optional AI analysis can work together.

### 🔍 Reliability Engineering

Provide a foundation for experimenting with incident classification, causal hypotheses, and operational investigation workflows.

---

# 🏁 Conclusion

The AI DevOps Production Incident Causality Engine brings incident intake, heuristic root-cause analysis, observability queries, and optional LLM-assisted analysis into a single API-oriented project. With a containerized local stack and Prometheus metrics support, it provides a foundation for exploring how DevOps and observability signals can support production incident investigations.

The project is designed as an extensible starting point. Persistent storage, stronger security controls, broader automated testing, and deeper telemetry correlation are important next steps before using it as a production incident-management system.
