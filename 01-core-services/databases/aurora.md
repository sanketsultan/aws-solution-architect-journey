# Amazon Aurora

AWS-built relational database — MySQL and PostgreSQL compatible, cloud-native storage engine. Aurora is not just managed RDS — it's a ground-up redesign of the storage layer.

## Aurora Architecture — What Makes it Different

```
┌─────────────────────────────────────────────┐
│           Aurora Cluster                     │
│                                             │
│  ┌──────────┐    ┌──────────┐              │
│  │ Primary  │    │ Replica  │  (up to 15)  │
│  │ (Writer) │    │ (Reader) │              │
│  └────┬─────┘    └────┬─────┘              │
│       │               │                    │
│  ─────┴───────────────┴──────────────────  │
│         Shared Distributed Storage          │
│      6 copies across 3 AZs (2 per AZ)      │
│         Auto-grows 10 GB → 128 TB           │
└─────────────────────────────────────────────┘
```

- **Compute and storage are decoupled** — replicas share the same storage volume; no replication lag for reads
- **6 copies of data** across 3 AZs automatically — tolerates loss of 2 copies for writes, 3 for reads
- **Self-healing** — continuously scans and repairs data blocks in background
- **Storage auto-grows** in 10 GB increments up to 128 TB — no pre-provisioning needed

## Aurora vs RDS Comparison

| Feature | RDS MySQL/PostgreSQL | Aurora |
|---------|---------------------|--------|
| Performance | Baseline | Up to 5x (MySQL), 3x (PostgreSQL) |
| Read replicas | Up to 5 | Up to 15 |
| Failover time | ~60–120 s | ~30 s (in-cluster replica) |
| Storage scaling | Manual or autoscale | Automatic (10 GB increments) |
| Max storage | 64 TB | 128 TB |
| Replication lag (replicas) | Async (some lag) | Milliseconds (shared storage) |
| Cost | Lower | ~20% more than RDS |
| Backtrack | ✗ | ✓ (MySQL only) |

## Aurora Replicas

- Up to **15 Aurora Replicas** in the cluster
- Share the same storage — no replication overhead, near-zero lag
- **Automatic failover target** — if primary fails, AWS promotes a replica in ~30 s
- **Reader endpoint** — load balances read traffic across all replicas automatically
- **Auto Scaling** for reader fleet — add/remove replicas based on CPU/connections

## Endpoints

| Endpoint | Routes To | Use For |
|----------|-----------|---------|
| **Cluster endpoint** | Primary writer | All writes + reads |
| **Reader endpoint** | All replicas (load balanced) | Read-only queries |
| **Instance endpoint** | Specific instance | Diagnostics, direct access |
| **Custom endpoint** | User-defined subset | Specific replica tiers |

## Aurora Serverless v2

- Scales capacity **instantly** in fine-grained Aurora Capacity Unit (ACU) increments (0.5 ACU steps)
- Min: 0.5 ACU → Max: 128 ACU (per instance)
- Pay per ACU-second — no capacity planning
- Scales to zero when idle (with slight cold-start penalty)
- Supports **Multi-AZ**, read replicas, Global Database
- Use for: variable/unpredictable workloads, dev/test, SaaS multi-tenant, infrequent access apps

> **v1 vs v2:** v1 scales in coarse steps with a pause (seconds); v2 scales instantly with no disruption. Always choose v2 for new workloads.

## Aurora Global Database

- **1 primary region** (read/write) + up to **5 secondary regions** (read-only)
- Replication via dedicated infrastructure — **< 1 second lag** across regions
- **Managed failover** — promote a secondary region to primary in < 1 minute (RPO ~1s, RTO ~1min)
- Use for: global apps needing low-latency local reads, cross-region DR

## Aurora Backtrack

- MySQL-compatible Aurora only
- **Rewind the DB to any point in time** without restoring from backup
- No new cluster needed — in-place rewind
- Configurable backtrack window (up to 72 hours)
- Use for: recovering from accidental deletes/bad queries quickly

## Aurora Multi-Master

- Multiple writer nodes — all nodes can accept writes
- Active-active write scaling within a single region
- Application handles write conflicts
- Use for: continuous write availability (zero-downtime writes during failover)

## Security

- Same as RDS: VPC, Security Groups, KMS encryption, SSL/TLS, IAM DB auth
- Encryption must be enabled at cluster creation

## Aurora vs DynamoDB — When to Use Which

| Factor | Aurora | DynamoDB |
|--------|--------|----------|
| Data model | Relational (SQL) | Key-value / document (NoSQL) |
| Schema | Fixed | Flexible |
| Joins/transactions | Complex SQL joins | Limited (single-table design) |
| Scale | Vertical + read replicas | Horizontal, virtually unlimited |
| Latency | Low (ms) | Ultra-low (µs with DAX) |
| Use case | OLTP, ERP, CRM | Gaming, IoT, session, catalog |

## Exam Tips

- Aurora storage is **always replicated 6 ways across 3 AZs** — you don't configure this
- **Reader endpoint** = load balancing across replicas; use this for read scaling, not individual instance endpoints
- Aurora Serverless v2 ≠ pause/resume like v1 — it scales without disruption
- Global Database managed failover RTO ~1 min, RPO ~1 s — use for cross-region DR requirements
- Backtrack ≠ restore from snapshot — it's an in-place rewind (faster, same cluster)
- Aurora costs ~20% more than RDS but gives significantly better performance and features

## Study Notes

<!-- Fill in your notes here -->
