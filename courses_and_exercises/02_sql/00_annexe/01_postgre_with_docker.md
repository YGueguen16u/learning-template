# PostgreSQL with Docker

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#setup">Setup PostgreSQL with Docker</a></li>
    <li><a href="#usage">Basic Usage</a></li>
    <li><a href="#project">Project Integration</a></li>
    <li><a href="#useful">Useful Commands</a></li>
  </ul>
</div>

<h2 id="prerequisites">Prerequisites</h2>

Before starting, ensure you have Docker installed and running on your system:

```bash
docker --version
```

```
Docker version 28.0.1, build 068a01e
```

If Docker is not installed, you can download it from [Docker's official website](https://www.docker.com/products/docker-desktop/).

<h2 id="setup">Setup PostgreSQL with Docker</h2>

Follow these steps to set up PostgreSQL:

1. Open Docker Desktop

2. **Check if Docker is running**
```bash
docker ps
```

```
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

3. **Pull the PostgreSQL image**
```bash
docker pull postgres:15
```

```
15: Pulling from library/postgres
bdb93ed47a09: Pulling fs layer 
23cc1624198a: Pull complete 
fd3187d6acde: Pull complete 
a3e06971819c: Pull complete 
573b5990cac7: Pull complete 
004d8ff67987: Pull complete 
6c7475e9a1eb: Pull complete 
34ed8d648854: Pull complete 
37259e733066: Pull complete 
ad9bf12774e0: Pull complete 
ab853045aefc: Pull complete 
c7658a5ec36b: Pull complete 
e0da14ecf374: Pull complete 
5d55ae5ad2ee: Pull complete 
Digest: sha256:3156e13d976072c9083fe4c56455b8515dcf6fee23fd770e6ba4a3c6b8837337
Status: Downloaded newer image for postgres:15
docker.io/library/postgres:15
```

4. **Create a volume for data persistence**
```bash
docker volume create postgres_data
```

```
postgres_data
```

5. **Launch PostgreSQL container**
```bash
docker run --name postgres-db \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -e POSTGRES_USER=postgres \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql/data \
  -d postgres:15
```

**Parameters explained:**
- `--name postgres-db`: Container name
- `-e POSTGRES_PASSWORD`: Password for postgres user
- `-e POSTGRES_USER`: Main username
- `-p 5432:5432`: Port mapping (host:container)
- `-v postgres_data:/var/lib/postgresql/data`: Volume mounting
- `-d`: Detached mode (run in background)


It returns the container ID.

```
130c8...dadc9
``` 

6. **Verify container is running**
```bash
docker ps
```

```
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
130c8dde6412   postgres  ...       ...       ...      ...       postgres-db
```

<h2 id="usage">Basic Usage</h2>

1. **Connect to PostgreSQL**
```bash
# Using psql inside the container
docker exec -it postgres-db psql -U postgres

# Or if psql is installed locally
psql -h localhost -U postgres
```

You get the PostgreSQL prompt with the terminal.
```
psql (15.13 (Debian 15.13-1.pgdg120+1))
Type "help" for help.

postgres=#
```

2. **Basic PostgreSQL commands**

```sql
-- List databases
\l
```

```
                                  List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges   
-----------+----------+----------+------------+------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
(3 rows)
```

- `Name`: Name of the database
    - `postgres`: Default database
    - `template0`: Template database
    - `template1`: Template database
- `Owner`: Owner of the database
    - `postgres`: Default owner
- `Encoding`: Encoding of the database
    - `UTF8`: Default encoding
- `Collate`: Collation of the database, used for sorting and comparing strings
    - `en_US.utf8`: Default collation, used for sorting and comparing strings
- `Ctype`: Character type of the database, used for character classification and conversion
    - `en_US.utf8`: Default character type, used for character classification and conversion
- `ICU Locale`: ICU locale of the database, used for collation and character classification
    - `en_US.utf8`: Default ICU locale, used for collation and character classification
- `Locale Provider`: Locale provider of the database, used for collation and character classification
    - `libc`: Default locale provider
- `Access privileges`: Access privileges of the database, used for controlling access to the database
    - `postgres=CTc/postgres`: Default access privileges, used for controlling access to the database

```sql
-- Create a database
CREATE DATABASE mydb;
```

```
   Name    |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges   
-----------+----------+----------+------------+------------+------------+-----------------+-----------------------
 mydb      | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | 
```

```sql
-- Connect to a database
\c mydb
```

```
You are now connected to database "mydb" as user "postgres".
mydb-#
```

```sql
-- List tables
\dt
```

if the db is empty, it returns:
```
Did not find any relations.
```

```sql
-- Remove a database
DROP DATABASE mydb; -- Don't forget the semicolon at the end of the command
```

```sql
-- Exit
\q
```


<h2 id="project">Project Integration</h2>

To use PostgreSQL with our Industrial Safety project:

1. **Create project database**
```sql
CREATE DATABASE industrial_safety;
\c industrial_safety
```

2. **Execute project scripts**
```bash
# Copy SQL file to container
docker cp path/to/your/script.sql postgres-db:/tmp/
```

example:
```bash
docker cp ./industrial_safety.sql postgres-db:/tmp/
```

```bash
# Execute SQL file
docker exec -it postgres-db psql -U postgres -d industrial_safety -f /tmp/script.sql
```

3. **Backup and Restore**
```bash
# Backup
docker exec -t postgres-db pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```

```bash
# Restore
cat your_dump.sql | docker exec -i postgres-db psql -U postgres
```

<h2 id="useful">Useful Commands</h2>

**Container Management:**
```bash
# Stop container
docker stop postgres-db

# Start container
docker start postgres-db

# Remove container
docker rm -f postgres-db

# View logs
docker logs postgres-db

# View container details
docker inspect postgres-db
```

**Database Operations:**
```bash
# Connect to specific database
docker exec -it postgres-db psql -U postgres -d database_name

# Execute single command
docker exec -it postgres-db psql -U postgres -c "SELECT version();"

# Monitor database activity
docker exec -it postgres-db psql -U postgres -c "SELECT * FROM pg_stat_activity;"
```

**Maintenance:**
```bash
# Restart PostgreSQL service inside container
docker exec -it postgres-db pg_ctl restart

# Check PostgreSQL status
docker exec -it postgres-db pg_ctl status
```

**Best Practices:**
1. Always use volumes for data persistence
2. Set strong passwords in production
3. Regular backups
4. Monitor container health
5. Use specific version tags instead of 'latest'