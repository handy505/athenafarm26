# ADR-002: Show Chinese and English side by side, not a language switcher

## Status

Accepted (2026-07-13, commit `ed8175f`)

## Context

Driven by [R-002](../requirements/R-002-bilingual-customer-partner-ui.md).
Considered a toggle/switcher (single language visible at a time,
lower text density) versus always rendering both languages together.

## Decision

Every UI string (labels, tabs, event reasons, validation badges,
traceability and ESG fields) renders Chinese and English together,
with no toggle.

## Consequences

- No risk of showing the "wrong" language mid-demo to a mixed audience.
- Every string in the codebase is now a zh/en pair, which increases text
  volume and requires discipline to keep both sides in sync when adding
  new UI text.
