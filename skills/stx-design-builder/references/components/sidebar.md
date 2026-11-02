---
components: [Sidebar]
---

# Sidebar

The persistent left navigation in the authenticated product, providing access to top-level destinations and account context, available in Business, Personal, and Sandbox variants.

---

## Guidelines

### When to use

- When the product has 3 or more top-level destinations that a user navigates between frequently within a session.

- When navigation items carry sub-items that benefit from hierarchical visibility without leaving the current page.

- When account and company context must remain persistently visible — especially in multi-company environments

### When not to use

- Do not use the Sidebar for single-page utility flows such as onboarding, setup wizards, or checkout — use a top navigation or stepper instead.

- Do not use for settings-only surfaces where a tabbed layout provides better spatial hierarchy.

- Do not render the Sidebar in unauthenticated views (login, forgot password, sign-up).

- Do not add account-level settings items (e.g. "My Profile", "Billing Plan") into the Sidebar nav — those belong in the Top Navigation account dropdown. This reflects a deliberate structural decision to separate account-level settings from product-level navigation.

## Behavior

**Parent item types**

Nav items at the parent level have two distinct behaviours. Which type applies is determined per item by product content, not by a component variant:

- **Expand-only**  — Clicking opens and closes the sub-item list. The item has no route of its own and is never active. Example: "Menu 1" in the Base component, "Treasury" in the Products component.

- **Navigable**  — Clicking navigates to its own route and also expands the sub-item list. This item can carry an active state when the current route matches it directly and no sub-item is selected. Example: "Home."

**Active state rules**

- Exactly one item — either a standalone nav item, a navigable parent, or a sub-item — is active at a time.

- The active state is driven by the current URL route, not by click alone. A click that does not result in a successful route change must not trigger the active state.

- When a sub-item is active, its parent row carries no active fill. The parent remains expanded (chevron up) as a wayfinding cue only — it never carries an active fill while a child is active.

- An expand-only parent is never active, regardless of which sub-item is selected beneath it.

**Expand / collapse**

- Clicking an expand-only or navigable parent toggles the sub-item list open and closed.

- Only one group is expanded at a time. Opening a new group collapses any previously open group (accordion behaviour)

**Text truncation**

- Nav item labels that exceed the available width are truncated with an ellipsis. No wrapping. Confirmed by "Very very long navigati…" in the Base component.

**Company Switcher dropdown**

- Opens as an overlaid panel anchored below the TriggerButton, listing available companies with a checkmark on the active selection, a divider, and account-level actions (Company Settings, Teams, Billing, Statements).

- Dismisses on outside click or Escape key.

**Variants and pinned elements**

- The brand logo sub-label differs per variant: "Business Account", "Personal Account" or "Sandbox".
- The regulatory badge is pinned to the bottom of the sidebar and does not scroll with the navigation.
- The user role shows only in the Business variant.

## Placement

**Desktop (≥ 1280)**

- Fixed to the left edge of the authenticated viewport. Does not scroll with page content.

- Width is fixed at the defined desktop value, with no collapsed/icon-only mode in the current MVP — this is a Future State item.

- `z-index`  sits above main content but below modal overlays, drawers, and toast notifications.

- Always paired with the Top Navigation bar. The Top Navigation occupies the content area starting immediately to the right of the Sidebar. Neither renders without the other on authenticated product pages.

**Mobile (below <1280)**

- The Sidebar moves entirely off-canvas in the resting state. It is not visible.

- Navigation is accessed through a  **hamburger icon**  in the Top Navigation bar, which stretches full-width on mobile.

- Tapping the hamburger opens the Sidebar as a  **left-edge drawer overlay** , sliding in over the content area without pushing it. The same six-zone structure applies inside the drawer (logo, company switcher, nav items, MAS Badge).

- A scrim covers the content area behind the open drawer. Tapping the scrim or selecting a nav item dismisses the drawer.

- The Company Switcher dropdown opens in-place within the drawer.

- The MAS Badge remains anchored to the bottom of the drawer regardless of nav content length.

- The nav container scrolls inside the drawer if content exceeds the visible drawer height.
