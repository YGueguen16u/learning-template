<h1>Alter Table</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
  </ul>
</div>


<h2 id="preamble">Preamble</h2>

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/008_create_table.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="alter_table">ALTER TABLE</h2>

**Important Note About DBMS Differences:**

Different database management systems have varying levels of support for ALTER TABLE operations:

**SQLite:**
- Supports:
  * ADD COLUMN
  * RENAME TABLE
  * RENAME COLUMN (since version 3.25.0)
- Does NOT directly support:
  * DROP COLUMN
  * MODIFY/ALTER COLUMN
  * Changing column constraints
  * Adding/removing PRIMARY KEY
- Workaround: Must recreate table for unsupported operations

**MySQL:**
- Supports all basic ALTER TABLE operations
- Specific syntax: Prefers `MODIFY COLUMN` over `ALTER COLUMN`
- Can perform multiple alterations in a single statement
- Supports instant algorithm for some operations (no table copy)

**PostgreSQL:**
- Supports all ALTER TABLE operations
- Prefers `ALTER COLUMN` syntax
- Most flexible with column modifications
- Can perform multiple alterations in a single statement
- Supports transactional DDL

**SQL Server (MSSQL):**
- Supports all ALTER TABLE operations
- Uses `ALTER COLUMN` syntax
- Cannot combine multiple alterations in single statement
- Some operations require table rebuild


`ALTER TABLE` statement is used to modify an existing table in the database.

General syntax:
```sql
ALTER TABLE <table_name> <action>;
```

- `<table_name>` : Name of the table to be modified
- `<action>` : Action to be performed on the table

Actions:

- `ADD COLUMN <column_name> <data_type> <constraints>` : Add a new column to the table

General syntax:
```sql
ALTER TABLE <table_name> 
ADD COLUMN <column_name> <data_type> <constraints>;
```

or 

```sql
ALTER TABLE <table_name> 
ADD <column_name> <data_type> <constraints>;
```

- `<column_name>` : Name of the column to be added
- `<data_type>` : Data type of the column ( cf <a href="../00_rdbms/004_data_types.md">Data types</a><br>)
- `<constraints>` : Constraints on the column ( cf <a href="../00_rdbms/xxx_constraints.md">Constraints</a><br>)

Examples:

```sql
ALTER TABLE Book ADD COLUMN Author VARCHAR(100);
```

- `DROP COLUMN <column_name>` : Remove a column from the table

General syntax:
```sql
ALTER TABLE <table_name> 
DROP COLUMN <column_name>;
```

- `<column_name>` : Name of the column to be removed

Examples:

```sql
ALTER TABLE Book DROP COLUMN Author;
```

- `MODIFY / ALTER COLUMN <column_name> <data_type> <constraints>` : Modify a column in the table 

General syntax:
```sql
ALTER TABLE <table_name> 
MODIFY COLUMN <column_name> <data_type> <constraints>;
```

or

```sql
ALTER TABLE <table_name> 
MODIFY <column_name> <data_type> <constraints>;
```

or

```sql
ALTER TABLE <table_name> 
ALTER COLUMN <column_name> <data_type> <constraints>;
```

or

```sql
ALTER TABLE <table_name> 
ALTER <column_name> <data_type> <constraints>;
```

- `<table_name>` : Name of the table to be modified
- `<column_name>` : Name of the column to be modified
- `<data_type>` : Data type of the column ( cf <a href="../00_rdbms/004_data_types.md">Data types</a><br>)
- `<constraints>` : Constraints on the column ( cf <a href="../00_rdbms/xxx_constraints.md">Constraints</a><br>)

Examples:

```sql
ALTER TABLE Book 
MODIFY COLUMN Author VARCHAR(100);
``` 

or

```sql
ALTER TABLE Book 
MODIFY Author VARCHAR(100);
``` 

or

```sql
ALTER TABLE Book 
ALTER COLUMN Author VARCHAR(100);
``` 

or

```sql
ALTER TABLE Book 
ALTER Author VARCHAR(100);
``` 

- Rename a column in the table

General syntax:
```sql
ALTER TABLE <table_name> 
RENAME COLUMN <column_name> TO <new_column_name>;
```

or

```sql
ALTER TABLE <table_name> 
RENAME <column_name> TO <new_column_name>;
```

- `<column_name>` : Name of the column to be renamed
- `<new_column_name>` : New name of the column

Examples:

```sql
ALTER TABLE Book 
RENAME COLUMN Author TO AuthorName;
``` 

- Rename a table in the database

