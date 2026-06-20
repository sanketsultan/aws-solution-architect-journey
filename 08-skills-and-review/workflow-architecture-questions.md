# Workflow Architecture Questions

> Source: AWS © 2025, Amazon Web Services, Inc. or its affiliates. All rights reserved.

Use these questions when designing or reviewing a storage and data workflow architecture on AWS.

---

## Data Types and Storage

- What are your different types of data?
  - How much storage capacity is required for each type?

- How can or should you separate your data?
  - How many different storage volumes are required?
  - What is the minimum number of volumes?
  - What is the ideal number of volumes?

- How should you configure your volumes?
  - What are the recommended block sizes?
  - What are the cache sizes?

---

## Data Access Patterns

- What are the data access patterns for the application or workflow?
  - Which data is accessed randomly and which data is accessed sequentially?

---

## Performance Requirements

- What are the performance requirements?
  - What is the required minimum latency that can be tolerated by the application, workflow, or process?
  - What are the throughput and IOPS performance requirements?
  - How do the performance requirements apply to different types of data?
  - How do you measure this performance?

- What is the number of concurrent users or concurrent operations?
  - How does the number of users or concurrent operations affect performance?

---

## Data Persistence and Durability

- What are the requirements for data persistence and durability?
  - Is there temporary data that does not need to persist?

---

## Data Sharing

- Does that data need to be shared?
  - If so, which services need to share the data?
  - How does it need to be shared?
