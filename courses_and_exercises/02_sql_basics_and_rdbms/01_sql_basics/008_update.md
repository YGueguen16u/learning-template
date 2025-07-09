<h1>UPDATE</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#data-presentation">Data presentation</a></li>
    <li><a href="#update">UPDATE</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Table example for this course:

You need to run in the terminal this command to create the table, if you are in the root directory:

```bash
sqlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_003.sql
```

If you are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db < 02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_003.sql
```

To display the table, columns and rows, you can write it on the top of your .sql file:

```bash
.mode column -- display columns in a table
.headers on -- display column names

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_003.db -- open the database
```

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/007_insert_update_delete.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="data-presentation">Data presentation</h2>


This table `network_events` simulates the collection of network events in a datacenter environment. It records the traffic passing through different routers in several data centers in France. The data allows you to monitor network performance, detect anomalies, and analyze traffic patterns.

### Structure of the table

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

<h2 id="update">UPDATE</h2>

`UPDATE` statement is used to modify existing rows in a table.

General syntax:

```sql
UPDATE <table_name>
SET <column1> = <value1>, <column2> = <value2>, ...
WHERE <condition>;
```

Example:

```sql
SELECT * 
FROM network_events
WHERE event_id = 31;

UPDATE network_events
SET latency_ms = 50, status_code = 'ERROR', error_rate = 0.5
WHERE event_id = 31;

SELECT * 
FROM network_events
WHERE event_id = 31;
```

Before update:
|event_id  |timestamp            |source_ip      |destination_ip  |protocol  |port  |packet_size  |latency_ms  |status_code  |router_id  |bandwidth_mbps  |error_rate  |packets_dropped  |location |
|--------  |-------------------  |-------------  |--------------  |--------  |----  |-----------  |----------  |-----------  |---------  |--------------  |----------  |---------------  |---------|
|31        |2023-06-01 08:30:00  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |25          |SUCCESS      |RTR_001    |100             |0.01        |0                |Paris-DC1|

After update:
|event_id  |timestamp            |source_ip      |destination_ip  |protocol  |port  |packet_size  |latency_ms  |status_code  |router_id  |bandwidth_mbps  |error_rate  |packets_dropped  |location |
|--------  |-------------------  |-------------  |--------------  |--------  |----  |-----------  |----------  |-----------  |---------  |--------------  |----------  |---------------  |---------|
|31        |2023-06-01 08:30:00  |192.168.1.100  |10.0.0.1        |TCP       |443   |1500         |50          |ERROR        |RTR_001    |100             |0.5         |0                |Paris-DC1|


Before update :
- latency_ms = 25
- status_code = 'SUCCESS'
- error_rate = 0.01

After update :
- latency_ms = 50
- status_code = 'ERROR'
- error_rate = 0.5

```sql
SELECT * 
FROM network_events
WHERE event_id = 31 OR event_id = 32;

UPDATE network_events
SET packet_size = 2048
WHERE event_id = 31 OR event_id = 32;

SELECT * 
FROM network_events
WHERE event_id = 31 OR event_id = 32;
```

Before update :

|event_id  |packet_size|
|--------  |-----------|
|31        |1500       |
|32        |1500       |

After update :

|event_id  |packet_size|
|--------  |-----------|
|31        |2048       |
|32        |2048       |