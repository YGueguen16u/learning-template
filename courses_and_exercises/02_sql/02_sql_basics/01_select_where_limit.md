<h1>SELECT, WHERE, LIMIT</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#select">SELECT</a></li>
    <li><a href="#where">WHERE</a></li>
    <li><a href="#limit">LIMIT</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>


<h2 id="preamble">Preamble</h2>

Before starting, make sure you have PostgreSQL running in Docker. See [PostgreSQL with Docker](../00_annexe/01_postgre_with_docker.md) for setup instructions.

**Important Note about SQL Files:**
In this chapter, we will be working with two main SQL files:

1. **Database Creation File:**
   - File: `lib_001.sql`
   - Location: `courses_and_exercises/02_sql/02_sql_basics/datasets/sql_scripts/lib_001.sql`
   - Purpose: Creates and populates the database tables we'll be using

2. **Practice File:**
   - File: `001_select_where_limit.sql`
   - Location: `courses_and_exercises/02_sql/02_sql_basics/utils/001_select_where_limit.sql`
   - Purpose: Contains all the SQL commands and examples we'll be learning
   - **This is the main file you'll be editing and running throughout this chapter**

All SQL commands and examples shown in this documentation can be found in `001_select_where_limit.sql`. As you progress through the chapter:
1. Open this file in your editor
2. Add or modify the SQL commands as you learn
3. Run the file to see the results
4. The examples in this documentation show both the commands and their expected output

**Setup the Database:**

1. **Connect to PostgreSQL**
```bash
docker exec -it postgres-db psql -U postgres
```

2. **Create and connect to the database**
```sql
-- Create new database
CREATE DATABASE sql_basics_01;

-- Connect to the database
\c sql_basics_01

-- quit the database
\q
```

3. **Create tables**
```bash
# Copy the SQL file to the container
docker cp courses_and_exercises/02_sql/02_sql_basics/datasets/sql_scripts/lib_001.sql postgres-db:/tmp/

# Execute the SQL file
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/lib_001.sql
```

4. **Verify the setup**
```sql
-- Connect to PostgreSQL
docker exec -it postgres-db psql -U postgres
```

```sql
-- Connect to the database
\c sql_basics_01
```

```sql
-- List all tables
\dt
```

Example output:

```
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | employees | table | postgres
(1 row)
```

```sql
-- View table structure
\d table_name
```

Example output:

```
                      Table "public.employees"
      Column       |     Type      | Collation | Nullable | Default 
-------------------+---------------+-----------+----------+---------
 employee_id       | integer       |           | not null | 
 first_name        | text          |           | not null | 
 last_name         | text          |           | not null | 
 email             | text          |           |          | 
 hire_date         | date          |           |          | 
 salary            | numeric(10,2) |           |          | 
 department        | text          |           |          | 
 city              | text          |           |          | 
 age               | integer       |           |          | 
 bonus_percentage  | numeric(4,2)  |           |          | 
 performance_score | numeric(3,1)  |           |          | 
Indexes:
    "employees_pkey" PRIMARY KEY, btree (employee_id)

(END)
```

**Note:** PostgreSQL differs from SQLite in several ways:
- Commands must end with semicolons (;)
- Table descriptions use `\d` instead of `.schema`
- Output is automatically formatted (no need for .mode or .headers)
- Has more data types and features

**Practice File Setup:**

1. **Copy the practice file to the container**
```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/001_select_where_limit.sql postgres-db:/tmp/
```

2. **Execute the file in PostgreSQL**
```bash
docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/001_select_where_limit.sql
```

Or, if you're already connected to PostgreSQL:
```sql
\i /tmp/001_select_where_limit.sql
```

Each time you modify the file, you can run it again to see the results.

```bash
docker cp courses_and_exercises/02_sql/02_sql_basics/utils/001_select_where_limit.sql postgres-db:/tmp/

docker exec -it postgres-db psql -U postgres -d sql_basics_01 -f /tmp/001_select_where_limit.sql
```

