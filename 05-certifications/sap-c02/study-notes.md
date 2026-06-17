# AWS Solutions Architect Professional (SAP-C02) — Study Notes

The advanced SA certification — tests deep technical knowledge across complex, multi-service scenarios.

## Exam Overview

- **Code:** SAP-C02
- **Duration:** 180 minutes
- **Questions:** 75 (scored, mix of single/multiple response)
- **Passing Score:** 750/1000
- **Domains:**
  1. Design Solutions for Organisational Complexity (26%)
  2. Design for New Solutions (29%)
  3. Continuous Improvement for Existing Solutions (25%)
  4. Accelerate Workload Migration and Modernisation (20%)

## How SAP-C02 Differs from SAA-C03

- Longer, more complex scenario-based questions (multi-paragraph)
- Multiple services involved in each scenario; must know integration points
- Focus on enterprise patterns: multi-account, hybrid cloud, migration strategies
- Cost optimisation at scale; Reserved Instance coverage analysis; Savings Plans modelling
- Deep knowledge of migration tools: MGN, DMS, DataSync, Snow Family, AWS Transfer Family

## Domain Notes

### Design Solutions for Organisational Complexity
- <!-- AWS Organizations, Control Tower, SCPs at scale -->
- <!-- Landing Zone design, Account Factory automation -->
- <!-- Centralised logging (CloudTrail → S3 → Athena), centralised security (Security Hub, GuardDuty) -->
- <!-- Cross-account access patterns: resource-based policies, role chaining, RAM -->

### Design for New Solutions
- <!-- Advanced VPC: TGW, PrivateLink, Direct Connect with multiple VIFs, BGP route summarisation -->
- <!-- Advanced DR: active-active with Route 53 and Aurora Global; RPO < 1s patterns -->
- <!-- Advanced security: Macie, Detective, Inspector v2, Network Firewall with centralised inspection VPC -->

### Continuous Improvement
- <!-- Performance analysis: Compute Optimizer, Trusted Advisor, Cost Explorer RI recommendations -->
- <!-- Database migration and modernisation: homogeneous vs. heterogeneous DMS migrations -->
- <!-- Well-Architected Reviews at scale with Conformance Packs and Config aggregators -->

### Workload Migration
- <!-- Migration strategies: 7 Rs (Retire, Retain, Rehost, Relocate, Replatform, Refactor, Repurchase) -->
- <!-- AWS MGN (Application Migration Service) for lift-and-shift -->
- <!-- AWS DMS for database migration; SCT for schema conversion -->
- <!-- Snow Family: Snowcone, Snowball Edge, Snowmobile — size and connectivity tradeoffs -->

## Study Resources

- [ ] Adrian Cantrill — AWS SAP-C02 course (highly recommended depth)
- [ ] Tutorials Dojo SAP-C02 practice exams
- [ ] AWS Whitepapers: Migration Whitepaper, AWS Organizations best practices, Hybrid Connectivity
- [ ] re:Invent ARC and ENT track sessions
