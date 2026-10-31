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
| `--space-5` | 20px | Card inset, supplied once by the card or its content part. |
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
- A card's inset is `20px`, supplied once by the card or its supported content part. Do not add it again on a wrapper, child or screen stylesheet.
- Use 2-column desktop layouts only when the viewport is at least 1280px.
- Mobile and tablet layouts under 1280px should collapse to a single column.
- Keep high-frequency operational pages compact but never cramped.

**Rules for generated screens**

- Write spacing as the pixel value of a step: 4, 8, 12, 16, 20, 24 or 40, or `var(--space-1)` to `var(--space-7)`, or 0 or `auto`. Do not use 28, 32, 36 or 48.
- Assign each inset to one owner: the existing page layout owns page padding; the card or its supported content part owns the card inset. Use the ownership rules below.
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

## Surface hierarchy and padding ownership

Dashboard balance cards, history containers and ordinary content sections are flat, bordered surfaces. Use the installed component's supported flat/bordered treatment with semantic surface and border tokens. Reserve elevation shadows for floating layers such as modals, menus and popovers, as defined by the installed DS. A dashboard card is not a floating layer. If the package cannot express the intended surface, report the gap rather than overriding component internals or adding arbitrary shadows.

Inspect the existing component and computed styles before adding wrappers. A card's content part (for example `CardContent`, only if exported) may already supply padding. Do not add another full inset on its parent, child or screen stylesheet. Put gaps between sibling sections; do not simulate gaps by duplicating container padding. For a plain layout wrapper with no existing owner, use spacing tokens once at that boundary.

Use headings, aligned rows, spacing and supported dividers to group information inside a surface. A summary within a modal or card normally shares that surface; avoid a second bordered/shadowed card around the same details. A distinct nested surface needs a distinct task or interaction, not merely a desire to separate lines. See [composition patterns](patterns.md) for dashboard applications.
