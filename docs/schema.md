# Cyber Attack Knowledge Graph Schema

## Node Labels

- ThreatGroup
- Malware
- Technique
- CVE
- Product
- Vendor
- Patch
- Industry
- Country

## Relationship Types

- USES
- EMPLOYS
- EXPLOITS
- AFFECTS
- PRODUCED_BY
- FIXED_BY
- PROTECTS
- TARGETS
- LOCATED_IN

## Graph Structure

Country
   ▲
   │ LOCATED_IN
ThreatGroup
   ├──────── USES ───────► Malware
   │                          │
   │                          ▼
   │                    EXPLOITS
   │                          │
   ▼                          ▼
TARGETS                     CVE
   │                          │
Industry                 AFFECTS
                              │
                              ▼
                           Product
                              │
                       PRODUCED_BY
                              │
                              ▼
                           Vendor

Patch ───── FIXED_BY ─────► CVE
   │
   └──── PROTECTS ───────► Product