# StraitsX Design Principles

Use these principles when designing StraitsX product experiences across Personal, Business, Wallet, Platform, OTC, APIs, and Payment Network.

StraitsX operates at the bridge between fiat, stablecoins, blockchain networks, payment rails, cards, QR acceptance, and institutional settlement. The design system must make that bridge feel reliable, understandable, and consistent without hiding the details that matter.

## Source of truth

These principles are grounded in three inputs:

1. StraitsX brand voice: **Approachable Experts** who help people navigate the complicated digital assets space.
2. StraitsX writing principle: **BLUF** — put the bottom line, action, and user value up front.
3. StraitsX product reality: one ecosystem spanning Dashboard, OTC, Payment APIs, Payout APIs, Blockchain API, Swap API, Card Issuance API, Payment Network, USD Settlement, and stablecoin reserves.

## How to use these principles

Use them during product strategy, IA, UX flows, UI reviews, design QA, and design-system component decisions.

For every feature, ask:

- Does the user understand what is happening now?
- Does the user know what changed, why it changed, and what to do next?
- Does the surface feel like one StraitsX network, even when multiple rails are involved?
- Does the amount of friction match the risk of the action?
- Does the design communicate trust through evidence, not decoration?

---

## Documentation ownership

StraitsX design documentation follows a layered source-of-truth model. This is the only place the model is defined; the other documents link here.

| Layer | File | Source of truth for |
| --- | --- | --- |
| Product and UX principles | `principles.md` (this file) | What the experience should optimise for: state, trust, risk, compliance, rails, next action |
| Layout | `layout.md` | Spacing, radius, layout and responsive rules |
| Design tokens and component implementation | The `stxdesign-sandbox` design system (`tokens.css`) | Token values: colour, type, spacing, radius, elevation. When a document and stxdesign-sandbox disagree, stxdesign-sandbox wins |
| Components | `component-guideline/*.md` | When to use, behaviour, and placement of one component |
| Numbers | `numbers.md` | How money, balances, and token amounts are formatted |
| Copy | `copy.md` | Voice, terminology, CTA and label rules |

Do not duplicate guidance across layers. Define a rule in the layer that owns it, and link to that file from anywhere else it is needed. Do not restate token values; refer to the token name.

Terminology conflicts between documents are resolved in favour of `copy.md`.

---

## 1. Show what is happening, what changed, and why

When designing any feature, ask: *Can the user see the current state, understand what changed, and know why — without needing to ask support?*

### Design requirements

- Name every account state, transaction state, review state, and error state in plain language.
- Pair every state with a clear next step, even when the next step is “wait”.
- Express time in human units: `~30 minutes`, `up to 2 hours`, `same business day`, `next business day`.
- Avoid vague status labels such as `Processing`, `Pending`, or `Failed` unless supported by a reason and next step.
- When something changes — a feature launches, a transaction moves state, a limit updates, or a rail becomes unavailable — surface the change once, deliberately, and close to the affected action.
- Keep change announcements useful, not promotional. Do not re-promote information the user has already acknowledged.

### Component implications

- Status badges must have consistent severity, naming, and next-step behaviour.
- Empty states must explain whether there is no data, no access, no eligible asset, or no completed activity.
- Toasts should confirm immediate UI feedback; persistent states should live in the page, table, or transaction detail.
- Transaction detail pages should show a timeline when the process has multiple steps or dependencies.

### Good pattern

`Waiting for network confirmation`

`Your XSGD transfer has been submitted. This usually takes ~10 minutes. You can leave this page and check the latest status in Transaction History.`

### Avoid

`Processing`

`Your transaction is processing. Please wait.`

---

## 2. Lead with the user’s next best action

When designing any feature, ask: *Does the page make the next action obvious before explaining the background?*

### Design requirements

- Put the primary action, user value, and outcome before supporting context.
- Start instructions with action verbs: `Add`, `Verify`, `Transfer`, `Review`, `Confirm`, `Request`, `Download`.
- Use progressive disclosure: show the minimum required decision first, then reveal details when they affect the user’s choice.
- Use helper text to explain consequences, not to repeat labels.
- Use headings to summarise the page outcome, not the internal feature name.

### Component implications

- Forms should begin with the user’s task, not internal setup logic.
- Confirmation screens should summarise the commitment first, then show the breakdown.
- Tooltips should explain unfamiliar terms only when the term cannot be replaced with simpler language.
- Error states should prioritise recovery action before explanation.

### Good pattern

`Add a verified wallet address`

`You can transfer XSGD to this address after it is approved.`

### Avoid

`Address management`

`This section contains the list of addresses associated with the blockchain withdrawal module.`

---

## 3. Unify rails into one movement

