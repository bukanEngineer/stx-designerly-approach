---
components: [Toast, ToastProvider]
---

# Toast / Messages

A short-lived, auto-dismissing message that confirms or contextualises a user action inline with the current view, available as Success, Warning, Critical, or Info variants.

---

## Guidelines

### When to use

- Provide a contextual message based on a user's action in the same view the action took place.

### When not to use

- For critical errors that require the user to take immediate corrective action (use a Modal instead).

- For long-form messages or complex instructions.

- When the user needs to interact with the message content (e.g., clicking a link within the text).

## Behavior

- **Auto-dismissal** : Toasts should disappear automatically after a short duration (e.g., 3-5 seconds).

- **Stacking** : When multiple toasts trigger, they stack vertically without overlapping.

- **Content adaptation** : The container expands vertically if the text wraps to a second line.

- A maximum width is applied to ensure readability without overwhelming the interface

- Keep the message to a single short sentence (ideally under 100 characters); if it wraps more than twice, rewrite it.

- Icons are mandatory — they let colour-blind users distinguish between Success, Warning, Critical, and Info variants.

## Placement

- Toasts are positioned near the top of the screen and centered to ensure they are easily noticeable and visually balanced
