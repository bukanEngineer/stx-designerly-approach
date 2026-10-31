---
components: [Copybox]
---

# Copybox

A read-only display field that presents a pre-filled value — such as a wallet
address, bank reference, or transfer detail — and lets the user copy it to the
clipboard in a single tap. Supports an optional leading logo/icon, a label with
info tooltip, and helper text.

## Guidelines

### When to use

- Exposing a long, error-prone string the user must transfer elsewhere — wallet addresses, bank account numbers, SWIFT/BIC codes, reference IDs.

- Presenting a system-generated, read-only value where accuracy matters and manual retyping would be slow or risky.

- Showing pre-filled transfer details (recipient, bank name, address) the user needs to verify and copy.

### When not to use

- For values the user must edit — use Input (Text Field) instead.

- For short values that are trivial to read and retype, where a copy affordance adds no benefit.

- For selecting between options — use Selection Box or Select / Dropdown.

---

## Behavior

- Field value is non-editable; only the copy action is interactive.

- Two copy-action options exist: an icon-only Copy Button and a text "Copy" button — use one per instance, never both.

- On copy, confirmation is surfaced via a Toast, not an inline state change.

- Line limit: copy boxes are capped at 2 lines by default. - Blockchain Address: truncates in the middle ("0xdac17…0699") so the start and end stay visible; supports 1-line and 2-line truncation. - Edge case — Bank Address: line limit does not apply; all lines are shown in full so no address detail is lost.

- The leading logo/icon supports multiple size variants chosen by the parent layout.

- Error variant: the container adopts the error treatment while the value and copy action remain intact and copyable.

- The full Field value is always copied to the clipboard, even when it is visually truncated.

- Keep Helper Text to one line, used only when the value requires clarification.

## Placement

- Sits inline within the parent form or detail layout, following standard document flow.

- Label sits above the container; Helper Text sits directly below it.

- The copy confirmation Toast follows the global toast placement rules, not the component's own position.
