#!/bin/bash
set -euo pipefail

# run relative to script location
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# files to remove
files=(
    "src/config/settings.inc.php"
    "src/app/config/parameters.php"
    "src/install.lock"
)

# directories to remove
dirs=(
    "src/install"
    "src/install4577"
    "src/admin"
    "src/admin4577"
)

for f in "${files[@]}"; do
    target="$BASE_DIR/$f"
    if [ -f "$target" ]; then
        rm -f "$target"
        printf 'removed file: %s\n' "$target"
    fi
done

for d in "${dirs[@]}"; do
    target="$BASE_DIR/$d"
    if [ -d "$target" ]; then
        rm -rf "$target"
        printf 'removed dir: %s\n' "$target"
    fi
done