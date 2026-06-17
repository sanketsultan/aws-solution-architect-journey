# AWS Solutions Architect — Interview Prep

Common interview questions and frameworks for SA roles.

---

## Behavioural / STAR Questions

Use the STAR format (Situation, Task, Action, Result) for all behavioural questions.

- Tell me about a time you designed a system that needed to scale rapidly.
- Describe a situation where you had to balance cost and performance in an architecture decision.
- Tell me about a production incident you handled — what was your process for diagnosing and resolving it?
- Describe a time you had to push back on a requirement because it would create technical debt or security risk.

---

## Technical Design Questions

### "Design X" Prompts

Practice whiteboarding these end-to-end. Clarify requirements → sketch architecture → explain trade-offs → estimate cost.

- Design a URL shortener that handles 10,000 redirects/second
- Design a photo-sharing application with global users
- Design a real-time fraud detection system for financial transactions
- Design a data pipeline that ingests 1 TB/day of click-stream data
- Design a multi-tenant SaaS application with strict data isolation

### Framework for Design Answers

1. **Clarify requirements** — traffic volume, RTO/RPO, compliance, team size, budget
2. **Define non-functional requirements** — latency, availability (e.g., 99.99%), durability
3. **Sketch the high-level architecture** — identify the tiers and data flows
4. **Go deep on components** — explain why you chose each service over alternatives
5. **Address trade-offs** — cost vs. performance, consistency vs. availability
6. **Discuss failure modes** — what breaks when, and how you recover

---

## Common Technical Questions

- What is the difference between a Security Group and a Network ACL?
- When would you use DynamoDB instead of RDS?
- How does S3 achieve 11 nines of durability?
- What is the difference between a target tracking scaling policy and a step scaling policy?
- How would you migrate a 10 TB PostgreSQL database to AWS with minimal downtime?
- Explain VPC peering vs. Transit Gateway — when would you use each?
- What happens during an RDS Multi-AZ failover?
- How does Lambda handle concurrency? What happens when it is throttled?

---

## Questions to Ask the Interviewer

- What does the current architecture look like, and what are its biggest pain points?
- What does the on-call rotation look like for this team?
- How are architecture decisions documented and reviewed?
- What does a typical project lifecycle look like from requirement to production?
