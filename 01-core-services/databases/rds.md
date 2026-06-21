# Amazon RDS — Relational Database Service

Managed relational databases: MySQL, PostgreSQL, MariaDB, Oracle, SQL Server, and db2.

## What RDS Manages For You

RDS is managed — AWS handles the undifferentiated heavy lifting:

| AWS Manages | You Manage |
|-------------|------------|
| OS patching | Schema design |
| DB engine patching | Query optimization |
| Backups | Application logic |
| Hardware provisioning | Parameter group tuning |
| Replication setup | Security group rules |
| Failover | User access |

> If you need OS-level access or unsupported engines → run your DB on EC2 instead (but you lose all managed benefits).

## Supported Engines

- **MySQL** — open source; widely used; good for web apps
- **PostgreSQL** — advanced open source; extensible; JSONB support
- **MariaDB** — MySQL-compatible fork; open source
- **Oracle** — enterprise; bring your own license (BYOL) or license included
- **SQL Server** — Microsoft; express/standard/enterprise editions
- **IBM Db2** — enterprise; BYOL

## Multi-AZ Deployments (High Availability)

- Provisions a **synchronous standby replica** in a different AZ
- Standby is **not readable** — it exists only for failover
- **Automatic failover** in ~60–120 seconds: AWS updates the DNS endpoint, no app connection string changes needed
- Covers: AZ failure, DB instance failure, network issues, patching (failover then patch standby)
- **Multi-AZ DB Cluster** (newer) — 2 readable standbys across 3 AZs; faster failover (~35 s); limited engine support

> Multi-AZ = **availability**, not performance. For read scaling, use Read Replicas.

## Read Replicas (Read Scaling)

- **Asynchronous replication** — slight lag vs primary
- Up to **5 read replicas** per DB instance (15 for Aurora)
- Can be in the **same AZ, cross-AZ, or cross-region**
- Use for: offloading read-heavy workloads, analytics queries, reporting
- **Promote to standalone** — replica becomes independent DB (breaks replication)
- Cross-region replicas help with: disaster recovery, local reads for global apps

> Read Replicas ≠ HA. If primary fails, you manually promote a replica. For automatic failover, use Multi-AZ.

## Storage Options

| Type | Use Case | Notes |
|------|----------|-------|
| **gp3** | Default; most workloads | Cost-effective; set IOPS independently |
| **gp2** | Legacy default | IOPS tied to size (3 IOPS/GB) |
| **io1** | High IOPS workloads | Provisioned IOPS up to 64,000 |

- **Storage Autoscaling** — enable to automatically grow storage when free space is low; set a maximum threshold

## Backups

### Automated Backups
- Daily full backup + transaction logs throughout the day
- **Point-in-time recovery (PITR)** — restore to any second within retention window
- Retention: **1–35 days** (0 = disabled, loses PITR)
- Stored in S3; automatically managed by AWS
- Deleted when DB instance is deleted (unless you take a final snapshot)

### Manual Snapshots
- User-initiated; **persist after DB deletion**
- No retention limit — you control when to delete
- Can copy to another region for cross-region DR
- Can share with other AWS accounts

## Security

- **VPC isolation** — deploy in private subnets; no public internet access by default
- **Security Groups** — control which resources can connect on the DB port
- **Encryption at rest** — KMS; must be enabled at creation time; can encrypt unencrypted DB via snapshot copy
- **Encryption in transit** — SSL/TLS; enforce via parameter group (`rds.force_ssl`)
- **IAM DB Authentication** — use IAM tokens instead of passwords; works with MySQL and PostgreSQL
- **Secrets Manager** — rotate DB credentials automatically; integrates natively with RDS

## RDS Proxy

- Fully managed connection pooler between app and RDS
- Reduces connection overhead for **serverless workloads** (Lambda opening many short-lived connections)
- Improves failover time — proxy holds connections while RDS fails over
- Enforces IAM authentication and Secrets Manager integration
- Supports: MySQL, PostgreSQL, MariaDB, SQL Server, Aurora

## Parameter Groups & Option Groups

- **Parameter Group** — DB engine configuration (e.g., `max_connections`, `innodb_buffer_pool_size`)
- **Option Group** — additional features for specific engines (e.g., Oracle TDE, SQL Server Backup)

## Decision: RDS vs Self-Managed on EC2

| Factor | RDS | EC2 + DB |
|--------|-----|----------|
| OS access needed | ✗ | ✓ |
| Custom storage engine | ✗ | ✓ |
| Automated backups/patching | ✓ | Manual |
| Multi-AZ built-in | ✓ | Manual |
| Operational overhead | Low | High |

## Exam Tips

- **Multi-AZ ≠ read scaling** — standby is not readable; it's only for failover
- **Read Replicas ≠ HA** — replication is async; manual promotion required
- Encryption must be enabled at **creation** — you can't encrypt an existing DB in-place
- **RDS Proxy** is the answer for Lambda → RDS connection pooling questions
- PITR requires automated backups enabled (retention > 0)
- Manual snapshots survive DB deletion; automated backups do not
- Cross-region read replica = DR + read performance for global apps

## Study Notes

<!-- Fill in your notes here -->
