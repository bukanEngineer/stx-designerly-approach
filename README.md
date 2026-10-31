# stx-designerly-approach

Portable agent skill for building StraitsX UI, built from the design-sandbox repo. Does not depend on the sandbox server or gate.

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

For a designer building a working prototype, the recommended starting point is the **design-sandbox repo**:

1. Clone the design-sandbox repo, follow its README to set it up, and run `npm install` and `npm run dev` there. The sandbox declares `stxdesign-sandbox` as a dependency; installing the sandbox dependencies installs the package too.
2. Install this skill for your agent using the commands above. Follow the sandbox's agent setup instructions to connect your agent and use its workspace tools.
3. Open the sandbox workspace and ask the agent to use `stx-designerly-approach` for your design task. The skill supplies design guidance; the sandbox supplies the preview environment and components.

The [official Storybook](https://stxdesign-sandbox.vercel.app) provides component examples and guidance. When building, check the installed package and sandbox catalog for the available components and props, since Storybook may describe a different version.

The package and sandbox application are **not included** in this skill repository. For an existing React project, install `stxdesign-sandbox` in that project instead and follow its conventions. For design reviews, copy and flow guidance, the skill's references can be used without installing either; component availability must then be verified separately.

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

Ask the agent to use `mobile-native` on a mobile screen or interaction. It checks viewport sizing, touch feedback, keyboards, safe areas and scrolling, using the sandbox’s supported workflow. Global shell or shared-package changes outside the workspace are reported separately, and checks requiring a real phone remain explicitly pending until tested.

`mobile-native` was originally created by [Emil Kowalski](https://github.com/emilkowalski/skills/tree/main/skills/mobile-native). See the adaptation’s [attribution](skills/mobile-native/ATTRIBUTION.md) and preserved [MIT licence](skills/mobile-native/LICENSE).
