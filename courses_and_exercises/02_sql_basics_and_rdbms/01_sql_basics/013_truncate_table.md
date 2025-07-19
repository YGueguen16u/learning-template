<h1>Truncate Table</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#truncate_table">TRUNCATE TABLE</a></li>
    <li><a href="#dbms_support">Important Note About DBMS Support</a></li>
  </ul>
</div>


<h2 id="preamble">Preamble</h2>

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/009_alter_table.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="truncate_table">TRUNCATE TABLE</h2>

`TRUNCATE TABLE` statement is used to remove all rows from a table.

General syntax:

```sql
TRUNCATE TABLE <table_name>;
```

- `<table_name>` : Name of the table to be truncated

Examples:

```sql
TRUNCATE TABLE EquipmentEvents;
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

1. **PostgreSQL:**
```sql
TRUNCATE TABLE table_name [RESTART IDENTITY] [CASCADE | RESTRICT];
```
- Supports multiple tables
- Can reset sequences
- Transaction-safe

2. **MySQL:**
```sql
TRUNCATE [TABLE] table_name;
```
- Implicit commit
- Cannot be rolled back

3. **SQLite Alternative:**
```sql
DELETE FROM table_name;
VACUUM;  -- Optional, to reclaim space
```
- Uses DELETE instead
- Maintains transaction support
- Can be rolled back

4. **SQL Server:**
```sql
TRUNCATE TABLE [schema_name.]table_name;
```
- Cannot truncate tables with foreign key references
- Resets identity columns

#### Examples with our Industrial Safety Database:

```sql
-- PostgreSQL, MySQL, SQL Server
TRUNCATE TABLE IndustrialEvents;

-- SQLite equivalent
DELETE FROM IndustrialEvents;
VACUUM;  -- Optional
```
