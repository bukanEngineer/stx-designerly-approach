---
components: [Tooltip]
---

# Tooltip

---

A small overlay that surfaces brief contextual help or information about an element when a user hovers or focuses on it. It can be placed top, bottom, left, or right of its trigger, may carry an optional title, status tag, and inline action links, and includes a Supported Chain variant that lists the blockchains a given token is available on

## Guidelines

### When to use

- Provide brief context for unlabeled or icon-only controls where the action or meaning isn't obvious on its own.

- Surface supplemental detail on hover or focus that helps but isn't required to complete the task — for example, what an asset is or which chains a token supports.

- Show an expanded form of content that has been shortened or abbreviated in the UI.

### When not to use

- Don't place information the user needs to complete a task here. Tooltips are dismissed easily and aren't guaranteed to be seen — use an always-visible helper, a popover, or a modal instead.

- Don't use for content the user must read at length or interact with heavily. If the content needs more than the light Dismiss / Learn More affordances, reach for a popover or drawer.

- Don't use to deliver errors or status the user must act on; surface those inline where the action happens.

## Behavior

- Appears when the user hovers or keyboard-focuses the trigger, and fades in after a short delay to confirm intent rather than on every passing cursor.

- Stays open while the pointer is within the trigger or the tooltip, and dismisses when the pointer leaves both or focus moves away from the trigger.

- The action variant adds an explicit Dismiss control for tooltips meant to persist until the user closes them, alongside an optional follow-up link.

- The title, tag, and action elements each appear only when their property is enabled; the body is always present.

- Preferred placement is set per instance and flips to an alternate side automatically when there isn't enough room in the viewport on the preferred side.

- Long body text wraps within the tooltip's maximum width rather than growing without limit.

## Placement

- Renders as an overlay above page content, anchored to its trigger with the pointer touching the trigger edge and no gap between them.

- Top is the default placement; bottom, left, and right are available and the tooltip flips to the opposite or an adjacent side when the preferred side would be clipped by the viewport.

- Must never cover the trigger element it describes.
