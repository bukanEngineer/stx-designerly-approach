---
components: [Button]
---

# Buttons

A core interactive element that triggers an action, available in three variants — Primary, Secondary, and Tertiary — each communicating a different level of emphasis.

---

## Guidelines

### When to use

- Use  **Primary**  for the single most important action on a screen or within a section — confirm, submit, proceed

- Use  **Secondary**  for supportive actions that are important but should not compete with the Primary (e.g. cancel, save draft, go back)

- Use  **Tertiary**  for low-emphasis actions, supplementary navigation, or inline contextual actions where a full button would be visually heavy

- Use a Right Icon when the action implies forward movement or produces a visible output (e.g. navigating to the next step)

- Use a Left Icon when the action has a well-recognised icon that aids comprehension at a glance

- Switch between Primary, Secondary, and Tertiary using component properties — do not detach instances or override styles to create a new button

- Keep Text labels short, verb-led, and action-oriented (e.g. "Continue", "Save", "Return To Home"); avoid vague labels like "Click here" or "OK"

- Use directional icons only when the action has a clear spatial outcome, and align all icon usage with the icon library — do not introduce new icons inside buttons

### When not to use

- Do not place more than one Primary button in the same immediate context — it dilutes emphasis and confuses hierarchy

- Do not use Tertiary for destructive or high-risk actions; the low visual weight under-communicates the consequence

- Do not use buttons for navigation between unrelated sections — use a Link Button instead

- Avoid using both Left Icon and Right Icon simultaneously unless there is a clear, justified reason

---

## Behavior

- All three variants respond to tap/click and execute their associated action immediately

- Buttons do not submit forms autonomously — behavior is defined by the action wired to the component

- In the disabled state, opacity is reduced and the button is non-interactive

- Icon slots are independent — either or both can be shown without affecting the other

- Tertiary buttons must still meet tap target size requirements despite the absence of a visible container

---

## Placement

- **Primary**  buttons are typically anchored to the bottom of a form, modal, or stepped flow as the final confirming action

- **Secondary**  buttons sit alongside the Primary, usually to its left, as a paired alternative action

- **Tertiary**  buttons are placed inline within content areas, toolbars, or as standalone contextual controls that don't warrant a full button

- Avoid floating buttons unless the layout explicitly requires it

- Right-align buttons in constrained containers (modals, dialogs, drawers), in progressive flows where the user is moving forward, or for actions with global impact — the Z-pattern reading flow makes right alignment feel natural for affirming a contained action

- When pairing Primary + Secondary, place the Primary (affirmative) on the right and the Secondary (dismissive) on the left, with both at equal width — use in high-stakes or irreversible flows where the user must consciously decide between proceeding and cancelling

- When pairing Primary + Tertiary, give the Primary full width as the dominant action and place the Tertiary below or alongside as a plain text link — use in success states, confirmations, or flows where the secondary option is an optional next step
