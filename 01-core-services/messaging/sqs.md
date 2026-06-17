# Amazon SQS — Simple Queue Service

Fully managed message queuing for decoupling distributed systems.

## Key Topics

- **Queue Types** — Standard (at-least-once, best-effort ordering) vs. FIFO (exactly-once, strict ordering, 3,000 msg/s with batching)
- **Visibility Timeout** — duration a message is hidden after being received; must be > processing time to avoid duplicate processing
- **Dead-Letter Queues (DLQ)** — capture messages that fail processing N times; same type (Standard/FIFO) as source queue
- **Long Polling** — reduces empty responses and cost; `WaitTimeSeconds` up to 20 s; preferred over short polling
- **Message Retention & Size** — 1 min – 14 days retention; up to 256 KB per message; SQS Extended Client Library for larger payloads via S3

## Study Notes

<!-- Fill in your notes here -->
