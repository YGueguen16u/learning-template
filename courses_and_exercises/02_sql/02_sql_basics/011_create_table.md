# Create Table

## Table of Contents
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#create_table">CREATE TABLE</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Before starting, make sure you have PostgreSQL running in Docker. See [PostgreSQL with Docker](../00_annexe/01_postgre_with_docker.md) for setup instructions.

To run SQL files with PostgreSQL in Docker:

1. **Copy the SQL file to the container**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/008_create_table.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/008_create_table.sql
```

<h2 id="create_table">CREATE TABLE</h2>

The `CREATE TABLE` statement is used to create a new table in the database.

### General syntax

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

### Example: Simple Table
```sql
CREATE TABLE Book (
    BookID SERIAL PRIMARY KEY,  -- PostgreSQL uses SERIAL for auto-increment
    Title VARCHAR(100),
    PublishedYear INTEGER
);
```

### Industrial Equipment Monitoring System

We'll create a table for an industrial equipment monitoring system that tracks critical events, maintenance operations, and safety incidents.

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
- `EquipmentCode`: Identifier of the affected equipment (max 50 chars, required)
- `EventTimestamp`: Date and time of the event (required)
- `EventType`: Type of event (INCIDENT, MAINTENANCE, ALERT, or SHUTDOWN)
- `Severity`: Event severity level (1=lowest to 5=highest)
- `Description`: Detailed description of the event (max 100 chars)
- `Location`: Physical location of the equipment (max 100 chars)
- `OperatorID`: ID of the operator (max 10 chars)
- `MaintenanceStatus`: Current status (default: 'PENDING')
- `ResolutionTime`: Time to resolve (minutes)
- `MTBF`: Mean Time Between Failures (hours)
- `SafetyImpact`: Safety implications flag (default: false)

**PostgreSQL Table Structure:**
```sql
CREATE TABLE EquipmentEvents (
    EventID SERIAL PRIMARY KEY,                   -- PostgreSQL auto-increment
    EquipmentCode VARCHAR(50) NOT NULL,
    EventTimestamp TIMESTAMP NOT NULL,            -- PostgreSQL timestamp
    EventType VARCHAR(20) NOT NULL 
        CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN')),
    Severity INTEGER NOT NULL 
        CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OperatorID VARCHAR(10) NOT NULL,
    MaintenanceStatus VARCHAR(20) NOT NULL 
        DEFAULT 'PENDING'
        CHECK (MaintenanceStatus IN ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    ResolutionTime INTEGER,
    MTBF REAL,                                   -- PostgreSQL uses REAL for floating-point
    SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE
);
```

### Verify the table exists

To view the table structure in PostgreSQL:

```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -c "\d EquipmentEvents"
```

This will show:
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
 safetyimpact      | boolean                     |           | not null | false
Indexes:
    "equipmentevents_pkey" PRIMARY KEY, btree (eventid)
Check constraints:
    "equipmentevents_eventtype_check" CHECK (eventtype::text = ANY (ARRAY['INCIDENT'::character varying, 'MAINTENANCE'::charac
ter varying, 'ALERT'::character varying, 'SHUTDOWN'::character varying]::text[]))
    "equipmentevents_maintenancestatus_check" CHECK (maintenancestatus::text = ANY (ARRAY['PENDING'::character varying, 'IN_PR
OGRESS'::character varying, 'COMPLETED'::character varying, 'CANCELLED'::character varying]::text[]))
    "equipmentevents_severity_check" CHECK (severity >= 1 AND severity <= 5)
:
```

