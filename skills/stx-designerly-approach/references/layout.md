# Layout

Spacing, radius, layout and responsive rules. Token values are owned by the `stxdesign-sandbox` design system (`tokens.css`). Where this document and stxdesign-sandbox disagree, stxdesign-sandbox wins.

## Spacing Scale

**Principle:** spacing is built on a 4px base unit. Every gap, padding, and margin is a multiple of 4px, chosen from the scale below. Density: comfortable.

**Source of truth:** the `stxdesign-sandbox` spacing tokens (`--space-1` to `--space-7`, in `tokens.css`). Use the token name, not a raw number, wherever tokens can be used. The token names are numbered steps, not pixel values: `--space-4` is 16px.

| Token | Value | Usage |
|---|---:|---|
| `--space-1` | 4px | Icon/text micro gaps, compact internal spacing. |
| `--space-2` | 8px | Small gaps, stacked label/input relationships. |
| `--space-3` | 12px | Button internal gaps, inline groups. |
| `--space-4` | 16px | Form field spacing, compact card sections. |
| `--space-5` | 20px | Default card padding. |
| `--space-6` | 24px | Larger card padding and gaps between sections. |
| `--space-7` | 40px | Page-level content blocks. |

- If a layout needs a value that is not a step, use the nearest step and tell the user.

## Radius Scale

Source of truth: `--radius-*` in stxdesign-sandbox `tokens.css`.

| Token | Value | Usage |
|---|---:|---|
| `--radius-sm` | 4px | Tooltips, small data markers. |
| `--radius-md` | 8px | Cards, tables, alerts, menus, toasts, tags, compact inline containers. |
| `--radius-lg` | 12px | Inputs, modals, bottom sheets, the dashboard surface behind page sections. |
| `--radius-full` | 999px | Buttons, segmented controls, removable and clickable chips, badges. |

## Layout Rules

- Dashboard pages use `background` as the main canvas and `surface` for content containers.
- Default card padding is `20px`.
- Use 2-column desktop layouts only when the viewport is wider than 1280px.
- Mobile and tablet layouts under 1280px should collapse to a single column.
- Keep high-frequency operational pages compact but never cramped.

**Rules for generated screens**

- Write spacing as the pixel value of a step: 4, 8, 12, 16, 20, 24 or 40, or `var(--space-1)` to `var(--space-7)`, or 0 or `auto`. Do not use 28, 32, 36 or 48.
- Do not set page padding or card padding by hand. The page layout and the stxdesign-sandbox cards own them.
- Inline styles set layout keys only. Spacing never carries colour, border or shadow.
- Forms are one column. Set `maxWidth` on form and detail columns so lines stay readable.
- If a layout needs a value that is not a step, use the nearest step and tell the user.

## Responsive behaviour

| Breakpoint | Width | Layout Behavior |
|---|---:|---|
| Mobile / Tablet | `<1280px` | Single-column layout, stacked cards, collapsible navigation. |
| Desktop | `>=1280px` | Left sidebar, content region, optional 2-column layouts. |

### Rules

- Keep forms single-column on mobile/tablet.
- Stack card grids under 1280px.
- Preserve primary action visibility at the end of each workflow step.
- Do not squeeze dense tables into unreadable mobile layouts; use responsive cards or horizontal scroll with fixed key columns.
