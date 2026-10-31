# Skill regression scenarios

Maintainer-only prompts for re-running after skill changes. Not shipped to agents or linked from a skill. Run each in a prototype project with a recorded `stxdesign-sandbox` version, once with the build skill and once with the verify skill, and compare with the expectations. Record the model, package version and date of each run; a skill change is an improvement only if expectations are met at least as often as before.

## Build skill

| # | Prompt | Must happen | Must not happen |
|---|---|---|---|
| B1 | Build a funding modal: choose a bank transfer, enter an amount, review, then show bank instructions. | Amount input before its helper; label/value review rows in two aligned columns; width fits content; footer uses the installed mechanism; one primary action per step. | Helper above the input; nested summary card; oversized fixed-size modal; footer rebuilt in the body. |
| B2 | Add a transaction history table with search, filters, export and copyable references. | Toolbar scoped to the data; one status placement; full reference copied; infinite loading with a keyboard "Load more" for continuous browsing; initial, load-more error, end and filter-reset states. | Pagination chosen only because there are more than 10 rows; success shown before the clipboard succeeds; decorative export. |
| B3 | Add balance cards to the dashboard. | Flat bordered surface; one padding owner; no shadow; `—` for loading. | Shadow on a dashboard card; card padding added on top of the content part's padding; `0.00` while loading. |
| B4 | Show a success alert with a "View details" action that the user can dismiss. | Message and action in the supported slots; dismissal updates parent state. | A Button placed beside the alert; a close icon that does nothing. |
| B5 | Use a prop the installed package does not have (for example ask for a `width` prop on the modal). | The agent reports the capability gap. | An invented prop hidden with a cast or suppression. |

## Verify skill

Use a seeded project for each case: apply the "flaw" below, then ask for the verify workflow.

| # | Seeded flaw | Expected finding | Expected status |
|---|---|---|---|
| V1 | Footer actions rendered inside the modal body; build and typecheck pass. | Fail A3/D10 with file and line, linked rule and fix. | Not Pass because the build passed. |
| V2 | `// @ts-expect-error` over an unsupported Modal prop. | Fail A2/A5 with declaration evidence. | Typecheck pass reported separately from the fail. |
| V3 | Summary Card nested in a modal; shadow on a dashboard card; doubled card padding. | Fail D4, D5, D6 with computed-style evidence. | |
| V4 | Same project, but no browser tool available. | Source findings reported; all R items Unverified. | No claim of a visual pass. |
| V5 | Read-only audit request on a project with an obvious violation. | Findings and fixes proposed only; no files edited. | `git status` unchanged. |
| V6 | A list with a 64-character email and a name with diacritics. | Stress-test finds the overflow and wrong initials with the offending value. | Fixture added only if edits are authorised. |
| V7 | A pointer-down handler that submits a transfer. | Fail M2. | |
| V8 | Fix applied for V1. | Recheck of A3, D10, R2 and R3 at both widths recorded. | Proposed fix not counted as a pass until rechecked. |
| V9 | One-line copy change in a modal; ask to "check this". | Standard-or-lighter depth stated; modal items checked; no data-robustness or mobile report. | Unchecked items listed as Not checked, not Pass. |
| V10 | Quick check of a small edit that touches only a card's spacing. | Quick depth stated; D3, D5 checked on the changed file; short report. | A full 40-item report. |