**Anchored to: Resilience** — robust systems and infrastructure that deliver consistent, reliable solutions across a fast-evolving financial ecosystem.

When designing any feature, ask: *Does this surface express movement as one StraitsX network, or does it leak the implementation underneath?*

### Design requirements

- Keep the shape of value movement constant: `asset`, `amount`, `source`, `destination`, `method`, `network`, `fee`, `time`, `status`.
- Use shared vocabulary across Wallet, Platform, and Developer surfaces.
- Treat new rails as extensions of the network, not separate products with separate mental models.
- Route errors and edge cases back into the unified flow; never strand users in a rail-specific dead end.
- Use rail-specific language only when it changes cost, speed, eligibility, risk, or required action.

### Component implications

- Transfer, swap, payout, mint, redeem, and settlement flows should share review-screen anatomy.
- Activity tables should use consistent columns and state naming across rails.
- API dashboards should mirror user-facing concepts where possible, even if implementation details differ.
- Network selectors should clarify availability, fee, and estimated time instead of exposing raw infrastructure choices only.

### Good pattern

`Transfer Out`

`Send XSGD to a verified wallet address on Polygon. Network fees apply.`

### Avoid

`Execute outbound blockchain transaction`

`Initiate chain-specific withdrawal operation.`

---

## 4. Make every bridge feel familiar

When designing any feature, ask: *Is the user crossing into unfamiliar territory — fiat to stablecoin, bank account to wallet address, personal to business, one network to another — without losing confidence?*

### Design requirements

- Anchor value in the unit the user already trusts: SGD, USD, XSGD, XUSD, USDC, or USDT depending on context.
- Show both sides of a conversion when it affects understanding: `You pay`, `You receive`, `Rate`, `Fee`, `Total`.
- Treat 1:1 minting or redeeming as parity when applicable; do not make it feel like speculative trading.
- Default to the simplest safe path. Reveal advanced controls — network choice, address metadata, settlement detail, API payloads — when the user needs them.
- Use familiar financial language for Personal users and precise product language for Business and Developer users.

### Component implications

- Conversion components should clearly separate amount, rate, fee, and received amount.
- Network choices should include asset compatibility and consequences.
- Educational prompts should appear before unfamiliar actions, not after mistakes.

### Good pattern

`Mint XSGD with SGD`

`Transfer SGD from your bank account. XSGD will be added to your StraitsX wallet after the transfer is received.`

### Avoid

`Convert fiat into tokens via stablecoin rail`

---

## 5. Make every commitment deliberate

When designing any feature, ask: *Does the friction match the consequence, and does the user know exactly what they are committing to before they commit?*

### Design requirements

- Keep reversible, low-risk actions lightweight.
- Add a dedicated review screen for irreversible, high-value, external, or compliance-sensitive actions.
- Restate all commitment parameters in human terms: amount, asset, recipient, destination, network, fee, total, estimated time, and what cannot be undone.
- Place trust signals at the moment of risk: verified wallet address, bank account ownership, quote expiry, transaction limit, reserve or compliance evidence, and fee breakdown.
- Make receipts mirror confirmations so users recognise the action they approved.

### Component implications

- Confirmation screens and receipts should share layout, labels, and order.
- Destructive or irreversible CTAs should be explicit: `Confirm Transfer`, `Submit Request`, `Confirm Swap`.
- Warning banners should explain consequence and recovery, not just risk.
- High-risk actions should support review, edit, and cancel paths before final confirmation.

### Good pattern

`Review Transfer Out`

`You are sending 1,000 XSGD to a verified wallet address on Ethereum. This transfer cannot be reversed once submitted.`

### Avoid

`Are you sure?`

`This action may have consequences.`

---

## 6. Put trust where decisions happen

When designing any feature, ask: *Is trust supported by relevant evidence at the exact moment the user needs it?*

### Design requirements

- Show trust signals contextually: verified bank account, verified wallet address, quote source, fee estimate, settlement timing, and transaction status.
- Explain limits and restrictions before the user hits a blocked state.
- Separate platform fees, network fees, and third-party fees when they affect the final amount.
- Do not imply regulatory, banking, merchant, or partner endorsement unless the claim is approved and factual.
- Use factual, restrained language. Avoid hype, guarantees, or overclaiming.

### Component implications

- Fee breakdown components must distinguish fee type, payer, deduction point, and final amount.
- Verified-state components must explain what was verified and what it enables.
- Limit components should show used, available, reset period, and next step.
- Trust markers should never be decorative; each must answer a real user concern.

### Good pattern

`Network fee estimate`

`This fee is charged by the blockchain network and may change before you confirm.`

### Avoid

`100% safe and instant`

---

## 7. Design for both first-time clarity and expert speed

