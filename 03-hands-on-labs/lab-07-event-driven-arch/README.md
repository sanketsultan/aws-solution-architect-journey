# Lab 07 — Event-Driven Architecture

Build an event-driven order processing system using SNS, SQS, Lambda, and EventBridge.

## Objectives

- Implement the SNS fan-out pattern: one topic → multiple SQS queues
- Create Lambda consumers for each queue (order processor, inventory updater, notification sender)
- Use EventBridge to route events from a custom event bus to downstream targets
- Configure Dead-Letter Queues and CloudWatch alarms on DLQ depth
- Observe end-to-end event flow with X-Ray tracing

## Prerequisites

- AWS SAM CLI installed
- Python 3.12

## Steps

1. `sam build && sam deploy --guided`
2. Publish a test event: `aws sns publish --topic-arn <TopicArn> --message '{"orderId":"123","amount":99.99}'`
3. Check CloudWatch Logs for each Lambda's processing output
4. Trigger a failure (bad payload) and confirm DLQ receives it
5. `sam delete` to tear down

## Architecture

```
API → SNS Topic (OrderPlaced)
         ├── SQS Queue → Lambda (OrderProcessor)
         ├── SQS Queue → Lambda (InventoryUpdater)
         └── SQS Queue → Lambda (NotificationSender)
```
