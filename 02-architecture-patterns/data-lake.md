# Data Lake Architecture on AWS

Centralized repository to store structured, semi-structured, and unstructured data at scale.

## Key Concepts

- **Storage Layer** — S3 as the data lake store; organize with prefix conventions (raw/, processed/, curated/); storage classes for cost optimization
- **Ingestion** — batch (AWS Glue, S3 Transfer); streaming (Kinesis Data Firehose → S3); CDC (DMS, Debezium → Kinesis)
- **Catalog & Governance** — AWS Glue Data Catalog for schema discovery; Lake Formation for fine-grained access control and data sharing
- **Processing** — Glue ETL (Spark-based); EMR for large-scale Spark/Hadoop; Lambda for lightweight transforms
- **Query Layer** — Amazon Athena (serverless SQL on S3); Redshift Spectrum (query S3 from Redshift); OpenSearch for log analytics

## Reference Architecture

```
Sources → Kinesis Firehose → S3 (raw)
                                ↓
                         Glue ETL → S3 (processed)
                                        ↓
                                Athena / Redshift Spectrum
```

## Study Notes

<!-- Fill in your notes here -->
