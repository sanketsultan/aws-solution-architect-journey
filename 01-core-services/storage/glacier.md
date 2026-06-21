# Amazon S3 Glacier

Long-term archival storage — lowest cost, higher retrieval latency. Glacier tiers are now integrated into S3 as storage classes rather than a separate service.

## Where Glacier Fits

```
Hot data       → S3 Standard
Warm data      → S3 Standard-IA / Intelligent-Tiering
Cold data      → S3 Glacier Instant Retrieval
Archive        → S3 Glacier Flexible Retrieval
Deep archive   → S3 Glacier Deep Archive  ← lowest cost on AWS
```

## Glacier Storage Tiers

| Tier | Min Storage Duration | Retrieval Time | Use Case |
|------|---------------------|----------------|----------|
| **Glacier Instant Retrieval** | 90 days | Milliseconds | Archives accessed ~once/quarter; needs immediate access when retrieved |
| **Glacier Flexible Retrieval** | 90 days | 1 min (Expedited), 3–5 hrs (Standard), 5–12 hrs (Bulk) | Backups, DR; retrieval time flexibility acceptable |
| **Glacier Deep Archive** | 180 days | ≤12 hrs (Standard), ≤48 hrs (Bulk) | 7–10 year retention; regulatory compliance; rarely/never retrieved |

## Retrieval Options (Flexible & Deep Archive)

| Option | Speed | Cost |
|--------|-------|------|
| **Expedited** | 1–5 minutes | Highest per-GB |
| **Standard** | 3–5 hours | Mid |
| **Bulk** | 5–12 hours (Flexible) / up to 48 hrs (Deep Archive) | Lowest per-GB |

> Provisioned capacity guarantees Expedited retrievals are available when you need them — purchase in advance if your SLA requires fast restores.

## Compliance & WORM

### Object Lock (S3-native, recommended)
- Set at bucket creation (cannot be added later)
- **Compliance mode** — no one (including root) can delete or modify the object until retention period expires; meets SEC 17a-4, CFTC, FINRA
- **Governance mode** — users with `s3:BypassGovernanceRetention` permission can override
- **Legal Hold** — independent of retention period; holds object indefinitely until explicitly removed

### Vault Lock (Legacy Glacier API)
- Applies to Glacier Vaults (older API, pre-S3-integration)
- Compliance via vault access policy; once locked, policy cannot be changed
- Prefer Object Lock for new implementations — it's S3-native and more flexible

## Lifecycle Policies — Transition to Glacier

Automate archiving with S3 Lifecycle rules:

```
Day 0   → S3 Standard (active use)
Day 30  → S3 Standard-IA (less frequent access)
Day 90  → S3 Glacier Instant Retrieval
Day 180 → S3 Glacier Flexible Retrieval
Day 365 → S3 Glacier Deep Archive
Day 730 → Delete
```

Minimum days before transitioning:
- Standard → Standard-IA: 30 days minimum
- Standard-IA → Glacier Instant: 90 days minimum

## Common Use Cases

| Use Case | Recommended Tier |
|----------|-----------------|
| Medical imaging archives (need fast access occasionally) | Glacier Instant Retrieval |
| Database backups, DR copies | Glacier Flexible Retrieval |
| Financial records (7-year retention) | Glacier Deep Archive |
| Media asset preservation | Glacier Flexible Retrieval |
| Log archives (compliance) | Glacier Deep Archive + Object Lock (Compliance mode) |

## Exam Tips

- "Archive, rarely accessed, cheapest" → **Glacier Deep Archive**
- "Archive, millisecond retrieval" → **Glacier Instant Retrieval** (not Flexible)
- "WORM compliance, no one can delete" → **Object Lock in Compliance mode**
- Minimum storage duration fees apply — deleting before minimum period incurs a charge
- Vault Lock is legacy; questions about new architectures → use Object Lock
- Deep Archive is the cheapest storage class on all of AWS — use for anything with long retention and no urgency

## Study Notes

<!-- Fill in your notes here -->
