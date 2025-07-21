<h1>Limit, offset and top</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#limit-offset-fetch">Limit, offset, fetch</a></li>
    <li><a href="#top">Top</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Before starting, make sure you have PostgreSQL running in Docker and the database is set up. See [PostgreSQL with Docker](../00_annexe/01_postgre_with_docker.md) for setup instructions.

For this course, we'll use the same dataset as the previous chapter. If you haven't created it yet:

1. **Copy the database creation script**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/datasets/sql_scripts/lib_002.sql postgres-db:/tmp/
```

2. **Create the tables**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/lib_002.sql
```

Then, to run the practice queries:

1. **Copy the practice file to the container**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/005_limit_offset_top.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/005_limit_offset_top.sql
```

Each time you modify the practice file, you can run these last two commands again to see the results.

<h2 id="limit-offset">Limit, offset</h2>

`LIMIT` is used to limit the number of rows returned by a query.

**General syntax**

```sql
-- Supported by: PostgreSQL, MySQL, SQLite, MariaDB
SELECT <column> 
FROM <table_name>
LIMIT <number_limit>;
```

```sql
-- Supported by: PostgreSQL, MySQL, SQLite, MariaDB
SELECT <column> 
FROM <table_name>
LIMIT <number_limit> OFFSET <number_offset>;
```

```sql
-- Supported by: MySQL, SQLite, MariaDB
-- NOT supported by: PostgreSQL
SELECT <column> 
FROM <table_name>
LIMIT <number_offset>, <number_limit>;
```

```sql
-- Supported by: PostgreSQL, Oracle, SQL Server (2012+)
-- Standard SQL:2008 syntax
SELECT <column> 
FROM <table_name>
OFFSET <number_offset> ROWS
FETCH NEXT <number_limit> ROWS ONLY;
```

### Supported by different DBMS

- **PostgreSQL** : 
  - `LIMIT x`
  - `LIMIT x OFFSET y`
  - `OFFSET x ROWS FETCH NEXT y ROWS ONLY`
  - `LIMIT x, y`

- **MySQL/MariaDB** :
  - `LIMIT x`
  - `LIMIT x OFFSET y`
  - `LIMIT x, y`
  - `FETCH NEXT`

- **SQLite** :
  - `LIMIT x`
  - `LIMIT x OFFSET y`
  - `LIMIT x, y`
  - `FETCH NEXT`

- **Oracle** :
  - `LIMIT`
  - `OFFSET x ROWS FETCH NEXT y ROWS ONLY`

- **SQL Server** :
  - `OFFSET x ROWS FETCH NEXT y ROWS ONLY` (SQL Server 2012+)
  - `TOP x` (all versions)
  - `LIMIT`

- Retrieve the first 5 employees

```sql
SELECT * 
FROM employees
LIMIT 5;
```

or 

```sql
SELECT * 
FROM employees
FETCH NEXT 5 ROWS ONLY;
```


| employee_id  | first_name  | last_name  | email                   | hire_date   | salary  | department  | city         | age  | bonus_percentage  | performance_score |
|-----------  | ----------  | ---------  | ----------------------  | ----------  | ------  | ----------  | -----------  | ---  | ----------------  | ----------------- |
| 1           | John        | Smith      | john.smith@company.com  | 2020-01-15  | 65000   |             | New York     | 35   | 15                | 8.5               |
| 2           | Emma        | Johnson    | emma.j@company.com      | 2019-03-20  | 72000   | Sales       | Chicago      | 29   | 20                | 9.2               |
| 3           | Michael     | Brown      | michael.b@company.com   | 2021-06-10  | 55000   |             | Los Angeles  | 42   | 10                | 7.8               |
| 4           | Sarah       | Davis      | sarah.d@company.com     | 2018-11-30  | 68000   | Marketing   | Boston       | 31   | 18                | 8.9               |
| 5           | James       | Wilson     | james.w@company.com     | 2022-02-15  | 59000   |             | Seattle      | 27   | 12                | 7.5               |

- `LIMIT` can be combined with `OFFSET` to retrieve a specific range of rows.

- `OFFSET` is used to skip a number of rows before starting to return rows.

- Retrieve the 5 employees starting from the 3rd one

```sql
SELECT * 
FROM employees
LIMIT 5 OFFSET 2;
```

or 

```sql
SELECT * 
FROM employees
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;
```

| employee_id  | first_name  | last_name  | email                   | hire_date   | salary  | department  | city         | age  | bonus_percentage  | performance_score |
|-----------  | ----------  | ---------  | ----------------------  | ----------  | ------  | ----------  | -----------  | ---  | ----------------  | ----------------- |
| 3           | Michael     | Brown      | michael.b@company.com   | 2021-06-10  | 55000   |             | Los Angeles  | 42   | 10                | 7.8               |
| 4           | Sarah       | Davis      | sarah.d@company.com     | 2018-11-30  | 68000   | Marketing   | Boston       | 31   | 18                | 8.9               |
| 5           | James       | Wilson     | james.w@company.com     | 2022-02-15  | 59000   |             | Seattle      | 27   | 12                | 7.5               |
| 6           | Lisa        | Anderson   | lisa.a@company.com      | 2020-09-01  | 71000   | Sales       | Miami        | 33   | 22                | 9                 |
| 7           | Robert      | Taylor     | robert.t@company.com    | 2019-07-25  | 63000   | HR          | Chicago      | 38   | 11                | 8.1               |

An equivalent query is:

```sql
SELECT * 
FROM employees
LIMIT 2, 5;
```

Where `2` is the offset and `5` is the maximum number of rows to return. 

Another equivalent query is:

```sql
SELECT * 
FROM employees
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;
```

### Examples 

- Retrieve the last_name, first_name, department and salary of the 4 following employees after the 5 first ones, where employees earn more than 70000 and work in IT or Sales

```sql
SELECT last_name, first_name, department, salary 
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales')
LIMIT 4 OFFSET 5;
```

or 

```sql
SELECT last_name, first_name, department, salary 
FROM employees
WHERE salary > 70000 AND (department = 'IT' or department = 'Sales')
OFFSET 5 ROWS
FETCH NEXT 4 ROWS ONLY;
```

|last_name|first_name|department|salary|
|---------|----------|----------|------|
|Lee      |Rachel    |Sales     |72000 |
|Lopez    |Andrew    |IT        |75000 |
|Wright   |Katherine |Sales     |73000 |
|Ramirez  |Stephen   |IT        |71000 |

- Retrieve the last_name, first_name, department, city and salary of the 3rd to 5th employees who:

    - are over 30 years old
    - work in IT or Sales departments
    - have a bonus percentage greater than 15%
    - earn more than a dynamic threshold calculated as: (number of distinct cities × 10000) (nested subquery)

```sql
SELECT employee_id, last_name, first_name, department, city, salary 
FROM employees
WHERE age > 30 
    AND (department = 'IT' OR department = 'Sales') 
    AND bonus_percentage > 15 
    AND salary > (SELECT COUNT(DISTINCT city) * 8000 FROM employees)
