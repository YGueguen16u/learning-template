<h1>Alter Table</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#alter_table">ALTER TABLE</a></li>
    <li><a href="#exercise">Exercise</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Before starting, make sure you have PostgreSQL running in Docker. See [PostgreSQL with Docker](../00_annexe/01_postgre_with_docker.md) for setup instructions.

To run SQL files with PostgreSQL in Docker:

1. **Copy the SQL file to the container**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/009_alter_table.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/009_alter_table.sql
```

<h2 id="alter_table">ALTER TABLE</h2>

**Important Note About DBMS Differences:**

Different database management systems have varying levels of support for ALTER TABLE operations:

**PostgreSQL:**
- Supports all ALTER TABLE operations
- Uses `ALTER COLUMN` syntax
- Most flexible with column modifications
- Can perform multiple alterations in a single statement
- Supports transactional DDL (changes can be rolled back)
- Can add/modify constraints without table recreation

**SQLite:**
- Limited ALTER TABLE support
- Only supports: ADD COLUMN, RENAME TABLE, RENAME COLUMN
- Must recreate table for other operations

**MySQL:**
- Supports all basic operations
- Uses `MODIFY COLUMN` syntax
- Can combine multiple alterations
- Some operations require table rebuild

**SQL Server:**
- Supports all operations
- Uses `ALTER COLUMN` syntax
- One alteration per statement
- Some operations require table rebuild

The `ALTER TABLE` statement modifies an existing table. In PostgreSQL, you can perform multiple alterations in a single statement.

### Basic Syntax

```sql
ALTER TABLE <table_name> <action>;
```

### Common Actions in PostgreSQL

1. **Add Column**
```sql
ALTER TABLE <table_name> 
ADD COLUMN <column_name> <data_type> <constraints>;
```

Or

```sql
ALTER TABLE <table_name> 
ADD <column_name> <data_type> <constraints>;
```

- `<column_name>` : Name of the column to be added
- `<data_type>` : Data type of the column ( cf <a href="../00_rdbms/004_data_types.md">Data types</a><br>)
- `<constraints>` : Constraints on the column ( cf <a href="../00_rdbms/xxx_constraints.md">Constraints</a><br>)

Example :

```sql
ALTER TABLE books 
ADD COLUMN author VARCHAR(100) NOT NULL DEFAULT 'Unknown';
```

2. **Drop Column**

- `DROP COLUMN` : Removes a column from the table

```sql
ALTER TABLE <table_name> 
DROP COLUMN <column_name>;
```

- `<column_name>` : Name of the column to be removed

Example :

```sql
ALTER TABLE books 
DROP COLUMN author;
```

3. **Modify Column**

- `ALTER COLUMN` : Modifies a column in the table

```sql
ALTER TABLE <table_name> 
ALTER COLUMN <column_name> TYPE <new_data_type>,
ALTER COLUMN <column_name> SET DEFAULT <value>,
ALTER COLUMN <column_name> SET NOT NULL;
ALTER COLUMN <column_name> SET DATA TYPE <new_data_type>;
ALTER COLUMN <column_name> CONSTRAINT <constraint_name>;
```

- `<table_name>` : Name of the table to be modified
- `<column_name>` : Name of the column to be modified
- `<new_data_type>` : New data type of the column ( cf <a href="../00_rdbms/004_data_types.md">Data types</a><br>)
- `<value>` : Default value of the column

Example :

```sql
ALTER TABLE books 
ALTER COLUMN title TYPE VARCHAR(200),
ALTER COLUMN published SET DEFAULT CURRENT_TIMESTAMP;
```

4. **Rename Column**

- `RENAME COLUMN` : Renames a column in the table

```sql
ALTER TABLE <table_name> 
RENAME COLUMN <old_name> TO <new_name>;
```

- `<table_name>` : Name of the table to be modified
- `<old_name>` : Name of the column to be renamed
- `<new_name>` : New name of the column

Example:
```sql
ALTER TABLE books 
RENAME COLUMN author TO writer;
```

5. **Rename Table**

- `RENAME TO` : Renames a table

```sql
ALTER TABLE <old_name> 
RENAME TO <new_name>;
```

- `<old_name>` : Name of the table to be renamed
- `<new_name>` : New name of the table

Example:
```sql
ALTER TABLE books 
RENAME TO library_books;
```

6. **Add Constraint**

- `ADD CONSTRAINT` : Adds a constraint to the table

```sql
ALTER TABLE <table_name> 
ADD CONSTRAINT <constraint_name> <constraint_definition>;
```

- `<table_name>` : Name of the table to be modified
- `<constraint_name>` : Name of the constraint to be added, choosen by the user
- `<constraint_definition>` : Definition of the constraint, contain the column name where the constraint is applied

Example :

```sql
ALTER TABLE books 
ADD CONSTRAINT positive_price CHECK (price > 0);
```

7. **Drop Constraint**

- `DROP CONSTRAINT` : Drops a constraint from the table

```sql
ALTER TABLE <table_name> 
DROP CONSTRAINT <constraint_name>;
```

- `<table_name>` : Name of the table to be modified
- `<constraint_name>` : Name of the constraint to be dropped

Example :
```sql
ALTER TABLE books 
DROP CONSTRAINT positive_price;
``` 

<h2 id="exercise">Exercise</h2>

Let's modify our `EquipmentEvents` table with various alterations. Create a new file `009_alter_table.sql`:

```sql
-- Initial table creation
CREATE TABLE EquipmentEvents (
    EventID SERIAL PRIMARY KEY,
    EquipmentCode VARCHAR(50) NOT NULL,
    EventTimestamp TIMESTAMP NOT NULL,
    EventType VARCHAR(20) NOT NULL CONSTRAINT equipmentevents_eventtype_check 
        CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN')),
    Severity INTEGER NOT NULL CONSTRAINT equipmentevents_severity_check 
        CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OperatorID VARCHAR(10) NOT NULL,
    MaintenanceStatus VARCHAR(20) NOT NULL DEFAULT 'PENDING'
      CHECK (MaintenanceStatus IN ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    ResolutionTime INTEGER,
    MTBF REAL,
);
```

```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -c "\d EquipmentEvents"
```


```sql
-- Multiple alterations in a single statement (PostgreSQL feature)
ALTER TABLE EquipmentEvents 
    -- Add SafetyImpact column
    ADD COLUMN SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE,
    
    -- Drop ResolutionTime column
    DROP COLUMN ResolutionTime,
    
    -- Modify MaintenanceStatus
    ALTER COLUMN MaintenanceStatus TYPE VARCHAR(30),
    ALTER COLUMN MaintenanceStatus SET DEFAULT 'OPEN',
    ALTER COLUMN MaintenanceStatus CONSTRAINT maintenance_status_check 
      CHECK (MaintenanceStatus IN ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    
    
    -- Modify EventType and its constraints
    DROP CONSTRAINT IF EXISTS equipmentevents_eventtype_check,
    ADD CONSTRAINT event_type_check 
        CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN', 'FAILURE'));
    
-- Rename EventType column
ALTER TABLE EquipmentEvents 
RENAME COLUMN EventType TO EventCategory;

-- Rename table (separate statement)
ALTER TABLE EquipmentEvents 
RENAME TO IndustrialEvents;

-- Verify the changes
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -c "\d IndustrialEvents"
```

To run the exercise:

1. Copy the file to the container:
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/009_alter_table.sql postgres-db:/tmp/
```

2. Execute the file:
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/009_alter_table.sql
```

3. Verify the table structure:
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -c "\d IndustrialEvents"
```

This will show the modified table structure with all our changes applied.

**Before Alterations**

```
                                              Table "public.equipmentevents"
      Column       |            Type             | Collation | Nullable |                     Default                      
-------------------+-----------------------------+-----------+----------+--------------------------------------------------
 eventid           | integer                     |           | not null | nextval('equipmentevents_eventid_seq'::regclass)
 equipmentcode     | character varying(50)       |           | not null | 
 eventtimestamp    | timestamp without time zone |           | not null | 
 eventtype         | character varying(20)       |           | not null | 
 severity          | integer                     |           | not null | 
 description       | text                        |           | not null | 
 location          | character varying(100)      |           | not null | 
 operatorid        | character varying(10)       |           | not null | 
 maintenancestatus | character varying(20)       |           | not null | 'PENDING'::character varying
 resolutiontime    | integer                     |           |          | 
 mtbf              | real                        |           |          | 
Indexes:
    "equipmentevents_pkey" PRIMARY KEY, btree (eventid)
Check constraints:
    "equipmentevents_eventtype_check" CHECK (eventtype::text = ANY (ARRAY['INCIDENT'::character varying, 'MAINTENANCE'::character varying, 'ALERT'::character varying, 'SHUTDOWN'::character varying]::text[]))
    "equipmentevents_maintenancestatus_check" CHECK (maintenancestatus::text = ANY (ARRAY['PENDING'::character varying, 'IN_PROGRESS'::character varying, 'COMPLETED'::character varying, 'CANCELLED'::character varying]::text[]))
    "equipmentevents_severity_check" CHECK (severity >= 1 AND severity <= 5)
```

**After Alterations**

```
                                              Table "public.industrialevents"
      Column       |            Type             | Collation | Nullable |                     Default                      
-------------------+-----------------------------+-----------+----------+--------------------------------------------------
 eventid           | integer                     |           | not null | nextval('equipmentevents_eventid_seq'::regclass)
 equipmentcode     | character varying(50)       |           | not null | 
 eventtimestamp    | timestamp without time zone |           | not null | 
 eventcategory     | character varying(20)       |           | not null | 
 severity          | integer                     |           | not null | 
 description       | text                        |           | not null | 
 location          | character varying(100)      |           | not null | 
 operatorid        | character varying(10)       |           | not null | 
 maintenancestatus | character varying(30)       |           | not null | 'OPEN'::character varying
 mtbf              | real                        |           |          | 
 safetyimpact      | boolean                     |           | not null | false
Indexes:
    "equipmentevents_pkey" PRIMARY KEY, btree (eventid)
Check constraints:
    "equipmentevents_maintenancestatus_check" CHECK (maintenancestatus::text = ANY (ARRAY['PENDING'::character varying::text, 'IN_PROGRESS'::character varying::text, 'COMPLETED'::character varying::text, 'CANCELLED'::character varying::text]))
    "equipmentevents_severity_check" CHECK (severity >= 1 AND severity <= 5)
    "event_type_check" CHECK (eventcategory::text = ANY (ARRAY['INCIDENT'::character varying, 'MAINTENANCE'::character varying, 'ALERT'::character varying, 'SHUTDOWN'::character varying, 'FAILURE'::character varying]::text[]))
```

- `maintenancestatus` column
```
 maintenancestatus | character varying(20)       |           | not null | 'PENDING'::character varying
 maintenancestatus | character varying(30)       |           | not null | 'OPEN'::character varying
```

- `SafetyImpact` column

```
safetyimpact      | boolean                     |           | not null | false
```

- `ResolutionTime` column
  - Removed

- `equipmentevents_eventtype_check` constraint and `event_type_check` constraint

```
    "equipmentevents_eventtype_check" CHECK (eventtype::text = ANY (ARRAY['INCIDENT'::character varying, 'MAINTENANCE'::character varying, 'ALERT'::character varying, 'SHUTDOWN'::character varying]::text[]))

    "event_type_check" CHECK (eventcategory::text = ANY (ARRAY['INCIDENT'::character varying, 'MAINTENANCE'::character varying, 'ALERT'::character varying, 'SHUTDOWN'::character varying, 'FAILURE'::character varying]::text[]))
```

- `EventType` column renamed to `EventCategory`

```
eventtype         | character varying(20)       |           | not null | 
eventcategory     | character varying(20)       |           | not null | 
```

- 'EquipmentEvents' table renamed to 'IndustrialEvents'

```
                                              Table "public.equipmentevents"
                                              Table "public.industrialevents"
```


    
