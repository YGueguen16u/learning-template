

| **Theme** | **Validation** |
| --- | --- |
| select | |
| where |  |
| operators of comparison |  |
| operators of logic |  |
| nulls and IS and IS NOT |  |
| limit |  |
| like |  |
| insert |  |
| update |  |
| delete |  |
| create |  |
| alter |  |
| drop |  |
| truncate |  |
| between |  |
| sorting |  |
| built-in functions |  |
| alias |  |
| group by |  |
| having |  |
| nested function |  |
| case when |  |


I. Table Creation

### Industrial Safety Database Setup

This exercise creates a database for industrial equipment safety monitoring with four main tables:
1. `Equipment`: Stores information about industrial equipment
2. `MaintenanceEvents`: Records all maintenance activities
3. `Failures`: Tracks equipment failures and incidents
4. `Technicians`: Maintains information about maintenance personnel

#### Requirements

1. **Equipment Table** (Legacy table with potential incomplete data)
   - Unique identifier for each piece of equipment
   - Basic information (name, type, location)
   - Installation date and criticality level
   - Status monitoring
   - Historical data might contain NULL values for:
     * Model (for old equipment)
     * Installation date (for equipment predating digital records)
     * Last/Next maintenance dates
     * Department (due to organizational changes)
     * Notes
   - Despite being a legacy table, new entries should follow current standards with mandatory fields

2. **MaintenanceEvents Table** (Active maintenance tracking)
   - `EventID`: INTEGER PRIMARY KEY (auto-increment)
   - `EquipmentID`: VARCHAR(10) NOT NULL, FOREIGN KEY to Equipment
   - `TechnicianID`: VARCHAR(10) NOT NULL, FOREIGN KEY to Technicians
   - `EventDate`: DATETIME NOT NULL
   - `Type`: VARCHAR(20) NOT NULL with CHECK constraint
     * Must be one of: 'PREVENTIVE', 'CORRECTIVE', 'INSPECTION', 'UPGRADE'
   - `Description`: TEXT NOT NULL
   - `Duration`: INTEGER NOT NULL (in minutes)
   - `Cost`: DECIMAL(10,2) NOT NULL
   - `Status`: VARCHAR(20) NOT NULL DEFAULT 'SCHEDULED'
     * Must be one of: 'SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED'
   - `PartsReplaced`: TEXT (can be NULL)

3. **Failures Table** (Critical incident tracking)
   - `FailureID`: INTEGER PRIMARY KEY (auto-increment)
   - `EquipmentID`: VARCHAR(10) NOT NULL, FOREIGN KEY to Equipment
   - `StartTime`: DATETIME NOT NULL
   - `EndTime`: DATETIME (can be NULL if ongoing)
   - `Category`: VARCHAR(50) NOT NULL
   - `Severity`: INTEGER NOT NULL with CHECK constraint
     * Must be between 1 and 5
   - `Description`: TEXT NOT NULL
   - `ImpactDescription`: TEXT NOT NULL
   - `ResolutionTime`: INTEGER (can be NULL if ongoing, in minutes)
   - `ProductionLoss`: DECIMAL(10,2) (can be NULL if not yet calculated)
   - `RootCause`: TEXT (can be NULL during investigation)
   - `PreventiveMeasures`: TEXT (can be NULL during initial response)

4. **Technicians Table** (Personnel management)
   - `TechnicianID`: VARCHAR(10) PRIMARY KEY
   - `FirstName`: VARCHAR(50) NOT NULL
   - `LastName`: VARCHAR(50) NOT NULL
   - `Qualification`: VARCHAR(50) NOT NULL
   - `CertificationLevel`: INTEGER NOT NULL with CHECK constraint
     * Must be between 1 and 5
   - `HireDate`: DATE NOT NULL
   - `Email`: VARCHAR(100) NOT NULL UNIQUE
   - `Phone`: VARCHAR(20) NOT NULL
   - `Status`: VARCHAR(20) NOT NULL DEFAULT 'ACTIVE'
     * Must be one of: 'ACTIVE', 'ON_LEAVE', 'TRAINING', 'INACTIVE'

Key constraints patterns:
- PRIMARY KEY: Used for unique identification
- FOREIGN KEY: Ensures referential integrity
- NOT NULL: Ensures required data is provided
- CHECK: Validates data ranges or allowed values
- DEFAULT: Provides fallback values
- UNIQUE: Prevents duplicate values

#### Implementation Steps

1. Create a new database file
2. Execute the table creation script
3. Verify the table structure
4. Add sample data (will be covered in the next section)

#### Table Creation Script

Create a new file `create_industrial_safety_db.sql` with the following content:




```sql
-- Enable column mode and headers for better output
.mode column
.headers on

-- Clean up any existing tables
DROP TABLE IF EXISTS MaintenanceEvents;
DROP TABLE IF EXISTS Failures;
DROP TABLE IF EXISTS Technicians;
DROP TABLE IF EXISTS Equipment;

-- Create Equipment table
CREATE TABLE Equipment (
    EquipmentID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    InstallationDate DATE NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    CriticalityLevel INT NOT NULL CHECK (CriticalityLevel BETWEEN 1 AND 5),
    Status VARCHAR(20) NOT NULL DEFAULT 'OPERATIONAL' 
        CHECK (Status IN ('OPERATIONAL', 'MAINTENANCE', 'FAILED', 'DECOMMISSIONED')),
    LastMaintenanceDate DATE,
    NextMaintenanceDate DATE,
    Notes TEXT
);

-- Create Technicians table
CREATE TABLE Technicians (
    TechnicianID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Qualification VARCHAR(50) NOT NULL,
    CertificationLevel INT NOT NULL CHECK (CertificationLevel BETWEEN 1 AND 5),
    HireDate DATE NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' 
        CHECK (Status IN ('ACTIVE', 'ON_LEAVE', 'TRAINING', 'INACTIVE'))
);

-- Create MaintenanceEvents table
CREATE TABLE MaintenanceEvents (
    EventID INTEGER PRIMARY KEY,
    EquipmentID VARCHAR(10) NOT NULL,
    TechnicianID VARCHAR(10) NOT NULL,
    EventDate DATETIME NOT NULL,
    Type VARCHAR(20) NOT NULL 
        CHECK (Type IN ('PREVENTIVE', 'CORRECTIVE', 'INSPECTION', 'UPGRADE')),
    Description TEXT NOT NULL,
    Duration INTEGER NOT NULL, -- in minutes
    Cost DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'SCHEDULED'
        CHECK (Status IN ('SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    PartsReplaced TEXT,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID),
    FOREIGN KEY (TechnicianID) REFERENCES Technicians(TechnicianID)
);

-- Create Failures table
CREATE TABLE Failures (
    FailureID INTEGER PRIMARY KEY,
    EquipmentID VARCHAR(10) NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME,
    Category VARCHAR(50) NOT NULL,
    Severity INTEGER NOT NULL CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    ImpactDescription TEXT NOT NULL,
    ResolutionTime INTEGER, -- in minutes
    ProductionLoss DECIMAL(10,2),
    RootCause TEXT,
    PreventiveMeasures TEXT,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);
```

#### Execute the Script

To create the database and tables, run:

```bash
sqlite3 industrial_safety.db < create_industrial_safety_db.sql
```

#### Verify the Structure

To verify the tables were created correctly:

```bash
sqlite3 industrial_safety.db ".schema"
```

