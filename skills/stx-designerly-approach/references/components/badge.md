---
components: [Badge]
---

# Badge

A small indicator attached to a parent component to signal unread state or unseen quantity, available as Counter (numeric) or Dots (presence only).

## Guidelines

### When to use

- Indicate unread notifications, pending updates, or unseen activity.

- Display quantity-based status such as unread messages or notification counts.

- Attach to icons, tabs, navigation items, or list elements that require attention.

- Use Dots when only presence of a new item needs to be communicated.

### When not to use

- For long text labels or descriptive statuses.

- To communicate detailed alerts or warnings.

- As a standalone component without a related parent element.

- Use Counter when quantity is not relevant.

---

## Behavior

- Counter width expands based on the number of digits.

- Badge is intended to be attached to another component such as icons, navigation items, or list items.

- Dots variant only indicates presence of a new item or unread state.

- Counter variant communicates quantity.

- Avoid using large numbers that may visually break the component layout.

- Do not detach the component or customise badge sizes outside the defined variants.

---

## Placement

- Typically positioned at the corner or edge of a parent component.

- Appears above the parent layer to maintain visibility.
