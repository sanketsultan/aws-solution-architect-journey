# Event-Driven Architecture

Decouple producers and consumers via events for scalability and resilience.

## Key Concepts

- **Event Producers & Consumers** — producers emit events without knowing consumers; consumers subscribe independently; loose coupling
- **Event Bus vs. Message Queue** — EventBridge for routing/filtering events across services; SQS for guaranteed delivery with consumer-paced processing
- **Fan-Out Pattern** — SNS topic → multiple SQS queues; each consumer processes independently at its own rate
- **Event Sourcing** — store state as a sequence of events; replay events to reconstruct state; Kinesis Data Streams or DynamoDB Streams
- **Choreography vs. Orchestration** — choreography: services react to events (EventBridge); orchestration: central coordinator (Step Functions)

## Study Notes

<!-- Fill in your notes here -->
