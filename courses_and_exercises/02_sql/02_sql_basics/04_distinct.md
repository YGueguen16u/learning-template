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
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/003_distinct.sql
```

Take care of the path of the file, where directory you are. For example if you are in the root directory, you need to write:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/003_distinct.sql
```

If ypu are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/utils/003_distinct.sql
```

Always take care of the path of the file, where directory you are.

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
|New York     |
|Chicago      |
|Los Angeles  |
|Boston       |
|Seattle      |
|Miami        |
|San Francisco|
|Houston      |
|Dallas       |

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
|New York     
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


