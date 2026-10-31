---
name: stx-design-verify
description: Verify a built StraitsX UI against the installed stxdesign-sandbox API, shared design rules, rendered behaviour, worst-case data and mobile web behaviour. Use after implementation, to stress-test a screen with edge-case data, to check mobile viewport or touch behaviour, for a design-system compliance check, or for an explicit read-only UI audit.
---

# Verify StraitsX UI

Companion to [stx-designerly-approach](../stx-designerly-approach/SKILL.md). That skill owns the design rules; this skill owns the checks and evidence. Both sibling directories must be installed together using the repository installer or copied with their full references and relative layout intact. Data-robustness and mobile checks are adapted from Emil Kowalski's skills; see [attribution](ATTRIBUTION.md).

## Workflow

1. Establish the requested screen/flow and mode. An explicit read-only audit reports fixes without editing. For implementation work, apply fixes only within the user's scope and host authorisation; this skill grants no extra permission. Preserve unrelated work.
2. Set the depth from the request and the size of the change, and state it in the report:
   - **Quick** (a small edit): A1 and A5, D1–D6 on the changed files, plus the A/D items for any modal or alert touched. Render only what changed, if tools are available.
   - **Standard** (a new screen or flow, or "check this"): sections 1–3 of the checks.
   - **Full** (a full audit or pre-release): adds data robustness and mobile where they apply.

   Items outside the chosen depth are **Not checked**, never Pass.
3. Read [verification checks](references/checks.md) (numbered items to report against) and the shared references relevant to the target. Record the consumer package version, routes, states and available typecheck/render/browser tools. If a shared reference is missing, report the installation gap rather than substituting an external checkout.
4. Identify the process. A **React project** gets the API, design-rule and rendered checks. A **Paper file** gets the design-rule checks plus [D13](references/checks.md), using the canvas tool's screenshots and computed styles; the API checks do not apply and interaction behaviour stays unverified. Run [data robustness](references/stress-test.md) and [mobile web](references/mobile.md) at Full depth where they apply (dynamic names, identifiers, amounts or lists; phone or touch targets), and at any depth when the user asks or reports a related symptom. Mark an area not applicable with the reason.
5. Check the installed API contract and source composition, then run the project's relevant typecheck/build/check commands. Inspect the rendered UI and exercise interactions where tools permit. Source inspection and build success cannot establish a visual pass.
6. Report issues, fix authorised ones, then rerun the checks and rendered paths affected by each fix, including adjacent states, fixtures or responsive layouts it could change. For read-only mode, stop at findings. If a required tool, state or device is unavailable, finish independent checks and leave that area unverified.

## Report

Follow the [report example](references/report-example.md). Separate **Pass**, **Fail** and **Unverified** by check ID; list anything outside the chosen depth as Not checked. For each issue give location (file/line and route/step where applicable), linked shared rule, observed evidence and concrete fix. Distinguish source evidence, command results and rendered/interaction evidence. For a fix, record its recheck result; a proposed fix is not a pass.

Keep the report proportionate (a Quick report lists findings, Unverified items and one line for what passed): state the checked package version, scope/viewports, relevant commands and results, then findings and remaining gaps. Cite screenshots, tool observations or reproduction steps only when actually obtained. Identify unavailable browser/device tools, inaccessible states, missing dependencies or ambiguous package behaviour and the next check needed. Claim completion only for verified areas; never invent screenshots, interactions or test results.
