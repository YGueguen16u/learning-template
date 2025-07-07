<h1>Count</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#count">COUNT</a></li>
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
qlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db < cou
rses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_002.sql
```

If you are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_001.db < 02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_001.sql
```

To display the table, columns and rows, you can write it on the top of your .sql file:

```sql
.mode column -- display columns in a table
.headers on -- display column names

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db -- open the database
```

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/002_count.sql
```

Take care of the path of the file, where directory you are. For example if you are in the root directory, you need to write:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/002_count.sql
```

If ypu are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/utils/002_count.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="count">COUNT</h2>

`COUNT(<column>)` returns the number of non-null rows in the column.

**General syntax**

```sql
SELECT COUNT(<column>) 
FROM <table_name>
```

- Count total number of non null rows

```sql
SELECT COUNT(*) 
FROM employees
```

|COUNT(*)|
|---|
|53|

Count total number of department

```sql
SELECT COUNT(department) 
FROM employees
```

|COUNT(department)|
-----------------
|48               |

Why the number of department is lower than the number of rows ?

```sql
SELECT last_name, department 
FROM employees
```

|last_name|department|
|---|---|
|Smith|NULL|
|Johnson|Sales|
|Brown|NULL|
|Davis|Marketing|
|Wilson|NULL|
|Anderson|Sales|
|Taylor|HR|
|Thomas|NULL|
|Moore|IT|
|Jackson|NULL|
|White|HR|
|Martinez|Marketing|
.
.
.

We can see that some rows have `NULL` as department.

The `COUNT` function is intrinsically tied to the concept of `NULL`s. Let’s make a small digression to learn about `NULL`s.

In practice`COUNT(*)`counts rows as long as any one of their columns is non-null. This helps us find table lengths because a table shouldn’t have rows that are completely null.


<h3 id="nulls-is-is-not">Nulls and IS and IS NOT</h3>

In SQL,`NULL`is the value of an empty entry. This is different from the empty string`''`and the integer`0`, both of which are_not_considered`NULL`. 

To check if an entry is`NULL`, use`IS`and`IS NOT`instead of`=`and`!=`.

```sql
SELECT (0 IS NOT NULL) AND ('' IS NOT NULL) 
```

| (0 IS NOT NULL) AND ('' IS NOT NULL) |
| ------------------------------------ |
| 1                                    |

1 = TRUE
0 = FALSE


### A Strange Query

Before we wrap up, let’s take a look at this query:  

`SELECT first_name, COUNT(*) FROM employees`.

Doesn’t it look strange? If you have a good mental model of aggregations, it should! `COUNT(*)` is trying to return a single entry consisting the length of the execution table. 

`first_name` is trying to return one entry for each row. 

Should the computer return one or multiple rows? 

If it returns one, which `first_name` should it pick? 

If it returns multiple, is it supposed to replicate the `COUNT(*)` result across all the rows? 

The shapes of the output just don’t match!

Let's try it anyway and see what happens.

```sql
SELECT first_name, COUNT(*) FROM employees
```

|first_name|COUNT(*)|
|---|---|
|John|53|

Databases will try to handle invalid queries by making assumptions. In this case, it returns 'John' because it's the first name from the first row in the table. Different databases might handle this differently, so don't rely on this behavior. If you need the first/last entry, use proper SQL functions instead (though SQLite lacks a built-in `LAST` function).



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

1. Find how many employees is over the age of 30.

```sql
SELECT COUNT(*) 
FROM employees
WHERE age > 30
```

|COUNT(*)|
--------
|38      |      



2. We want to count the number of cities. But we also want to restrict the output result set so that we only retrieve the number of cities of employees who earn more than 70000. The query for this can be written as:

```sql
SELECT COUNT(city) 
FROM employees 
WHERE last_name = 'Smith';
```

|COUNT(city)|
-----------
|1         |      


3. Retrieve the number of cities where department is IT.

```sql
SELECT COUNT(city) 
FROM employees 
WHERE department = 'IT';
```

|COUNT(city)|
-----------
|11        |      

NB : Not the most efficient way to do it, it counts the number of rows where department is IT and the city is not null, while a city can have several employees working in IT.

A more efficient way to do it is to use the COUNT(DISTINCT) function.

```sql
SELECT COUNT(DISTINCT city) 
FROM employees 
WHERE department = 'IT';
```

|COUNT(DISTINCT city)|
---------------------
|2                   |      


4. Retrieve the number of employees having a performance score greater than 8.5.

```sql
SELECT Count(*) 
FROM employees 
WHERE performance_score > 8.5;
```

|Count(*)|
--------
|25      |       


