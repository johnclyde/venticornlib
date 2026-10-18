#!/usr/bin/env bash
set -euo pipefail

if (( $# > 1 )); then
  echo "Usage: bash scripts/verify.sh [/absolute/path/to/verify]" >&2
  exit 2
fi

library_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
verifier="${1:-$library_root/../venticorn/target/release/verify}"
if [[ ! -x "$verifier" ]]; then
  echo "Build Venticorn's verify binary first, or pass its executable path." >&2
  exit 2
fi

exec env VENTICORN_LIBRARY="$library_root" "$verifier" --no-cache
