#!/usr/bin/env bash
# Symlink the skills into each agent's user-level skills folder so edits here apply everywhere.
# Usage: scripts/install.sh [claude] [codex] [cursor]   (default: all)
set -euo pipefail
HERE="$(cd "$(dirname "$0")/.." && pwd)"
TARGETS=("$@"); [ ${#TARGETS[@]} -eq 0 ] && TARGETS=(claude codex cursor)

link() { # <skills dir>
  mkdir -p "$1"
  for s in "$HERE"/skills/*/; do
    n="$(basename "$s")"; ln -sfn "${s%/}" "$1/$n"; echo "linked $1/$n"
  done
}
for t in "${TARGETS[@]}"; do
  case "$t" in
    claude) link "$HOME/.claude/skills" ;;
    codex)  link "$HOME/.agents/skills" ;;   # Codex reads ~/.agents/skills
    cursor) link "$HOME/.cursor/skills" ;;   # Cursor Agent Skills (needs a Cursor version with skills support)
    *) echo "unknown target $t" >&2; exit 1 ;;
  esac
done
