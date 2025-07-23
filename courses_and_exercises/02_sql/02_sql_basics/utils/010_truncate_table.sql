INSERT INTO industrial_events (
    equipment_code, 
    event_timestamp,
    event_category,
    severity,
    description,
    location,
    operator_id,
    maintenance_status,
    safety_impact
) VALUES 
('REAC-BLA-01', CURRENT_TIMESTAMP, 'MAINTENANCE', 2, 
 'Routine inspection of primary circuit', 'Blayais Unit 1', 'OP123', 'IN_PROGRESS', true),
('TURB-CAT-02', CURRENT_TIMESTAMP, 'ALERT', 4, 
 'High vibration detected', 'Cattenom Unit 2', 'OP456', 'PENDING', true),
('PUMP-DAM-03', CURRENT_TIMESTAMP, 'INCIDENT', 3, 
 'Cooling pump pressure drop', 'Dampierre Unit 3', 'OP789', 'PENDING', true);