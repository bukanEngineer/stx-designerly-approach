---
components: [TopNavigation]
---

# Top Navigation

The persistent header bar across all authenticated pages, providing global access to notifications and the user profile, with a condensed mobile variant that exposes the Sidebar through a hamburger trigger.

---

## Guidelines

### When to use

- As the persistent top-level navigation across all main application pages.

- When users need immediate access to global actions like switching accounts or initiating a transaction.

### When not to use

- Within temporary flows or modals where focus should be restricted (use a dedicated Modal header instead).

- For sub-navigation or page-specific filtering (use Tab components or Sub-headers).

## Behavior

**Default Behavior**

- **Fixed Position:**  Stays at the top of the viewport as the user scrolls.

- **Responsive Transition:**  Switches from the Desktop layout to the Mobile layout at the defined breakpoint

**Desktop**

- Full horizontal layout with visible menu items

**Mobile**

- Condensed layout with a hamburger menu trigger; the Sandbox variant uses a distinct background to signal a non-production environment

- **Menu Trigger:**  Clicking the hamburger menu on mobile slides out a navigation drawer.

- **Menu item limit:**  If more than 5–6 items are needed in the desktop view, consolidate them under a "More" dropdown rather than overcrowding the bar.

## Placement

- **Positioning:**  Pinned to the top edge of the viewport.

- **Layering:**  Sits on the highest Z-index layer below modals and tooltips to ensure it is never covered by page content.
