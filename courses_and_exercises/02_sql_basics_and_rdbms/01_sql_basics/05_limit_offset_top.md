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

Table example for this course:

You need to run in the terminal this command to create the table, if you are in the root directory:

```bash
qlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_002.sql
```

If you are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db < 02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_002.sql
```

To display the table, columns and rows, you can write it on the top of your .sql file:

```sql
.mode column -- display columns in a table
.headers on -- display column names

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db -- open the database
```

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/005_limit_offset_top.sql
```

<h2 id="limit-offset">Limit, offset</h2>

`LIMIT` is used to limit the number of rows returned by a query.

**General syntax**

```sql
SELECT <column> 
FROM <table_name>
LIMIT <number_limit>;

SELECT <column> 
FROM <table_name>
LIMIT <number_limit> OFFSET <number_offset>;

SELECT <column> 
FROM <table_name>
LIMIT <number_offset>, <number_limit>;

SELECT <column> 
FROM <table_name>
OFFSET <number_offset> ROWS
FETCH NEXT <number_limit> ROWS ONLY;
```

**Syntax support by different DBMS:**
- SQLite, MySQL, PostgreSQL: Support `LIMIT ... OFFSET ...` and `LIMIT offset, limit`
- PostgreSQL: Also supports the standard SQL `FETCH NEXT ... ROWS`
- Oracle: Only supports `FETCH NEXT ... ROWS`
- SQL Server: Uses `TOP` or `OFFSET ... FETCH` (we'll see `TOP` in the next section)

Note: When writing portable SQL code, be aware of these syntax differences. The most widely supported syntax across modern DBMS is `LIMIT ... OFFSET ...`

- Retrieve the first 5 employees

```sql
SELECT * 
FROM employees
LIMIT 5;
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

Only SQL Server supports `TOP`.

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

