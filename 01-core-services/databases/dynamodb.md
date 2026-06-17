# Amazon DynamoDB

Serverless, fully managed NoSQL key-value and document database.

## Key Topics

- **Data Model** — Partition Key (PK) and optional Sort Key (SK); Local Secondary Indexes (LSI, same PK); Global Secondary Indexes (GSI, any PK)
- **Capacity Modes** — Provisioned (predictable, can use Auto Scaling) vs. On-Demand (pay-per-request, spiky workloads)
- **DynamoDB Streams & Kinesis** — change data capture; trigger Lambda for event-driven patterns; Kinesis Data Streams integration
- **Global Tables** — multi-region active-active replication; last-writer-wins conflict resolution
- **DynamoDB Accelerator (DAX)** — in-memory cache; microsecond reads; write-through; does NOT help with Scans or strongly consistent reads

## Access Patterns First

DynamoDB design is access-pattern-driven. Document your read/write patterns before designing tables.

## Study Notes

<!-- Fill in your notes here -->
