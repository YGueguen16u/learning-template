
DROP TABLE IF EXISTS EquipmentEvents;
DROP TABLE IF EXISTS IndustrialEvents;


-- Initial table creation
CREATE TABLE EquipmentEvents (
    EventID SERIAL PRIMARY KEY,
    EquipmentCode VARCHAR(50) NOT NULL,
    EventTimeStamp TIMESTAMP NOT NULL,
    EventType VARCHAR(20) NOT NULL,
        CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN')),
    Severity INTEGER NOT NULL,
        CHECK (Severity BETWEEN 1 AND 5),
    Description TEXT NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OperatorID VARCHAR(10) NOT NULL,
    MaintenanceStatus VARCHAR(20) NOT NULL DEFAULT ('PENDING')
        CHECK (MaintenanceStatus IN ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    ResolutionTime INTEGER,
    MTBF REAL
);

-- Multiple alterations in a single statement
ALTER TABLE EquipmentEvents 
    ADD COLUMN SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE,
    DROP COLUMN ResolutionTime,
    ALTER COLUMN MaintenanceStatus TYPE VARCHAR(30),
    ALTER COLUMN MaintenanceStatus SET DEFAULT 'OPEN',
    DROP CONSTRAINT IF EXISTS equipmentevents_eventtype_check,
    ADD CONSTRAINT event_type_check
        CHECK (EventType IN ('INCIDENT', 'MAINTENANCE', 'ALERT', 'SHUTDOWN', 'FAILURE'));

-- Rename column (separate statement)
ALTER TABLE EquipmentEvents 
RENAME COLUMN EventType TO EventCategory;

-- Rename table (separate statement)
ALTER TABLE EquipmentEvents 
RENAME TO IndustrialEvents;

