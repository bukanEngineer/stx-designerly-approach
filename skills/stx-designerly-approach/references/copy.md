# StraitsX copy rules

These rules apply to all product copy. When a person asks for copy to be written or reviewed as a deliverable (including email, social and blog), also follow [copywriting mode](copywriting.md).

## Where to look

| Question | Section |
|---|---|
| Which term to use, and which to avoid | Product Terminology, Transfer Terminology, Terms to Use Carefully |
| Fee, deduction or verification wording | Fee and Deduction Copy, Verification and Whitelisting |
| Button, label and CTA wording | CTA and Label Rules |
| Capitalisation, punctuation, style | Capitalisation and Style |
| Dashboard and in-product text | Dashboard and UX copy |
| Compliance wording | Compliance and Risk Guardrails |
| Worked examples | Quick Examples |


## Source of Truth Priority

When rules conflict, follow this order:

1. Product, legal, compliance, and risk requirements
2. Current StraitsX product terminology and feature behaviour
3. StraitsX tone of voice principles
4. UX clarity and channel-specific formatting
5. General copywriting preferences

Do not invent limits, fees, settlement times, supported networks, licences, or regulatory claims. Ask for the product fact if it is missing.

## Brand Voice

StraitsX speaks as an **Approachable Expert**.

This means copy should be:

- **Approachable**: friendly, understandable, and clear
- **Brave**: useful, action-led, and solution-oriented
- **Confident**: precise, credible, and direct
- **Trustworthy**: empathetic, supportive, and sincere

Avoid sounding overly casual, promotional, speculative, intimidating, or defensive.

## Core Writing Principle: BLUF

Use **BLUF: Bottom Line Up Front**.

Lead with the user action, outcome, or most important information. Put supporting context after.

Use this structure:

1. **Action or key outcome**
2. **What it means for the user**
3. **Relevant context, condition, fee, limit, or next step**

For actionable copy, write **Action > Context**.

Bad:
> To ensure we are able to match your deposit, please add your phone number in the comments.

Better:
> Add your phone number in the comments so we can match your deposit.

## UX Copy Principles

For product and dashboard copy:

- Start instructions with an action verb whenever possible.
- Use active voice.
- Be clear and concise.
- Explain technical or internal terms in plain language.
- Use scannable structures: headings, subheads, bullets, and short paragraphs.
- Avoid repeating instructions unless the repetition prevents user error.
- Match the user's context and stage in the journey.
- Make the next step obvious.

## Audience Modes

### Personal users

Use simpler explanations and reduce technical density.

Prefer:
- stablecoins
- digital assets
- bank account
- blockchain wallet
- wallet address
- transfer
- verify your identity

Avoid unnecessary business or technical terms such as settlement rails, DVA, CAS-to-CAS, POBO, COBO, or liquidity unless the user asks for details.

### Business and developer users

Use more precise product language while staying clear.

Approved terms include:
- Dashboard
- OTC
- Payment API
- Payout API
- Blockchain API
- Swap API
- Card Issuing API
- Payment Network
- USD Settlement
- Dedicated Virtual Account (DVA)
- Dedicated Virtual Account+ (DVA+)
- Business Account
- Stablecoin settlement
- Blockchain transfer
- Whitelisted address

Spell out acronyms on first mention, then use the acronym.

Example:
> Dedicated Virtual Account (DVA) lets your business collect and send USD through named virtual accounts.

## Product Terminology

Use current StraitsX product names consistently:

- StraitsX
- StraitsX Personal Account
- StraitsX Business Account
- Dashboard
- OTC
- Payment API
- Payout API
- Blockchain API
- Swap API
- Card Issuing API
- Payment Network
- USD Settlement
- XSGD
- XUSD
- USDC
- USDT
- SGD
- USD

Use digital asset tickers as they are written: **XSGD**, **XUSD**, **USDC**, **USDT**.

Format every amount per [`numbers.md`](./numbers.md).

## Transfer Terminology

Use **Transfer** as the main dashboard action.

Use:

- **Transfer In** for moving funds or supported stablecoins into StraitsX
- **Transfer Out** for moving funds or supported stablecoins out of StraitsX
- **Bank Transfer** for transfers through bank accounts
- **Blockchain Transfer** for transfers through supported blockchain networks
- **Wallet Address** for destination or source blockchain addresses
- **Whitelisted Address** for an approved wallet address

