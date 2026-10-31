# stx-designerly-approach

Portable agent skills for creating and reviewing StraitsX UI using the `stxdesign-sandbox` component package and official Storybook.

| Skill | Purpose |
|---|---|
| `stx-designerly-approach` | Build and review StraitsX UI: setup, finding component props, principles, copy, numbers, layout, component guides, review checklist |
| `break-ui` | Stress-test existing screens with realistic difficult data; originally by Emil Kowalski, adapted for StraitsX |
| `mobile-native` | Improve mobile web touch, viewport, keyboard and scroll behaviour; originally by Emil Kowalski, adapted for StraitsX |

## Install (team)

```bash
git clone <this repo> && cd stx-designerly-approach
scripts/install.sh            # symlinks into Claude, Codex and Cursor user skill folders
scripts/install.sh claude     # or pick one
```

| Agent | Folder |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.agents/skills/` |
| Cursor | `~/.cursor/skills/` (requires a Cursor version with Agent Skills; older versions: copy `skills/stx-designerly-approach/SKILL.md` into `.cursor/rules/stx-designerly-approach.mdc`) |

## Use for design work

1. Open a React project with `stxdesign-sandbox` installed, or set up a prototype project and install the package there. Follow the package README for runtime requirements and setup.
2. Install these skills for your agent using the commands above.
3. Ask the agent to use `stx-designerly-approach` for your task. It uses the package's components, the skill's design guidance and your project's build/preview workflow.

The [official Storybook](https://stxdesign-sandbox.vercel.app) provides component examples and guidance. Verify available components and props against the installed package, since Storybook may describe a different version.

The component package is not bundled with these skills. Design reviews, copy and flow guidance can use the included references without installing it; component availability must then be verified separately. Missing tooling is not a reason to recreate package components by hand.

## Maintain

The knowledge in `skills/stx-designerly-approach/references/` is generated. Never edit it here.

```bash
scripts/sync.sh [path-to-design-sandbox-repo]   # default: /Users/bong/Documents/design-sandbox-stx-exp
```

`sync.sh` also strips lines that only apply inside the sandbox repo (gate rules, `AppShell`, `dashboard/…` paths, stale "Differs from 0.2.2" notes) and fails if any remain. Add new patterns in the filter block of the script.

Commit the result. The sync prints the source commit; put it in your commit message. `SKILL.md` files are hand-written; update the
core rules there only when `agent-rules/core.md` in the source repo changes.

## Stress-test a screen

After building a screen, ask the agent to use `break-ui` on that screen. It creates realistic edge-case fixtures, checks the rendered result where tools are available, and reports issues and proposed fixes. It applies fixes when requested. The installer above discovers all skill folders automatically.

`break-ui` was originally created by [Emil Kowalski](https://github.com/emilkowalski/skills/tree/main/skills/break-ui). This repository maintains a StraitsX adaptation; see its [attribution](skills/break-ui/ATTRIBUTION.md) and preserved [MIT licence](skills/break-ui/LICENSE). It is maintained separately from the generated StraitsX references.

## Check mobile web behaviour

Ask the agent to use `mobile-native` on a mobile screen or interaction. It checks viewport sizing, touch feedback, keyboards, safe areas and scrolling, using the project’s build/preview workflow. Global shell or shared-package changes outside the workspace are reported separately, and checks requiring a real phone remain explicitly pending until tested.

`mobile-native` was originally created by [Emil Kowalski](https://github.com/emilkowalski/skills/tree/main/skills/mobile-native). See the adaptation’s [attribution](skills/mobile-native/ATTRIBUTION.md) and preserved [MIT licence](skills/mobile-native/LICENSE).
