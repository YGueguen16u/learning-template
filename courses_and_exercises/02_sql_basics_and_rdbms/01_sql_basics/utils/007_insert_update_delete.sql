.mode column 
.headers on 

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db

-- INSERT
/*
SELECT * FROM network_events;

INSERT INTO network_events (timestamp, source_ip, destination_ip, protocol, port, packet_size, latency_ms, status_code, router_id, bandwidth_mbps, error_rate, packets_dropped, location)
VALUES ('2023-06-01 08:30:00', '192.168.1.100', '10.0.0.1', 'TCP', 443, 1500, 25, 'SUCCESS', 'RTR_001', 100, 0.01, 0, 'Paris-DC1');

SELECT * FROM network_events;

INSERT INTO network_events (timestamp, source_ip, destination_ip, protocol, port, packet_size, latency_ms, status_code, router_id, bandwidth_mbps, error_rate, packets_dropped, location)
VALUES 
('2023-06-01 08:30:30', '192.168.1.100', '10.0.0.1', 'TCP', 443, 1500, 25, 'SUCCESS', 'RTR_001', 100, 0.01, 0, 'Paris-DC1'),
('2023-06-01 08:31:45', '192.168.1.101', '10.0.0.2', 'UDP', 53, 512, 15, 'SUCCESS', 'RTR_002', 100, 0.00, 0, 'Lyon-DC1');

SELECT * FROM network_events;
*/

-- UPDATE

/*
SELECT * 
FROM network_events
WHERE event_id = 31;

UPDATE network_events
SET latency_ms = 50, status_code = 'ERROR', error_rate = 0.5
WHERE event_id = 31;

SELECT * 
FROM network_events
WHERE event_id = 31;


SELECT event_id, packet_size
FROM network_events
WHERE event_id = 31 OR event_id = 32;

UPDATE network_events
SET packet_size = 2048
WHERE event_id = 31 OR event_id = 32;

SELECT event_id, packet_size
FROM network_events
WHERE event_id = 31 OR event_id = 32;
*/

-- DELETE
INSERT INTO network_events (event_id, timestamp, source_ip, destination_ip, protocol, port, packet_size, latency_ms, status_code, router_id, bandwidth_mbps, error_rate, packets_dropped, location)
VALUES 
(33, '2023-06-01 08:30:30', '192.168.1.100', '10.0.0.1', 'TCP', 443, 1500, 25, 'SUCCESS', 'RTR_001', 100, 0.01, 0, 'Paris-DC1');

SELECT * 
FROM network_events
LIMIT 5 OFFSET 32;

DELETE FROM network_events
WHERE event_id = 36;

SELECT * 
FROM network_events
LIMIT 5 OFFSET 31;