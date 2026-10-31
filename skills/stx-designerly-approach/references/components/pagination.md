---
components: [Pagination]
---

# Pagination

A navigation control that lets users move through a paginated dataset by page number or by next/previous step, with control over items shown per page.

---

## Guidelines

### When to use

- Use when a dataset is too large to be displayed on a single page without impacting performance or readability.

- To provide users with control over how much data they want to digest at once via the items-per-page dropdown.

- When users need to jump to specific sections of a large result set.

### When not to use

- For simple navigation between two or three pages where basic "Back" and "Forward" buttons suffice.

- In mobile layouts with very limited horizontal space (consider a simplified version).

---

## Behavior

- Truncation is shown using  `…`  when the number of pages exceeds the pagination display limit. By default  `…`  are shown after the  **5th page**  on large and medium viewports and after the  **2nd page**  on small and mobile viewports.

- Clicking any link triggers an asynchronous content refresh.

## Placement

- **Positioning** : Fixed at the bottom of a table, list, or grid.

- **Alignment** : Right-aligned or centered depending on the layout's primary content alignment.

**Usage Example**
