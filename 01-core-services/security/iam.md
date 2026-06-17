# AWS IAM — Identity and Access Management

Control who can do what to which resources — the security foundation of AWS.

## Key Topics

- **Principals, Policies & Permissions** — users, groups, roles, service principals; identity-based vs. resource-based policies; policy evaluation logic
- **IAM Roles** — assumed via STS; EC2 instance profiles, Lambda execution roles, cross-account roles, SAML/OIDC federation
- **Permission Boundaries** — cap the maximum permissions an identity-based policy can grant; used for delegated administration
- **Service Control Policies (SCPs)** — AWS Organizations guardrails; applied to OUs/accounts; do not grant permissions, only limit them
- **Conditions & Attribute-Based Access Control (ABAC)** — `aws:RequestedRegion`, `aws:PrincipalTag`, resource tags for dynamic policies

## Policy Evaluation Order

Explicit Deny → SCPs → Resource-based → Identity-based → Permission Boundary → Session Policy

## Study Notes

<!-- Fill in your notes here -->
