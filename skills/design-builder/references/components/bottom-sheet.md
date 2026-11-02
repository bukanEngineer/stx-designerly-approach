---
components: [BottomSheet, BottomSheetBank, BottomSheetBlockchain, BottomSheetNetwork]
---

# Bottom Sheet

A mobile-only overlay that slides up from the bottom of the viewport to present a focused, bounded set of choices or a single-purpose action.

---

## Guidelines

### When to use

- Presenting a list of selectable options on mobile (e.g. choosing a network, currency, or country)

- Replacing a dropdown menu that would be difficult to interact with at mobile viewport sizes

- Surfacing a focused, single-purpose action that requires a user choice before proceeding

- Confirming or continuing a task that has a small, bounded set of decisions

### When not to use

- On desktop or tablet viewports — use a dropdown, popover, or modal instead

- When the task requires the user to input complex data across multiple fields — use a full page or modal

- When content is purely informational with no required action — use a toast or inline state

- When the number of options is so large that even search would not reasonably narrow it — reconsider the information architecture

## Behavior

- Sheet animates up from the bottom of the viewport on trigger

- Height is determined by content, constrained between a defined min-height and max-height of the screen

- When content exceeds max height, the Content/Slot area becomes scrollable; Title, Dismissal/Close, and Footer remain fixed (sticky)

- Search bar appears inside the Content/Slot when the list has more than 10 items; filters list items in real time as the user types

- List items can carry optional secondary labels (e.g. "Last Used") or badges (e.g. "New") to surface contextual metadata

- The sheet can be dismissed by: - Tapping the × (Dismissal/Close) icon - Tapping the Cancel button in the Footer - Tapping the Backdrop behind the sheet - Swiping down on the sheet

## Placement

- Anchored to the bottom edge of the mobile viewport; bottom corners are flush with the screen

- Slides up over page content; backdrop covers everything behind it

- Width is fixed to match the mobile viewport width

- Does not appear on desktop or tablet — this component is mobile-only
