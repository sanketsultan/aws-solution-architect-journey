# Microservices on AWS

Decompose monolithic applications into independently deployable services.

## Key Concepts

- **Service Decomposition** — bounded contexts; each service owns its data store; API contracts between services
- **Container Orchestration** — ECS Fargate or EKS for running microservices; service discovery via Cloud Map or CoreDNS
- **API Gateway as Front Door** — single entry point; rate limiting, auth, routing to backend services; BFF (Backend for Frontend) pattern
- **Inter-Service Communication** — synchronous (REST/gRPC via ALB or App Mesh); asynchronous (SQS, SNS, EventBridge) for loose coupling
- **Observability** — distributed tracing with X-Ray; structured logging to CloudWatch; service-level dashboards

## Patterns

- **Saga Pattern** — manage distributed transactions via choreography (events) or orchestration (Step Functions)
- **Circuit Breaker** — prevent cascading failures; App Mesh or application-level libraries
- **Strangler Fig** — incrementally migrate monolith to microservices via API Gateway routing

## Study Notes

<!-- Fill in your notes here -->
