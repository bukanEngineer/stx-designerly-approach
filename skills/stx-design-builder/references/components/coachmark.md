---
components: [Coachmark]
---

# Coachmark

A guided tooltip overlay used to introduce new features or onboarding steps to users, with a structured layout for a title, body content, step pagination, and navigation controls.

---

## Guidelines

### When to use

- Introducing a new or recently changed feature that users would otherwise discover by accident, where you want to actively draw attention to its location.

- Onboarding a user through a multi-step product flow (e.g. first-time setup, wallet creation, KYC entry points) where each step needs to be tied to a specific UI element.

- Highlighting a single, time-bound action the user should take next — for example, a moved button after a layout change, or a newly available capability tied to their account state.

### When not to use

- For passive, hover-revealed hints about an element's purpose. Use  **Tooltip**  instead.

- For supplemental information the user requested by clicking a help icon. Use  **Popover**  instead.

- For system messages unrelated to a specific UI element (success, error, info). Use  **Toast**  or  **Alert**  instead.

- For information that blocks the user's task or requires acknowledgement before they can proceed. Use  **Modal**  instead.

- When more than one Coachmark would need to appear at the same time on the same screen. Queue them into a sequence instead, or reconsider whether the feature truly needs a Coachmark.

---

## Behavior

- Coachmarks are  **system-triggered** , not user-triggered. They appear on a defined event (first login after a release, first visit to a page, completion of a prior step) — never on hover or focus of the target element.

- Each user sees a given Coachmark or Coachmark sequence  **once** . Persist dismissal state per user, per Coachmark ID.

- In a multi-step sequence,  **Next**  advances to the next step and  **Back**  returns to the previous one. The pagination dots are display-only and reflect the current step. The final step replaces  **Next**  with a terminal label (e.g.  **Done** ,  **Got it** ).

- The Coachmark dismisses on: click of the close icon, click of the terminal action on the last step, or pressing  `Esc` . Clicking outside the Coachmark does  **not**  dismiss it — this prevents accidental loss of onboarding context.

- Dismissing mid-sequence (via close icon) ends the entire sequence and does not resume on the next visit.

- The target element remains interactive while the Coachmark is visible. Coachmarks do not use a backdrop or scrim; if the surrounding UI must be dimmed to focus attention, pair the Coachmark with a Spotlight overlay pattern (out of scope for this component).

- Focus moves to the Coachmark container on appearance and returns to the target element (or next logical focus target) on dismissal.

- The total step count must be defined before the sequence is placed; the Ellipses always reflect the true count.

- Keep the Label to one line and the Details to two or three lines — the Coachmark is not a documentation panel.

---

## Placement

- Position the Coachmark adjacent to its target element using the tip pointer to visually anchor the relationship. The tip must always touch or point directly at the target.

- Prefer  **Bottom**  or  **Right**  placement by default. Use  **Top**  or  **Left**  only when the default would clip outside the viewport or overlap critical UI.

- If the target element is near a viewport edge, shift to the alignment variant (start / center / end) that keeps the full Coachmark on screen while keeping the tip aligned with the target.

- Coachmarks render above page content but below Modals, Toasts, and global navigation overlays in the z-index stack.

- On viewport resize or scroll, the Coachmark repositions to remain anchored to its target. If the target scrolls fully out of view, dismiss the Coachmark and resume the sequence when the target is visible again.

- On mobile breakpoints, default to  **Bottom / center**  placement spanning the available content width minus standard page gutters. Disable the Left and Right placement variants on mobile.