All examples in this chapter can be found in this file. You can edit it and run it again to try different queries.

<h2 id="select">SELECT</h2>

The SELECT statement retrieves data from a table.

**General syntax**

```sql
SELECT <column1>, <column2>, ... FROM <table_name>;

SELECT * FROM <table_name>;
```

**Example**
```sql
SELECT * 
FROM employees;
```

| employee_id  | first_name   | last_name  | email  | hire_date  | salary  | department  | city  | age  | bonus_percentage  | performance_score |
|-----------  | -----------  | ---------  | ---------------------------  | ----------  | ------  | ----------  | -------------  | ---  | ----------------  | ----------------- |
| 1            | John         | Smith      | john.smith@company.com       | 2020-01-15  | 65000   | IT          | New York       | 35   | 15                | 8.5              
| 2            | Emma         | Johnson    | emma.j@company.com           | 2019-03-20  | 72000   | Sales       | Chicago        | 29   | 20                | 9.2              
| 3            | Michael      | Brown      | michael.b@company.com        | 2021-06-10  | 55000   | HR          | Los Angeles    | 42   | 10                | 7.8              
| 4            | Sarah        | Davis      | sarah.d@company.com          | 2018-11-30  | 68000   | Marketing   | Boston         | 31   | 18                | 8.9              
| 5            | James        | Wilson     | james.w@company.com          | 2022-02-15  | 59000   | IT          | Seattle        | 27   | 12                | 7.5              
| 6            | Lisa         | Anderson   | lisa.a@company.com           | 2020-09-01  | 71000   | Sales       | Miami          | 33   | 22                | 9                
| 7            | Robert       | Taylor     | robert.t@company.com         | 2019-07-25  | 63000   | HR          | Chicago        | 38   | 11                | 8.1              
| 8            | Emily        | Thomas     | emily.t@company.com          | 2021-04-12  | 67000   | Marketing   | New York       | 30   | 17                | 8.7              
| 9            | William      | Moore      | william.m@company.com        | 2018-08-05  | 75000   | IT          | San Francisco  | 45   | 16                | 9.3              
| 10           | Jennifer     | Jackson    | jennifer.j@company.com       | 2022-01-20  | 58000   | Sales       | Houston        | 28   | 19                | 7.9              

Your file should look like this:

```sql
-- Connect to the database
\c lib_001

SELECT * FROM employees;
```

- Retrieve the first name and last name of all employees.

```sql
SELECT first_name, last_name
FROM employees;
```

|first_name   |last_name|
|-----------  |---------|
|John         |Smith    
|Emma         |Johnson  
|Michael      |Brown    
|Sarah        |Davis    
|James        |Wilson   
|Lisa         |Anderson 
|Robert       |Taylor   
|Emily        |Thomas   
|William      |Moore    
|Jennifer     |Jackson  
|David        |White    
|Maria        |Martinez 
|Richard      |Lee      
|Elizabeth    |Garcia   
|Joseph       |Rodriguez
|Michelle     |Lopez    
|Daniel       |Gonzalez 
|Laura        |Wilson   
|Christopher  |Anderson 
|Amanda       |Taylor   
|Kevin        |Thomas   
|Jessica      |Moore    
|Brian        |Jackson  
|Nicole       |White    
|Steven       |Martinez 
|Rachel       |Lee      
|Timothy      |Garcia   
|Melissa      |Rodriguez
|Andrew       |Lopez    
|Rebecca      |Gonzalez 
|Mark         |Clark    
|Lauren       |Young    
|Justin       |King     
|Katherine    |Wright   
|Eric         |Scott    
|Samantha     |Green    
|Brandon      |Baker    
|Angela       |Adams    
|Gregory      |Nelson   
|Christine    |Hill     
|Stephen      |Ramirez  
|Catherine    |Campbell 
|Jeffrey      |Mitchell 
|Julie        |Roberts  
|Ryan         |Carter   
|Amy          |Phillips 
|Edward       |Evans    
|Stephanie    |Turner   
|Peter        |Torres   
|Andrea       |Parker   
|Romuald      |Garcia   
|Ahmed        |Bengarcia
|Ahmed        |Bengarcia

