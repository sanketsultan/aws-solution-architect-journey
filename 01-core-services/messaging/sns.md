# Amazon SNS — Simple Notification Service

Fully managed pub/sub messaging and mobile push notifications.

## Key Topics

- **Topics & Subscriptions** — publishers send to a topic; subscribers (SQS, Lambda, HTTP/S, email, SMS, mobile push) receive fan-out copies
- **Message Filtering** — subscription filter policies reduce noise; subscribers only receive messages matching their filter
- **SNS FIFO Topics** — strict ordering + deduplication; only SQS FIFO queues as subscribers
- **SNS + SQS Fan-Out** — canonical pattern: one SNS topic → multiple SQS queues for parallel independent processing
- **Message Durability** — SNS is not a queue (no retention); pair with SQS for durability and retry

## Study Notes

<!-- Fill in your notes here -->
