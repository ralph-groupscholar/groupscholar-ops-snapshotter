#!/bin/zsh
set -euo pipefail

: "${PGHOST?Need PGHOST}"
: "${PGPORT?Need PGPORT}"
: "${PGUSER?Need PGUSER}"
: "${PGPASSWORD?Need PGPASSWORD}"
: "${PGDATABASE?Need PGDATABASE}"

psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -f db/schema.sql
psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -f db/seed.sql
