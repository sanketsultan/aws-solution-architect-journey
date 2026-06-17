# SAA-C03 — Exam Tips & Strategy

## Question Strategy

- Eliminate clearly wrong answers first; usually 2 can be ruled out immediately.
- Watch for "most cost-effective", "least operational overhead", and "highly available" in the question stem — they narrow the answer significantly.
- Scenario questions: identify the *constraint* (cost, RTO/RPO, compliance, throughput) before evaluating options.
- For multi-select questions, pick answers that work *together*, not the two best individual answers.

## High-Value Topics (study depth)

1. **VPC design** — subnets, route tables, IGW, NAT GW, VPC Peering vs. TGW, Security Groups vs. NACLs
2. **IAM** — policy evaluation logic, roles vs. users, cross-account, SCPs, Permission Boundaries
3. **S3** — storage classes, lifecycle, replication (SRR/CRR), event notifications, pre-signed URLs, OAC
4. **RDS vs. Aurora** — when to choose each; Multi-AZ vs. read replicas; Aurora Serverless v2
5. **DynamoDB** — GSI/LSI, DAX, Streams, Global Tables, On-Demand vs. Provisioned
6. **EC2 purchasing** — Spot for batch, Reserved/Savings Plans for steady-state, On-Demand for spiky/unpredictable
7. **DR strategies** — know all four by name, RPO/RTO characteristics, and AWS services used in each

## Common Traps

- CloudFront signed URLs ≠ S3 pre-signed URLs (different use cases)
- Multi-AZ RDS does NOT serve read traffic — it's standby only
- Elastic IP addresses incur charges when NOT associated with a running instance
- Lambda@Edge runs in us-east-1 and is replicated to edge — cannot use VPC resources easily
- NACLs are stateless — you must explicitly allow return traffic in both directions

## Day-Of Tips

- Flag uncertain questions and come back — don't spend more than 2 min on any single question
- 65 questions in 130 minutes = 2 min/question average
- Read ALL answer choices before selecting — the "best" answer sometimes isn't obvious until you've read all options
