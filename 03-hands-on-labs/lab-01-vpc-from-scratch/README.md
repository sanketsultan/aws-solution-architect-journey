# Lab 01 — VPC from Scratch

Build a production-grade VPC with public and private subnets, NAT Gateway, and routing.

## Objectives

- Create a VPC with a /16 CIDR block
- Provision public and private subnets across two AZs
- Attach an Internet Gateway and configure route tables
- Deploy a NAT Gateway in each public subnet for private subnet egress
- Launch a bastion host in the public subnet and a test EC2 in the private subnet

## Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform >= 1.5 installed
- `terraform.tfvars` file with your variables (see `main.tf` for required vars)

## Steps

1. `terraform init`
2. `terraform plan -out=tfplan`
3. `terraform apply tfplan`
4. Verify connectivity: SSH to bastion → SSH to private instance
5. `terraform destroy` when done to avoid charges

## Architecture

```
VPC 10.0.0.0/16
├── Public Subnet AZ-a  10.0.1.0/24  → IGW
├── Public Subnet AZ-b  10.0.2.0/24  → IGW
├── Private Subnet AZ-a 10.0.11.0/24 → NAT GW (AZ-a)
└── Private Subnet AZ-b 10.0.12.0/24 → NAT GW (AZ-b)
```

## Cost Estimate

~$0.09/hr for two NAT Gateways. Run `terraform destroy` after completing the lab.
