# Amazon RDS — Relational Database Service

Managed relational databases: MySQL, PostgreSQL, MariaDB, Oracle, SQL Server.

## Key Topics

- **Multi-AZ Deployments** — synchronous standby replica in another AZ; automatic failover (~60 s); not a read replica
- **Read Replicas** — asynchronous replication; up to 5 per instance; can promote to standalone; cross-region supported
- **Storage** — gp2/gp3/io1; storage autoscaling; provisioned IOPS for latency-sensitive workloads
- **Automated Backups & Snapshots** — retention 0–35 days; point-in-time recovery; manual snapshots persist after deletion
- **Security** — VPC isolation, SG control, TDE / encryption at rest with KMS, SSL in-transit, IAM DB authentication

## Exam Tips

<!-- Multi-AZ ≠ read scaling; read replicas ≠ HA; RDS vs Aurora performance comparison -->

## Study Notes

<!-- Fill in your notes here -->
