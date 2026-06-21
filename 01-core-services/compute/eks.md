# Amazon EKS — Elastic Kubernetes Service

Managed Kubernetes control plane on AWS. EKS falls under the **containers** compute model — containers share the host OS/kernel, making them lighter than VMs while providing strong workload isolation via Kubernetes primitives.

## Key Topics

- **EKS Architecture** — managed control plane (AWS-owned), worker nodes (EC2 or Fargate), add-ons (CoreDNS, kube-proxy, VPC CNI)
- **Node Groups** — Managed Node Groups, Self-Managed Nodes, Fargate Profiles; choosing the right option
- **Networking** — Amazon VPC CNI plugin, pod-level security groups, service types (ClusterIP, NodePort, LoadBalancer)
- **IAM Integration** — IRSA (IAM Roles for Service Accounts) for fine-grained pod permissions
- **EKS vs. ECS** — when to choose Kubernetes: portability needs, existing k8s expertise, complex scheduling requirements

## Study Notes

<!-- Fill in your notes here -->
