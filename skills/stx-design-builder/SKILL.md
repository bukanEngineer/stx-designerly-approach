---
name: stx-design-builder
description: Build StraitsX product UI with the stxdesign-sandbox React design system. Use for screen and flow implementation, modals, alerts, transaction history, balance cards, funding flows, copy, financial formatting and design guidance. For post-build verification or an explicit audit, use the companion stx-design-verify skill.
---

# StraitsX design

Build UI from the `stxdesign-sandbox` design system and the StraitsX rules below. Works in any project and any agent.

## Choose the workspace

Ask which process applies if the request does not say.

- **React project** (for example a Vite prototype): use the project's installed `stxdesign-sandbox` package and project conventions. The package supplies React components and tokens; it is not bundled with this skill.
- **Paper file**: design in the file the user has selected in Paper or linked. Confirm the target file and page from the file you are connected to before editing, change only that file, and follow Paper's own tool instructions. Draw only components in the design system, as their [component guides](references/components/README.md) and the official Storybook show them, with the same tokens, spacing steps, copy and number rules. Do not invent controls or restyle existing ones. Skip Paper's own design brief with a mood and palette: colours, type and surfaces come from StraitsX tokens and component styling. Package availability stays unverified, since no React package is involved.
- **Critique, copy or flow guidance**: use this skill's references without requiring either. State when component availability cannot be verified.

In a React project, check that the package is available in the project. If it is missing, explain the dependency needed and follow the user's instructions for installing it. Follow the installed package setup: import `stxdesign-sandbox/global.css` once at the app entry if that path is exported, and use its supported named imports. Use the project's existing build and preview workflow.

## Finding components and props

Read [Package authority](references/package-api.md) before implementation. The consumer project's installed package declarations, README and version-matched supported examples determine actual exports, props and composition. These bundled guides describe design intent, not a version-independent API contract. Report unsupported capabilities; do not recreate package controls or hide mismatches with casts or suppressions.

## Before designing

1. Identify the user where relevant: Personal, Business or Developer.
2. Identify the money movement where relevant, or note that none applies.

## Always-on rules

These are hard rules. Everything in the references (patterns, component guides, sizing and layout advice) is a default: depart from it when the task needs to, say why, and stay inside these rules.

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
| Writing copy as a deliverable (email, social, blog) | [Copywriting mode](references/copywriting.md) |
| Any amount, balance, fee, rate or sample data | `references/numbers.md` |
| Gap, padding, columns, radius, responsive | `references/layout.md` |
| Transaction history, balance cards or funding flows | [Composition patterns](references/patterns.md) |
| Using a specific component | `references/components/<name>.md` (index: `references/components/README.md`) |

## Building a screen

1. Answer the two "before designing" questions.
2. Read the topics above that apply and the guide for each component you plan to use.
3. Verify component availability and props against the installed package, then build the screen using the workspace conventions and realistic sample data.
4. Build the non-default states (empty, loading, error, success) and the review/receipt step for risky actions.
5. Run the companion [stx-design-verify](../stx-design-verify/SKILL.md) workflow: check the package contract and project checks, then inspect rendered states and interactions. Fix issues within the authorised scope and recheck affected areas before claiming completion. Record unavailable checks as unverified.

## Reviewing a design

Use the shared references for design advice. For a post-build check or explicit read-only audit, follow [stx-design-verify](../stx-design-verify/SKILL.md); it owns the verification procedure and evidence report.
