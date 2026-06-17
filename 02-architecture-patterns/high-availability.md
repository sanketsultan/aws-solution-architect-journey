# High Availability Patterns

Design systems that remain operational despite component failures.

## Key Concepts

- **Redundancy at Every Tier** — Multi-AZ for compute (ASG across AZs), data (RDS Multi-AZ, Aurora), and networking (multiple NAT GWs)
- **Load Balancing** — ALB (HTTP/HTTPS, L7 routing), NLB (TCP/UDP, ultra-low latency), GWLB (inline appliances); health checks drive traffic away from unhealthy instances
- **Auto Scaling** — maintain desired capacity; replace failed instances automatically; scale out under load
- **Health Checks & Failover** — Route 53 health checks + failover routing for DNS-level HA; ALB health checks for application-level
- **Avoiding Single Points of Failure** — identify SPOFs in architecture; eliminate or add redundant paths

## HA Checklist

- [ ] No single AZ dependency for stateful or stateless tiers
- [ ] ELB health checks tuned appropriately
- [ ] Auto Scaling minimum = 2 across 2 AZs
- [ ] Database in Multi-AZ mode
- [ ] Route 53 failover or health-check-based routing configured

## Study Notes

<!-- Fill in your notes here -->
