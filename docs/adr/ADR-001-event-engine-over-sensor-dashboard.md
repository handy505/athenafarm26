# ADR-001: Replace raw sensor dashboard with a Scenario-driven Event Engine

## Status

Accepted (2026-07-13, commit `e350823`)

## Context

Driven by [R-001](../requirements/R-001-event-driven-not-raw-telemetry.md).
The prior version simulated random sensor data and displayed it directly.
There was no real farm available to generate this data from, and raw
numbers don't carry the "why" that traceability/ESG need.

## Decision

Adopt the pipeline:

```
Scenario -> Environment Model -> Telemetry -> Device Action -> Farm Event -> Farm Timeline
```

- 4 built-in replayable scenarios (morning CO2 buildup, irrigation/drought,
  pump failure, sensor dropout), scenarios defined in YAML.
- Rule-based Event Engine (CO2 > 1500 -> ventilate, soil moisture < 30% ->
  irrigate, no pump flow -> alert, telemetry gap -> sensor-offline event).
- Device actions feed back into the environment model (fan lowers CO2,
  pump raises soil moisture) — the loop is closed, not one-directional.
- Expected-vs-actual event validation at the end of a scenario replay
  (PASS/FAIL), usable as an event regression test.

## Consequences

- Traceability tab (batch card, farm story, QR) and ESG tab (energy/carbon/
  water) can both be generated purely from Farm Events — no manual entry.
- The simulator's primary output changed from "a chart of numbers" to "an
  audit trail of what happened and why," which is what R-001 required.
- Cost: scenario/event logic is rule-based and hand-authored, not learned
  or model-driven — acceptable for a demo, would need revisiting for a
  production event engine.
