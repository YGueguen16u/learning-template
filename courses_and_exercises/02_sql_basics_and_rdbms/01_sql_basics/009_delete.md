<h1>DELETE</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#delete">DELETE</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Table example for this course:

You need to run in the terminal this command to create the table, if you are in the root directory:

```bash
sqlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_003.sql
```

If you are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db < 02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_003.sql
```

To display the table, columns and rows, you can write it on the top of your .sql file:

```bash
.mode column -- display columns in a table
.headers on -- display column names

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db -- open the database
```

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/007_insert_update_delete.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="delete">DELETE</h2>

`DELETE` statement is used to remove rows from a table.

General syntax:

```sql
DELETE FROM <table_name>
WHERE <condition>;
```

Example:

```sql
SELECT * 
FROM network_events
LIMIT 5 OFFSET 32;

DELETE FROM network_events
WHERE event_id = 36;

SELECT * 
FROM network_events
LIMIT 5 OFFSET 32;
```

Before delete:

|event_id  |timestamp            |source_ip      |destination_ip  |protocol  |port  |packet_size  |latency_ms  |status_code  |router_id  |bandwidth_mbps  |error_rate  |packets_dropped  |location |
|--------  |-------------------  |-------------  |--------------  |--------  |----  |-----------  |----------  |-----------  |---------  |--------------  |----------  |---------------  |---------|
|33        |2023-06-01 08:30:30  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|
|34        |2023-06-01 08:31:45  |192.168.1.101  |10.0.0.2        |UDP       |53    |512          |15          |SUCCESS      |RTR_002    |100             |0           |0                |Lyon-DC1 |
|35        |2023-06-01 08:30:30  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|
|36        |2023-06-01 08:31:45  |192.168.1.101  |10.0.0.2        |UDP       |53    |512          |15          |SUCCESS      |RTR_002    |100             |0           |0                |Lyon-DC1 |
|37        |2023-06-01 08:30:30  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|

After delete:

|event_id  |timestamp            |source_ip      |destination_ip  |protocol  |port  |packet_size  |latency_ms  |status_code  |router_id  |bandwidth_mbps  |error_rate  |packets_dropped  |location |
|--------  |-------------------  |-------------  |--------------  |--------  |----  |-----------  |----------  |-----------  |---------  |--------------  |----------  |---------------  |---------|
|32        |2023-06-01 08:30:30  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|
|33        |2023-06-01 08:30:30  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|
|34        |2023-06-01 08:31:45  |192.168.1.101  |10.0.0.2        |UDP       |53    |512          |15          |SUCCESS      |RTR_002    |100             |0           |0                |Lyon-DC1 |
|35        |2023-06-01 08:30:30  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|
|37        |2023-06-01 08:30:30  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|