LIMIT 3 OFFSET 2;
```

or 

```sql
SELECT employee_id, last_name, first_name, department, city, salary 
FROM employees
WHERE age > 30 
    AND (department = 'IT' OR department = 'Sales') 
    AND bonus_percentage > 15 
    AND salary > (SELECT COUNT(DISTINCT city) * 8000 FROM employees)
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;
```

|employee_id|last_name|first_name|department|city           |salary|
|-----------|---------|----------|----------|---------------|------|
|29          |Lopez     |Andrew     |IT         |Seattle        |75000 |
|49          |Torres    |Peter      |IT         |San Francisco  |76000 |

With :

```sql
SELECT COUNT(DISTINCT city) * 8000 
FROM employees
```

|COUNT(DISTINCT city) * 8000|
---------------------------
|72000                     |

And :

```sql
SELECT employee_id, last_name, first_name, department, city, salary 
FROM employees
WHERE age > 30 
    AND (department = 'IT' OR department = 'Sales') 
    AND bonus_percentage > 15 
```

|employee_id|last_name|first_name|department|city           |salary|
-----------|---------|----------|----------|---------------|------|
|6           |Anderson   |Lisa       |Sales      |Miami          |71000 
|9           |Moore      |William    |IT         |San Francisco  |75000 
|14          |Garcia     |Elizabeth  |Sales      |Miami          |73000 
|17          |Gonzalez   |Daniel     |IT         |San Francisco  |70000 
|18          |Wilson     |Laura      |Sales      |Houston        |60000 
|22          |Moore      |Jessica    |Sales      |Miami          |71000 
|26          |Lee        |Rachel     |Sales      |Houston        |72000 
|29          |Lopez      |Andrew     |IT         |Seattle        |75000 
|30          |Gonzalez   |Rebecca    |Sales      |Miami          |61000 
|37          |Baker      |Brandon    |IT         |Seattle        |69000 
|42          |Campbell   |Catherine  |Sales      |Houston        |68000 
|49          |Torres     |Peter      |IT         |San Francisco  |76000 



<h2 id="top">Top</h2>

`TOP` is used to limit the number of rows returned by a query.

Only SQL Server supports `TOP`, not SQLite, MySQL, PostgreSQL.

**General syntax**

```sql
SELECT TOP <number> <column> 
FROM <table_name>
```

- Retrieve the first 5 employees

```sql
SELECT TOP 5 * 
FROM employees;
```