General syntax:
```sql
ALTER TABLE <table_name> 
RENAME TO <new_table_name>;
```

- `<table_name>` : Name of the table to be renamed
- `<new_table_name>` : New name of the table

Examples:

```sql
ALTER TABLE Book 
RENAME TO Library;
```     


<h2 id="exercise">Exercise</h2>

Create a new file `alter_table.sql` with the following content:

```sql
.mode column
.headers on

DROP TABLE IF EXISTS EquipmentEvents;

CREATE TABLE EquipmentEvents (
    EventID INTEGER PRIMARY KEY,
    EquipmentCode VARCHAR(50) NOT NULL,
    EventTimestamp DATETIME NOT NULL,
    EventType VARCHAR(20) NOT NULL CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN')),
    Severity INT NOT NULL CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OperatorID VARCHAR(10) NOT NULL,
    MaintenanceStatus VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    ResolutionTime INT,
    MTBF FLOAT,
);
```

1. Add a new column `SafetyImpact` of type `BOOLEAN` to the table `EquipmentEvents`.
2. Remove the column `ResolutionTime` from the table `EquipmentEvents`.
3. Modify the column `MaintenanceStatus` to be of type `VARCHAR(30)` and to have a default value of 'OPEN'.
4. Modify the column `EventType` to be of type `VARCHAR(15)` and add in the list of values `FAILURE`.
5. Rename the column `EventType` to `EventCategory`.
6. Rename the table `EquipmentEvents` to `IndustrialEvents`.

#### To run the file, write in the terminal:

general syntax:
```bash
sqlite3 <database_name> < <sql_file>
```

Here is the command:

```bash
sqlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_005_industrial_safety_alter.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/009_alter_table.sql
```

#### Verify the table exists:

general syntax:
```bash
sqlite3 <database_name> ".schema <table_name>"
```

Here is the command:

```bash
sqlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_005_industrial_safety_alter.db ".schema EquipmentEvents"
```

### Solution

```sql
.mode column
.headers on

DROP TABLE IF EXISTS EquipmentEvents;

CREATE TABLE EquipmentEvents (
    EventID INTEGER PRIMARY KEY,
    EquipmentCode VARCHAR(50) NOT NULL,
    EventTimestamp DATETIME NOT NULL,
    EventType VARCHAR(20) NOT NULL CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN')),
    Severity INT NOT NULL CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OperatorID VARCHAR(10) NOT NULL,
    MaintenanceStatus VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    ResolutionTime INT,
    MTBF FLOAT,
);

ALTER TABLE EquipmentEvents 
ADD COLUMN SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE EquipmentEvents 
DROP COLUMN ResolutionTime;

ALTER TABLE EquipmentEvents 
ALTER COLUMN MaintenanceStatus VARCHAR(30) NOT NULL DEFAULT 'OPEN';

ALTER TABLE EquipmentEvents 
MODIFY COLUMN EventType VARCHAR(15) NOT NULL CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN', 'FAILURE'));

ALTER TABLE EquipmentEvents 
RENAME COLUMN EventType TO EventCategory;

ALTER TABLE EquipmentEvents 
RENAME TO IndustrialEvents;

SELECT * FROM IndustrialEvents;
```

With PostgreSQL, you can see the schema of the table `IndustrialEvents` with the following command:

### PostgreSQL Solution

```sql

-- Create initial table
CREATE TABLE EquipmentEvents (
    EventID INTEGER PRIMARY KEY,
    EquipmentCode VARCHAR(50) NOT NULL,
    EventTimestamp TIMESTAMP NOT NULL,
    EventType VARCHAR(20) NOT NULL CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN')),
    Severity INT NOT NULL CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OperatorID VARCHAR(10) NOT NULL,
    MaintenanceStatus VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    ResolutionTime INT,
    MTBF FLOAT
);

-- PostgreSQL can combine multiple alterations in a single statement
ALTER TABLE EquipmentEvents 
    ADD COLUMN SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE,
    DROP COLUMN ResolutionTime,
    ALTER COLUMN MaintenanceStatus TYPE VARCHAR(30),
    ALTER COLUMN MaintenanceStatus SET DEFAULT 'OPEN',
    ALTER COLUMN EventType TYPE VARCHAR(15),
    ALTER COLUMN EventType SET NOT NULL,
    ADD CONSTRAINT event_type_check CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN', 'FAILURE')),
    RENAME COLUMN EventType TO EventCategory;

-- Rename table (separate statement)
ALTER TABLE EquipmentEvents RENAME TO IndustrialEvents;

-- Verify changes
SELECT * FROM IndustrialEvents;
```




