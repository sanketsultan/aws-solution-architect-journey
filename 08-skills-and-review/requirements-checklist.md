# Requirements Checklist

> Source: AWS © 2025, Amazon Web Services, Inc. or its affiliates. All rights reserved.

Use this checklist when gathering requirements for a new or existing AWS workload.

---

## 1. Organization-Based Strategies

- [ ] What are your key business goals and how does this workload support them?
- [ ] Are there any organizational standards or mandates (e.g., approved regions, architectures)?
- [ ] Who are the primary stakeholders and decision-makers for this workload?
- [ ] Are there any existing enterprise architectures or patterns this solution must align with?
- [ ] How is success measured for this workload?
- [ ] Are there dependencies on other internal systems or business units?
- [ ] Are there timelines or milestones we should be aware of?
- [ ] Are there future plans (e.g., migrations, upgrades, product launches) that could impact this workload?

---

## 2. Security

- [ ] What are your security and privacy requirements (e.g., encryption, data residency)?
- [ ] How do you currently manage identity and access?
- [ ] Are there specific threat models or known risks for this workload?
- [ ] Do you require centralized or decentralized security controls?
- [ ] What is your approach to vulnerability management and patching?
- [ ] How do you handle secrets management (API keys, credentials)?
- [ ] Do you conduct regular security assessments or penetration testing?
- [ ] Are specific AWS services (e.g., KMS, IAM Access Analyzer, GuardDuty) already in use?

---

## 3. Storage Needs

- [ ] What types of data will you store (structured, unstructured, media, logs)?
- [ ] What are your requirements for data durability, availability, and latency?
- [ ] How frequently is the data accessed (hot, warm, cold)?
- [ ] Are there retention policies or archival needs?
- [ ] Do you require object storage, block storage, or file systems—or a combination?
- [ ] How do you back up data today?
- [ ] Are there cross-region replication or multi-AZ storage requirements?
- [ ] How do you plan to handle data deletion or lifecycle transitions?

---

## 4. Monitoring and Alerting

- [ ] What operational metrics do you need to monitor (e.g., latency, error rates)?
- [ ] What is your incident response process?
- [ ] Who should receive alerts and how (email, SMS, Slack)?
- [ ] Do you require centralized observability across teams?
- [ ] Do you use existing observability tools (e.g., Datadog, Splunk, CloudWatch)?
- [ ] What are your SLIs (Service Level Indicators) and SLOs (Objectives)?
- [ ] Do you need custom dashboards or visualization for different teams?
- [ ] How is alert noise or false positives currently handled?

---

## 5. Resilience

- [ ] Do you require multi-AZ or multi-region deployment?
- [ ] How is application state handled during failover events?
- [ ] Are there critical downstream dependencies that affect availability?
- [ ] How often do you perform resilience or failure mode testing?
- [ ] What is your tolerance for downtime or degraded performance?
- [ ] What failure scenarios are critical to recover from?
- [ ] Do you need automatic failover or just manual recovery?

---

## 6. Disaster Recovery (DR) and Business Continuity (BC)

- [ ] What are your RTO (Recovery Time Objective) and RPO (Recovery Point Objective)?
- [ ] What DR strategies do you currently use or plan to use (e.g., pilot light, warm standby)?
- [ ] Are there business-critical systems that must remain available at all times?
- [ ] Do you test your DR plan regularly? If so, how often?
- [ ] Are there specific business hours when availability is critical?
- [ ] Do you need cold, warm, or hot standby environments?
- [ ] Are third-party dependencies (e.g., SaaS, other cloud providers) included in DR planning?

---

## 7. Performance

- [ ] Do you have requirements around startup time or cold starts?
- [ ] Are there known performance pain points or complaints from users?
- [ ] Do you benchmark performance against competitors or internal standards?
- [ ] How do you differentiate between acceptable vs unacceptable performance?
- [ ] What are your latency and throughput requirements?
- [ ] Are there peak usage times or performance SLAs?
- [ ] How do you currently measure performance?

---

## 8. Scaling

- [ ] Do you expect workload usage to fluctuate (daily, seasonally, or due to events)?
- [ ] What are your scale-out/scale-in triggers (e.g., CPU, queue length)?
- [ ] Do you need horizontal, vertical, or both types of scaling?
- [ ] What happens today when you hit capacity limits?
- [ ] Do you anticipate long-term growth in users, data, or requests?
- [ ] Do you need different scaling policies per component (e.g., API vs DB)?
- [ ] Are burst traffic scenarios (marketing events, product launches, etc.) expected?

