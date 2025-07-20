# Drop Table

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#drop_table">DROP TABLE</a></li>
    <li><a href="#dbms_support">Important Note About DBMS Support</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/009_alter_table.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="drop_table">DROP TABLE</h2>

`DROP TABLE` statement is used to remove a table and all its data from the database.

General syntax:

```sql
DROP TABLE [IF EXISTS] <table_name>;
```

- `[IF EXISTS]` : Optional clause to prevent error if table doesn't exist
- `<table_name>` : Name of the table to be dropped

Examples:

```sql
DROP TABLE IF EXISTS EquipmentEvents;
```

<h2 id="dbms_support">Important Note About DBMS Support</h2>

Different DBMS have varying levels of support for the DROP TABLE command:

**Universally Supported:**
- SQLite
- PostgreSQL
- MySQL
- Oracle
- SQL Server (MSSQL)
- MariaDB
- DB2

**Specific Syntax and Behavior:**

1. **SQLite:**
```sql
DROP TABLE [IF EXISTS] table_name;
```
- Simple syntax
- Supports IF EXISTS
- Cannot drop multiple tables at once
- No CASCADE option

2. **PostgreSQL:**
```sql
DROP TABLE [IF EXISTS] table_name [CASCADE | RESTRICT];
```
- Supports CASCADE/RESTRICT
- Can drop multiple tables
- Transaction-safe
- Supports IF EXISTS

3. **MySQL:**
```sql
DROP TABLE [IF EXISTS] table_name [CASCADE | RESTRICT];
```
- Supports CASCADE/RESTRICT
- Can drop multiple tables
- Implicit commit (cannot be rolled back)
- Supports temporary tables

4. **SQL Server:**
```sql
DROP TABLE [IF EXISTS] [schema_name.]table_name;
```
- Schema-aware
- Cannot drop multiple tables in one statement
- Supports IF EXISTS (SQL Server 2016+)
- Must remove dependencies first

#### Examples with our Industrial Safety Database:

```sql
-- Basic drop (all DBMS)
DROP TABLE IF EXISTS IndustrialEvents;

-- PostgreSQL with CASCADE
DROP TABLE IF EXISTS IndustrialEvents CASCADE;

-- MySQL multiple tables
DROP TABLE IF EXISTS IndustrialEvents, Technicians, Equipment;

-- SQL Server with schema
DROP TABLE IF EXISTS dbo.IndustrialEvents;
```

#### Important Considerations:

1. **Foreign Keys:**
   - PostgreSQL: CASCADE will automatically drop dependent objects
   - MySQL: Must drop tables in correct order or use CASCADE
   - SQL Server: Must manually drop or modify foreign key constraints first
   - SQLite: Must drop tables in correct order

2. **Transaction Support:**
   - PostgreSQL: Fully transactional
   - MySQL: Implicit commit
   - SQL Server: Transaction-safe
   - SQLite: Transaction-safe

3. **Best Practices:**
   - Always use IF EXISTS to prevent errors
   - Be careful with CASCADE as it can lead to unintended data loss
   - Consider dependencies when dropping tables
   - Back up important data before dropping tables