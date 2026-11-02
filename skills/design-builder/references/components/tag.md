---
components: [Tag]
---

# Tag

A compact label that communicates status, category, or filter state, available as a static, removable, or clickable element depending on whether it conveys information or drives an action.

---

## Guidelines

### When to use

- To surface the  **status**  of an object — verification state, transaction outcome, or progress (e.g. Verified, Failed, Pending, Not Verified) — using the static outlined or filled type.

- To mark a  **new sidebar menu item**  with the "New" badge — this is the sole use of the static filled type.

- To let users  **filter or toggle a selection**  in a set of mutually compatible options — use the clickable type.

- To represent an  **applied, dismissable selection**  such as an active filter chip or a selected currency — use the removable type.

### When not to use

- For an action that navigates or submits — use a  **Button**  or  **Link Button**  instead. Tags are not primary action surfaces.

- For long phrases or sentences — tags are single-word or short-phrase labels. Use  **Important Notes**  or body text for explanatory content.

- For a single binary on/off control that isn't part of a filter set — use a  **Toggle**  or  **Checkbox** .

- To draw urgent attention to a message — use a banner or  **Important Notes** , not a status tag.

---

## Behavior

- **Variant determines colour, not type.**  The five semantic variants — Critical, Warning, Positive, Information, Neutral — set the colour treatment. The four types — Static Outlined, Static Filled, Removable, Clickable — set structure and interactivity.

- **Static Filled is intentionally scoped.**  It is reserved for the "New" menu marker in the sidebar and only exists in Positive and Neutral. This is a deliberate rule, not a gap — do not introduce Filled for other variants or contexts. For any status outside this case, use Static Outlined.

- **Removable Tag**  has enabled and disabled states only. Activating the close icon removes the tag from its container; the parent decides what happens to the remaining set.

- **Clickable Tag**  has enabled, selected, and disabled states. Selecting toggles the tag's appearance to indicate it is active. Clickable tags are mutually compatible by default — selecting one does not deselect others unless the parent enforces single-select.

- **Disabled**  tags are non-interactive and use the disabled surface/text treatment; this applies to Removable and Clickable types.

- **Sizing**  has two options — Large and Small — applied consistently across all four types. Width is hug-content; the container grows with the label.

- **Overflow** : tags do not truncate or wrap internally. If horizontal space runs out, the parent container wraps tags to a new line or scrolls; it does not clip a tag mid-label

---

## Placement

- Tags sit inline next to the content they describe — beside an item title in a list row, inside a card, or grouped above an input.

- Filter and selection tag groups are placed at the top of the filterable content they control.

- Keep status tags close to their subject so the association is unambiguous; avoid placing a status tag far from the object it qualifies
