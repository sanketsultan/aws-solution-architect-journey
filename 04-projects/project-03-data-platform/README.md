# Project 03 — Data Platform (Data Lake + Analytics)

A scalable data lake and analytics platform on AWS using S3, Glue, Athena, and Redshift.

## Architecture

```
Sources (RDS, APIs, SaaS)
        ↓
Kinesis Data Firehose / AWS DMS
        ↓
S3 Data Lake (raw / processed / curated zones)
        ↓
AWS Glue ETL (PySpark jobs)
        ↓
Glue Data Catalog
        ↓
Athena (ad-hoc SQL) / Redshift (BI / dashboards)
        ↓
QuickSight (visualisation)
```

## Key Design Decisions

- **Storage Format** — Parquet with Snappy compression in processed/curated zones for Athena performance
- **Partitioning** — partition by year/month/day/hour for time-series data; reduces scan cost
- **Governance** — Lake Formation for column-level and row-level security; Glue catalog as single source of truth
- **Cost** — S3 Intelligent-Tiering for raw zone; Athena workgroups with per-query data limits

## Project Layout

- `terraform/` — infrastructure for S3 buckets, Glue, IAM, Lake Formation
- `docs/` — data model, lineage, ingestion runbook

## Getting Started

```bash
cd terraform
terraform init && terraform apply
```
