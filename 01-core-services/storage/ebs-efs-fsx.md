# EBS, EFS & FSx

Block and file storage options for EC2 and container workloads.

## Storage Type Recap

| Type | Access Model | Scope | AWS Service |
|------|-------------|-------|-------------|
| Block | Attached volume; OS-level disk | Single instance (mostly) | EBS, Instance Store |
| File | Network file system (NFS/SMB) | Multiple instances | EFS, FSx |
| Object | HTTP API | Global | S3 |

---

## EBS — Elastic Block Store

Block storage volumes that attach to EC2 instances. Think of it as a network-attached hard drive.

### Key Characteristics
- **AZ-scoped** — EBS volume lives in one AZ; must be in the same AZ as the EC2 instance
- **Persists independently** from the instance lifecycle (unlike Instance Store)
- **One attachment** by default — one volume to one instance at a time (except Multi-Attach)
- **Snapshots** — point-in-time backups stored in S3; incremental; can copy across regions/accounts

### Volume Types

| Type | Category | Use Case | Max IOPS |
|------|----------|----------|----------|
| **gp3** | General Purpose SSD | Default; boot volumes, most workloads | 16,000 |
| **gp2** | General Purpose SSD | Older default; IOPS scale with size | 16,000 |
| **io2 / io2 Block Express** | Provisioned IOPS SSD | High-perf databases (Oracle, SAP HANA) | 256,000 |
| **st1** | Throughput Optimized HDD | Sequential reads; data warehouses, Kafka | 500 MB/s |
| **sc1** | Cold HDD | Infrequent access; lowest cost block storage | 250 MB/s |

> **gp3 vs gp2:** gp3 lets you set IOPS and throughput independently; gp2 ties IOPS to volume size (3 IOPS/GB). gp3 is cheaper and more flexible — default choice.

### Multi-Attach
- Only **io2** volumes support Multi-Attach
- Attach same volume to up to 16 Nitro-based instances in the same AZ
- Application must manage concurrent writes (e.g. clustered databases)

### Encryption
- AES-256, KMS-backed
- Encrypting an existing unencrypted volume: snapshot → copy snapshot with encryption enabled → create new volume from encrypted snapshot
- Option to enforce encryption for all new volumes at account level

### Instance Store
- **Ephemeral** block storage physically attached to the host
- Highest IOPS possible (NVMe SSD directly on hardware)
- Data lost on stop, hibernate, or termination — only survives reboot
- Use for: temp files, caches, buffers, scratch data

---

## EFS — Elastic File System

Managed NFS file system for Linux workloads. Multiple EC2 instances and containers can mount the same EFS simultaneously.

### Key Characteristics
- **Regional** — spans all AZs in a region via mount targets in each AZ
- **Elastic** — grows and shrinks automatically; no capacity planning needed
- **Linux only** — NFS v4.1/4.2 protocol; not compatible with Windows
- **POSIX-compliant** — supports file permissions, locking

### Storage Classes
| Class | Use Case |
|-------|----------|
| **EFS Standard** | Frequently accessed files |
| **EFS Standard-IA** | Infrequently accessed; lower cost, retrieval fee |
| **EFS One Zone** | Single AZ; lower cost; use when durability trade-off is acceptable |
| **EFS One Zone-IA** | Single AZ + infrequent access |

### Throughput Modes
| Mode | When to Use |
|------|-------------|
| **Bursting** | Default; throughput scales with storage size; good for variable workloads |
| **Provisioned** | When you need more throughput than your storage size allows |
| **Elastic** | Automatically scales up/down; best for unpredictable workloads (recommended default) |

### Performance Modes
- **General Purpose** — default; lower latency; good for most use cases
- **Max I/O** — higher throughput, higher latency; large-scale parallel workloads (big data, media)

---

## FSx Family

Managed file systems for workloads that need specific protocols or performance characteristics beyond EFS.

### FSx for Windows File Server
- Fully managed **SMB** (Windows) file system
- **Active Directory integration** — supports AD authentication natively
- **DFS Namespaces** — aggregate multiple file shares under one namespace
- Multi-AZ deployment for high availability
- Use case: Windows apps, home directories, SharePoint, SQL Server on Windows

### FSx for Lustre
- High-performance **parallel** file system; purpose-built for HPC and ML
- Sub-millisecond latencies, hundreds of GB/s throughput, millions of IOPS
- **S3 integration** — link an FSx for Lustre file system to an S3 bucket; lazy-load data on first access, write results back to S3
- **Deployment types:**
  - Scratch — temporary, high-burst; no replication; cheapest
  - Persistent — long-term; replicated within AZ; for ongoing workloads
- Use case: genomics, financial modeling, ML training, video rendering

### FSx for NetApp ONTAP
- Managed NetApp ONTAP; supports NFS, SMB, iSCSI
- Multi-protocol access; snapshots, cloning, replication
- Use case: lift-and-shift NetApp workloads to AWS

### FSx for OpenZFS
- Managed OpenZFS; NFS-compatible
- Rich data management (snapshots, cloning); low latency
- Use case: Linux workloads needing ZFS features

---

## Decision Guide

| Need | Service |
|------|---------|
| Single EC2 boot/data volume | EBS gp3 |
| High IOPS database (Oracle, SAP) | EBS io2 |
| Temp/scratch, max IOPS, ephemeral OK | Instance Store |
| Shared file system — Linux, multi-AZ | EFS |
| Shared file system — Windows/SMB/AD | FSx for Windows |
| HPC / ML parallel workloads | FSx for Lustre |
| Lift-and-shift NetApp | FSx for NetApp ONTAP |

## Exam Tips

- EBS is **AZ-locked** — to move, snapshot and restore in new AZ/region
- EFS is **Linux only** — Windows → FSx for Windows
- Instance Store = fastest I/O but ephemeral — data gone on stop/terminate
- FSx for Lustre + S3 integration is a common exam scenario for HPC/ML pipelines
- gp3 is the new default; gp2 still appears in older questions — know the difference
- EFS Elastic throughput mode = best answer for unpredictable/spiky file workloads

## Study Notes

<!-- Fill in your notes here -->
