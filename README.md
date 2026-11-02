# stx-designerly-approach

Portable agent skills for creating and reviewing StraitsX UI using the `stxdesign-sandbox` component package and official Storybook.

| Skill | Purpose |
|---|---|
| `stx-designerly-approach` | Build StraitsX UI: package authority, shared rules, transaction history, balance cards and funding/modal composition |
| `stx-design-verify` | Post-build API, design-rule, rendered UI, edge-case data and narrow-screen verification; explicit read-only audits |

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
| Cursor | `~/.cursor/skills/` (requires a Cursor version with Agent Skills) |

## Use for design work

1. Choose the process. For a React project (for example Vite), open one with `stxdesign-sandbox` installed, or set up a prototype project and install the package there (follow the package README). For a Paper file, point the agent at the file you are working on; it draws only the design system's components.
2. Install these skills for your agent using the commands above.
3. Ask the agent to use `stx-designerly-approach` for your task, then `stx-design-verify`. The loop is build → verify → fix authorised issues → recheck affected areas. For a report without edits, explicitly request a read-only audit. Source/build checks and rendered checks are reported separately; unavailable checks stay unverified.

The [official Storybook](https://stxdesign-sandbox.vercel.app) provides component examples and guidance. Verify available components and props against the installed package, since Storybook may describe a different version.

The component package is not bundled with these skills. Design reviews, copy and flow guidance can use the included references without installing it; component availability must then be verified separately. Missing tooling is not a reason to recreate package components by hand.

## Maintain

The bundled references are maintained in this repository. Edit shared design rules under `skills/stx-designerly-approach/references/`; the verification skill links to them rather than duplicating them. No external checkout is needed. Consumer package declarations and supported examples remain authoritative for actual API support.

```bash
python3 scripts/validate.py   # frontmatter, relative links, portability and companion packaging
scripts/sync.sh              # compatibility alias for validation; no copying or deletion
```

After changing a skill, rerun the maintainer prompts in [tests/scenarios.md](tests/scenarios.md) and compare against the stated expectations; they are not shipped to agents.

The former sync import is retired: `sync.sh` rejects source arguments so it cannot overwrite repository-owned guidance. Review API-specific changes against the installed consumer version and record that version when verifying an application.

The installer discovers every sibling skill and symlinks complete directories. Keep the build and verification skills together. For manual or archive distribution, ship the complete `skills/` tree (including references) and preserve sibling names. Copying only an entrypoint loses required references and is unsupported. The validator checks cross-skill links; run it after editing skills. Installation does not need Python.
