.section __TEXT,__text,regular,pure_instructions
.globl _main

_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // argc in x0, argv in x1
    cmp w0, #2
    b.lt print_usage

    // argv[1]
    ldr x2, [x1, #8]

    // if argv[1] == "daily"
    adrp x3, str_daily@PAGE
    add x3, x3, str_daily@PAGEOFF
    mov x0, x2
    mov x1, x3
    bl _strcmp
    cbz w0, print_daily

    // if argv[1] == "incident"
    adrp x3, str_incident@PAGE
    add x3, x3, str_incident@PAGEOFF
    mov x0, x2
    mov x1, x3
    bl _strcmp
    cbz w0, print_incident

    // if argv[1] == "sql"
    adrp x3, str_sql@PAGE
    add x3, x3, str_sql@PAGEOFF
    mov x0, x2
    mov x1, x3
    bl _strcmp
    cbz w0, print_sql

    b print_usage

print_usage:
    adrp x0, usage_line1@PAGE
    add x0, x0, usage_line1@PAGEOFF
    bl _puts
    adrp x0, usage_line2@PAGE
    add x0, x0, usage_line2@PAGEOFF
    bl _puts
    adrp x0, usage_line3@PAGE
    add x0, x0, usage_line3@PAGEOFF
    bl _puts
    b exit_ok

print_daily:
    adrp x0, daily_line1@PAGE
    add x0, x0, daily_line1@PAGEOFF
    bl _puts
    adrp x0, daily_line2@PAGE
    add x0, x0, daily_line2@PAGEOFF
    bl _puts
    adrp x0, daily_line3@PAGE
    add x0, x0, daily_line3@PAGEOFF
    bl _puts
    adrp x0, daily_line4@PAGE
    add x0, x0, daily_line4@PAGEOFF
    bl _puts
    adrp x0, daily_line5@PAGE
    add x0, x0, daily_line5@PAGEOFF
    bl _puts
    b exit_ok

print_incident:
    adrp x0, incident_line1@PAGE
    add x0, x0, incident_line1@PAGEOFF
    bl _puts
    adrp x0, incident_line2@PAGE
    add x0, x0, incident_line2@PAGEOFF
    bl _puts
    adrp x0, incident_line3@PAGE
    add x0, x0, incident_line3@PAGEOFF
    bl _puts
    adrp x0, incident_line4@PAGE
    add x0, x0, incident_line4@PAGEOFF
    bl _puts
    adrp x0, incident_line5@PAGE
    add x0, x0, incident_line5@PAGEOFF
    bl _puts
    adrp x0, incident_line6@PAGE
    add x0, x0, incident_line6@PAGEOFF
    bl _puts
    b exit_ok

print_sql:
    adrp x0, sql_line1@PAGE
    add x0, x0, sql_line1@PAGEOFF
    bl _puts
    adrp x0, sql_line2@PAGE
    add x0, x0, sql_line2@PAGEOFF
    bl _puts
    b exit_ok

exit_ok:
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret

.section __TEXT,__cstring,cstring_literals
usage_line1:
    .asciz "Usage: ops-snapshotter [daily|incident|sql]"
usage_line2:
    .asciz "  daily    Print daily ops snapshot template"
usage_line3:
    .asciz "  incident Print incident snapshot template"

str_daily:
    .asciz "daily"
str_incident:
    .asciz "incident"
str_sql:
    .asciz "sql"

daily_line1:
    .asciz "Date: YYYY-MM-DD"
daily_line2:
    .asciz "Owner:"
daily_line3:
    .asciz "Key wins:"
daily_line4:
    .asciz "Risks / blockers:"
daily_line5:
    .asciz "Next 24h focus:"

incident_line1:
    .asciz "Incident title:"
incident_line2:
    .asciz "Detected at: YYYY-MM-DD HH:MM TZ"
incident_line3:
    .asciz "Impact:"
incident_line4:
    .asciz "Root cause hypothesis:"
incident_line5:
    .asciz "Immediate mitigation:"
incident_line6:
    .asciz "Follow-up owner + due date:"

sql_line1:
    .asciz "INSERT INTO groupscholar_ops_snapshotter.snapshots"
sql_line2:
    .asciz "  (snapshot_type, owner_name, snapshot_date, summary, risks, next_focus) VALUES (...);"
