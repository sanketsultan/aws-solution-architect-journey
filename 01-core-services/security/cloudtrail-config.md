# AWS CloudTrail & AWS Config

Audit logging and configuration compliance for your AWS environment.

## Key Topics

- **CloudTrail** — records API calls (who did what, when, from where); management events vs. data events vs. Insights events
- **CloudTrail Lake** — query CloudTrail events with SQL; retention up to 7 years; replaces Athena+S3 for many use cases
- **AWS Config** — records resource configuration history; config rules for compliance evaluation (managed + custom Lambda rules)
- **Config Conformance Packs** — bundles of Config rules and remediation actions; deploy via Organizations for all accounts
- **Integration** — CloudTrail → EventBridge for real-time alerting; Config + SSM for auto-remediation; both → S3 for long-term audit

## Study Notes

<!-- Fill in your notes here -->
