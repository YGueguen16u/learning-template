<h1>Create Table</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#create_table">CREATE TABLE</a></li>
  </ul>
</div>


<h2 id="preamble">Preamble</h2>

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/008_create_table.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="create_table">CREATE TABLE</h2>

`CREATE TABLE` statement is used to create a new table in the database.

General syntax:

```sql
CREATE TABLE <table_name> (
    <column1> <data_type> <constraints>,
    <column2> <data_type> <constraints>,
    ...
);
```

- `<table_name>` : Name of the table to be created
- `<columni>` : Name of the i-th column
- `<data_type>` : Data type of the column ( cf <a href="../00_rdbms/004_data_types.md">Data types</a><br>)
- `<constraints>` : Constraints on the column ( cf <a href="../00_rdbms/005_constraints.md">Constraints</a><br>)

Examples:

```sql
CREATE TABLE Book (
    BookID INT,
    Title VARCHAR(100),
    PublishedYear INT
);
```

We want to create a table called for an industrial equipment monitoring system that tracks critical events, maintenance operations, and safety incidents.

**Context:**
You are developing a data engineering solution for a large industrial facility that needs to monitor and analyze equipment reliability and safety incidents. The system must track all events (maintenance operations, incidents, alerts, and emergency shutdowns) with their severity levels and impact on safety.

**Requirements:**
1. Each event must have a unique identifier
2. All critical information must be mandatory (NOT NULL)
3. Event types must be validated against a predefined list
4. Severity levels must be between 1 and 5
5. System must track maintenance status with a default state
6. Safety impact must be explicitly tracked
7. Time-based metrics (MTBF) must be recorded for reliability analysis

**Field Descriptions:**

- `EventID`: Unique identifier for each event
- `EquipmentCode`: Identifier of the affected equipment, max length string : 50, no null values.
- `EventTimestamp`: Date and time (datetime) when the event occurred, no null values.
- `EventType`: Type of event (INCIDENT, MAINTENANCE, ALERT, or SHUTDOWN), no null values, max length string : 20, must be in the list.
- `Severity`: Event severity level (1=lowest to 5=highest), no null values, must be an integer between 1 and 5.
- `Description`: Detailed description of the event, no null values, max length string : 100.
- `Location`: Physical location of the equipment, no null values, max length string : 100.
- `OperatorID`: ID of the operator who recorded or handled the event, no null values, max length string : 10.
- `MaintenanceStatus`: Current status of maintenance action, no null values, max length string : 20, must be in the list, default value : `"PENDING"`.
- `ResolutionTime`: Time taken to resolve the event (in minutes), integer.
- `MTBF`: Mean Time Between Failures (in hours), float.
- `SafetyImpact`: Whether the event has safety implications, boolean, default value : `FALSE`, no null values.

**Key Features Demonstrated:**

- `PRIMARY KEY` constraint : it is used to identify each row in the table uniquely 
- `NOT NULL` constraints : it is used to ensure that a column cannot have a null value
- `CHECK` constraints for data validation : it is used to ensure that a column has a value that satisfies a condition
- `DEFAULT` values : it is used to set a default value for a column
- Various data types (INTEGER, VARCHAR, DATETIME, TEXT, FLOAT, BOOLEAN)

**Table Structure:**
```sql
.mode column 
.headers on

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
    SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE
);
```

#### To run the file, write in the terminal:

general syntax:
```bash
sqlite3 <database_name> < <sql_file>
```

Here is the command:

```bash
sqlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_004_industrial_safety.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/008_create_table.sql
```

#### Verify the table exists:

general syntax:
```bash
sqlite3 <database_name> ".schema <table_name>"
```

Here is the command:

```bash
sqlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db ".schema EquipmentEvents"
```

return :

```sql
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
    SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE
);
```


