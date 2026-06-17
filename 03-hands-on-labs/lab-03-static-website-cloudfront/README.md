# Lab 03 — Static Website with CloudFront

Host a static website on S3 and serve it globally via CloudFront with HTTPS.

## Objectives

- Create an S3 bucket with static website content (index.html, error.html)
- Configure Origin Access Control (OAC) so only CloudFront can read the bucket
- Provision a CloudFront distribution with HTTPS, custom error responses, and caching
- Optionally attach an ACM certificate and custom domain via Route 53

## Prerequisites

- Terraform >= 1.5
- AWS CLI configured
- (Optional) A registered domain in Route 53 and an ACM certificate in us-east-1

## Steps

1. `terraform init`
2. `terraform apply`
3. Upload your site files: `aws s3 sync ./site s3://<bucket_name>/`
4. Access via the CloudFront distribution domain name in the outputs
5. `terraform destroy` to clean up

## Architecture

```
Browser → CloudFront (HTTPS, edge caching)
              ↓ Origin Access Control
           S3 Bucket (private, static files)
```
