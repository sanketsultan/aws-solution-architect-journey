# Amazon EventBridge

Serverless event bus for building event-driven applications across AWS services and SaaS.

## Key Topics

- **Event Buses** — default bus (AWS service events), custom buses (your app events), partner buses (SaaS integrations)
- **Rules & Event Patterns** — JSON pattern matching on event fields; schedule rules (cron/rate); up to 5 targets per rule
- **Targets** — Lambda, SQS, SNS, Step Functions, API Gateway, Kinesis, EC2, ECS tasks, and 20+ more
- **Schema Registry** — auto-discovered event schemas; generate code bindings (TypeScript, Java, Python) for type safety
- **Pipes** — point-to-point integrations with filtering, enrichment (Lambda/API GW), and transformation; replaces custom glue code

## EventBridge vs. SNS vs. SQS

- EventBridge: complex routing, schema-driven, cross-account/SaaS events
- SNS: simple fan-out, high throughput, mobile push
- SQS: durable queuing, decoupling, consumer pulls at own pace

## Study Notes

<!-- Fill in your notes here -->
