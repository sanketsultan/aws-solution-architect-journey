# SAA-C03 — Mock Questions

Practice questions organised by domain. Answers at the bottom.

---

## Domain 1: Design Secure Architectures

**Q1.** A company stores sensitive documents in an S3 bucket. The documents must only be accessible from within the corporate VPC. Which combination of controls achieves this? (Choose 2)

- A. Enable S3 Block Public Access on the bucket
- B. Create an S3 bucket policy with a `aws:SourceVpc` condition
- C. Create a Gateway VPC Endpoint for S3 in the VPC
- D. Enable S3 Object Lock on the bucket
- E. Attach an IAM policy to all IAM users denying S3 access

---

**Q2.** A Lambda function needs to read secrets from Secrets Manager without exposing credentials in the function code. What is the recommended approach?

- A. Store the secret ARN as a Lambda environment variable and use the SDK to call `GetSecretValue` using the function's execution role
- B. Embed the secret value directly in the Lambda deployment package
- C. Pass the secret as a function parameter via API Gateway
- D. Store the secret in an S3 bucket and grant the Lambda S3 read access

---

## Domain 2: Design Resilient Architectures

**Q3.** A company runs a web application across two AZs with Auto Scaling. The RDS MySQL instance is single-AZ. An AZ outage occurs. Which component causes the application to be unavailable?

- A. The Auto Scaling group
- B. The Application Load Balancer
- C. The RDS instance
- D. The Internet Gateway

---

**Q4.** An e-commerce company has an RPO of 1 hour and an RTO of 4 hours for its order management system. Which DR strategy meets these requirements at the lowest cost?

- A. Multi-Site Active/Active
- B. Warm Standby
- C. Pilot Light
- D. Backup and Restore

---

## Domain 3: Design High-Performing Architectures

**Q5.** A media company serves 4 K video files (average 8 GB each) to users globally. Which S3 feature improves upload performance for content creators uploading from multiple continents?

- A. S3 Cross-Region Replication
- B. S3 Transfer Acceleration
- C. S3 Multipart Upload with a presigned URL
- D. S3 Inventory

---

## Domain 4: Design Cost-Optimised Architectures

**Q6.** A batch processing job runs for 6 hours every night and can tolerate interruptions with checkpointing. Which EC2 purchasing option minimises cost?

- A. On-Demand Instances
- B. Reserved Instances (1-year, no upfront)
- C. Spot Instances
- D. Dedicated Hosts

---

---

## Answers

| # | Answer | Explanation |
|---|--------|-------------|
| 1 | B, C | Bucket policy with `aws:SourceVpc` restricts access; Gateway Endpoint routes traffic privately. Block Public Access (A) doesn't restrict VPC-internal IAM-authenticated access. |
| 2 | A | Attach an IAM execution role to Lambda with `secretsmanager:GetSecretValue` permission; call the SDK at runtime. Never embed secrets in code. |
| 3 | C | Single-AZ RDS fails during an AZ outage. ALB and ASG distribute across AZs automatically. IGW is regional. |
| 4 | C | Pilot Light meets RPO ~minutes (DB replication) and RTO ~hours (scale out core infrastructure on DR event) at lower cost than Warm Standby. |
| 5 | B | S3 Transfer Acceleration uses CloudFront edge locations to accelerate uploads over long distances. Multipart upload (C) improves reliability but not necessarily global speed. |
| 6 | C | Spot Instances are cheapest for fault-tolerant batch workloads. The checkpointing handles interruptions. |
