---
components: [Table, TransactionHistoryTable]
---

# Table

A structured grid for displaying multi-attribute datasets in rows and columns, supporting text, links, status tags, and inline actions in body cells.

---

## Guidelines

### When to use

- To organize and display structured data sets for easy scanning and comparison.

- When users need to view multiple attributes of an item simultaneously in a single row.

### When not to use

- For simple, single-column lists where a list component is more space-efficient.

- When content is primarily long-form prose or non-tabular layout.

## Behavior

- The table width is fluid and should stretch to fill its parent container

- Table rows have a fixed maximum height to maintain a compact, scannable layout. When content exceeds the available space, it is truncated with an  **ellipsis (…)** .

- **Scroll behavior** : If content width exceeds the viewport, the table uses horizontal scrolling.

- **Interaction** : Rows may change background color on hover to assist with horizontal scanning.

- Choose data navigation by user task, not a row-count threshold. Use incremental/infinite loading for continuous chronological history browsing; use pagination when users need page navigation, stable page links or bounded result sets. See [history loading and recovery](../patterns.md#history-loading-and-recovery).

- Left-align text in cells for readability; right-align numerical data for easier comparison.

## Placement

- Main content is positioned within the primary workspace of the page.

- Usually placed right below Search, Filter and Sort, or Export CSV button.

Use the installed package's supported table composition; this guide does not prescribe data or loading props.
