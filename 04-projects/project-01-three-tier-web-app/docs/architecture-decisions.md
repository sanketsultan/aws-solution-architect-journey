# Architecture Decision Records (ADRs)

Document key architecture decisions, the options considered, and the reasoning behind each choice.

---

## ADR-001 — Container Orchestration: ECS Fargate vs. EKS

**Date:** <!-- YYYY-MM-DD -->
**Status:** Proposed / Accepted / Superseded

**Context:** The application tier needs container orchestration. The team is small and does not have Kubernetes expertise.

**Decision:** Use ECS Fargate.

**Consequences:**
- Positive: No node management overhead; AWS manages the data plane.
- Positive: Faster time to production for a team new to containers on AWS.
- Negative: Less portable than Kubernetes; vendor lock-in for orchestration layer.

---

## ADR-002 — Database: Aurora MySQL vs. RDS MySQL

**Date:** <!-- YYYY-MM-DD -->
**Status:** Proposed

**Context:** The application requires a relational database with high availability and read scaling.

**Decision:** <!-- fill in -->

**Options Considered:**
- Aurora MySQL Serverless v2 — auto-scales compute; good for variable load
- Aurora MySQL provisioned — predictable cost; up to 15 read replicas
- RDS MySQL Multi-AZ — simpler; less expensive; fewer features

**Consequences:** <!-- fill in -->

---

## ADR-003 — Caching Strategy

**Date:** <!-- YYYY-MM-DD -->
**Status:** Proposed

**Context:** <!-- fill in -->

**Decision:** <!-- fill in -->

**Consequences:** <!-- fill in -->

---

*Add new ADRs as numbered entries below.*
