# AWS KMS — Key Management Service

Create and control the cryptographic keys used to encrypt your data.

## Key Topics

- **Key Types** — AWS Managed Keys (free, auto-rotated every year), Customer Managed Keys (CMKs, configurable rotation), Customer Provided Keys (external/CloudHSM)
- **Envelope Encryption** — KMS encrypts a Data Encryption Key (DEK); DEK encrypts data; only ciphertext DEK stored at rest
- **Key Policies & Grants** — resource-based policy on the key; grants for temporary, programmatic access delegation
- **Multi-Region Keys** — replicate CMKs across regions; same key material, different key ARNs; disaster recovery use case
- **KMS vs. CloudHSM** — KMS is multi-tenant, managed; CloudHSM is single-tenant HSM, FIPS 140-2 Level 3, you control the key material

## Study Notes

<!-- Fill in your notes here -->
