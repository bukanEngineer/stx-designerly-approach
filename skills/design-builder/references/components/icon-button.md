---
components: [IconButton]
---

# Icon Buttons

# Icon Buttons

A compact, circular button that triggers an action through a single icon without a text label, available in Default, Active, and Ghost states.

---

## Guidelines

### When to use

- For a recurring action whose meaning is clear from its icon alone, such as Transfer In, Transfer Out, refresh, or notifications.

- In dense or space-constrained surfaces — top navigation, card headers, table rows — where a full text button would not fit.

- As a quick-action shortcut grouped with other icon buttons (e.g. the dashboard quick-action row)

### When not to use

- For unfamiliar or ambiguous actions where the icon alone does not communicate intent — use a text Button (Primary / Secondary / Tertiary) instead so the label removes ambiguity.

- To toggle between two states where the icon itself changes (e.g. eye / eye-slash). Use a Toggle or Checkbox with a label instead, so the current vs. resulting state stays clear.

- For the single most important action on a screen. Promote it to a Primary Button.

---

## Behavior

- Tapping the Icon Button triggers its associated action immediately

- The Active variant signals an on/engaged state; tapping again returns the button to Default for toggle-style actions

- The Ghost variant behaves identically to Default in terms of interaction, but with reduced visual prominence

---

## Placement

- When grouped as quick actions, align on a shared baseline with consistent spacing between buttons.
