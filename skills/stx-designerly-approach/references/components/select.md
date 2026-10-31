---
components: [Select, MultiSelect]
---

# Select

# Dropdown / Select

A form input that lets a user choose one or more options from a collapsed list. Tapping the field opens a picker; the selected value(s) are reflected in the trigger.

## Guidelines

### When to use

- When a user needs to select from a predefined list too long for radio buttons or checkboxes to display inline

- **Single Select**  — when only one option can be chosen (network, currency, transfer method)

- **Multiple Select**  — when several options can be active simultaneously (filters, recipients, categories)

- **Multiple Select (Responsive Box)**  — when the number of selected items is unpredictable and all selections must be fully visible without truncation

### When not to use

- Don't use Single Select when there are only 2–3 options — use a Radio Group or Selection Box instead

- Don't use Multiple Select when only one option is valid — use Single Select

- Don't use Responsive Box when vertical growth would break the surrounding layout — use the fixed-height Multiple Select instead

- Don't use any dropdown variant for binary toggles — use a Switch or Checkbox

---

## Behavior

**Common**

- Tapping the container or Dropdown Icon opens the option picker

- Dropdown Icon is always visible regardless of selection state

- Label and Helper Text are independently optional

- Info only appears when Label is present

- Helper Text switches to error styling on failed validation

**Single Select**

- Selecting an option closes the picker and populates the Field with the chosen value

- Logo Container updates to reflect the selected option's logo when applicable

- Secondary Text is static — set by the implementer, does not change on selection

- Selecting a new option replaces the current selection

**Multiple Select**

- Each Removable Tag represents one selected option; tapping × removes it

- Container height is fixed — tags sit in a single row and do not wrap

- The picker stays open after each selection to allow continuous multi-select

**Multiple Select (Responsive Box)**

- Same selection and removal behavior as Multiple Select

- Container grows vertically as tags wrap to new rows — no selections are clipped

- Use when showing all selected items at once matters more than a fixed height
