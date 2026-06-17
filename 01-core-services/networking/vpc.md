# Amazon VPC — Virtual Private Cloud

Your private, logically isolated network within AWS.

## Key Topics

- **VPC Fundamentals** — CIDR blocks, subnets (public vs. private), Internet Gateway, route tables
- **NAT Gateway vs. NAT Instance** — managed (NAT GW) vs. self-managed; HA across AZs; bandwidth scaling
- **VPC Peering** — non-transitive; no overlapping CIDRs; cross-account and cross-region peering
- **VPC Endpoints** — Interface Endpoints (PrivateLink, per-AZ ENI) vs. Gateway Endpoints (S3, DynamoDB — free)
- **VPN & Direct Connect** — Site-to-Site VPN over Internet; Direct Connect for dedicated private connectivity; VGW vs. TGW attachment

## Subnet Design Pattern

```
10.0.0.0/16  (VPC)
├── 10.0.1.0/24  Public  AZ-a
├── 10.0.2.0/24  Public  AZ-b
├── 10.0.11.0/24 Private AZ-a
└── 10.0.12.0/24 Private AZ-b
```

## Study Notes

<!-- Fill in your notes here -->
