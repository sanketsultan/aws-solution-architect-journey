# Amazon EC2 — Elastic Compute Cloud

Virtual machines in the cloud; the foundational compute building block.

EC2 is a web service that provides secure, resizable compute capacity in the cloud. You provision virtual servers called EC2 instances. A hypervisor (software/firmware) on the host machine shares physical hardware resources across one or more VMs and provisions resources to create and run them.

## Compute Options on AWS

AWS offers three compute models — pick based on your workload:

| Model | Description | AWS Service |
|-------|-------------|-------------|
| Virtual machines (instances) | Emulate physical servers; easiest if you have prior infra knowledge | EC2 |
| Containers | Share host OS/kernel; lighter than VMs, no per-container OS overhead | ECS, EKS, Fargate |
| Serverless | No servers to manage; event-driven, pay per invocation | Lambda |

**VMs vs Containers:**
- VMs each carry their own Guest OS → resource overhead
- Containers share the host OS and kernel → more efficient, faster startup
- Containers sit on a containerization platform (e.g. Docker) on top of the host OS

## Instance Launch Considerations

When launching an EC2 instance, you configure 8 things:

1. **Name and tags** — identify and organize resources
2. **Application and OS image (AMI)** — base image for the instance
3. **Instance type and size** — CPU, memory, network capacity
4. **Key pair** — SSH access credentials
5. **Network and security** — VPC, subnet, security groups
6. **Storage** — EBS volume type and size (gp3 is default)
7. **Placement and tenancy** — placement groups, dedicated hosts
8. **Scripts and metadata** — User Data for bootstrapping on launch

## Instance Families

Pick the optimal instance family for your workload type — choosing right upfront saves time, cost, and avoids resizing later. Note: some instance types are only available in certain Regions.

### General Purpose
- **Mac** — macOS workloads
- **T3, T3a, T4g** — burstable performance; baseline CPU with burst credits; cost-effective for variable workloads
- **M5, M5a, M5zn, M6g** — balanced CPU/memory (4:1 GiB to vCPU ratio); web servers, app servers

### Memory Optimized (8:1 GiB to vCPU ratio)
- **R5, R5a, R6g** — in-memory databases, real-time big data analytics
- **X1, X1e** — large in-memory workloads (SAP HANA)
- **z1d** — high compute + high memory + NVMe SSD; financial modeling
- **U\*** — largest memory available on EC2

### Storage Optimized (2:1 GiB to vCPU ratio)
- **I3/I3en** — high random I/O (NVMe SSD); NoSQL databases
- **D3/D3en** — dense HDD storage; data warehouses, Hadoop
- **H1** — high disk throughput; MapReduce, HDFS

### Compute Optimized
- **C5, C5a, C6g** — high CPU performance; batch processing, media transcoding, HPC

### Accelerated Compute
- **G4, G4ad** — GPU; ML inference, video transcoding, graphics workloads
- **P4dn** — GPU; ML training
- **F1** — FPGA; custom hardware acceleration
- **Inf1** — AWS Inferentia chip; ML inference at scale

## Key Topics

- **Purchasing Options** — On-Demand, Reserved (Standard/Convertible), Savings Plans, Spot, Dedicated Hosts/Instances
- **AMIs & User Data** — creating custom AMIs, golden image strategy, bootstrapping with User Data scripts
- **Placement Groups** — Cluster (low latency HPC), Spread (fault isolation), Partition (large distributed systems)
- **Auto Scaling** — Launch Templates, scaling policies (target tracking, step, scheduled), health checks, lifecycle hooks

## AWS Compute Optimizer

Uses **machine learning** to analyze resource configuration and CloudWatch usage data, then provides recommendations to right-size your compute.

**How it works:**
1. Opt in your accounts
2. Compute Optimizer ingests resource configuration + CloudWatch usage data
3. ML analysis produces recommendations
4. Cross-service integration recommendations exported to S3
5. Reconfigure resources based on recommendations

**Integrations:** Recommendations can be exported to S3 and integrated with:
- **AWS Cost Explorer** — see cost impact of recommendations
- **AWS Systems Manager** — act on recommendations directly

**Supported resources:** EC2 instances, EC2 Auto Scaling groups, EBS volumes, Lambda functions, ECS services on Fargate

> Use Compute Optimizer to reduce cost and improve performance without guessing at instance sizes.

## Exam Tips

- T-series = burstable; watch for questions about CPU credit exhaustion under sustained load
- C6g/M6g/R6g = Graviton2 (ARM); better price-performance but check app compatibility
- Compute Optimizer ≠ Cost Explorer — Optimizer gives right-sizing recommendations, Cost Explorer shows spend
- If a question mentions "right-sizing" or "ML-based recommendations" → Compute Optimizer

## Study Notes

<!-- Fill in your notes here -->
