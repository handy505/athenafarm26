# ADR-003: Adopt system-evolution methodology as the primary axis; keep the farm product as Domain #1

## Status

Accepted (2026-08-24)

## Context

Driven by [R-003](../requirements/R-003-methodology-becomes-primary-axis.md).
With the Digital Farm Event Engine demoable ([R-001](../requirements/R-001-event-driven-not-raw-telemetry.md),
[R-002](../requirements/R-002-bilingual-customer-partner-ui.md)), the
question shifted from "what feature should the farm demo have next" to
"how does a system evolve from intent to a traceable, executable model,
with AI participating." That question is written out in
[system-evolution.md](../experiments/system-evolution.md).

This ADR is itself the first decision made *under* the new mechanism it
establishes — R-001/ADR-001 and R-002/ADR-002 were written retroactively
as the first test of that mechanism; this one is written at the moment
the decision is made.

## Decision

- The project's primary axis is now: how requirements evolve into
  architecture, an executable model, and implementation while staying
  traceable — not: what the farm demo should do next.
- The Digital Farm Event Engine (`index.html`, `PRD.md`, `README.md`) is
  frozen as-is and treated as **Domain #1** — real material the
  methodology is tested against — not rewritten to reflect the new axis.
- `doc/vision/project-vision.md` is the single authoritative statement of
  the current primary axis. Anyone (human or AI agent) unsure of current
  priority checks there first, not `README.md`/`PRD.md`.
- Future scope decisions (System DSL, Simulator, Agents, Traceability
  Graph — see `system-evolution.md` section 8) are evaluated against this
  axis, not against whether they improve the farm demo.

## Consequences

- `README.md`/`PRD.md` and `doc/vision/project-vision.md` now tell two
  different stories on purpose (product-facing vs. axis-facing). Risk:
  they can drift out of sync over time. Mitigation: `project-vision.md`'s
  "Status" section is updated whenever the axis changes again, and that
  update is itself expected to produce the next R-00x/ADR-00x pair.
- Phases in `system-evolution.md` (System Model, DSL, Simulator, Agents,
  Traceability Graph) are only started once the prior phase proves
  useful — this ADR does not greenlight building all of them.
