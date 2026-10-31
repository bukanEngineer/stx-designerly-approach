---
components: [Input]
---

# Input / Input with Button

A compact row that pairs a text input with a primary action button, optionally preceded by a selectable prefix (e.g. country/dial code).

## Guidelines

### When to use

- When a field value has a directly associated primary action that should be immediately accessible (e.g. sending a verification code, applying a coupon, submitting a phone number)

- When pairing a selector (prefix) with a text input and an action in a single compact row

- When the action is tightly coupled to the input — the user fills the field and immediately triggers the button

### When not to use

- Don't use when the action is a general form submission — use a standalone Button below the form instead

- Don't use when there is no prefix selector and the button is the only addition — reconsider whether a plain input with a submit button pattern is more appropriate

- Don't place two action buttons inside the same input row

- Don't use for multi-field forms where the action applies to more than one field

---

## Behavior

- Tapping the Prefix Panel opens a dropdown or Bottom Sheet to select a different prefix value

- The Chevron inside the Prefix Panel is always visible and signals selectability

- The Button triggers the primary action using the current field value — it does not submit a broader form

- The Button disabled state should mirror the field's empty/invalid state — don't allow the action when the field is unfilled or in error

- Height is fixed; the container does not grow vertically

---

## Placement

- Used inline within forms where an input and its primary action are tightly coupled

- Spans the full width of its parent column

- Label sits above the container; Helper Text sits below

- Commonly used for phone number entry, OTP sending, and coupon code application

- Keep the Action button label short — one word is ideal (e.g. "Send", "Apply", "Verify") to avoid breaking the row layout.
