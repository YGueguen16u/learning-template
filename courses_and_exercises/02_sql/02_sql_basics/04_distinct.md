<h1>Distinct</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#distinct">DISTINCT</a></li>
    <ul>
      <li><a href="#nulls-is-is-not">Nulls and IS and IS NOT</a></li>
    </ul>
    <li><a href="#exercises">Exercises</a></li>
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
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/004_distinct.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/004_distinct.sql
```

Each time you modify the practice file, you can run these last two commands again to see the results.

<h2 id="distinct">DISTINCT</h2>

`DISTINCT` is used to remove duplicate rows from the result set.

**General syntax**

```sql
SELECT DISTINCT <column> 
FROM <table_name>
```

- Retrieve all unique cities

```sql
SELECT DISTINCT city 
FROM employees;
```

|city         |
|-------------|
|Dallas       |
|Boston       |
|Los Angeles  |
|Chicago      |
|New York     |
|Houston      |
|Miami        |
|Seattle      |

While 

```sql
SELECT city 
FROM employees;
```

|city         |      
-------------
|New York     |
|Chicago      |
|Los Angeles  |
|Boston       |
|Seattle      |
|Miami        |
|Chicago      |
|New York     |
|San Francisco|
|Houston      |
|Boston       |
|Los Angeles  |
|Seattle      
|Miami        
|Chicago      
|New York     |
|San Francisco
|Houston      
|Boston       
.
.
.

We can see doublon cities in the second query because it displays all the cities, rows by rows.

- Count the number of unique cities

```sql
SELECT COUNT(DISTINCT city) 
FROM employees;
```

|COUNT(DISTINCT city)|
---------------------
|9                   |

while 

```sql
SELECT COUNT(city) 
FROM employees;
```

|COUNT(city)|
-----------
|53        |  

- Count the number of unique last names, for employees older than 30, earning more than 70000 and working in IT

```sql
SELECT COUNT(DISTINCT last_name) 
FROM employees
WHERE age > 30 AND salary > 70000 AND department = 'IT';
```

|COUNT(DISTINCT last_name)|
--------------------------
|4                      |

We can verify it with the following query:

```sql
SELECT DISTINCT last_name 
FROM employees
WHERE age > 30 AND salary > 70000 AND department = 'IT';
```

|last_name|
----------
|Moore    |
|Lopez    |
|Ramirez  |
|Torres   |

<h3 id="distinct-with-multiple-columns">Distinct with multiple columns</h3>

In SQL the keyword `DISTINCT` must always be placed just after `SELECT` and applies to all the columns listed. It is not possible to apply it to a single column in the middle of other columns.

- Retrieve all the unique rows of for columns city, first_name, department and salary where employees earn more than 70000 and work in IT or Sales 

```sql
SELECT DISTINCT city, first_name, department, salary 
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales');
```

|city           |first_name  |department|salary|
-------------  ----------  ----------  ------
|Chicago        |Emma        |Sales       |72000 |
|Miami          |Lisa        |Sales       |71000 |
|San Francisco  |William     |IT          |75000 |
|Miami          |Elizabeth   |Sales       |73000 |
|Miami          |Jessica     |Sales       |71000 |
|Houston        |Rachel      |Sales       |72000 |
|Seattle        |Andrew      |IT          |75000 |
|Houston        |Katherine   |Sales       |73000 |
|San Francisco  |Stephen     |IT          |71000 |
|San Francisco  |Peter       |IT          |76000 |

- `DISTINCT` applies to the combination of all columns. This means a row is considered duplicate only if ALL column values are identical (even not displayed ones). That's why we can see the same city multiple times - the rows are different because other columns (first_name, department, or salary) have different values.

**IN SQLite**

- If you want to count the number of unique rows where employees earn more than 70000 and work in IT or Sales, following queries will raise an error: 

```sql
SELECT COUNT(DISTINCT city, first_name, department, salary) 
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales');
```

```sql
SELECT COUNT(DISTINCT *) 
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales');
```

```sql
Parse error near line 37: near "*": syntax error
  SELECT COUNT(DISTINCT *)  FROM employees WHERE salary > 70000 AND (department 
                        ^--- error here
```

These queries fail because:

1. COUNT() function can only take a single argument - you cannot pass multiple columns
2. * is not a valid argument for the COUNT(DISTINCT ...) syntax

To count unique combinations, you need to use nested queries (which we will cover in detail in a later chapter):

```sql
SELECT COUNT(*) 
FROM (SELECT DISTINCT city, first_name, department, salary 
      FROM employees
      WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales'));
```

|COUNT(*)|
---------
|10      |

**IN POSTGRESQL**

However in PostgreSQL, to count distinct combinations of multiple columns, use this syntax:

```sql
SELECT COUNT(DISTINCT (city, first_name, department, salary)::text)
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales');
```

|COUNT(DISTINCT (city, first_name, department, salary)::text)|
-------------------------------------------------------------
|10                                                          |

```sql
SELECT COUNT(*) 
FROM (
    SELECT DISTINCT * 
    FROM employees
    WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales')
) as distinct_rows;
```

|COUNT(*)|
---------
|10      |
