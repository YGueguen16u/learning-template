DROP TABLE IF EXISTS EquipmentEvents;

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

