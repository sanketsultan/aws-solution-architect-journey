# Project 02 — Serverless SaaS Platform

A multi-tenant serverless SaaS application built with AWS CDK (TypeScript).

## Architecture

```
Tenants → CloudFront → API Gateway (HTTP API)
                             ↓
                     Cognito User Pools (per-tenant isolation)
                             ↓
                     Lambda Functions (business logic)
                             ↓
                 DynamoDB (tenant-partitioned data)
                             ↓
                 EventBridge (domain events)
```

## Key Design Decisions

- **Tenant Isolation** — tenant ID in every DynamoDB partition key; Cognito User Pool per tenant (pool-based isolation)
- **IaC** — AWS CDK TypeScript; constructs organised by domain (auth, api, data, observability)
- **API Design** — HTTP API with Lambda proxy integration; JWT authorizer using Cognito tokens
- **Observability** — CloudWatch Logs structured logging; X-Ray tracing; per-tenant CloudWatch dimensions

## Project Layout

- `cdk/` — CDK app and stacks
- `docs/` — architecture diagrams, tenant onboarding runbook

## Getting Started

```bash
cd cdk
npm install
cdk bootstrap
cdk deploy --all
```
