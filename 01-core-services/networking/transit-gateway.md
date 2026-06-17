# AWS Transit Gateway

Hub-and-spoke network transit hub connecting VPCs, VPNs, and Direct Connect.

## Key Topics

- **Architecture** — replaces full-mesh VPC peering; attachments (VPC, VPN, Direct Connect GW, TGW peering, SD-WAN)
- **Route Tables** — multiple route tables for segmentation; associating and propagating attachments
- **TGW Peering** — connecting TGWs across regions for global network; static routes required
- **Multicast Support** — native multicast routing for media and trading applications
- **Bandwidth & Limits** — up to 50 Gbps per VPC attachment; ECMP for VPN bandwidth scaling

## When to Use TGW vs. VPC Peering

- Use TGW when you have 5+ VPCs to connect, need centralized inspection, or require transitive routing.
- Use VPC Peering for simple, low-cost, point-to-point connections between a few VPCs.

## Study Notes

<!-- Fill in your notes here -->
