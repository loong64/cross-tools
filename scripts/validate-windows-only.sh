#!/bin/bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

grep -q 'x86_64-w64-mingw32' .github/workflows/canadian.yaml
grep -q 'mingw-w64' .github/workflows/canadian.yaml

for forbidden in oldworld oldwrold loongarch32; do
    if grep -R -n --exclude='validate-windows-only.sh' "$forbidden" README.md .github/workflows scripts targets >/dev/null; then
        echo "Found forbidden reference: $forbidden" >&2
        exit 1
    fi
done

echo "canadian windows validation passed"
