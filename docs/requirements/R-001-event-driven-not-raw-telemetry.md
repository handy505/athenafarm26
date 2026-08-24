# R-001: Farm state must be expressed as events, not raw telemetry

## Status

Accepted (implemented 2026-07-13, commit `e350823`)

## Problem

The original dashboard only showed raw sensor readouts:
`Temperature = 32°C`, `CO2 = 1500ppm`. This cannot answer the questions
traceability and ESG accounting actually need answered:

- What agricultural event happened?
- Why did it need handling?
- What was the outcome?

Traceability (產銷履歷) and ESG carbon accounting both need "event + cause +
start/end time + evidence," not raw data points.

## Requirement

The system must derive **Farm Events** (with cause, start/end time, and
supporting telemetry) from raw sensor/device data, and every
traceability/ESG record must be generated from those events — not entered
manually and not read directly off raw telemetry.

## Trace

- Decision: [ADR-001](../adr/ADR-001-event-engine-over-sensor-dashboard.md)
- Implementation: `index.html` (Event Engine, Farm Timeline, Traceability
  tab, ESG tab)