For product or operational context, it is acceptable to use:

- Deposit
- Withdrawal
- Mint
- Redeem
- Direct Mint
- Settlement
- Payout
- Collection

Use these terms only when they match the product flow or product documentation.

## Fee and Deduction Copy

### Transfer In

Do not overemphasise fees unless the flow requires them.

Focus on successful receipt, matching, and next steps.

### Transfer Out

Clearly communicate deductions before the user confirms.

Use **network fee** or **blockchain network fee** instead of gas fee unless the interface specifically names gas.

Example:
> Network fees may apply and will be deducted from the amount you receive.

## Verification and Whitelisting

Use precise terms:

- **Identity verification** confirms the user's identity.
- **Bank account verification** confirms the user's bank account details.
- **Wallet address whitelisting** approves a wallet address for blockchain transfers.

Do not use metaphors such as passport check or permission stamp in product copy.

## Terms to Use Carefully

Do not ban useful industry terms completely. Instead, use the clearest term for the audience and context.

Prefer **digital assets** or **stablecoins** for general users.

Use **crypto** only when it is necessary for accuracy, audience fit, or a product context involving crypto exchanges, crypto businesses, or Web3 platforms.

Use **fiat** when comparing fiat currencies and stablecoins, especially in business, API, settlement, or product overview contexts. For personal users, prefer **SGD**, **USD**, or **bank transfer** where clearer.

Use **chain** only when referring to supported networks in technical contexts. Prefer **blockchain network** in user-facing copy.

Use **Recipient** for a bank account holder or named payee. Use **Wallet Address** or **Whitelisted Address** for blockchain destinations.

Avoid crypto-native slang such as moon, pump, degen, alpha, ape, yield farming, and meme-native terms.

### Copy examples

| Context | Good | Avoid |
|---|---|---|
| Primary CTA | `Transfer Out` | `Send Crypto` |
| Verification | `Verify Identity` | `KYC Now` |
| Balance | `Available Balance` | `Crypto Bag` |
| Status | `Waiting for network confirmation` | `On-chain Pending` |
| Error | `Transfer could not be completed` | `Transaction Failed on Chain` |

## Capitalisation and Style

Use UK English.

Examples:

- personalised
- customised
- centralised
- decentralised
- optimised
- realised
- colour
- centre

Use sentence case for normal UI copy unless the component style requires title case.

Capitalise product names, account names, acronyms, and official feature names.

Correct:
- Transfer In
- Transfer Out
- StraitsX Business Account
- Blockchain API
- Wallet Address as a UI label
- wallet address in body copy

Avoid capitalising every noun in body copy.

Use the Oxford comma for clarity.

## CTA and Label Rules

CTAs should be short, clear, and action-led.

Prefer 1-3 words. Do not enforce an arbitrary 10-character limit when a clearer CTA needs more space.

Good CTA examples:

- Transfer In
- Transfer Out
- Confirm Transfer
- Preview Swap
- Confirm Swap
- Request Quote
- Verify Identity
- Add Address
- Continue
- Confirm
- Submit

Avoid vague CTAs:

- Click Here
- Proceed Now
- Do It
- Okay

## Dashboard and UX copy

- Lead with the action.
- Use direct instructions.
- Keep helper text short.
- Explain errors with the problem, reason, and fix.

Error structure:

1. What happened
2. Why it happened, if known
3. What the user can do next

## Compliance and Risk Guardrails

- Be factually accurate.
- Do not overclaim speed, cost, availability, stability, licensing, or regulatory approval.
- Do not imply endorsement by regulators, banks, merchants, or partners unless explicitly approved.
- Do not mention MAS in promotional copy unless it is legally required, factual, and approved.
- Do not guarantee returns, profits, price stability beyond product facts, or uninterrupted service.
- Use disclaimers when discussing availability, limits, fees, settlement times, or supported networks.

## Quick Examples

### Transfer In helper text

> Transfer funds from a bank account under your name so we can match your deposit smoothly.

### Transfer Out fee notice

> Network fees may apply and will be deducted from the amount received in your wallet address.

### Swap CTA helper text

> Review your quote before confirming the swap.

### OTC CTA helper text

> Request a quote for high-volume stablecoin trades with dedicated support.
