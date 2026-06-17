# CloudFormation, CDK & SAM

Infrastructure as Code (IaC) on AWS — three complementary tools.

## Key Topics

- **CloudFormation** — declarative JSON/YAML templates; stacks and stack sets; change sets for safe updates; drift detection
- **CloudFormation Best Practices** — nested stacks for modularity; cross-stack references via Exports/ImportValue; use `DeletionPolicy: Retain` for stateful resources
- **AWS CDK** — define infrastructure in TypeScript/Python/Java/C#; synthesizes to CloudFormation; constructs (L1 raw CFN, L2 curated, L3 patterns)
- **AWS SAM** — CloudFormation extension for serverless; `AWS::Serverless::Function/Api/Table` resource types; `sam local invoke` for local testing
- **Comparison** — CloudFormation: maximum control; CDK: developer-friendly, type safety; SAM: serverless-optimized, local dev

## Study Notes

<!-- Fill in your notes here -->
