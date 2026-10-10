#!/bin/bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

expected_target="x86_64-w64-mingw32"

actual_targets="$(find targets -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)"
if [ "$actual_targets" != "$expected_target" ]; then
    echo "Unexpected target directories: ${actual_targets}" >&2
    exit 1
fi

for forbidden in oldworld oldwrold loongarch32 loongarch64-unknown-linux-gnu loongarch64-unknown-linux-musl; do
    if grep -R -n "$forbidden" README.md .github/workflows targets >/dev/null; then
        echo "Found forbidden reference: $forbidden" >&2
        exit 1
    fi
done

for workflow in .github/workflows/release.yaml .github/workflows/canadian.yaml; do
    grep -q 'x86_64-w64-mingw32' "$workflow"
    grep -q 'mingw-w64' "$workflow"
done

echo "windows-only validation passed"
