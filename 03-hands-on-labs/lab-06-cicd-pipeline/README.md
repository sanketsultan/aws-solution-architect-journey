# Lab 06 — CI/CD Pipeline with CodePipeline & CodeBuild

Build a fully automated CI/CD pipeline that deploys code changes to ECS Fargate.

## Objectives

- Create a CodeCommit repository (or use GitHub connection) as the source stage
- Configure CodeBuild to build a Docker image and push to ECR
- Use CodeDeploy (Blue/Green) or a direct ECS deployment action for the deploy stage
- Add an SNS-based manual approval gate before production deployment
- Test the pipeline end-to-end by pushing a code change

## Prerequisites

- Terraform >= 1.5
- Lab 04 infrastructure (ECS cluster, ECR repo, ALB) already deployed
- S3 bucket for pipeline artifacts (created by this Terraform)

## Steps

1. `terraform init && terraform apply`
2. Push to the source branch to trigger the pipeline
3. Monitor in CodePipeline console
4. Approve the manual approval action
5. Verify the new container version is running

## Architecture

```
Source (CodeCommit/GitHub) → CodeBuild (build + push ECR) → Approval → Deploy (ECS)
```
