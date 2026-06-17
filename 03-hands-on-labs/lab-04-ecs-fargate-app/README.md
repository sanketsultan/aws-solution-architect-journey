# Lab 04 — ECS Fargate Application

Deploy a containerised web application on ECS Fargate behind an Application Load Balancer.

## Objectives

- Build and push a Docker image to Amazon ECR
- Create an ECS Cluster and Fargate Task Definition with the correct IAM roles
- Deploy an ECS Service with the ALB as the load balancer
- Configure health checks and auto scaling for the service
- Stream container logs to CloudWatch Logs

## Prerequisites

- Docker installed locally
- Terraform >= 1.5
- AWS CLI configured (with ECR push permissions)

## Steps

1. `docker build -t lab04-app .`
2. Push image to ECR (see Terraform outputs for the ECR URI)
3. `terraform init && terraform apply`
4. Access the app at the ALB DNS name from outputs
5. `terraform destroy` to tear down

## Architecture

```
Internet → ALB (port 80/443) → ECS Fargate Tasks (port 8080)
                                       ↓
                               CloudWatch Logs
```
