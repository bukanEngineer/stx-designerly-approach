---
components: [Modal, Modal2FA, ModalAssetOverview, ModalAssetSelection]
---

# Modal

Use a modal for one focused task or decision. Move extensive work to a page when it cannot remain readable with reachable actions. Listed component names are discovery hints; [Package authority](../package-api.md) governs actual availability and body/footer/width/dismissal APIs.

## Guidelines

### When to use

- Serve as a single purpose dedicated to completing the user's task

- Require a user response from the system

- Confirm a non-revertible destructive action

### When not to use

- For a significant amount of content, take the user to a different page to utilize space a modal can‘t provide

## Content-based sizing

Choose the smallest supported width that fits the longest meaningful field or detail row without cramped wrapping. Height follows content; avoid a large fixed canvas for a short funding form. Use the installed responsive constraints, keep the modal within the viewport, and scroll the supported content region when needed so title, context and actions remain usable. Test the smallest target viewport and an open keyboard when tooling permits. Change width through supported patterns rather than invented size props or internal CSS overrides.

## Amount entry

Use this reading order: title and essential context → amount label → amount input with supported asset/unit treatment → helper/limit/fee text → related details. Keep the helper below the amount input, associated through the supported field API. Errors use the field's supported error/help pattern in the same position. Place a separate flow-level alert near the condition it explains, not in place of field help.

Give the amount visual priority without restyling DS input typography. Keep unit, balance/limit and validation visible, and use the input capabilities actually supported by the installed version. See [Input](input.md) and [numbers](../numbers.md).

## Detail and review rows

Use a shared two-column label/value grid for bank details, amount, fees, rate, recipient and total: labels at the leading edge, values aligned at the trailing edge. Keep shared column alignment across rows; let long values wrap within their column. On small widths, stack a label above its value only when two columns would become unreadable, retaining row grouping and copy access.

Group rows with spacing and supported dividers on the modal's existing surface. Avoid a nested summary card and repeated container padding; follow [surface and padding ownership](../layout.md#surface-hierarchy-and-padding-ownership). Put copy actions beside the relevant value and ensure the full value is available.

A review step repeats the entered amount and selected asset/rail, recipient or destination, fees, total and timing relevant to confirmation. Emphasise the final amount/total with the DS hierarchy. Keep edit/back navigation understandable and preserve data. The receipt mirrors this review and identifies pending versus completed outcomes accurately.

## Footer composition

Inspect the installed modal declarations and matching examples before building actions. Use its supported footer/action mechanism and expected value shape: some versions may accept structured action configuration, others compound parts or children. Verify which is present. Avoid manually injecting a second footer inside the body, passing arbitrary children to an object slot, or styling buttons to imitate an unsupported footer.

Use one primary action for the current step, with an explicit verb such as “Continue” or “Confirm transfer”. Apply the supported primary/secondary arrangement from [Buttons](button.md) when it fits the modal's API; use the supported success-state arrangement for optional next steps. Keep action order and widths consistent with the installed pattern, allow responsive wrapping/stacking, and avoid crowding helper text into the action row. Show submission progress through a supported mechanism and prevent duplicate activation.

## Dismissal and steps

Use the package's supported close, Escape, outside-click and focus-management behaviour; verify it rather than assuming every dismissal mode exists. Define what closing means during entry, review and an in-flight request. Warn about meaningful unsaved work where needed; do not imply closing cancels a submitted transfer. Return focus to the opener and ensure scroll, keyboard focus and actions remain reachable through each step. See [funding flow](../patterns.md#funding-flow) for the step sequence and states.
