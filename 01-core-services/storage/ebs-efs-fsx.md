# EBS, EFS & FSx

Block and file storage options for EC2 and container workloads.

## Key Topics

- **EBS (Elastic Block Store)** — volume types (gp3, gp2, io2, st1, sc1), single-AZ attachment, snapshots, Multi-Attach (io2 only)
- **EBS Encryption** — KMS-backed, automatic for new volumes option, encrypting an existing unencrypted volume via snapshot copy
- **EFS (Elastic File System)** — shared NFS for Linux; Standard vs. One Zone storage classes; throughput modes (bursting, provisioned, elastic)
- **FSx for Windows File Server** — SMB shares, Active Directory integration, DFS namespaces
- **FSx for Lustre** — high-performance parallel file system; HPC and ML workloads; integration with S3

## Decision Guide

| Need | Service |
|------|---------|
| Single EC2 boot volume | EBS gp3 |
| Shared file system (Linux) | EFS |
| Shared file system (Windows/SMB) | FSx for Windows |
| HPC / ML scratch storage | FSx for Lustre |

## Study Notes

<!-- Fill in your notes here -->
