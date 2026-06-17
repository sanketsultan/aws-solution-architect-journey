# Project 01 — Three-Tier Web Application

A production-grade, highly available three-tier web application on AWS.

## Architecture

```
                  Route 53
                     ↓
                 CloudFront
                     ↓
          [Public Tier] ALB
                     ↓
        [App Tier] ECS Fargate (Auto Scaling)
                     ↓
       [Data Tier] Aurora MySQL (Multi-AZ)
                     ↓
              ElastiCache (Redis)
```

## Tiers

- **Presentation** — CloudFront + ALB; static assets on S3; HTTPS enforced
- **Application** — ECS Fargate containers behind ALB; auto scales on CPU/request count
- **Data** — Aurora MySQL Multi-AZ; ElastiCache Redis for session and query caching

## Infrastructure Layout

- `terraform/vpc/` — VPC, subnets, NAT Gateways, Security Groups
- `terraform/compute/` — ECS cluster, task definition, service, ALB, Auto Scaling
- `terraform/database/` — Aurora cluster, ElastiCache replication group, Secrets Manager
- `terraform/monitoring/` — CloudWatch dashboards, alarms, SNS notifications

## Docs

- `docs/architecture-decisions.md` — ADRs for key technology choices
- `docs/cost-estimate.md` — monthly cost breakdown at various traffic levels

## Getting Started

1. Deploy VPC: `cd terraform/vpc && terraform apply`
2. Deploy compute: `cd terraform/compute && terraform apply`
3. Deploy database: `cd terraform/database && terraform apply`
4. Deploy monitoring: `cd terraform/monitoring && terraform apply`
