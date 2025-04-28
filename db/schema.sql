create schema if not exists groupscholar_ops_snapshotter;

create table if not exists groupscholar_ops_snapshotter.snapshots (
  snapshot_id bigserial primary key,
  snapshot_type text not null,
  owner_name text not null,
  snapshot_date date not null,
  summary text not null,
  risks text not null,
  next_focus text not null,
  created_at timestamptz not null default now()
);

create index if not exists snapshots_snapshot_date_idx
  on groupscholar_ops_snapshotter.snapshots (snapshot_date desc);
