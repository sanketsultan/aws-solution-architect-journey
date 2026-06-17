# Lab 05 — RDS Multi-AZ

Deploy a production-grade RDS MySQL instance with Multi-AZ standby and a read replica.

## Objectives

- Create a VPC with private subnets in two AZs for the DB subnet group
- Launch an RDS MySQL instance in Multi-AZ mode
- Add a read replica in a third AZ for read scaling
- Configure automated backups (7-day retention) and encryption at rest
- Verify failover by rebooting with forced failover

## Prerequisites

- Terraform >= 1.5
- AWS CLI configured
- Run Lab 01 first (or set `vpc_id` and `subnet_ids` variables)

## Steps

1. `terraform init && terraform apply`
2. Note the DB endpoint from outputs
3. Connect: `mysql -h <endpoint> -u admin -p`
4. Trigger failover: `aws rds reboot-db-instance --db-instance-identifier lab05-db --force-failover`
5. Observe DNS endpoint re-pointing to standby (~60s)
6. `terraform destroy` to clean up (note: final snapshot is taken by default)

## Cost Estimate

~$0.23/hr for db.t3.micro Multi-AZ. Destroy promptly after the lab.
