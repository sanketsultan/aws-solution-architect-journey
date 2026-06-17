# Lab 02 — Serverless REST API

Build a serverless CRUD API with API Gateway, Lambda, and DynamoDB using AWS SAM.

## Objectives

- Define a SAM template with an API Gateway HTTP API
- Create a Lambda function that reads/writes to DynamoDB
- Configure IAM roles with least-privilege permissions
- Deploy with `sam deploy` and test the live endpoints
- Observe invocations and logs in CloudWatch

## Prerequisites

- AWS SAM CLI installed
- AWS CLI configured
- Python 3.12 runtime available

## Steps

1. `sam build`
2. `sam deploy --guided` (first time) or `sam deploy` (subsequent)
3. Note the API endpoint from the stack outputs
4. Test: `curl -X POST <endpoint>/items -d '{"id":"1","name":"test"}'`
5. `sam delete` to tear down

## Architecture

```
Client → API Gateway (HTTP API) → Lambda (handler.py) → DynamoDB Table
```