---

## 9. Cost Optimization

- [ ] What is your budget for this workload?
- [ ] Are you open to using spot instances or serverless to reduce cost?
- [ ] Do you monitor and optimize cost regularly?
- [ ] Are you using any cost allocation tags or AWS Budgets?
- [ ] Do you want to reserve capacity (Savings Plans, RIs) for predictable workloads?
- [ ] Is there a threshold at which cost becomes unacceptable?
- [ ] Who is responsible for cost governance or approval?

---

## 10. Access, Authorization, and Authentication

- [ ] Who needs access to this system, and what level of access is appropriate?
- [ ] What identity providers (IdPs) do you use (e.g., Active Directory, SSO)?
- [ ] Do you use roles or policies to enforce least privilege?
- [ ] Are different environments (dev/test/prod) managed separately or together?
- [ ] How is access revoked or audited?
- [ ] Do you need temporary credentials (e.g., for CI/CD, contractors)?
- [ ] Do you integrate with external IdPs?

---

## 11. Connectivity

- [ ] Will the system be accessed over the internet, VPN, or AWS Direct Connect?
- [ ] Are there latency or bandwidth requirements for connectivity?
- [ ] Do you require private connectivity between AWS services?
- [ ] Are there systems that require hybrid connectivity with on-premise?
- [ ] What network segmentation or isolation is required (e.g., public/private subnets)?
- [ ] Are VPC peering or Transit Gateway already in use?
- [ ] Do you require low-latency inter-region connectivity?

---

## 12. Name Resolution

- [ ] Do you use internal or external DNS?
- [ ] Are there custom domain requirements for your services?
- [ ] Do you manage DNS records centrally or by workload?
- [ ] Are there naming conventions or DNS governance policies?
- [ ] Do you require split-horizon DNS (different resolution internally vs externally)?
- [ ] Will services be exposed using AWS Route 53 or another provider?
- [ ] Are health checks or failover configurations part of your DNS usage?

---

## 13. Compliance

- [ ] What regulatory standards must this workload comply with (e.g., GDPR, HIPAA, SOC 2)?
- [ ] Do you need audit trails, logging, and access reports?
- [ ] Who is responsible for governance and compliance verification?
- [ ] Do you require data sovereignty or residency in specific jurisdictions?
- [ ] Are there internal audits or governance boards to report to?
- [ ] How is compliance enforcement automated (e.g., AWS Config, SCPs)?
- [ ] Do you require data access logging or forensic traceability?

---

## 14. Capacity Management

- [ ] What is the expected volume of requests, storage, and compute?
- [ ] How do you forecast usage and plan for growth?
- [ ] Are there resource limits or quotas you need to account for?
- [ ] Are autoscaling policies defined per environment?
- [ ] What are your usage growth projections (quarterly or yearly)?
- [ ] Do you have any buffer or overprovisioning strategies?
- [ ] How is underutilization identified and addressed?

---

## 15. Compute Needs

- [ ] What are the compute requirements (e.g., CPU-intensive, GPU, memory)?
- [ ] Do you require containerization (ECS, EKS) or serverless (Lambda)?
- [ ] Are there specific OS or runtime dependencies?
- [ ] Are you currently using EC2, Lambda, ECS, or EKS? Any plans to migrate?
- [ ] Do your workloads benefit from specific instance types (e.g., compute-optimized)?
- [ ] Are there licensing requirements (e.g., Windows, Oracle)?
- [ ] Do you need GPU-based compute (e.g., for ML or graphics)?

---

## 16. Data Needs and Databases

- [ ] What types of data do you manage (transactional, analytical, time series)?
- [ ] What are your requirements for consistency, availability, and partition tolerance?
- [ ] Are you currently using relational, NoSQL, or other types of databases?
- [ ] Do you require multi-region database replication or failover?
- [ ] How often is your data updated, and by how many concurrent users?
- [ ] Do you need analytics or business intelligence integration?
- [ ] Are there migration plans for legacy databases?

---

## 17. Session and State Management

- [ ] Do you need to persist user sessions across services or deployments?
- [ ] How do you currently manage state (e.g., cookies, databases, caching)?
- [ ] Is session affinity or sticky sessions a requirement?
- [ ] Are user sessions expected to persist across regions?
- [ ] Will this application rely on server-side or client-side state?
- [ ] How long should session data be retained?
- [ ] Do you require shared session stores (e.g., Redis, DynamoDB)?
