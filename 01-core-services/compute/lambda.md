# AWS Lambda

Serverless, event-driven compute — run code without managing servers. Lambda is the **serverless** compute model on AWS: no VMs to provision, no containers to manage. You bring the code; AWS handles everything else.

## Key Topics

- **Execution Model** — cold starts vs. warm starts, Provisioned Concurrency, execution environment lifecycle
- **Triggers & Event Sources** — synchronous (API GW, ALB), asynchronous (S3, SNS), stream-based (Kinesis, DynamoDB Streams)
- **Concurrency & Throttling** — reserved concurrency, burst limits per region, handling throttle errors with SQS buffer
- **Layers & Container Images** — packaging dependencies, container image support up to 10 GB
- **VPC Integration** — attaching Lambda to a VPC, cold-start penalty, hyperplane ENI improvements

## Limits to Remember

| Setting | Limit |
|---------|-------|
| Max execution time | 15 minutes |
| Memory | 128 MB – 10 GB |
| Deployment package (zip) | 50 MB (250 MB unzipped) |
| /tmp storage | 512 MB – 10 GB |

## Study Notes

<!-- Fill in your notes here -->
