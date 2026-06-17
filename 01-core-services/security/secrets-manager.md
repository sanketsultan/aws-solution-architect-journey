# AWS Secrets Manager

Securely store, rotate, and retrieve credentials, API keys, and other secrets.

## Key Topics

- **Secret Storage** — encrypted at rest with KMS; supports database credentials, API keys, arbitrary JSON
- **Automatic Rotation** — built-in rotation for RDS/Aurora/DocumentDB/Redshift; Lambda-based custom rotation for others
- **Cross-Account Access** — resource-based policy on the secret; useful in multi-account architectures
- **Secrets Manager vs. Parameter Store** — Secrets Manager: auto-rotation, higher cost; SSM Parameter Store: cheaper, no built-in rotation, SecureString tier
- **Integration** — native integration with RDS, ECS task definitions, Lambda env vars; SDK `GetSecretValue` API call

## Study Notes

<!-- Fill in your notes here -->
