# R-003: The project's primary axis must be explicitly recorded when it changes

## Status

Accepted (2026-08-24)

## Problem

The demoable product (Digital Farm Event Engine) was completed. Continuing
to treat "ship product features" as the top-line goal would keep the
project scoped as a POC forever, and would bury the more valuable thing
actually being learned: how a system evolves — from human intent through
requirements, architecture, and implementation — while staying traceable,
with AI participating in that process.

Without an explicit record, this kind of shift is invisible. Anyone (human
or AI agent) reading `PRD.md` / `README.md` would still assume the farm
product is the primary goal, because those files correctly describe
Domain #1 but say nothing about what the project is *for* now.

## Requirement

When the project's primary axis changes, that change must be captured as
a first-class requirement/ADR pair — not just a tone shift in a vision
document — so the shift itself is traceable. The previously-primary goal
(the farm product) does not need to be rewritten; it is kept as evidence
(Domain #1) for the new axis.

## Trace

- Decision: [ADR-003](../adr/ADR-003-adopt-system-evolution-methodology.md)
- Statement of current axis: [project-vision.md](../vision/project-vision.md)
- Long-form rationale: [system-evolution.md](../experiments/system-evolution.md)
