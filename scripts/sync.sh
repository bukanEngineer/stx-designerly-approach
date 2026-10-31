#!/usr/bin/env bash
# Compatibility entrypoint: references are maintained here, not imported from another checkout.
set -euo pipefail
HERE="$(cd "$(dirname "$0")/.." && pwd)"
if [ "$#" -ne 0 ]; then
  echo 'References are repository-owned. Edit them here; sync.sh no longer accepts a source checkout.' >&2
  exit 1
fi
python3 "$HERE/scripts/validate.py"
