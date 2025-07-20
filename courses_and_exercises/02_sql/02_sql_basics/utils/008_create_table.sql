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
    SafetyImpact BOOLEAN NOT NULL DEFAULT FALSE
);

