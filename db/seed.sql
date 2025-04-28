insert into groupscholar_ops_snapshotter.snapshots
  (snapshot_type, owner_name, snapshot_date, summary, risks, next_focus)
values
  ('daily', 'Avery Lewis', '2026-02-05',
   'Closed three pending mentor matches and reconciled February stipend exceptions.',
   'One cohort is behind on intake forms; reminders queued.',
   'Finalize spring onboarding checklist and verify waitlist comms.'),
  ('daily', 'Samira Patel', '2026-02-06',
   'Prepared weekly program brief and confirmed 4 scholarship interviews.',
   'Two scholarship portals have updated requirements; review underway.',
   'Publish updated rubric guidance and sync with reviewer leads.'),
  ('incident', 'Jordan Reyes', '2026-02-07',
   'Scholar portal outage for 22 minutes due to upstream auth latency.',
   'Monitoring indicates no data loss; verify retry queue.',
   'Add fallback messaging and document auth provider escalation path.');
