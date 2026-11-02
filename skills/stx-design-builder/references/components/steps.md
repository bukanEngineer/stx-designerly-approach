---
components: [HorizontalSteps, VerticalSteps, BadgeSteps]
---

# Steps

A progress indicator for multi-stage flows or status histories, available as Horizontal Steps (linear wizard), Vertical Steps (event log), and Badge Steps (compact card header).

---

## Variants

### Horizontal Steps

**When to use**

- Multi-step onboarding, KYC, quiz, or wizard flows where steps must be completed in order.

- When users need constant orientation — how far along am I, and how many steps remain.

- When each step has a distinct screen of content (form, selection, confirmation).

**When not to use**

- When there are only 1–2 fields — use a single form instead.

- When steps can be completed in any order — use tabs or a form layout instead.

- When showing read-only status history — use Vertical Steps instead.

**Behavior**

- Progress is always linear. A user cannot skip ahead to an incomplete step.

- Back navigation is permitted without destroying inputs already entered in later steps.

- Forward progress is blocked and inline validation errors are shown if required inputs in the current step are invalid.

- Optional steps must include a clearly visible Skip action alongside the primary advance action.

- Supports 2 to 7 steps. Beyond 7, consider breaking the flow into distinct stages with their own sub-flows.

### Vertical Steps

**When to use**

- Displaying a request or transaction history where the system drives state changes (e.g. Request History, transfer lifecycle).

- When each event has a timestamp and optional supporting notes to show alongside the status.

- When the number of steps is unbounded or data-driven.

**When not to use**

- When the user drives progression through actions — use Horizontal Steps instead.

- When showing percentage completion with no discrete stages — use a Progress Bar instead.

- When compact horizontal placement is needed — use Badge Steps instead.

**Behavior**

- States are set by the system, not by user interaction.

- Failed state must always appear with an explanatory label or note. A bare red dot with no context is never acceptable.

- Steps are ordered newest-first — the most recent event always appears at the top of the list.

- A "View All" affordance may be added when the list is truncated.

### Badge Steps

**When to use**

- When a step's header needs to live inside a compact card container (e.g. transfer method selection, checkout summary card).

- When step count is small (1–3) and the emphasis is on the step's content, not on overall flow progress.

- When horizontal screen real estate is limited and a full-width progress bar would dominate the UI.

**When not to use**

- When users need to see the total number of steps and their overall progress — use Horizontal Steps instead.

- When the flow exceeds 7 steps and cannot be broken down further — Horizontal Steps provides better orientation at that scale.

- When showing system-driven status history — use Vertical Steps instead.

**Behavior**

- The badge only ever shows the current step number. There are no completed or failed states for this variant — state feedback is handled by the surrounding flow, not the badge itself.

- Card content below the badge header updates per step; the badge component itself stays fixed at the top of the card.

- No explicit Back button is required if the card is part of a larger flow that already provides navigation controls.

- No hard maximum, but 7 is the recommended upper limit. If a flow exceeds 7 badge steps, consider one of these approaches instead: break the flow into distinct phases each with their own Badge Steps, consolidate steps that are logically related, or switch to Horizontal Steps if overall progress visibility becomes important.

---

## Placement

- **Horizontal Steps**  are placed at the top of the content area, spanning the full width of the step container, directly above the step's content body.

- **Vertical Steps**  are placed in a left-aligned column layout, typically within a card or panel, where each step flows downward.

- **Badge Steps**  are placed inline within a card header or at the top of a contained section.

- Steps should not be placed inside modals or drawers unless the modal is purpose-built as a full-screen step flow.
