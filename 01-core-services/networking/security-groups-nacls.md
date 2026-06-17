# Security Groups & Network ACLs

Two layers of network traffic control in a VPC.

## Key Topics

- **Security Groups** — stateful, instance/ENI level, allow rules only, evaluated as a whole (no order)
- **Network ACLs** — stateless, subnet level, numbered rules processed in order, explicit deny possible
- **Stateful vs. Stateless** — SGs automatically allow return traffic; NACLs require explicit inbound AND outbound rules for both directions
- **Default Behavior** — default SG: allows all outbound, allows inbound from same SG; default NACL: allows all in/out
- **Common Patterns** — layered defense (NACL for IP block-listing, SG for fine-grained app rules); referencing SG IDs instead of CIDRs

## Quick Comparison

| Feature | Security Group | NACL |
|---------|---------------|------|
| Level | Instance / ENI | Subnet |
| Stateful | Yes | No |
| Rule types | Allow only | Allow & Deny |
| Rule order | All evaluated | Lowest number first |

## Study Notes

<!-- Fill in your notes here -->
