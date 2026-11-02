# Verification checks

Acceptance checks against the shared rules, not a second rulebook. Each item has an ID; report each applicable item as **Pass**, **Fail** or **Unverified** with its evidence type (source, command, rendered or interaction). Mark an inapplicable item with its reason. Missing evidence is Unverified, never Pass, and items outside the depth chosen in the skill are Not checked. See [the report example](report-example.md).

Use source inspection to find candidate failures and rendered or computed evidence to settle visual questions. A component name or token reference alone does not prove a good composition.

## 1. Installed API and executable checks

Rule: [Package authority](../../stx-design-builder/references/package-api.md).

- **A1** Record the consumer package version and run the project's typecheck and relevant build, lint and tests. Record command, exit status and scope. If the build omits typechecking, run it separately; if none exists, report the gap. A pass establishes only the checked source and build properties.
- **A2** Where typecheck cannot confirm DS usage (untyped files, loosely typed wrappers, children or slot shapes), compare imports, props and composition with the installed declarations and supported examples.
- **A3** Modal: the footer and actions use the installed footer mechanism. A footer recreated inside the body is a Fail even if it typechecks.
- **A4** Alert: text reaches the supported message interface, the action sits in the supported action slot, and dismissal is wired to parent state. An action button beside the alert is a Fail.
- **A5** Search touched DS usage and wrappers for `any`, double assertions, `@ts-ignore`, `@ts-expect-error`, lint suppressions and broad prop spreads. Report one only when it hides an unsupported import, prop or composition, with declaration evidence. Do not flag unrelated casts.

## 2. DS use and shared design rules

Load only the references the screen needs.

- **D1** Every control traces to a DS export. No recreated button, input, select, textarea or table. Rule: [build rules](../../stx-design-builder/SKILL.md).
- **D2** No CSS, utility or inline overrides of component internals. Compare selected tokens with the installed styles; inspect computed styles where needed.
- **D3** Spacing, colour and typography come from tokens and DS components. Rule: [Layout](../../stx-design-builder/references/layout.md).
- **D4** Dashboard surfaces are flat and bordered. Shadows appear only on floating layers (modals, menus, popovers).
- **D5** Every inset has one owner. Check the computed padding of a card and its content part for doubled spacing.
- **D6** No nested summary card around details that already share a surface.
- **D7** Labels, help text, errors and state names, including disabled and pending messages, follow [Copy](../../stx-design-builder/references/copy.md).
- **D8** Amounts follow [Numbers](../../stx-design-builder/references/numbers.md): raw values in data, one shared formatter, code after the number, `—` for missing, loading and error, never `0.00`. Check precision in overview, entry, review and receipt contexts using realistic balances, amounts, fees and rates.
- **D9** History and balances follow [Patterns](../../stx-design-builder/references/patterns.md): toolbar scope and actions, copyable references, one status placement, the navigation choice, recovery states, balance hierarchy and responsive behaviour.
- **D10** Modals follow [Modal](../../stx-design-builder/references/components/modal.md): content-based width and height, helper below the amount input, aligned label/value rows, one shared surface, supported footer.
- **D11** Alerts follow [Alert](../../stx-design-builder/references/components/alert.md): suitable severity, no colour-only meaning, compact and long wrapping.
- **D12** Flow follows [Principles](../../stx-design-builder/references/principles.md): decision context shown, review and receipt agree, pending, success and error outcomes are truthful.
- **D13** Paper file: every component matches its [component guide](../../stx-design-builder/references/components/README.md) and the official Storybook, and nothing is drawn that the design system does not have. A1–A5 do not apply; record package availability as Unverified. Evidence comes from the canvas tool's screenshots and computed styles.

## 3. Rendered states and interactions

Use the host's browser tools and the project's preview instructions. Record route, fixture or state, viewport and observations. In a Paper file, draw each state in R3, R5 and R6 that applies on its own artboard and check desktop and mobile artboards; a missing state is a Fail, and behaviour is Unverified. Without rendering tools, keep source findings and command results and mark every item here Unverified. A screenshot proves layout at that state and size; it does not prove focus, copying, submission or recovery works.

- **R1** Default screen at desktop and at a narrow size. Check overflow, wrapping, action visibility and alignment with realistic long text and amounts.
- **R2** Modal at a short viewport: scrolling works and title, context and actions stay reachable.
- **R3** Each applicable modal step: selection, entry, validation error, review, submission, pending, success, failure, instructions.
- **R4** Modal navigation: back, edit, close and reopen preserve data, show the right footer actions, prevent duplicate submit, contain focus and return it to the opener.
- **R5** Alerts: render compact and long copy, an action with dismissal, and each applicable severity. Activating the action and the close control changes parent state, and essential information stays recoverable.
- **R6** History states: empty, initial loading, loading more, error with retry, end of results, filter reset. Keyboard recovery or page navigation works; context is retained; no duplicate or stale rows; announcements do not steal focus.
- **R7** Search, filters, reset, export scope, progress and failure, full-reference clipboard content, and row and detail actions, tested independently. Success feedback requires observed success; a click handler is only source evidence.
- **R8** Use project-supported fixtures, routes or controlled data. Do not perform real financial or external actions to verify UI. Report inaccessible outcomes as Unverified.

## 4. Edge-case data

Applies when the screen renders dynamic names, identifiers, amounts or lists. Drive values through the existing fixture, mock or props boundary, never by editing markup or CSS to force a break. Use realistic values or the schema's actual limits.

- **S1** Text: the longest name, reference and label the data allows, a one-character name, a missing optional field, and text with accents or non-Latin characters. Nothing overflows, overlaps, clips or leaves an orphaned placeholder.
- **S2** Collections: empty, exactly one item (check plurals and counts), and a very large list. Each has a sensible state and acceptable performance.
- **S3** Amounts, per D8: a tiny non-zero balance is not shown as zero, a failed or missing balance differs from a real zero, a fee above the balance gives a clear message, an amount at a limit and one step above it validates correctly, and a large balance, fee and total fit together.
- **S4** Identifiers: a long wallet address, hash, reference or beneficiary name stays distinguishable. If truncated, truncate in the middle and keep the full raw value copyable. Never truncate amounts or dates.
- **S5** Check each case at the real container width, 320px and the widest layout. Record it as rendered, inferred from code or not tested. Use fixtures only; never start a real transaction.

## 5. Narrow and touch screens

Applies when the screen targets phones or touch.

- **M1** At phone width, forms are one column, the primary action stays reachable at every step, there is no horizontal page overflow, and modals and sheets scroll with their actions reachable. Rule: [Layout](../../stx-design-builder/references/layout.md).
- **M2** Financial actions use standard activation (click or form submit) with keyboard support, never pointer-down. Amounts, addresses and references stay selectable.
- **M3** Amount and code fields use the keyboard hints the installed input supports, and focusing an input does not make the page zoom or shift.
- **M4** Touch feel, the software keyboard and browser-bar behaviour stay Unverified until tested on a device. Emulation verifies layout only.

## After fixes

Repeat the affected items by ID: the source and command checks and the rendered states at the affected sizes. When shared composition changed, include nearby loading and failure states and the other fixtures. Keep unresolved failures separate from items that could not be performed.
