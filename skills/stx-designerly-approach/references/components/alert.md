---
components: [Alert]
---

# Alert

An inline feedback component that communicates important information, status updates, or system messages within a page layout, with optional supporting detail, a contextual action, and dismissal behavior.

## Guidelines

### When to use

- To advise the user about a system-generated event or condition tied to their current context that needs attention (e.g. a KYC verification still processing).

- To reaffirm that a prior action succeeded, where the result happened in a different location or async flow.

- To present a dynamic status update inline, where the message belongs in the page flow rather than over it.

- To surface a contextual next step alongside the message using a single action.

### When not to use

- For transient, self-dismissing confirmation of a direct action — use a Toast / Snackbar instead.

- For content that must block the flow and demand a decision — use a Modal.

- For persistent, page-level promotional or onboarding messaging spanning the full width at the top of a product area — use a Banner.

- For validation tied to a single form field — use inline field-level error messaging.

---

## Behavior

- The alert does not manage its own visibility. Dismissal emits an event; the parent is responsible for removing the alert from view and for whether it stays dismissed across sessions.

- The component supports two layout densities driven by content length: single-line (title and detail on one row) and multi-line (detail wraps below the title). Layout is chosen by content, not set manually.

- Only one action is supported per alert. The action renders as a Link Button, positioned bottom or right depending on the button property.

- When both an action and the close icon are present, the action sits inline-left of the close icon (button=right) or below the detail with the close icon top-right (button=bottom).

- The Critical variant may use sticky positioning when keeping the message in context is necessary or when an alert is injected into a page and could otherwise be missed. Reserve this for Critical only.

- Alerts are programmatically focusable so attention can be moved to them when injected dynamically.

- Keep copy short, actionable, and in clear language. Prefer a single sentence fragment for the detail where possible.

- When a title is present, don't paraphrase it in the detail — write the detail as if continuing from the title.

- Use the variant that matches intent: Success for positive confirmation, Warning for conditions needing attention, Critical for errors or blocking issues, Info for neutral context.

- Use the action for next steps, troubleshooting, or a "learn more" link — not as a primary form submit.

---

## Placement

- Place the alert inline within the page content, adjacent to the context it refers to, following normal document flow.

- For responsive layouts the alert fills its container width.

- Sticky positioning is an exception reserved for Critical alerts (see Behavior).
