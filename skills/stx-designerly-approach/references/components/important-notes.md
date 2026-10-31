---
components: [ImportantNotes]
---

# Important Notes

A contextual callout component used to surface critical information inline, with a left-side accent line and a structured title-description layout.

---

## Guidelines

### When to use

- When the user needs to be aware of a constraint, process detail, or caveat that directly affects their current action — e.g. processing timelines, verification requirements, or fee notices.

- When information is non-blocking but consequential: the user can still proceed, but ignoring the note may lead to confusion or error.

- When the content is specific to the context of the current screen or flow, not a system-wide status or error condition.

- When you need to communicate a single, focused piece of information — not a list of unrelated items.

### When not to use

- **Do not use for errors or validation failures.**  Use an inline error state on the affected field, or a system alert, instead.

- **Do not use for success confirmations.**  Use a toast or status indicator for post-action feedback.

- **Do not use for promotional or marketing copy.**  This component signals critical process information; using it for non-essential content dilutes its authority.

- **Do not use multiple Important Notes stacked consecutively.**  If you need to communicate more than two related caveats, consolidate them into a single note with a concise description, or reconsider whether the information belongs in a tooltip, a modal, or a dedicated help section.

- **Do not use as a page header or section header.**  It is an inline callout, not a structural element.

---

## Behavior

- Container height expands dynamically as description text wraps across lines

- The component is a read-only, static display with no interactive states

- The component is not dismissible; it persists as long as its parent section is visible

- Text is never truncated — the full content is always shown

- Keep the Title to one line; the Description carries the detail.

---

## Placement

- Placed inline within a form section or detail panel, directly above or below the content it contextualises.

- Does not float or overlay content. It occupies normal document flow.

- On mobile viewports, the component spans the full content column width — no horizontal truncation.
