.mode column 
.headers on

DROP TABLE IF EXISTS EquipmentEvents;

-- Create initial table
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
    MTBF FLOAT
);

-- Add SafetyImpact column (this works directly in SQLite)
ALTER TABLE EquipmentEvents 
ADD COLUMN SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE;

-- To modify MaintenanceStatus and remove ResolutionTime, we need to:
-- 1. Create new table with desired structure
CREATE TABLE EquipmentEvents_new (
    EventID INTEGER PRIMARY KEY,
    EquipmentCode VARCHAR(50) NOT NULL,
    EventTimestamp DATETIME NOT NULL,
    EventType VARCHAR(20) NOT NULL CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN')),
    Severity INT NOT NULL CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OperatorID VARCHAR(10) NOT NULL,
    MaintenanceStatus VARCHAR(30) NOT NULL DEFAULT 'OPEN', -- Modified column
    MTBF FLOAT,
    SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE
);

-- 2. Copy data from old table to new table
INSERT INTO EquipmentEvents_new 
SELECT EventID, EquipmentCode, EventTimestamp, EventType, Severity,
       Description, Location, OperatorID, 'OPEN', MTBF, SafetyImpact
FROM EquipmentEvents;

-- 3. Drop old table
DROP TABLE EquipmentEvents;

-- 4. Rename new table to original name
ALTER TABLE EquipmentEvents_new RENAME TO EquipmentEvents;
