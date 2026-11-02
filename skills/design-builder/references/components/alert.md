---
components: [Alert]
---

# Alert

Use inline feedback for a contextual condition, an asynchronous outcome or a persistent next step. Use field help for field validation, a toast for brief direct-action confirmation, and a modal for a decision that must block progress.

## Guidelines

### When to use

- To advise the user about a system-generated event or condition tied to their current context that needs attention (e.g. a KYC verification still processing).

- To reaffirm that a prior action succeeded, where the result happened in a different location or async flow.

- To present a dynamic status update inline, where the message belongs in the page flow rather than over it.

- To surface a contextual next step alongside the message using a single action.

### When not to use

- For transient, self-dismissing confirmation of a direct action — use a Toast / Snackbar instead.

- For content that must block the flow and demand a decision — use a Modal.

- For persistent, page-level promotional or onboarding messaging spanning the full width at the top of a product area — use a Banner.

- For validation tied to a single form field — use inline field-level error messaging.

---

## Supported composition

Read the installed Alert declaration and matching supported example before writing it; follow [Package authority](../package-api.md). Identify the actual message/title/detail interface, action slot and dismissal callback. Supply text through that interface rather than assuming arbitrary children will render. The terms below describe intent, not literal prop names or union values.

Use the supported single action slot for a contextual next step, such as retry or viewing details. Confirm whether it accepts action configuration or a component, and use exactly that shape. Do not place a separate button beside the Alert to imitate an action or use an alert action as the main form submit. If the installed version lacks a needed slot, report the limitation and choose another supported composition.

## Severity and dismissal

Match semantic intent to the installed variant: neutral information, successful outcome, warning needing attention, or critical error/blocker. Routine funding instructions are informational; a submitted request is not a success claim about settlement. Keep the text meaningful without colour and state the next step when action is needed.

Enable dismissal only when hiding the message will not conceal a required action or active blocker. Wire the supported dismissal event to parent visibility/state and decide when the message may reappear; displaying a close icon with no effect is a failure. Persistent blockers need an enduring explanation even if a supplementary notification can close. Verify dynamic announcements/focus through supported behaviour without stealing focus unnecessarily.

## Compact and long messages

For compact content, use a short message and one action without repeating the message in a title and detail. For longer content, use the supported title/detail or multiline treatment, keeping the explanation readable and the next step distinct. Verify the installed component's wrapping/action placement; do not assume a density or position prop exists.

Keep the Alert inline near its affected content and within the available width. Check long text, an action plus dismissal, and narrow viewports for overlap, clipped text and unreachable targets. Avoid forced single-line heights. Use the DS's built-in layout rather than overriding its internal padding, typography or colours. Put extensive instructions in the adjacent content area instead of stretching an alert into a second form.
