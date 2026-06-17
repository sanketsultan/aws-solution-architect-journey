# Cost Estimate — Three-Tier Web App

Estimates based on us-east-1 pricing as of mid-2025. Use the [AWS Pricing Calculator](https://calculator.aws/) for accurate quotes.

## Assumptions

- Traffic: ~100 req/s average, peaks to 500 req/s
- Data transfer: ~50 GB/month out
- Storage: 100 GB RDS, 1 TB S3

---

## Monthly Cost Breakdown

| Service | Configuration | Est. Monthly Cost |
|---------|--------------|-------------------|
| ECS Fargate | 2 tasks × 0.25 vCPU / 512 MB (On-Demand) | ~$10 |
| ALB | 1 ALB, ~50 GB processed | ~$20 |
| Aurora MySQL | db.t3.medium writer + 1 reader, Multi-AZ | ~$150 |
| ElastiCache Redis | cache.t3.micro, 1 node | ~$25 |
| CloudFront | 50 GB transfer out, 1M requests | ~$10 |
| NAT Gateway | 2 × ~10 GB/month | ~$40 |
| S3 | 1 TB storage + requests | ~$25 |
| Route 53 | 1 hosted zone + health checks | ~$5 |
| CloudWatch | Logs, metrics, dashboards | ~$15 |
| **Total** | | **~$300/month** |

## Cost Optimization Opportunities

- [ ] Switch ECS tasks to Fargate Spot for non-critical workloads (up to 70% savings)
- [ ] Purchase 1-year Reserved Instance or Compute Savings Plan for baseline capacity
- [ ] Enable S3 Intelligent-Tiering for infrequently accessed objects
- [ ] Review NAT Gateway traffic — use VPC Endpoints for S3/DynamoDB to eliminate NAT costs
- [ ] Right-size Aurora after 2 weeks of production metrics via Performance Insights

## Notes

<!-- Add actual AWS Cost Explorer data here once deployed -->
