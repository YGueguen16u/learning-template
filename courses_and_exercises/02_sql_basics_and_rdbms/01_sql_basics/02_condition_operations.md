<h1>Condition operations</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#condition-operations">Condition operations</a></li>
    <ul>
      <li><a href="#operators-of-comparison">Operators of comparison</a></li>
      <li><a href="#logical-operators">Logical operators</a></li>   
      <li><a href="#nulls-is-is-not">Nulls and IS and IS NOT</a></li>
    </ul>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Table example for this course:

You need to run in the terminal this command to create the table, if you are in the root directory:

```bash
sqlite3 courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_001.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_001.sql
```

If you are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_001.db < 02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_001.sql
```

To display the table, columns and rows, you can write it on the top of your .sql file:

```bash
.mode column -- display columns in a table
.headers on -- display column names

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_001.db -- open the database
```

To run the file, write in the terminal:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/002_operators.sql
```

Take care of the path of the file, where directory you are. For example if you are in the root directory, you need to write:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/002_operators.sql
```

If ypu are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/utils/002_operators.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="condition-operations">Condition operations</h2>

Condition operations are used to filter rows of a table based on a condition.


<h3 id="operators-of-comparison">Operators of comparison</h3>

The operators of comparison are used to compare values, the following list shows them : 

- = : equal
- != : not equal
- < : less than
- > : greater than
- <= : less than or equal to
- >= : greater than or equal to
- <> : not equal

**Examples**

```sql
SELECT * 
FROM employees 
WHERE department = 'IT';
```

| employee_id  | first_name  | last_name  | email                   | hire_date   | salary  | department  | city           | age  | bonus_percentage  | performance_score |
-----------  | ----------  | ---------  | ----------------------  | ----------  | ------  | ----------  | -------------  | ---  | ----------------  | ----------------- |
1            | John        | Smith      | john.smith@company.com  | 2020-01-15  | 65000   | IT          | New York       | 35   | 15                | 8.5              
5            | James       | Wilson     | james.w@company.com     | 2022-02-15  | 59000   | IT          | Seattle        | 27   | 12                | 7.5              
9            | William     | Moore      | william.m@company.com   | 2018-08-05  | 75000   | IT          | San Francisco  | 45   | 16                | 9.3              
13           | Richard     | Lee        | richard.l@company.com   | 2021-08-22  | 61000   | IT          | Seattle        | 41   | 14                | 7.7              
17           | Daniel      | Gonzalez   | daniel.g@company.com    | 2019-02-14  | 70000   | IT          | San Francisco  | 43   | 15.5              | 9.4              
21           | Kevin       | Thomas     | kevin.t@company.com     | 2020-05-20  | 68000   | IT          | Seattle        | 44   | 13.5              | 8.9              
.
.
.


```sql
SELECT last_name
FROM employees 
WHERE department != 'IT';
```

|last_name|
|---------|
|Johnson  
|Brown    
|Davis    
|Anderson 
|Taylor   
|Thomas   
|Jackson  
 .
 .
 .
 

```sql
SELECT last_name, age
FROM employees 
WHERE age < 28;
```

|last_name|age|
|---------|---|
|Wilson    |27 |

```sql
SELECT last_name, age
FROM employees 
WHERE age > 40;
```

|last_name  |first_name  |age|
|---------  |----------  |---|
|Brown      |Michael     |42 
|Moore      |William     |45 
|Lee        |Richard     |41 
|Gonzalez   |Daniel      |43 
.
.
.

```sql
SELECT last_name, age
FROM employees 
WHERE age >= 35;
```

|last_name|age|
|---------|---|
|Smith     | 35 
|Brown     | 42 
|Taylor    | 38 
|Moore     | 45 
|White     | 36 
|Lee       | 41 
.
.
.


```sql
SELECT last_name, age
FROM employees 
WHERE age <= 28;
```

|last_name  |first_name  |age|
|---------  |----------  |---|
|Wilson     |James       |27 
|Jackson    |Jennifer    |28 
|Taylor     |Amanda      |28 
|Wright     |Katherine   |28 
|Parker     |Andrea      |28 
|Garcia     |Romuald     |28 
|BenGarcia  |ahmed       |28 
|BenGarcia  |ahmed       |28 

You can constate the difference beteween < and <=, the number 28 is included in the result of the second query, the result displays far more rows than the first query with a simple <.


```sql
SELECT last_name, department
FROM employees 
WHERE department <> 'IT';
```

|last_name  |department|
|---------  |----------|
|Johnson    |Sales     
|Brown      |HR        
|Davis      |Marketing 
|Anderson   |Sales     
|Taylor     |HR        
|Thomas     |Marketing 
|Jackson    |Sales     
|White      |HR        
.
.
.

<h3 id="logical-operators">Logical operators</h3>

The logical operators are used to combine conditions, the following list shows them : 

- AND : and --> both conditions must be true
- OR : or --> at least one condition must be true
- NOT : not --> the condition must be false
- XOR : (A AND NOT B) OR (NOT A AND B) = (A OR B) AND NOT (A AND B) --> only one condition must be true

**Examples**

```sql
SELECT last_name, department
FROM employees 
WHERE department = 'IT' AND age > 30;
```

|last_name  |department|
|---------  |----------|
|Smith      |IT        
|Moore      |IT        
|Lee        |IT        
|Gonzalez   |IT        
|Thomas     |IT        
|Martinez   |IT        
|Lopez      |IT        
|King       |IT        
|Baker      |IT        
|Ramirez    |IT        
|Carter     |IT        
|Torres     |IT        

```sql
SELECT last_name, department
FROM employees 
WHERE department = 'IT' OR age > 30;
```

|last_name  |department|
|---------  |----------|
|Smith      |IT        
|Brown      |HR        
|Davis      |Marketing 
|Wilson     |IT        
|Anderson   |Sales     
|Taylor     |HR        
|Moore      |IT        
|White      |HR        
|Martinez   |Marketing 
|Lee        |IT        
.
.
. 


```sql
SELECT last_name, department
FROM employees 
WHERE department = 'IT' AND NOT age > 30;
```

|last_name  |department|
|---------  |----------|
|Wilson     |IT        

```sql
SELECT last_name, department
FROM employees 
WHERE (department = 'IT' AND NOT age > 30) OR (NOT department = 'IT' AND age > 30);
```
    
|last_name  |department|
|---------  |----------|
|Brown      |HR        
|Davis      |Marketing 
|Wilson     |IT        
|Anderson   |Sales     
|Taylor     |HR        
|White      |HR        
.
.
.

#### Visual representation

|Nom|Dept|Âge|IT AND >30|IT OR >30|IT AND NOT >30|IT XOR >30|
|---|---|---|---|---|---|---|
|Smith|IT|35|✅|✅|❌|❌|
|Jones|HR|40|❌|✅|❌|✅|
|Lee|IT|28|❌|✅|✅|✅|
|Brown|Sales|32|❌|✅|❌|✅|
|Davis|IT|45|✅|✅|❌|❌|



<h3 id="nulls-is-is-not">Nulls and IS and IS NOT</h3>

The IS and IS NOT operators are used to check if a value is NULL or not NULL.

Attention : NULL is not the same as an empty string `''` or 0.
**General syntax**

```sql
SELECT * 
FROM employees 
WHERE <column_name> IS NULL;
```

```sql
SELECT * 
FROM employees 
WHERE <column_name> IS NOT NULL;
```

**Example**

```sql
SELECT * 
FROM employees 
WHERE bonus_percentage IS NULL;
```

|employee_id|first_name|last_name|email|hire_date|salary|department|city|age|bonus_percentage|performance_score|
|---|---|---|---|---|---|---|---|---|---|---|
|1|John|Smith|john.smith@company.com|2020-01-15|65000|IT|New York|35|NULL|8.5|
|2|James|Wilson|james.w@company.com|2022-02-15|59000|IT|Seattle|27|NULL|7.5|
|3|Michael|Brown|michael.b@company.com|2018-08-05|72000|HR|Chicago|29|NULL|9.2|
|4|Sarah|Davis|sarah.d@company.com|2018-11-30|68000|Marketing|San Francisco|32|NULL|8.2|


```sql
SELECT * 
FROM employees 
WHERE bonus_percentage IS NOT NULL;
```

|employee_id|first_name|last_name|email|hire_date|salary|department|city|age|bonus_percentage|performance_score|
|---|---|---|---|---|---|---|---|---|---|---|
|5|James|Wilson|james.w@company.com|2022-02-15|59000|IT|Seattle|27|NULL|7.5|
|6|Michael|Brown|michael.b@company.com|2018-08-05|72000|HR|Chicago|29|NULL|9.2|
|7|Sarah|Davis|sarah.d@company.com|2018-11-30|68000|Marketing|San Francisco|32|NULL|8.2|
.
.
.

<h3 id="in">IN</h3>

The IN operator is used to check if a value is in a list of values.

**General syntax**

```sql
SELECT * 
FROM employees 
WHERE <column_name> IN (<value1>, <value2>, ...);
```

**Example**

```sql
SELECT last_name, department
FROM employees 
WHERE department IN ('IT', 'HR');
```

|employee_id  |first_name   |last_name  |email                   |hire_date   |salary  |department  |city           |age  |bonus_percentage  |performance_score|
-----------  |-----------  |---------  |----------------------  |----------  |------  |----------  |-------------  |---  |----------------  |-----------------
|1            |John         |Smith      |john.smith@company.com  |2020-01-15  |65000   |IT          |New York       |35   |15                |8.5              
|3            |Michael      |Brown      |michael.b@company.com   |2021-06-10  |55000   |HR          |Los Angeles    |42   |10                |7.8              
|5            |James        |Wilson     |james.w@company.com     |2022-02-15  |59000   |IT          |Seattle        |27   |12                |7.5              
|7            |Robert       |Taylor     |robert.t@company.com    |2019-07-25  |63000   |HR          |Chicago        |38   |11                |8.1              
|9            |William      |Moore      |william.m@company.com   |2018-08-05  |75000   |IT          |San Francisco  |45   |16                |9.3              
|11           |David        |White      |david.w@company.com     |2020-03-15  |69000   |HR          |Boston         |36   |13                |8.4              
|13           |Richard      |Lee        |richard.l@company.com   |2021-08-22  |61000   |IT          |Seattle        |41   |14                |7.7              
|15           |Joseph       |Rodriguez  |joseph.r@company.com    |2022-04-05  |57000   |HR          |Chicago        |29   |12.5              7.6              
|17           |Daniel       |Gonzalez   |daniel.g@company.com    |2019-02-14  |70000   |IT          |San Francisco  |43   |15.5              9.4              
.
.
.



