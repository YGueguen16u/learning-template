<h1>TRUNCATE TABLE</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#truncate_table">TRUNCATE TABLE</a></li>
    <li><a href="#postgresql_specific">PostgreSQL Specific Features</a></li>
    <li><a href="#exercise">Exercise</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Before starting, make sure you have PostgreSQL running in Docker. See [PostgreSQL with Docker](../00_annexe/01_postgre_with_docker.md) for setup instructions.

To run SQL files with PostgreSQL in Docker:

1. **Copy the SQL file to the container**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/010_truncate.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/010_truncate.sql
```

<h2 id="truncate_table">TRUNCATE TABLE</h2>

The `TRUNCATE TABLE` statement quickly removes all rows from a table. It is faster than `DELETE` because it doesn't scan the table, and it reclaims disk space immediately.

### Basic syntax:

```sql
TRUNCATE TABLE <table_name>;
```

- `<table_name>` : Name of the table to be truncated

Example:

```sql
TRUNCATE TABLE industrial_events;
```

<h2 id="dbms_support">Important Note About DBMS Support</h2>

**Important Note About DBMS Support:**

Different DBMS have varying levels of support for the TRUNCATE TABLE command:

**Supported:**
- PostgreSQL
- MySQL
- Oracle
- SQL Server (MSSQL)
- MariaDB
- DB2

**Not Supported:**
- SQLite (use `DELETE FROM table_name;` instead)

**Specific Syntax and Behavior:**

<h2 id="postgresql_specific">PostgreSQL Specific Features</h2>

PostgreSQL's TRUNCATE command offers additional options:

1. **Multiple Tables**

```sql
TRUNCATE TABLE table1, table2, table3;
```
- Supports multiple tables
- Can reset sequences
- Transaction-safe

2. **Reset Identity (Auto-increment)**
```sql
TRUNCATE TABLE <table_name> RESTART IDENTITY;
```

3. **Cascade Option**
```sql
TRUNCATE TABLE <table_name> CASCADE;  -- Also truncates dependent tables
TRUNCATE TABLE <table_name> RESTRICT; -- Fails if dependent tables exist
```

4. **Transaction Support**
Unlike some other databases, PostgreSQL's TRUNCATE is transaction-safe:
```sql
BEGIN;
TRUNCATE TABLE <table_name>;
-- Can be rolled back if needed
ROLLBACK;
```

<h2 id="exercise">Exercise</h2>

Let's practice with our industrial equipment monitoring system:

```sql
-- First, let's insert some test data
INSERT INTO industrial_events (
    equipment_code, 
    event_timestamp,
    event_category,
    severity,
    description,
    location,
    operator_id,
    maintenance_status,
    safety_impact
) VALUES 
('REAC-BLA-01', CURRENT_TIMESTAMP, 'MAINTENANCE', 2, 
 'Routine inspection of primary circuit', 'Blayais Unit 1', 'OP123', 'IN_PROGRESS', true),
('TURB-CAT-02', CURRENT_TIMESTAMP, 'ALERT', 4, 
 'High vibration detected', 'Cattenom Unit 2', 'OP456', 'PENDING', true),
('PUMP-DAM-03', CURRENT_TIMESTAMP, 'INCIDENT', 3, 
 'Cooling pump pressure drop', 'Dampierre Unit 3', 'OP789', 'PENDING', true);

-- View the data
SELECT * FROM industrial_events;

-- Now truncate the table
TRUNCATE TABLE industrial_events RESTART IDENTITY;

-- Verify the table is empty
SELECT COUNT(*) FROM industrial_events;
```

To run this exercise:

1. Copy the file:
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/010_truncate_table.sql postgres-db:/tmp/
```

2. Execute it:
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/010_truncate_table.sql
```

3. Verify the results:
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -c "SELECT COUNT(*) FROM industrial_events"
