---
name: stx-designerly-approach
description: Build and review StraitsX product UI (Personal, Business, Developer dashboards; transfer, swap, mint, redeem, payout, OTC, settlement flows) with the stxdesign-sandbox React design system. Use when designing, coding, writing copy for, formatting amounts in, laying out, or reviewing any StraitsX screen, flow, form or component.
---

# StraitsX design

Build UI from the `stxdesign-sandbox` design system and the StraitsX rules below. Works in any project and any agent.

## Choose the workspace

- For prototypes and existing React products, use the project's installed `stxdesign-sandbox` package and project conventions. The package supplies React components and tokens; it is not bundled with this skill.
- For critique, copy or flow guidance, use this skill's references without requiring the package. State when component availability cannot be verified.

When implementing UI, check that the package is available in the project. If it is missing, explain the dependency needed and follow the user's instructions for installing it. Import `stxdesign-sandbox/global.css` once at the app entry and import components by name. Use the project's existing build and preview workflow.

## Finding components and props

- Use the official Storybook at https://stxdesign-sandbox.vercel.app for component examples and guidance.
- Verify available exports and exact props against the installed package's `dist/index.d.ts`, component declarations and README. Some controls are compound; do not guess their API. Storybook may describe a different version.
- For design intent, read `references/components/<name>.md`. The guides describe intent; the installed package determines what can actually be used. Explain unavailable capabilities rather than inventing props.
- Do not recreate design-system controls from tokens, CSS or screenshots as a fallback for missing components or tooling. Report the limitation. If the user requests a visual mockup in a design tool, clearly distinguish its visual representations from working package components.

## Before designing

1. Identify the user where relevant: Personal, Business or Developer.
2. Identify the money movement where relevant, or note that none applies.

## Always-on rules

**Flow**
- One primary action per decision area. Put it first, before the background.
- Show state, fees, limits and timing where the user decides. Every state has a plain name and a next step.
- Irreversible, high-value or external actions get a review screen first. The receipt mirrors the review.
- Design empty, loading, error and success states, not only the default.

**Layout**
- Spacing (gap, padding, margin) uses only 0, 4, 8, 12, 16, 20, 24 or 40 px. Prefer design-system layout and spacing tokens over raw values.
- Use design-system components for controls: no raw `<button>`, `<input>`, `<select>`, `<textarea>` or `<table>`.
- Do not hand-pick colours, fonts, borders, shadows or backgrounds. Use components and `tokens.css` variables (`var(--token)`).

**Copy**
- Action verb first. UK English. Sentence case. Use the approved terms. No hype or guarantees.

**Numbers**
- Code after the number, no currency symbol: `1,232 USD`.
- Overview values are simplified; working pages are exact.
- Never show `0.00` for loading or error. Show `—`.
- Keep raw values in data and format at render time with one shared helper (see `references/numbers.md`).

## Load the topic you need (read only what applies)

| Task | Read |
|---|---|
| Designing or reviewing a flow, states, risk, compliance, rails | `references/principles.md` |
| Labels, buttons, helper text, errors, terminology | `references/copy.md` |
| Any amount, balance, fee, rate or sample data | `references/numbers.md` |
| Gap, padding, columns, radius, responsive | `references/layout.md` |
| Using a specific component | `references/components/<name>.md` (index: `references/components/README.md`) |

## Building a screen

1. Answer the two "before designing" questions.
2. Read the topics above that apply and the guide for each component you plan to use.
3. Verify component availability and props against the installed package, then build the screen using the workspace conventions and realistic sample data.
4. Build the non-default states (empty, loading, error, success) and the review/receipt step for risky actions.
5. Typecheck and run the project's own checks. Look at the result in the browser if you can.

## Reviewing a design

Check against: the two "before designing" answers, the flow rules, the `principles.md` review checklist, then copy, numbers and
layout. Report each violation with the rule it breaks and a concrete fix.
