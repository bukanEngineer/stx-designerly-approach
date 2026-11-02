---
components: [DateInput]
---

# Input / Date Input

A form input that captures a single date or a date range through a calendar picker, available as Single or Range variants.

## Guidelines

### When to use

- Collecting a specific date from the user (booking date, birth date, effective date)

- Collecting a date range where both a start and end date are required (filter period, validity window, travel dates)

- When a structured date format must be enforced — the calendar picker prevents free-form input errors

### When not to use

- Don't use for approximate or relative time input (e.g. "next week", "in 3 days")

- Don't use when only a year or month is needed — a simpler select or dropdown is more appropriate

- Don't substitute with a plain Text Field using  `type="date"`  — use this component

- Don't use when a time component is also required — verify if a DateTime variant exists

---

## Behavior

- Tapping or clicking the Right Icon (⑥) opens the date picker

- Tapping directly on Start Date or End Date also opens the date picker, focused on the respective value

- In range mode, the picker enforces that End Date cannot precede Start Date

- In single mode, End Date and the " - " separator are not rendered

- Height is fixed; the container does not grow

- The Right Icon is always visible regardless of filled or unfilled state

- Helper Text can show the expected format as a persistent hint, or switch to an error message on invalid input

---

## Placement

- Used inline within forms wherever a date or date range is required

- Spans the full width of its parent column

- Label sits above the container; Helper Text sits below

- The date picker overlay opens below or above the container depending on available viewport space

- Keep the date format consistent across the product — never mix DD/MM/YYYY and MM/DD/YYYY in the same interface.
