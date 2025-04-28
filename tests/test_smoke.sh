#!/bin/zsh
set -euo pipefail

BIN=${1:-./bin/ops-snapshotter}

OUTPUT=$($BIN daily)
if ! echo "$OUTPUT" | grep -q "Key wins:"; then
  echo "Expected daily template to include Key wins"
  exit 1
fi

OUTPUT=$($BIN incident)
if ! echo "$OUTPUT" | grep -q "Root cause hypothesis:"; then
  echo "Expected incident template to include Root cause hypothesis"
  exit 1
fi

OUTPUT=$($BIN sql)
if ! echo "$OUTPUT" | grep -q "groupscholar_ops_snapshotter"; then
  echo "Expected SQL template to include schema name"
  exit 1
fi

echo "ok"