```sql
SELECT 50 + 2, 51 * 2, 51 / 2
```

|50 + 2|51 * 2|51 / 2|
|---|---|---|
|52|102|25|

Isn’t it strange that `51 / 2` gives `25` rather than `25.5`? This is because SQL is doing integer division. To do decimal division, at least one of the operands must be a decimal, for instance `51.0 / 2`. A common trick is to multiply one number by `1.0` to convert it into a decimal.

<h2 id="where">WHERE</h2>

The `WHERE` block allows us to filter the table for rows that meet certain conditions. 

Its format is `WHERE <clause>` and it always goes after the `FROM` block. 

Refering to a Boolean statement that the computer can evaluate to be true or false like `ex_number = 145`.

**General syntax**

```sql
SELECT <column1>, <column2>, ... 
FROM <table_name> 
WHERE <clause>
```

**Example**

Retrieve the first name, last name, and hire date of employees who were hired on or before January 1, 2021.

```sql
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date <= '2019-01-01'
```

|first_name   |last_name  |hire_date |
|-----------  |---------  |----------|
|Sarah        |Davis      |2018-11-30|
|William      |Moore      |2018-08-05|
|Elizabeth    |Garcia     |2018-05-18|
|Christopher  |Anderson   |2018-09-25|
|Nicole       |White      |2018-07-12|
|Andrew       |Lopez      |2018-12-20|
|Katherine    |Wright     |2018-10-15|
|Gregory      |Nelson     |2018-03-30|
|Julie        |Roberts    |2018-09-08|
|Peter        |Torres     |2018-07-05|

<h2 id="limit">LIMIT</h2>

The LIMIT clause is used to limit the number of rows returned in the result set.

**General syntax**

```sql
SELECT <column1>, <column2>, ... 
FROM <table_name> 
WHERE <clause>
LIMIT <number>
```

**Example**

Retrieve the first 5 rows of the employees table.

```sql
SELECT *
FROM employees
LIMIT 5;
```

| employee_id  | first_name   | last_name  | email  | hire_date  | salary  | department  | city  | age  | bonus_percentage  | performance_score |
|-----------  | -----------  | ---------  | ---------------------------  | ----------  | ------  | ----------  | -------------  | ---  | ----------------  | ----------------- |
| 1            | John         | Smith      | john.smith@company.com       | 2020-01-15  | 65000   | IT          | New York       | 35   | 15                | 8.5              
| 2            | Emma         | Johnson    | emma.j@company.com           | 2019-03-20  | 72000   | Sales       | Chicago        | 29   | 20                | 9.2              
| 3            | Michael      | Brown      | michael.b@company.com        | 2021-06-10  | 55000   | HR          | Los Angeles    | 42   | 10                | 7.8              
| 4            | Sarah        | Davis      | sarah.d@company.com          | 2018-11-30  | 68000   | Marketing   | Boston         | 31   | 18                | 8.9              
| 5            | James        | Wilson     | james.w@company.com          | 2022-02-15  | 59000   | IT          | Seattle        | 27   | 12                | 7.5              

<h2 id="exercises">Exercises</h2>

Columns : 

- employee_id
- first_name
- last_name
- email
- hire_date
- salary
- department
- city
- age
- bonus_percentage
- performance_score

1. Retrieve the employees names, first names and salaries in the HR department

**Solution**

```sql
SELECT first_name, last_name, salary 
FROM employees 
WHERE department = 'HR' ;
```

|first_name   |last_name  |salary   |
|-----------  |---------  |---------|
|Michael      |Brown      |55000.00 |
|Robert       |Taylor     |63000.00 |
|David        |White      |69000.00 |
|Joseph       |Rodriguez  |57000.00 |
|Christopher  |Anderson   |74000.00 |
|Brian        |Jackson    |59000.00 |
|Timothy      |Garcia     |58000.00 |
|Mark         |Clark      |70000.00 |
|Eric         |Scott      |57000.00 |
|Gregory      |Nelson     |74000.00 |
|Jeffrey      |Mitchell   |59000.00 |
|Edward       |Evans      |61000.00 |



