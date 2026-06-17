# SAA-C03 Cheatsheet

Quick-reference card for exam day. One line per concept.

## Compute

| Service | Key Fact |
|---------|---------|
| EC2 Spot | Up to 90% off; 2-min termination notice; use for fault-tolerant batch workloads |
| EC2 Reserved | 1 or 3 year; up to 72% off; Convertible RI can change family/OS/tenancy |
| Savings Plans | Commit to $/hr spend (not instance type); Compute SP most flexible |
| Lambda | Max 15 min; max 10 GB memory; cold start → use Provisioned Concurrency |
| ECS vs EKS | ECS = AWS-native orchestration; EKS = managed Kubernetes; Fargate = serverless nodes for both |

## Storage

| Service | Key Fact |
|---------|---------|
| S3 Standard-IA | Min 30-day storage charge; retrieval fee; same durability/availability as Standard |
| S3 One Zone-IA | Single AZ only; 20% cheaper than Standard-IA; not for critical data |
| Glacier Instant | ms retrieval; min 90 days; for archives accessed once a quarter |
| Glacier Deep Archive | 12-hr retrieval; min 180 days; cheapest storage on AWS |
| EBS gp3 | Baseline 3,000 IOPS / 125 MB/s; independently scale IOPS and throughput |
| EFS | NFSv4, Linux only; scales automatically; Bursting or Provisioned throughput |

## Networking

| Service | Key Fact |
|---------|---------|
| ALB | L7; path/host/header routing; WebSocket support; target: IP, instance, Lambda |
| NLB | L4; static IP/Elastic IP; ultra-low latency; target: IP, instance, ALB |
| VPC Peering | Non-transitive; no overlapping CIDRs; cross-account OK |
| Transit Gateway | Hub-and-spoke; transitive routing; up to 5,000 VPC attachments |
| PrivateLink | Expose service privately via Interface Endpoint; no peering/IGW needed |
| Direct Connect | Dedicated private network to AWS; 1 or 10 Gbps ports; not encrypted by default (use VPN over DX) |

## Databases

| Service | Key Fact |
|---------|---------|
| RDS Multi-AZ | Synchronous standby; auto failover ~60 s; NOT a read replica |
| Aurora | 6 copies across 3 AZs; up to 15 read replicas; faster failover than RDS |
| DynamoDB | Serverless; single-digit ms; GSI can have different PK; DAX for caching |
| ElastiCache Redis | Persistence, replication, sorted sets; Multi-AZ with auto-failover |

## Security

| Service | Key Fact |
|---------|---------|
| SCP | Applied at OU/account level; doesn't grant permissions; restricts max permissions |
| Permission Boundary | Caps identity-based policy; used for delegated admin |
| KMS CMK | Annual rotation; envelope encryption; CloudTrail logs all API calls |
| Secrets Manager | Auto-rotation for RDS/Aurora; cross-account via resource policy |

## DR / HA

| Strategy | RTO | RPO | Cost |
|----------|-----|-----|------|
| Backup & Restore | Hours | Hours | $ |
| Pilot Light | 10s min | Minutes | $$ |
| Warm Standby | Minutes | Seconds | $$$ |
| Active-Active | Near zero | Near zero | $$$$ |
