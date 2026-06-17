# Multi-Account Architecture

Use AWS Organizations to manage multiple accounts for security, billing, and operational isolation.

## Key Concepts

- **Why Multi-Account** — blast radius reduction; billing isolation; regulatory compliance; team autonomy with guardrails
- **AWS Organizations** — management account + member accounts; Organizational Units (OUs) for grouping; consolidated billing
- **Account Structure** — common patterns: root → Security OU (Log Archive, Security Tooling) → Workloads OU (Dev, Staging, Prod) → Sandbox OU
- **SCPs as Guardrails** — deny regions, restrict expensive services, require tagging; applied to OUs; inherited downward
- **AWS Control Tower** — opinionated multi-account setup with landing zone; Account Factory for vending new accounts; guardrails (SCPs + Config rules)

## Landing Zone Reference

```
Root
├── Management Account
├── Security OU
│   ├── Log Archive Account
│   └── Security Tooling Account
├── Infrastructure OU
│   └── Shared Services Account (DNS, TGW)
└── Workloads OU
    ├── Dev Account
    ├── Staging Account
    └── Prod Account
```

## Study Notes

<!-- Fill in your notes here -->
