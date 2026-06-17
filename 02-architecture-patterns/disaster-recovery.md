# Disaster Recovery Patterns

Strategies for recovering from region-wide or catastrophic failures.

## Key Concepts

- **RTO & RPO** — Recovery Time Objective (how long can you be down); Recovery Point Objective (how much data can you lose)
- **DR Strategies (cheapest → fastest):**
  1. **Backup & Restore** — high RTO/RPO; S3 backups, AMI copies; cheapest
  2. **Pilot Light** — minimal always-on core (DB); scale out compute on DR event
  3. **Warm Standby** — scaled-down but running copy; faster RTO; moderate cost
  4. **Multi-Site Active/Active** — full capacity in multiple regions; near-zero RTO/RPO; most expensive
- **Data Replication** — S3 Cross-Region Replication, RDS Read Replicas (promote on DR), Aurora Global Database, DynamoDB Global Tables
- **DNS Failover** — Route 53 health checks + failover routing policy to redirect to DR region

## Study Notes

<!-- Fill in your notes here -->
