# Report example

A format sample only. Every file, version, command and observation below is a placeholder; a real report cites only evidence actually obtained, and unobtained evidence stays Unverified. Check IDs are defined in [checks](checks.md).

---

**Scope:** Funding modal on `/wallet`, desktop (1440px) and narrow (375px). Mode: read-only audit.
**Package:** `stxdesign-sandbox` 1.2.3 (resolved from the lockfile; declarations in `node_modules/stxdesign-sandbox/dist/index.d.ts`).
**Commands:** `npm run typecheck` exit 0; `npm run build` exit 0. These establish source and build properties only.

## Pass

- A1, A2: typecheck and build succeed, and DS usage matches the declarations. *(source, command)*
- D1: every control traces to a DS export. *(source)*
- D8: amounts are formatted through the shared helper, with `—` while loading. *(source; rendered at 1440px)*

## Fail

**1. A3, D10: footer recreated inside the modal body** (`src/funding/FundingModal.tsx:88`)
Rule: [Modal footer composition](../../stx-designerly-approach/references/components/modal.md#footer-composition).
Evidence: the actions are a `div` of two Buttons rendered as body children. The installed Modal declaration exposes a footer mechanism (`dist/index.d.ts`, Modal props), and the example in the package README uses it. Rendered: the actions scroll away with the content at a 600px-high viewport.
Fix: move the actions to the supported footer mechanism with one primary "Continue" action; remove the custom row.

**2. D6, D10: nested summary card and stacked details** (`src/funding/Review.tsx:41`)
Rule: [Detail and review rows](../../stx-designerly-approach/references/components/modal.md#detail-and-review-rows), [surface hierarchy](../../stx-designerly-approach/references/layout.md#surface-hierarchy-and-padding-ownership).
Evidence: a bordered Card wraps the review rows inside the modal, and each row stacks label above value. *(rendered, 1440px)*
Fix: render the rows as a two-column label/value grid on the modal's own surface and drop the inner Card.

## Unverified

- R3, R4: validation error, failure and instructions steps. No fixture reaches these states and the failure path needs a real submission, which was not performed.
- R2 at a short viewport with the keyboard open: no device or keyboard emulation was available.
- M3: touch feel and URL-bar behaviour need a phone.

## Not applicable

- R6–R7 (history), S1–S5 (no dynamic lists on this screen).

## Next checks

Supply a fixture for the error and instructions steps; test on a device. After fixing 1 and 2, recheck A3, D6, D10, R2 and R3 at both widths.
