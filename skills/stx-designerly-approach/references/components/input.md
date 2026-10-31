---
components: [Input, InputCurrency, Textarea]
---

# Input (Text Field, Text Area, Search Box, Password Field, and Input with Suffix/Prefix)

---

A family of form controls that collects typed user input across five variants — Text Field, Text Area, Search Box, Password Field, and Input with Suffix/Prefix — each tailored to a specific data-entry context.

## Guidelines

### When to use

- **Text Field**  — collecting short, single-value user data: names, email addresses, amounts, account numbers, or any general form field.

- **Text Area**  — collecting longer freeform input that may span multiple lines: notes, descriptions, reasons, or messages.

- **Search Box**  — filtering a list or navigating to content by keyword; the search icon primes the user for a query interaction rather than a form entry.

- **Password Field**  — any field where the value must be masked by default; the visibility toggle lets users verify what they've typed.

- **Input with Suffix or Prefix**  — entry of a value that is inherently tied to a selectable unit or asset type, such as a crypto amount paired with a token selector or a transfer value with a currency toggle.

### When not to use

- Do not use a Text Field when the user must pick from a fixed set of options — use a Select or Dropdown instead.

- Do not use Text Area when a single short value is expected — it implies open-ended length and will mislead users about what's required.

- Do not use Search Box inside a form to collect data — it signals filtering behavior, not submission.

- Do not use Password Field for non-sensitive data; masking creates friction without benefit.

- Do not use Input with Suffix or Prefix if the unit or asset is fixed and non-selectable — embed the unit in the label or placeholder text instead.

## Behavior

- **Fill state** : The input switches from the unfilled to the filled appearance as soon as the user types any character.

- **Suffix/Prefix selector focus independence** : The suffix and prefix pill controls can receive their own focused and hovered states independently from the text area. This means a user can interact with the token/currency selector without placing focus in the text field, and vice versa.

- **Password visibility toggle** : Tapping the eye-slash icon in the Password Field unmasks the value for review. The icon state changes to reflect the visible mode. Re-tapping masks the value again.

- **Text Area height** : The Text Area starts at a minimum height and auto-grows vertically as the user types, up to a maximum cap set by the parent context. Once the cap is reached, the field locks at that height and the content scrolls internally.

- **Helper text and error messaging** : Helper text is optional and sits below the input container at all times when enabled. When the input enters an error state, the helper text slot becomes the error message — the content and position remain the same, only the text color changes to the critical/error color. The error border alone is not sufficient to communicate a problem; helper text must be present in the error state.

- **Disabled inputs** : A disabled field is non-interactive and should carry a tooltip or supporting text explaining why the field is unavailable, where the context is not self-evident

## Placement

- Inputs are full-width within their parent column or form container by default.

- In multi-column form layouts, never place more than two inputs side by side on mobile viewports.

- Input with Suffix and Prefix are primarily used in Send, Receive, and Convert flow screens where asset selection is part of the entry task. Do not repurpose them in generic forms where the selector has no functional role.

- The Search Box is typically placed at the top of a list view or filter panel, not inside a form alongside other field types.

- **Labels** : Written in sentence case, no trailing colon, max three words. The label is optional and can be hidden, but the field must always carry an accessible name (e.g.  `aria-label` ) so screen reader users still know its purpose. Mark optional fields with "(optional)" inline rather than relying on label presence alone.

- **Placeholder text** : Use to show an example value or input format (e.g. "e.g. 0.01 ETH"), not to restate the label. Placeholder disappears on focus; do not use it for instructions the user must retain while typing.

- **Helper text** : Use to provide context, formatting hints, or constraints below the field (e.g. "Maximum 200 characters"). Keep it to one line where possible.

- **Error messages** : Reuse the helper text slot. Write in plain language stating what went wrong and what the user should do. Avoid generic strings like "Invalid input."
