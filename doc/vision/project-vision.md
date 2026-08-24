# AthenaFarm — Project Vision

## Status (2026-08-24)

The product goal — a demoable **Digital Farm Event Engine** (`index.html`,
`PRD.md`) for showing customers/partners — is achieved. From this point,
that product is no longer the end goal. It becomes **Domain #1**: the real
material used to test a bigger question.

## Primary axis going forward

> How does a system evolve — from human intent, through requirements,
> architecture, an executable model, and implementation — while staying
> traceable and continuously fed back by reality?

AthenaFarm the farm-simulation product keeps running and keeps being useful,
but it is now the *test subject*, not the deliverable. The deliverable is
the methodology: how requirements turn into architecture decisions, how
those decisions turn into components, and how all of it stays connected
well enough that both a human and an AI agent can ask "why does this exist"
and get a real answer.

Full rationale and long-form exploration: [system-evolution.md](../experiments/system-evolution.md).

## What this changes in practice

- New requirements/ADRs are written to explain decisions that already
  happened in this repo (see `doc/requirements/`, `doc/adr/`), not to
  plan hypothetical future features.
- Structure (System DSL, simulator, multi-agent workflow, traceability
  graph) is only built once the previous phase proves useful — not
  up front. See `doc/experiments/system-evolution.md` section 8 for the
  phase order.
- `index.html` / `PRD.md` remain as-is: they are the Domain #1 artifact,
  not something this axis needs to rewrite.
