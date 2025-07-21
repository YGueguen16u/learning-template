# DELETE

## Table of Contents
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#delete">DELETE</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Before starting, make sure you have PostgreSQL running in Docker and the database is set up. See [PostgreSQL with Docker](../00_annexe/01_postgre_with_docker.md) for setup instructions.

For this course, we'll use a network events dataset. To create it:

1. **Copy the database creation script**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/datasets/sql_scripts/lib_003.sql postgres-db:/tmp/
```

2. **Create the tables**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/lib_003.sql
```

Then, to run the practice queries:

1. **Copy the practice file to the container**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/007_insert_update_delete.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/007_insert_update_delete.sql
```

Each time you modify the practice file, you can run these last two commands again to see the results.

<h2 id="delete">DELETE</h2>

The `DELETE` statement is used to remove rows from a table. The syntax is the same in both SQLite and PostgreSQL.

### Basic Syntax

```sql
DELETE FROM <table_name>
WHERE <condition>;
```

### Example: Delete a Single Row

First, let's look at the current data:
```sql
SELECT * 
FROM network_events
LIMIT 5 OFFSET 32;
```

Now, delete one record:
```sql
DELETE FROM network_events
WHERE event_id = 36;
```

Verify the deletion:
```sql
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

### Important Notes

1. If you omit the WHERE clause, the DELETE will remove ALL rows from the table
2. Use SELECT first to verify which rows will be affected by your DELETE
3. Both SQLite and PostgreSQL support complex WHERE conditions with DELETE
4. Deleted rows cannot be recovered unless you have a backup
5. Some tables may have foreign key constraints that prevent deletion
