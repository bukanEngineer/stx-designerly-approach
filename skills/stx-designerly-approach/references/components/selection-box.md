---
components: [SelectionBox]
---

# Selection Box

A large, label-led selection control that lets users pick from a small set of visually distinct options, configurable as Radio (single-select) or Check (multi-select).

## Guidelines

### When to use

- When users need to choose between distinct options that require more context than a simple list.

- For layout-heavy forms where options need to be visually prominent.

### When not to use

- In tight spaces where a standard Radio Group or Checkbox is more efficient.

## Behavior

**Common Behavior**

- Always group ≥ 2 items — a single radio option/check is meaningless.

- Keep labels short. If options need context, add a description sub-label (see missing cases).

- Do not mix Radio and Check types within the same question group.

- Do not use Selection Box as a navigation element or action trigger.

**Radio**

- Selecting one item must automatically deselect the previously selected one.

- Use icon when add meaningful differentiation, not decoration

- The selection type slot accepts any icon from the approved icon set. When an  `icon`  prop is passed, the radio circle is replaced visually by that icon — but the component continues to behave as a radio (single-select). The interaction model is determined solely by  `selectionType` , not by what is rendered in the icon slot

**Check**

- Each checkbox is independent, checking one must never affect others.

- Use checkboxes (not radio) when multiple options can be active at once, or for a single binary toggle.
