#!/usr/bin/env bash
# Copy design knowledge from the design-sandbox repo into skills/stx-designerly-approach/references.
# Read-only on the source repo. Re-run whenever the source changes.
set -euo pipefail
SRC="${1:-/Users/bong/Documents/design-sandbox-stx-exp}"
HERE="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$HERE/skills/stx-designerly-approach/references"

[ -d "$SRC/design-principle" ] || { echo "No design-principle/ in $SRC" >&2; exit 1; }

rm -rf "$DEST"
mkdir -p "$DEST/components"
cp "$SRC"/design-principle/{principles,copy,numbers,layout}.md "$DEST/"
cp "$SRC"/design-principle/component-guideline/*.md "$DEST/components/"

# --- Remove lines that only make sense inside the design-sandbox repo -------------------------
# The copied source files stay untouched; only the copies are filtered.
python3 - "$DEST" <<'PY'
import re, sys, pathlib
root = pathlib.Path(sys.argv[1])

def edit(rel, fn):
    p = root / rel
    out = [l for l in (fn(l) for l in p.read_text().split("\n")) if l is not None]
    p.write_text(re.sub(r"\n{3,}", "\n\n", "\n".join(out)))

# 1. Component guides: stale "Differs from stxdesign-sandbox 0.2.2" notes (the package .d.ts is authoritative).
for p in (root / "components").glob("*.md"):
    edit(f"components/{p.name}", lambda l: None if l.startswith("> **Differs from stxdesign-sandbox") else l)

# 2. Component index: catalog/MCP wording.
edit("components/README.md", lambda l: None if l.startswith("Each guide starts with a `components:`") else l)

# 3. numbers.md: repo-specific formatAmount path and gate checks -> generic wording.
NUM = ("Implement these rules in one shared formatting helper, for example `formatAmount(value, code, context)`, "
       "and let the tables in sections 3, 4, 5, 7, 8, 9 and 14 be its tests. Contexts: `simplified` (truncates, user balances), "
       "`aggregate` (rounds, stats), `exact` (2 decimals, truncates), `fee` (rounds up) and `full` (every digit). "
       "A missing value returns `—`. Keep raw values in data and call the helper at render time.")
edit("numbers.md", lambda l: NUM if l.startswith("`formatAmount(value, code, context)` in `dashboard/") else l)

# 4. layout.md: gate, AppShell/Surface and dashboard/GAPS.md references.
def lay(l):
    if l.startswith("- Write spacing as the pixel value of a step"):
        return ("- Write spacing as the pixel value of a step: 4, 8, 12, 16, 20, 24 or 40, or `var(--space-1)` to `var(--space-7)`, "
                "or 0 or `auto`. Do not use 28, 32, 36 or 48.")
    if l.startswith("- Do not set page padding or card padding in a screen."):
        return "- Do not set page padding or card padding by hand. The page layout and the stxdesign-sandbox cards own them."
    if "dashboard/GAPS.md" in l:
        return "- If a layout needs a value that is not a step, use the nearest step and tell the user."
    return l
edit("layout.md", lay)
PY

# Fail loudly if sandbox-only wording survives.
if grep -rnE '@dashboard|dashboard/|design_get|design_list|screen_write|sandbox_update|AppShell|fixtures\.ts|the gate|gate rejects|Differs from stxdesign' "$DEST" --include='*.md'; then
  echo "sync.sh: sandbox-only wording left in references (see above)" >&2; exit 1
fi

COMMIT="$(git -C "$SRC" rev-parse --short HEAD 2>/dev/null || echo unknown)"
echo "Synced from $SRC @ $COMMIT"
