# Dashboard composition patterns

Read [Package authority](package-api.md) before translating these patterns into components. Names such as Table, Copybox, Card or InputCurrency are candidates only when exported by the consumer version. These are composition specifications, not API examples, and they are defaults: adapt them to the task and say why when you depart from one. Shared [layout](layout.md), [copy](copy.md) and [numbers](numbers.md) rules apply.

## Transaction history

Use a single history section with a heading, toolbar, results and data-navigation/status area. Keep search, filters and export adjacent to the data they affect. Prefer the installed history/table composition if it supports the task; otherwise compose its supported DS controls and table parts.

- Give search a visible or accessible name and a clearable query. Group date, type and status filters; expose active filters and a reset action. Keep export as a secondary toolbar action, state whether it exports filtered results or another scope, and show progress/failure for asynchronous exports. A decorative export button is not a working action.
- On wide screens, keep search/filters together and export at the trailing edge. On narrow screens, wrap or stack groups in reading order; retain access to filters and export without squeezing controls or clipping labels.
- Place one status indicator in a consistent status column on desktop and next to the transaction identity in a compact layout. Do not repeat the same status in multiple cells. Use plain state names and a supported Tag/Badge treatment; colour alone cannot carry meaning.
- Align amounts numerically and keep currency codes visible. Make references copyable with the supported copy control/action; copy the full raw identifier even if display text is truncated. Give an icon action a name such as “Copy transaction reference”, show success only after clipboard success, and expose failure with recovery. Keep copy activation distinct from opening a row's details.
- For mobile, use a supported compact row/detail pattern or a labelled horizontal scroll region that keeps identity and actions discoverable. Preserve status, amount, date and reference access. Do not invent a sticky-column prop or replace the DS table with a hand-styled raw table.

### History loading and recovery

Continuous chronological browsing uses incremental/infinite loading. Page navigation, stable page links or bounded results use pagination. Honour a user's chosen model; neither is globally banned and neither follows from “more than 10 rows”. Apply the states the screen can actually reach: a bounded static list needs no load-more or end-of-results handling. Use the installed table's supported loading presentation and project data conventions; loading behaviour may live in the application rather than in a table prop.

| State | Expected behaviour |
|---|---|
| Initial load | Show a supported loading treatment sized to the results area, with a textual loading status. Do not flash “No transactions” or fabricated zero amounts. |
| Loading more | Retain existing rows and scroll position. Show progress at the result boundary; guard duplicate requests and duplicate rows. |
| Initial error | Explain the failure with an accessible retry action. Keep search/filter context. |
| Load-more/page error | Keep already loaded data visible; place retry beside the failed boundary/navigation. Retry the same cursor/page and query. |
| Empty | Distinguish no history from no matching results. Offer the relevant next step or clear/reset filters. |
| End of results | Stop requesting data; show an end message distinguishable from loading or error. |
| Search/filter/sort change | Reset cursor/page and previous end/error state for the new query. Ignore/cancel stale responses so old results cannot append. Keep controls and focus usable. |

For infinite loading, provide a keyboard-accessible “Load more” or equivalent explicit recovery path using a supported DS control, even if an observer loads automatically. Announce loading, completion and failure without stealing focus; appended rows must not move focus or trap users away from later page content. For pagination, preserve active query and page context, identify the current page and announce refreshed results. Test retry and reset with keyboard as well as pointer input.

## Balance cards

Show asset/account identity, an explicit balance label and the primary formatted balance in that order. Separate available, pending and total balances only when they have different meanings; explain restrictions next to the affected balance. Use the formatting context from [numbers](numbers.md), including overview versus working-page precision. Preserve full-value access where abbreviation would conceal a decision-relevant amount.

Keep funding/withdrawal actions subordinate to the balance hierarchy, with one primary action only when the card is the main decision context. Use flat bordered surfaces and one padding owner from [layout](layout.md#surface-hierarchy-and-padding-ownership); do not wrap the amount in another card. Use colour on a balance only when it communicates status, never decoratively. Align peer cards by shared heading, amount and action regions rather than fixed heights that clip content. Stack on narrow screens and allow long asset/account names to wrap.

Distinguish loading, unavailable/error, zero and real values. Keep a balance label and loading indication while fetching; use `—` for an unknown amount and provide retry on failure. Do not make stale data look current: label retained data and its update state where it affects decisions.

## Funding flow

Use the [modal composition guide](components/modal.md) for sizing, fields, detail rows and footer. A typical flow is method/asset selection where necessary → amount/details → review → submission → result/instructions. Skip irrelevant steps; funding by bank transfer may end with bank instructions rather than immediate settlement.

Carry the selected asset, network/rail and amount across steps. Show fees, limits, expected timing and any mandatory transfer reference before confirmation. On an instructions step, expose recipient/bank/account/reference as aligned labelled details with supported copy controls. Do not call a transfer complete just because instructions were displayed or an asynchronous request was accepted; use the actual pending/completed/failed state.

Preserve entered data when going back, show validation next to the field, prevent duplicate submissions while pending and give a safe retry/recovery path after failure. Route success and pending messages through the [Alert guide](components/alert.md) where persistent context is needed. Exercise every applicable step, back/close behaviour and result state before claiming the flow works.
