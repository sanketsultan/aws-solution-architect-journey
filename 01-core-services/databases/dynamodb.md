# Amazon DynamoDB

Serverless, fully managed NoSQL key-value and document database. Single-digit millisecond performance at any scale — no servers, no clusters to manage.

## When to Use DynamoDB (vs Relational)

| Use DynamoDB | Use RDS/Aurora |
|-------------|----------------|
| Known, simple access patterns | Complex queries, joins, aggregations |
| Massive scale (millions of req/s) | Moderate scale |
| Flexible/evolving schema | Fixed schema with referential integrity |
| Low-latency key-value lookups | Reporting, analytics, OLTP with relations |
| Serverless / event-driven apps | Traditional enterprise apps (ERP, CRM) |

## Core Data Model

### Tables, Items, Attributes
- **Table** — collection of items (like a table in SQL, but schema-less)
- **Item** — a single record (up to **400 KB**)
- **Attribute** — a field within an item; each item can have different attributes

### Primary Key (mandatory)
- **Partition Key (PK) only** — simple primary key; DynamoDB hashes the PK to determine the partition
- **Partition Key + Sort Key (SK)** — composite primary key; items with same PK are stored together, sorted by SK

### Secondary Indexes
| Index | Partition Key | Sort Key | Scope | When to Create |
|-------|--------------|----------|-------|----------------|
| **LSI** (Local Secondary Index) | Same as table PK | Different attribute | Same partition | At table creation only; max 5 |
| **GSI** (Global Secondary Index) | Any attribute | Any attribute | Across all partitions | Any time; max 20 |

> LSIs share the table's read/write capacity. GSIs have their own capacity — provision separately.

## Capacity Modes

### Provisioned Mode
- You specify **Read Capacity Units (RCU)** and **Write Capacity Units (WCU)**
- 1 RCU = 1 strongly consistent read of 4 KB/s (or 2 eventually consistent reads)
- 1 WCU = 1 write of 1 KB/s
- **Auto Scaling** — DynamoDB adjusts capacity based on utilization targets
- Use for: **predictable, steady traffic**; lower cost when traffic is consistent

### On-Demand Mode
- No capacity planning — pay per request
- Instantly accommodates any traffic level
- ~2.5x more expensive per request than provisioned (at steady load)
- Use for: **spiky, unpredictable, or new workloads**

## Read Consistency

| Type | Description | Cost |
|------|-------------|------|
| **Eventually Consistent** | May return slightly stale data (replication lag) | 0.5 RCU per 4 KB |
| **Strongly Consistent** | Always returns latest data | 1 RCU per 4 KB |
| **Transactional** | ACID read as part of a transaction | 2 RCU per 4 KB |

## DynamoDB Transactions

- **TransactWriteItems / TransactGetItems** — all-or-nothing operations across up to 100 items / 4 MB
- ACID compliant within a single region
- Use for: financial transfers, inventory updates, order processing
- Cost: 2x the normal RCU/WCU

## DynamoDB Streams

- Ordered stream of item-level changes (INSERT, MODIFY, REMOVE)
- Retained for **24 hours**
- **Stream views:** KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES
- Trigger **Lambda** for event-driven processing (e.g., send notification on new order)
- **Kinesis Data Streams integration** — longer retention, more consumers, enhanced fan-out

## DynamoDB Accelerator (DAX)

- Fully managed **in-memory cache** for DynamoDB
- **Microsecond** read latency (vs single-digit ms for DynamoDB)
- Write-through cache — writes go to DynamoDB, cache is updated automatically
- **Does NOT help with:**
  - Strongly consistent reads (bypasses DAX, goes to DynamoDB)
  - Scan operations (full table scans)
  - Write-heavy workloads (no write acceleration)
- Use for: read-heavy workloads, same API as DynamoDB (drop-in), gaming leaderboards, session stores

## Global Tables

- Multi-region **active-active** replication
- Select the regions; DynamoDB replicates automatically
- **Last-writer-wins** conflict resolution (based on timestamp)
- Each region is a full replica — reads and writes accepted everywhere
- Use for: global apps needing low-latency writes in multiple regions, multi-region DR

## TTL — Time to Live

- Set an expiry timestamp attribute on items
- DynamoDB automatically deletes expired items (within ~48 hours of expiry)
- **No WCU consumed** for TTL deletes
- Use for: session data, temporary tokens, audit logs, cache entries

## Backup & Restore

### Point-in-Time Recovery (PITR)
- Continuous backups for the last **35 days**
- Restore to any second within the window
- No performance impact; no extra cost beyond storage

### On-Demand Backups
- Full table backup at any time
- Retained until explicitly deleted
- Useful for compliance snapshots

## DynamoDB Table Design — Key Principles

1. **Design for access patterns first** — know your queries before designing keys
2. **One table design** — store multiple entity types in one table (use PK/SK to differentiate)
3. **Avoid hot partitions** — distribute writes evenly across partition keys
4. **Use sparse indexes** — only items with the GSI attribute appear in the index (cost-efficient)

## Exam Tips

- Item size limit = **400 KB** — if you need larger, store in S3 and reference from DynamoDB
- LSI = created at table creation only, shares table capacity
- GSI = can be added anytime, has its own capacity
- DAX = eventual consistency cache; strongly consistent reads bypass DAX
- Global Tables = active-active (not active-passive); last-writer-wins
- TTL deletes are free (no WCU) but not instant — up to 48 hr delay
- On-Demand mode = no throttling, but costs more at steady load
- Streams retention = 24 hours; for longer → use Kinesis Data Streams integration

## Study Notes

<!-- Fill in your notes here -->
