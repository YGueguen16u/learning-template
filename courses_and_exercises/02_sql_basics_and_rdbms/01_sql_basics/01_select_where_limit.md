<h1>SELECT, WHERE, LIMIT</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#select">SELECT</a></li>
    <li><a href="#where">The WHERE block</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>


<h2 id="preamble">Preamble</h2>

Table example for this course:

You need to run in the terminal this command to create the table, if you are in the root directory:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_001.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_001.sql
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
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/001_select_where_limit.sql
```

Take care of the path of the file, where directory you are. For example if you are in the root directory, you need to write:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/001_select_where_limit.sql
```

If ypu are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/utils/001_select_where_limit.sql
```

Always take care of the path of the file, where directory you are.

<h2 id="select">SELECT</h2>

**General syntax**

```sql
SELECT <column1>, <column2>, ... FROM <table_name>

SELECT * FROM <table_name>
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
.mode column -- display columns in a table
.headers on -- display column names

.open 01_sql_basics/datasets/db/lib_001.db -- open the database

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

<h2 id="where">The WHERE Block</h2>

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

<h2 id ="exercises">Exercises</h2>

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

|first_name   |last_name  |salary|
|-----------  |---------  |------|
|Michael      |Brown      |55000 |
|Robert       |Taylor     |63000 |
|David        |White      |69000 |
|Joseph       |Rodriguez  |57000 |
|Christopher  |Anderson   |74000 |
|Brian        |Jackson    |59000 |
|Timothy      |Garcia     |58000 |
|Mark         |Clark      |70000 |
|Eric         |Scott      |57000 |
|Gregory      |Nelson     |74000 |
|Jeffrey      |Mitchell   |59000 |
|Edward       |Evans      |61000 |



1. Retrieve the employees names, first names and cities of employees who arrive after 2022

**Solution**

```sql
SELECT first_name, last_name, city 
FROM employees 
WHERE hire_date >= '2022-01-01';
```

|first_name  |last_name  |city         |
|-----------  |---------  |-------------|
|James       |Wilson     |Seattle      
|Jennifer    |Jackson    |Houston      
|Joseph      |Rodriguez  |Chicago      
|Amanda      |Taylor     |Los Angeles  
|Steven      |Martinez   |San Francisco
|Rebecca     |Gonzalez   |Miami        
|Eric        |Scott      |Boston       
|Christine   |Hill       |New York     
|Ryan        |Carter     |Seattle      
|Andrea      |Parker     |Houston      
|Romuald     |Garcia     |Houston   


1. Retrieve the employees names, first names and cities of employees who don't work in New York

- != : not equal
- = : equal

**Solution**

```sql
SELECT first_name, last_name, city 
FROM employees 
WHERE city != 'New York';
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
|Jennifer     |Jackson    |Houston      
|David        |White      |Boston       
|Maria        |Martinez   |Los Angeles  
|Richard      |Lee        |Seattle      
|Elizabeth    |Garcia     |Miami        
|Joseph       |Rodriguez  |Chicago      
|Daniel       |Gonzalez   |San Francisco
|Laura        |Wilson     |Houston      
|Christopher  |Anderson   |Boston       
|Amanda       |Taylor     |Los Angeles  
|Kevin        |Thomas     |Seattle      
|Jessica      |Moore      |Miami        
|Brian        |Jackson    |Chicago      
|Steven       |Martinez   |San Francisco
|Rachel       |Lee        |Houston      
|Timothy      |Garcia     |Boston       
|Melissa      |Rodriguez  |Los Angeles  
|Andrew       |Lopez      |Seattle      
|Rebecca      |Gonzalez   |Miami        
|Mark         |Clark      |Chicago      
|Justin       |King       |San Francisco
|Katherine    |Wright     |Houston      
|Eric         |Scott      |Boston       
|Samantha     |Green      |Los Angeles  
|Brandon      |Baker      |Seattle      
|Angela       |Adams      |Miami        
|Gregory      |Nelson     |Chicago      
|Stephen      |Ramirez    |San Francisco
|Catherine    |Campbell   |Houston      
|Jeffrey      |Mitchell   |Boston       
|Julie        |Roberts    |Los Angeles  
|Ryan         |Carter     |Seattle      
|Amy          |Phillips   |Miami        
|Edward       |Evans      |Chicago      
|Peter        |Torres     |San Francisco
|Andrea       |Parker     |Houston      
|Romuald      |Garcia     |Houston      
|ahmed        |Bengarcia  |Dallas       
|ahmed        |Bengarcia  |Dallas       

