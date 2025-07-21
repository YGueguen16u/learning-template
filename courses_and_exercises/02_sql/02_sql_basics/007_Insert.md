<h1>INSERT</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#data-presentation">Data presentation</a></li>
    <li><a href="#insert">INSERT</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Before starting, make sure you have PostgreSQL running in Docker and the database is set up. See [PostgreSQL with Docker](../00_annexe/01_postgre_with_docker.md) for setup instructions.

For this course, we'll use a new dataset. To create it:

1. **Copy the database creation script**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/datasets/sql_scripts/lib_003.sql postgres-db:/tmp/
```

2. **Create the tables**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/lib_003.sql
```

Then, to run the practice queries:

1. **Copy the practice file to the container**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/007_insert_update_delete.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/007_insert_update_delete.sql
```

Each time you modify the practice file, you can run these last two commands again to see the results.

<h2 id="data-presentation">Data presentation</h2>

This table `network_events` simulates the collection of network events in a datacenter environment. It records the traffic passing through different routers in several data centers in France. The data allows you to monitor network performance, detect anomalies, and analyze traffic patterns.

### Structure of the table

#### SQLite Version
```sql
CREATE TABLE network_events (
    event_id INTEGER PRIMARY KEY,
    timestamp DATETIME,
    source_ip TEXT,
    destination_ip TEXT,
    protocol TEXT,
    port INTEGER,
    packet_size INTEGER,
    latency_ms INTEGER,
    status_code TEXT,
    router_id TEXT,
    bandwidth_mbps INTEGER,
    error_rate DECIMAL(4,2),
    packets_dropped INTEGER,
    location TEXT
);
```

#### PostgreSQL Version
```sql
CREATE TABLE network_events (
    event_id SERIAL PRIMARY KEY,  -- Auto-incrementing ID in PostgreSQL
    timestamp TIMESTAMP,          -- TIMESTAMP instead of DATETIME
    source_ip TEXT,
    destination_ip TEXT,
    protocol TEXT,
    port INTEGER,
    packet_size INTEGER,
    latency_ms INTEGER,
    status_code TEXT,
    router_id TEXT,
    bandwidth_mbps INTEGER,
    error_rate DECIMAL(4,2),
    packets_dropped INTEGER,
    location TEXT
);
```

Key differences between SQLite and PostgreSQL:
- SQLite uses `INTEGER PRIMARY KEY` for auto-incrementing IDs, PostgreSQL uses `SERIAL PRIMARY KEY`
- SQLite uses `DATETIME`, PostgreSQL uses `TIMESTAMP`
- Both support `TEXT`, `INTEGER`, and `DECIMAL` types similarly

#### Identifiers and Time

- `event_id` : Unique event identifier
- `timestamp` : Event date and time in the format `YYYY-MM-DD HH:MM:SS`

#### Network Information

- `source_ip` : Source IP address (format 192.168.x.x for internal network)
- `destination_ip` : Destination IP address (format 10.0.0.x for servers)
- `protocol` : Type of network protocol used :
    - `TCP` : Transmission Control Protocol (connexions fiables)
    - `UDP` : User Datagram Protocol (streaming, DNS)
    - `HTTP/HTTPS` : Trafic web
    - `ICMP` : Ping et messages d'erreur
    - `FTP` : Transfert de fichiers
    - `SSH` : Connexions sécurisées
    - `SMTP` : Emails
    - `DNS` : Résolution de noms

#### Metrics of Performance

- `port` : Port number used (NULL for ICMP)
    - `80`, `443` : Web
    - `22` : SSH
    - `53` : DNS
    - `25`, `587` : SMTP
- `packet_size` : Packet size in bytes
- `latency_ms` : Response time in milliseconds
- `bandwidth_mbps` : Bandwidth in Mbps
    - `100` : High capacity routers
    - `50` : Medium capacity routers
    - `25` : Low capacity routers

#### Quality of Service

- `status_code` : Transmission status :
    - `SUCCESS` : Transmission successful
    - `ERROR` : Transmission error
    - `TIMEOUT` : Timeout error
- `error_rate` : Error rate in percentage (0.00 to 3.00)
- `packets_dropped` : Number of packets dropped

#### Infrastructure

- `router_id` : Router identifier (RTR_001 to RTR_004)
- `location` : Datacenter location
    - `Paris-DC1` : Main datacenter
    - `Lyon-DC1` : Secondary datacenter
    - `Marseille-DC1` : Backup datacenter



This table allows to perform various analyses such as :

- Surveillance of performance by datacenter
- Detection of router problems
- Analysis of traffic by protocol
- Tracking error rates and latency
- Identification of network bottlenecks

<h2 id="insert">INSERT</h2>

The `INSERT` statement is used to add new rows to a table. While the basic syntax is similar in both SQLite and PostgreSQL, there are some differences in how they handle auto-incrementing IDs.

### Basic Syntax

```sql
INSERT INTO <table_name> (<column1>, <column2>, ...)
VALUES (<value1>, <value2>, ...);
```

### SQLite Example
In SQLite, you can either specify the `event_id` or let it auto-increment:

```sql
-- With explicit ID
INSERT INTO network_events (event_id, timestamp, source_ip, destination_ip, protocol, port, packet_size, latency_ms, status_code, router_id, bandwidth_mbps, error_rate, packets_dropped, location)
VALUES (31, '2023-06-01 08:30:15', '192.168.1.100', '10.0.0.1', 'TCP', 443, 1500, 25, 'SUCCESS', 'RTR_001', 100, 0.01, 0, 'Paris-DC1');

-- Without ID (auto-increment)
INSERT INTO network_events (timestamp, source_ip, destination_ip, protocol, port, packet_size, latency_ms, status_code, router_id, bandwidth_mbps, error_rate, packets_dropped, location)
VALUES ('2023-06-01 08:30:15', '192.168.1.100', '10.0.0.1', 'TCP', 443, 1500, 25, 'SUCCESS', 'RTR_001', 100, 0.01, 0, 'Paris-DC1');
```

### PostgreSQL Example
In PostgreSQL, with `SERIAL` type, you typically omit the `event_id` as it's automatically generated:

```sql
INSERT INTO network_events (timestamp, source_ip, destination_ip, protocol, port, packet_size, latency_ms, status_code, router_id, bandwidth_mbps, error_rate, packets_dropped, location)
VALUES ('2023-06-01 08:30:15', '192.168.1.100', '10.0.0.1', 'TCP', 443, 1500, 25, 'SUCCESS', 'RTR_001', 100, 0.01, 0, 'Paris-DC1');
```

### Multiple Row Insert
Both SQLite and PostgreSQL support inserting multiple rows in a single statement:

```sql
INSERT INTO network_events (timestamp, source_ip, destination_ip, protocol, port, packet_size, latency_ms, status_code, router_id, bandwidth_mbps, error_rate, packets_dropped, location)
VALUES 
('2023-06-01 08:30:30', '192.168.1.100', '10.0.0.1', 'TCP', 443, 1500, 25, 'SUCCESS', 'RTR_001', 100, 0.01, 0, 'Paris-DC1'),
('2023-06-01 08:31:45', '192.168.1.101', '10.0.0.2', 'UDP', 53, 512, 15, 'SUCCESS', 'RTR_002', 100, 0.00, 0, 'Lyon-DC1');
```

### Key Differences
- SQLite allows explicit ID values even with auto-increment
- PostgreSQL with `SERIAL` type manages IDs automatically
- PostgreSQL is stricter about data types (e.g., dates must match the `TIMESTAMP` format)
- Both support multi-row INSERT with the same syntax
