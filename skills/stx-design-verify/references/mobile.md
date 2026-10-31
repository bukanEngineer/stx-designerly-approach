# Mobile web behaviour

Adapted from Emil Kowalski's `mobile-native`; see [attribution](../ATTRIBUTION.md). Use for screens or interactions used on a phone: viewport sizing, touch feedback, keyboards, safe areas and scrolling. Not for React Native or visual redesign. Emulation catches layout problems, not phone browser and input behaviour; see [hardware limits](#hardware-limits).

## Boundaries

- Follow the project's build and preview workflow. Locate the app shell and shared components before touching global CSS or document metadata.
- Identify the fix owner: screen layout, application shell or design-system package. Report fixes needed outside the authorised workspace.
- Treat the CSS below as patterns to evaluate against an observed problem, not a stylesheet to paste. Use supported DS components, tokens and motion conventions; check existing styles first and avoid duplicate fixes.
- Use media queries and `env()` capability checks, never user-agent sniffing. Touch and mouse are not exclusive; write for both.
- Pointer-down may start visual press feedback only. Submission and confirmation stay on accessible activation (`click` or form submit) with keyboard support. Never trigger a transfer or other financial action on pointer-down.
- Keep amounts, wallet addresses, transaction identifiers and errors selectable. Use supported input props for amount and code keyboards; keyboard hints do not replace validation.

## Symptoms and fixes

| Symptom | Cause | Check or fix |
|---|---|---|
| Hover state sticks after tap | Touch emulates hover | Gate hover styles with `@media (hover: hover) and (pointer: fine)`; give touch feedback through `:active` |
| Grey or blue flash on tap | Browser tap highlight | `-webkit-tap-highlight-color: transparent`, only on controls whose DS styling gives visible press feedback |
| Wrong height; bottom action under the URL bar | `100vh` is the largest viewport | `100dvh` for app shells and drawers; `min-height: 100svh` for first screens. Neither guarantees visibility above a software keyboard |
| Page zooms into an input | iOS zooms on inputs under 16px | Keep input text at 16px or more through the DS input typography; never override shared components from one screen |
| Tap feels laggy | Delay or feedback only on release | `touch-action: manipulation` on tappable elements; style `:active` at 100–160ms ease-out using project motion tokens |
| Pull-to-refresh or rubber band hijacks scroll | Scroll chaining to the page | `overscroll-behavior: contain` on inner scrollers (sheet content, lists); root `none` only when an app requirement; never `touchmove` + `preventDefault()` |
| Content under the notch or home indicator | No safe-area handling | `viewport-fit=cover` plus `env(safe-area-inset-*)` padding on shell-owned headers, bottom bars and sheets, with a fallback in `calc()`. Insets are device geometry, not replacements for spacing tokens |
| Long-press selects a button label | Text selection on controls | `user-select: none` and `-webkit-touch-callout: none` on controls only, never on `body` or content |
| Carousel or drag surface fights page scroll | Ambiguous gesture axis | `touch-action: pan-y pinch-zoom` for horizontal gestures, `pan-x pinch-zoom` for vertical handles; `none` only on a narrowly scoped surface that needs every axis, with an accessible alternative. Prefer native scroll with `scroll-snap-type` when possible |
| Status bar colour clashes | One or missing `theme-color` | Per-scheme `theme-color` resolved from the app's real tokens, only for schemes the app supports; check the PWA manifest for installed apps |

Software keyboard: `interactive-widget=resizes-content` is a Chrome-specific request, not the default iOS Safari behaviour or a cross-browser fix. Check target support and test with the keyboard open. For keyboard hints use `inputmode="decimal"` for amounts, `inputmode="numeric"` for codes, `enterkeyhint`, and `autocapitalize`/`autocorrect` off for codes.

## Avoid

Apply a row only where the browser, feature or target is in scope for the screen.

| Never | Instead |
|---|---|
| `user-scalable=no` or `maximum-scale=1` | Fix the input font size; zoom stays available |
| Ungated `:hover` | `@media (hover: hover) and (pointer: fine)` |
| `100vh` for an app shell or bottom-pinned UI | `100dvh` |
| `100dvh` on a hero | `100svh` |
| Press feedback on `click` only | `:active` or pointer-down feedback |
| Financial action on pointer-down | Standard activation |
| `user-select: none` on `body` | Controls only |
| `touch-action: none` on something users scroll past | `pan-x` or `pan-y` |
| Metadata for a theme the app does not support | Match the supported themes |
| Declaring it fixed from emulation | Real hardware, or mark unverified |

## Hardware limits

Sticky hover, tap highlight, URL-bar viewport changes, input zoom, click delay, overscroll, safe areas and the software keyboard are real-hardware behaviours. Emulation and the Simulator are steps toward them, not proof.

- Use the project's approved device setup (remote debugging or an approved local preview). Do not change server network exposure to run this check.
- Where a device exists: iOS through Safari Develop, Android through `chrome://inspect`. Prefer an older phone, with the keyboard open, in landscape once, and as an installed PWA if that is a target.
- Without a device, finish the code and layout checks and mark device behaviour **Unverified**, naming which fixes need confirmation on hardware.
- Report in the main format: what was wrong (symptom and one-line cause), what changed (file and declaration), and what needs a phone.
