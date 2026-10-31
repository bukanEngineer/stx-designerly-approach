---
components: [Checkbox, Radio, Switch]
---

# Control

A selection control that captures user choice, available as Checkbox (multi-select), Radio (mutually exclusive), or Toggle (binary setting that takes effect immediately).

## Guidelines

### When to use

- Use  **Checkboxes**  when the user can select one or multiple options from a list.

- Use  **Radio buttons**  when the user must select exactly one option from a mutually exclusive list.

- Use  **Toggles**  for binary settings that take effect immediately (e.g., turning a feature on/off).

### When not to use

- Don’t use Radio buttons if the user should be able to unselect the item; use a Checkbox instead.

- Don’t use Toggles if the action requires a "Submit" or "Save" button to take effect.

- Avoid using controls without labels unless the context is purely visual (e.g., selecting rows in a table).

- Do not mix Radio buttons and Checkboxes in the same list.

---

## Behavior

### Checkbox

- **Multi-selection** : Allows users to select one or multiple items from a group of related options.

- **Independent State** : Each checkbox operates independently; selecting or deselecting one does not affect the state of others in the same group.

- **Toggle Interaction** : Clicking either the checkbox item or its associated label toggles the state between selected and unselected.

### Radio

- **Mutually Exclusive** : Selecting one radio button automatically deselects any previously selected button within the same group.

- **Required Selection** : Once an option is selected, the user typically cannot return to an unselected state by clicking the same item; they must select a different option.

- **Focus Management** : Clicking the label or the radio item triggers the selection, ensuring a larger, accessible hit area.

### Toggle

- **Immediate Action** : Used for binary settings that take effect as soon as the switch is flipped, without requiring an explicit "Save" or "Submit".

- **Visual Feedback** : The component provides clear visual state changes (on/off) to indicate the current system status.

- **Accessibility** : Both the switch and the label serve as interactive triggers to change the state.

---

## Placement

- **Alignment** : Typically left-aligned within forms or list groups.

- **Grouping** : Grouped logically with a section header when multiple related controls are present.