When designing any feature, ask: *Can a new user understand the flow, while an experienced user can move quickly without losing control?*

### Design requirements

- Make first-time experiences guided, but do not make repeat users relearn the flow.
- Save safe preferences where useful: last asset, last network, saved beneficiary, preferred view.
- Use defaults carefully; never default irreversible risk without clear confirmation.
- Support bulk, API, and advanced workflows without making the basic flow feel technical.
- Give expert users shortcuts only after the underlying state and risk remain visible.

### Component implications

- Progressive onboarding should disappear or shrink after completion.
- Tables should support filtering, exporting, and drill-down without sacrificing readable defaults.
- Developer surfaces should include plain-language summaries before technical payloads.
- Power-user controls should be discoverable, not dominant.

### Good pattern

`Use saved wallet address`

`Last used for XSGD on Polygon. Verified on 12 May 2026.`

### Avoid

`Advanced mode required to continue`

---

## 8. Keep Personal, Business, and Platform experiences connected

When designing any feature, ask: *Can a user grow from Personal to Business to Platform without learning a new StraitsX from scratch?*

### Design requirements

- Reuse mental models across Personal, Business, OTC, and API surfaces.
- Keep naming consistent unless the audience genuinely needs a different term.
- Let additional capability feel like depth, not a new product universe.
- Make permissions, roles, limits, and approval flows visible in Business and Platform contexts.
- Respect the difference between end-user language and developer language while keeping shared concepts aligned.

### Component implications

- Navigation, status, tables, review screens, and receipts should share system patterns across product areas.
- Business surfaces should expose role, permission, and approval context close to restricted actions.
- API surfaces should map technical events to user-facing transaction states.

### Good pattern

`Transfer requires approval`

`An Admin must approve this Transfer Out before it is submitted.`

### Avoid

`Insufficient role scope for outbound transaction endpoint`

---

## 9. Make compliance understandable without making it feel like punishment

When designing any feature, ask: *Does the user understand the requirement, the reason, and the path forward?*

### Design requirements

- Explain compliance-related requirements in user terms: what is needed, why it matters, and what happens next.
- Use `Verification` for identity or account checks. Use `Whitelisting` only when referring to permissioned wallet addresses or approved destinations.
- Avoid exposing internal compliance jargon unless the audience is Developer.
- Make blocked states actionable: show what is missing, who can resolve it, and expected timing.
- Do not blame the user. Keep tone calm, factual, and supportive.

### Component implications

- Verification components should show requirement, status, next step, and expected review time.
- Permission errors should tell the user whether they need a different role, an Admin, or Support.
- Limit components should explain whether a limit is daily, annual, account-based, product-based, or rail-based.
- Compliance banners should be persistent only while action is required.

### Good pattern

`Verify your identity to continue`

`We need this before you can Transfer Out to a wallet address. Reviews usually take 1 business day.`

### Avoid

`KYC incomplete. Transaction blocked.`

---

## 10. Design the system, not the screen

When designing any feature, ask: *Will this pattern still work when the product adds a new asset, rail, network, account type, or limit?*

### Design requirements

- Design reusable patterns before creating bespoke screens.
- Build components around stable concepts: asset, amount, destination, network, status, fee, limit, role, time, proof.
- Use extensible naming and layout rules for new assets, networks, and products.
- Avoid rail-specific exceptions unless the underlying risk, regulation, or capability truly differs.
- Record new patterns in the design system when they become reusable.

### Component implications

- Status, fee, asset, network, and transaction components should be tokenised and reusable.
- Tables should support additional columns without breaking hierarchy.
- Review and receipt components should support optional fields gracefully.
- Empty, loading, error, and success states should be part of every component spec.

### Good pattern

A single `Transaction Summary` component that supports Transfer In, Transfer Out, Swap, Mint, Redeem, OTC, Payout, and API-triggered flows.

### Avoid

A custom confirmation layout for every rail or product team.

---

# Product-specific guidance

## Dashboard

Design Dashboard around confident self-service. Users should understand their balances, available actions, transfer methods, supported assets, fees, and transaction history without needing product or support knowledge.

Prioritise:

- Clear asset cards and available actions
- Transfer In, Transfer Out, and Swap as the primary movement model
- Plain-language transaction states
- Review screens for external transfers and swaps
- Fast access to Transaction History and Account Statement

## OTC

Design OTC around high-value clarity, timing, and human support. OTC users need confidence in quote request, quote receipt, trade execution, and settlement.

Prioritise:

- Quote status and expiry
- Minimum trade amount
- Operating hours
- Same-day vs next-business-day settlement timing
- Clear handoff between digital flow and dedicated trading support

## API and Platform

