---
components: [LinkButton]
---

# Link Button

A minimal inline navigation element combining a directional icon with a text label, used to trigger a navigation action or contextual link within a flow.

---

## Guidelines

### When to use

- Use a Link Button when the action is  **inline with text**  — for example, a "Learn more", "View details", or "Forgot password?" trigger that sits naturally within a sentence or beneath a form field, where a full button would be visually heavy.

- Use when the affordance of a traditional button would break the reading flow or visual hierarchy but the element still triggers an action (not navigation to another URL).

- Use in empty states, helper text areas, or instructional copy where a secondary action needs to live close to explanatory content without competing with the primary CTA.

- Use when a ghost or secondary button would create excessive visual weight for the importance of the action, particularly in dense UI areas like tables, list rows, or inline forms.

### When not to use

- Do not use as a primary action — this component is not suited to replace filled or outlined buttons for key CTAs

- Avoid using without an icon when the action is directional — the icon provides essential context

- Do not use for destructive or irreversible actions — the visual weight is too low for high-risk interactions

- Do not stack multiple Link Buttons in a row as a navigation group; use a tab or nav component instead

---

## Behavior

- Use sentence case for the label. It never wraps to a second line; it truncates with an ellipsis.
- Use an icon only when it adds clarity, never as decoration. When there is no icon, it leaves no residual spacing.
- The tap target is always larger than the visible label (44×44 px on mobile) and has no visible background or border at rest.

## Placement

- Link Buttons appear  **inline**  — within body copy, beneath form fields, inside table rows, or within card footers.

- They are  **not**  used as standalone CTAs anchored in a page's primary action zone (header, footer, or hero areas — those belong to Button).

- When placed inside a modal or drawer, the Link Button typically lives in the body text or beneath secondary helper content, never in the modal's primary action footer.

- On mobile, ensure the tap target meets a minimum of 44×44 px even if the visual element appears smaller — use padding to extend the hit area without altering the visual design.
