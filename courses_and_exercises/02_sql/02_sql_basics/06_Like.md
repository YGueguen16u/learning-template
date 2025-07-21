<h1>LIKE</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#like">LIKE</a></li>
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
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/006_like.sql postgres-db:/tmp/
```

2. **Execute the file**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/006_like.sql
```

Each time you modify the practice file, you can run these last two commands again to see the results.

<h2 id="like">LIKE</h2>

LIKE is used to search for a specified pattern in a column with REGEX.

LIKE can be used with the following operators:

- `'%'` : matches any number of characters
- `'_'` : matches a single character

SQL employs single quotes (` ' `) to denote string literals, while backticks (` ` `) are used to escape table and column identifiers.   

The latter is particularly necessary when identifiers contain spaces or match SQL reserved keywords. Following standard naming conventions typically eliminates the need for backtick delimiters in most cases.

**General syntax**

```sql
SELECT <column1>, <column2>, ... 
FROM <table_name> 
WHERE <column_name> LIKE <pattern>
```

**Example**

Retrieve the first name, last name, and hire date of employees who were hired on or before January 1, 2021 and have a last name starting with 'S'.

```sql
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date <= '2021-01-01' AND last_name LIKE 'S%'
```

|first_name   |last_name  |hire_date |
|-----------  |---------  |----------|
|John        |Smith      |2020-01-15|

Retrieve the first name, last name, and hire date of employees who were hired in the 2010's and with a `e` in their first name and last name.

```sql
-- SQLite
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '201%' AND first_name LIKE '%e%' AND last_name LIKE '%e%';

-- PostgreSQL
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date::text LIKE '201%' 
  AND first_name LIKE '%e%' 
  AND last_name LIKE '%e%';
```

|first_name   |last_name  |hire_date |
|-----------  |---------  |----------|
|Daniel       |Gonzalez   |2019-02-14|
|Christopher  |Anderson   |2018-09-25|
|Jessica      |Moore      |2019-10-15|
|Nicole       |White      |2018-07-12|
|Andrew       |Lopez      |2018-12-20|
|Gregory      |Nelson     |2018-03-30|
|Catherine    |Campbell   |2019-11-20|
|Julie        |Roberts    |2018-09-08|
|Edward       |Evans      |2019-05-12|
|Peter        |Torres     |2018-07-05|

Retrieve the first name, last name, hire date and department of employees who were hired in the 2020's and with a `e` in their first name and a `l` in their last name or were hired in the 2020's and an `a` in the name of the department . 

```sql
-- SQLite
SELECT first_name, last_name, hire_date, department
FROM employees
WHERE 
    (hire_date LIKE '202%' AND (first_name LIKE '%e%' AND last_name LIKE '%l%')) 
    OR (hire_date LIKE '202%' AND department LIKE '%a%');

-- PostgreSQL
SELECT first_name, last_name, hire_date, department
FROM employees
WHERE 
    (hire_date::text LIKE '202%' AND (first_name LIKE '%e%' AND last_name LIKE '%l%')) 
    OR (hire_date::text LIKE '202%' AND department LIKE '%a%');
```

|first_name  |last_name  |hire_date   |department|
|-----------  |---------  |----------  |----------|
|James       |Wilson     |2022-02-15   |Sales     
|Lisa        |Anderson   |2020-09-01   |Sales     
|Michelle    |Lopez      |2020-07-30   |Marketing 
|Laura       |Wilson     |2021-11-08   |Sales     
|Amanda      |Taylor     |2022-03-12   |Marketing 
|Rachel      |Lee        |2020-11-25   |Sales     
|Melissa     |Rodriguez  |2021-09-05   |Marketing 
|Rebecca     |Gonzalez   |2022-05-15   |Sales     
|Samantha    |Green      |2020-04-28   |Marketing 
|Angela      |Adams      |2021-06-18   |Sales     
|Christine   |Hill       |2022-08-12   |Marketing 
|Jeffrey     |Mitchell   |2021-02-15   |HR        
|Amy         |Phillips   |2020-08-18   |Sales     
|Stephanie   |Turner     |2021-10-30   |Marketing 
|Andrea      |Parker     |2022-04-20   |Sales     
|Romuald     |Garcia     |2022-04-20   |Sales     
|ahmed       |BenGarcia  |2021-06-20   |Data      
|ahmed       |BenGarcia  |2021-06-20   |Data  

If you forget to write `hire_date LIKE '202%'` in the second condition, you will also retrieve employees hired in the 2010's with an `a` in the name of the department.

```sql
SELECT first_name, last_name, hire_date, department
FROM employees
WHERE 
    (hire_date LIKE '202%' AND (first_name LIKE '%e%' AND last_name LIKE '%l%')) 
    OR (department LIKE '%a%');
```

|first_name  |last_name  |hire_date   |department|
|-----------  |---------  |----------  |----------|
|Emma        |Johnson    |2019-03-20  |Sales     
|Sarah       |Davis      |2018-11-30  |Marketing 
|James       |Wilson     |2022-02-15            
|Lisa        |Anderson   |2020-09-01  |Sales     
|Maria       |Martinez   |2019-12-10  |Marketing 
|Elizabeth   |Garcia     |2018-05-18  |Sales     
|Michelle    |Lopez      |2020-07-30  |Marketing 
.
.
.

For example, look at emma's row. She was hired in 2019 and has an `a` in her name.


Retrieve distinct department names with an `a` in the name.

```sql
SELECT DISTINCT department
FROM employees
WHERE department LIKE '%a%';
```

|department|
----------
|Sales     
|Marketing 
|Data      
