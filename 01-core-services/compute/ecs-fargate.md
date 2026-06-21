# Amazon ECS & AWS Fargate

Container orchestration on AWS — managed clusters with optional serverless compute via Fargate.

## Containers vs VMs (Why Containers?)

- Containers share the host OS and kernel — no separate Guest OS per container
- VMs each carry a full Guest OS copy → more resource overhead
- Result: containers are lighter, start faster, and pack more density per host
- Trade-off: less isolation than VMs (shared kernel); mitigated by security tooling (seccomp, AppArmor, etc.)

## Key Topics

- **ECS Concepts** — Clusters, Task Definitions, Tasks, Services; bridge vs. awsvpc network modes
- **Launch Types** — EC2 launch type (you manage nodes) vs. Fargate (serverless; AWS manages nodes)
- **Service Discovery & Load Balancing** — Cloud Map integration, ALB/NLB target group registration
- **IAM Roles for Tasks** — Task Role (permissions for the app) vs. Task Execution Role (pull image, write logs)
- **Auto Scaling** — Service Auto Scaling with Application Auto Scaling; Fargate Spot for cost savings

## Exam Tips

<!-- ECS vs. EKS decision criteria, Fargate cost tradeoffs -->

## Study Notes

<!-- Fill in your notes here -->