Design Platform surfaces around operational reliability. Business and Developer users need to understand how API actions map to money movement, customer balances, payouts, swaps, blockchain withdrawals, and reconciliation.

Prioritise:

- API events mapped to user-facing transaction states
- Clear environment separation: sandbox vs production
- Logs, webhooks, errors, retries, and reconciliation views
- Permission and approval visibility
- Plain-language summaries before technical details

## Payment Network

Design Payment Network around interoperable acceptance and settlement confidence. Businesses need to understand who paid, through which acceptance method, what was settled, when, and in which currency or stablecoin.

Prioritise:

- Merchant, payer, payment method, settlement asset, and timing
- QR and partner flow clarity
- Settlement status and reconciliation
- Clear separation between payment acceptance and settlement outcome

## Card Issuance

Design Card Issuance around programme control, cardholder clarity, and settlement transparency.

Prioritise:

- Programme, card, cardholder, and transaction hierarchy
- Funding source clarity: fiat or stablecoin-backed
- Spend, authorisation, reversal, settlement, and dispute states
- Controls for activation, suspension, limits, and compliance review

---

# Flow patterns

## Transfer Creation Flow

Use a step-by-step layout with clear hierarchy:

1. Select asset or account.
2. Enter amount and recipient details.
3. Review fees, limits, and processing expectations.
4. Confirm transfer.
5. Show completion or pending state.

**Design rules**

- Use one primary action at each step.
- Show limits and validation near the relevant input.
- Use review cards before final confirmation.
- Avoid ambiguous copy such as “Send Now” if additional processing still applies.

## Account Verification Flow

Verification flows should feel procedural and reassuring.

**Recommended components**

- Progress indicator
- Checklist card
- Alert for missing information
- Clear document requirements
- Final review panel

**Copy rules**

- Use “Verify Identity”, “Verify Bank Account”, “Submit Documents”, “Review Details”. Terms follow [`copy.md`](./copy.md).
- Avoid anxiety-inducing language unless legally required.

## Balance / Asset Summary

Balance cards should prioritize scanability.

**Recommended hierarchy**

- Asset code or account name
- Available balance
- Secondary metadata: pending, reserved, limits, last updated
- Primary action only if the card is the main context

**Amount formatting**

- Format every amount per [`numbers.md`](./numbers.md): code after the number, no currency symbol.
- Right-align tabular amounts in tables.
- Use clear asset codes.
- Avoid decorative coloring of balances unless communicating status.

## Sandbox / Developer Environment

Sandbox experiences may use deeper green surfaces to distinguish environment, but the language should remain professional.

**Rules**

- Clearly label sandbox state.
- Avoid making sandbox look like production.
- Use `sidebar-sandbox-bg` for strong environment distinction.

---

# Design review checklist

Use this checklist before shipping any StraitsX product experience.

## State and clarity

- [ ] Every state has a plain-language name.
- [ ] Every state has a next step or clear reason why no action is needed.
- [ ] Wait times are expressed in human units.
- [ ] Empty, loading, error, success, and edge states are designed.

## Movement and rails

- [ ] The flow uses the shared movement model: asset, amount, source, destination, method, network, fee, time, status.
- [ ] Rail-specific details appear only when they affect user choice, cost, speed, eligibility, or risk.
- [ ] Transfer In, Transfer Out, Swap, Mint, and Redeem are used consistently.
- [ ] Receipts mirror confirmations.

## Trust and risk

- [ ] Fees are shown before confirmation.
- [ ] Irreversible or high-value actions have a review step.
- [ ] Verified destinations, limits, quote expiry, and settlement timing appear at the moment of decision.
- [ ] No unsupported claims, guarantees, or implied endorsements are made.

## Accessibility and scalability

- [ ] The interface is scannable with headings, summaries, and clear hierarchy.
- [ ] Controls are accessible by keyboard and assistive technology.
- [ ] Every form field has a visible label and helper text. Placeholder text is not used as a label.
- [ ] New assets, networks, roles, or rails can be added without redesigning the pattern.
- [ ] The pattern is documented if reusable.

---

# Agent behaviour for applying these principles

When reviewing or generating product design recommendations for StraitsX:

1. Identify the user type: Personal, Business, or Developer.
2. Identify the money movement: Transfer In, Transfer Out, Swap, Mint, Redeem, Payout, OTC Trade, Card Transaction, QR Payment, Settlement, or API Event.
3. Apply BLUF: state the user outcome and next action first.
4. Check whether the flow makes state, timing, fees, limits, and risk visible.
5. Recommend reusable design-system patterns instead of one-off screen fixes.
6. Flag unclear terminology, hidden risk, unsupported claims, or inconsistent rail-specific behaviour.
7. Provide improved UI copy where the design issue is caused by unclear language.

