# R-002: UI must communicate to both Chinese and English speaking audiences at once

## Status

Accepted (implemented 2026-07-13, commit `ed8175f`)

## Problem

The demo audience is mixed: customers and partners in the same
conversation may read Chinese or English, sometimes both in the same
meeting. A language switcher forces a choice and hides information from
whoever didn't pick it.

## Requirement

Every label, tab, event reason, validation badge, and
traceability/ESG field must show Chinese and English side by side, with
no toggle required to see either.

## Trace

- Decision: [ADR-002](../adr/ADR-002-bilingual-zh-en-ui.md)
- Implementation: `index.html` (all UI strings)
