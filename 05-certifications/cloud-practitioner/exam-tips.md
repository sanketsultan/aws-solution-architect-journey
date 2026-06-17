# Cloud Practitioner — Exam Tips & Gotchas

## General Tips

- Read every question carefully — many answers are plausible; choose the *best* one.
- "Most cost-effective" and "least operational overhead" are the two most common question framings.
- When in doubt, prefer managed services over self-managed ones.

## High-Frequency Topics

- **Shared Responsibility Model** — know exactly what AWS owns (physical, hypervisor, managed service internals) vs. what you own (OS patches, app code, data encryption, IAM config)
- **S3 storage classes** — know when to use Standard, IA, Glacier; understand lifecycle policies
- **Support plan differences** — Business = 24/7 phone/chat, 1-hr response for production down; Enterprise adds TAM and concierge
- **AWS pricing fundamentals** — pay for compute, storage, data transfer OUT; data transfer IN is free
- **Well-Architected pillars** — know all six names and their key design principles

## Common Traps

- Route 53 is a global service (not regional) — no charge per Region
- CloudFront is a CDN, not a global load balancer
- AWS Trusted Advisor checks depend on the support plan tier
- "Availability Zone" ≠ "Data Center" — each AZ may contain multiple physical data centers

## Day-Before Checklist

- [ ] Review the Shared Responsibility Model diagram
- [ ] Memorise the six Well-Architected pillars
- [ ] Know the four main support plan tiers and their SLAs
- [ ] Review EC2 purchasing options and when to use each