1. Retrieve the first 6 employees names, first names and cities of employees who arrive after 2022

**Solution**

```sql
SELECT first_name, last_name, city 
FROM employees 
WHERE hire_date >= '2022-01-01'
LIMIT 6;
```

|first_name  |last_name  |city         |
|-----------  |---------  |-------------|
|James       |Wilson     |Seattle      
|Jennifer    |Jackson    |Houston      
|Joseph      |Rodriguez  |Chicago      
|Amanda      |Taylor     |Los Angeles  
|Steven      |Martinez   |San Francisco
|Rebecca     |Gonzalez   |Miami        


1. Retrieve the first 7 employees names, first names and cities of employees who don't work in New York

- != : not equal
- = : equal

**Solution**

```sql
SELECT first_name, last_name, city 
FROM employees 
WHERE city != 'New York'
LIMIT 7;
```

|first_name   |last_name  |city         |
|-----------  |---------  |-------------|
|Emma         |Johnson    |Chicago      
|Michael      |Brown      |Los Angeles  
|Sarah        |Davis      |Boston       
|James        |Wilson     |Seattle      
|Lisa         |Anderson   |Miami        
|Robert       |Taylor     |Chicago      
|William      |Moore      |San Francisco   


<h2 id="additional_information">Additional Information</h2>

### Projection operation

Projection operation enables to select a subset of attributes from a relation by eliminating the other attributes that are not necessary. 

The projection is generally used to simplify the results of a query or to reduce the size of the data being manipulated.
Mathematically, the projection of a relation R on a set of attributes A can be defined as follows :

$$\Pi_{\alpha}(R)$$

- $R$ is the original relation, 
- $A$ is the subset of attributes to be kept. 

The result is a new relation containing only the attributes specified in $A$.

The projection preserves all the rows of the original relation, but only for the attributes present in $A$. 

Attributes not included in $A$ are deleted. 

If the projection results in duplicate rows, they are generally merged to avoid duplicates, since relations are sets in relational algebra.

#### In SQL

In  SQL, the projection operation corresponds to a `SELECT` instruction that chooses certain columns (attributes) of a table (relation), while ignoring the others.

**General syntax**

```sql
SELECT <column1>, <column2>, ... 
FROM <table_name>
```

### Selection operation

The selection operation allows to filter the rows of a relation based on a given condition, by keeping only the rows that satisfy this condition. 

Selection is often used to extract specific information or to limit the results of a query.

Mathematically, the selection of a relation R based on a condition C can be defined as follows :

$$\sigma_{C}(R)$$

- $R$ is the original relation, 
- $C$ is the condition to be satisfied. 

The result is a new relation containing only the rows of $R$ that satisfy the condition $C$.

#### In SQL

The selection operation in SQL corresponds to the use of the `WHERE` clause to filter rows of a table based on a logical condition.

**General syntax**

```sql
SELECT <column1>, <column2>, ... 
FROM <table_name> 
WHERE <condition>
```

**Example**

Retrieve the first name, last name, and hire date of employees who were hired on or before January 1, 2021.

```sql
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date <= '2021-01-01';
```

|first_name   |last_name  |hire_date |
|-----------  |---------  |----------|
|Sarah        |Davis      |2018-11-30|
|William      |Moore      |2018-08-05|
|Elizabeth    |Garcia     |2018-05-18|
|Christopher  |Anderson   |2018-09-25|
|Nicole       |White      |2018-07-12|
|Andrew       |Lopez      |2018-12-20|
|Katherine    |Wright     |2018-10-15|
|Gregory      |Nelson     |2018-03-30|
|Julie        |Roberts    |2018-09-08|
|Peter        |Torres     |2018-07-05|
