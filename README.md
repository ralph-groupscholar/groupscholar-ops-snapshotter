# Group Scholar Ops Snapshotter

Assembly CLI that prints standardized daily and incident ops snapshot templates for Group Scholar. Includes a Postgres schema and seed data for storing snapshots.

## Features
- Generate daily ops snapshot template
- Generate incident snapshot template
- Output SQL insert template for rapid logging
- Postgres schema + realistic seed data

## Tech
- Assembly (macOS arm64)
- Postgres
- Make

## Usage

Build:

```sh
make build
```

Daily template:

```sh
./bin/ops-snapshotter daily
```

Incident template:

```sh
./bin/ops-snapshotter incident
```

SQL insert template:

```sh
./bin/ops-snapshotter sql
```

## Database setup

Use environment variables (do not commit credentials):

```sh
export PGHOST="db-acupinir.groupscholar.com"
export PGPORT="23947"
export PGUSER="ralph"
export PGPASSWORD="<password>"
export PGDATABASE="postgres"
./scripts/db_setup.sh
```

## Testing

```sh
make test
```
