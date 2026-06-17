# Serverless Architecture

Build and run applications without managing servers.

## Key Concepts

- **Core Serverless Services** — Lambda (compute), API Gateway (HTTP API layer), DynamoDB (database), S3 (storage), EventBridge (events), SQS/SNS (messaging)
- **Event-Driven Execution** — Lambda functions triggered by events; pay only for execution time; no idle cost
- **API Gateway Patterns** — REST API vs. HTTP API (cheaper, faster) vs. WebSocket API; Lambda proxy integration; custom authorizers
- **State Management** — Lambda is stateless; use DynamoDB, ElastiCache, or S3 for state; Step Functions for long-running workflows
- **Cold Start Mitigation** — Provisioned Concurrency; smaller deployment packages; avoid VPC attachment unless needed

## Reference Architecture

```
Client → CloudFront → API Gateway → Lambda → DynamoDB
                                          ↓
                                       S3 (assets)
                                       SQS (async jobs)
```

## Study Notes

<!-- Fill in your notes here -->
