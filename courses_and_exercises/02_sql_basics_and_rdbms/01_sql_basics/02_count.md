<h1>Count</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#preamble">Preamble</a></li>
    <li><a href="#count">COUNT</a></li>
    <li><a href="#exercises">Exercises</a></li>
  </ul>
</div>

<h2 id="preamble">Preamble</h2>

Table example for this course:

You need to run in the terminal this command to create the table, if you are in the root directory:

```bash
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/sql_scripts/lib_002.sql
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
sqlite3 < courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/utils/001_select_where_limit.sql
```

If ypu are in `courses_and_exercises`, you need to write:

```bash
sqlite3 < 02_sql_basics_and_rdbms/01_sql_basics/utils/001_select_where_limit.sql
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

Count 

```sql
SELECT COUNT(department) 
FROM employees
```

|COUNT(department)|
|---|
|443|

The `COUNT` function is intrinsically tied to the concept of `NULL`s. Let’s make a small digression to learn about `NULL`s.

In practice `COUNT(*)` counts rows as long as _any one_ of their columns is non-null. This helps us find table lengths because a table shouldn’t have rows that are completely null.

```sql
SELECT COUNT(*) FROM executions
```

### Nulls

In SQL, `NULL` is the value of an empty entry. This is different from the empty string `''` and the integer `0`, both of which are _not_ considered `NULL`. To check if an entry is `NULL`, use `IS` and `IS NOT` instead of `=` and `!=`.

```sql
SELECT (0 IS NOT NULL) AND ('' IS NOT NULL) 
```

| (0 IS NOT NULL) AND ('' IS NOT NULL) |
| ------------------------------------ |
| 1                                    |
Another common variation is to count a subset of the table. For instance, counting Harris county executions. We could run `SELECT COUNT(*) FROM executions WHERE county='Harris'` which filters down to a smaller dataset consisting of Harris executions and then counts all the rows.

But what if we want to simultaneously find the number of Bexar county executions?

The solution is to apply a `CASE WHEN` block which acts as a big if-else statement. It has two formats and the one I like is:

```sql
CASE
    WHEN <clause> THEN <result>
    WHEN <clause> THEN <result>
    ...
    ELSE <result>
END
```

A common mistake is to miss out the `END` command and the `ELSE` condition which is a catchall in case all the prior clauses are false.

```sql
SELECT
    SUM(CASE 
		    WHEN county='Harris' THEN 1
	        ELSE 0 END
	    ),
    SUM(CASE 
		    WHEN county='Bexar' THEN 1
	        ELSE 0 END
	    )
FROM executions
```

Switching `SUM` for `COUNT` alone isn't enough because `COUNT` still counts the 0 since 0 is non-null.

With `CASE WHEN`we create two new columns in depth : 
- `CASE WHEN county='Harris' THEN 1 ELSE 0 END`
- `CASE WHEN county='Bexar' THEN 1 ELSE 0 END`

```sql
SELECT *,
    CASE 
		WHEN county='Harris' THEN 1
		ELSE 0 END
	,
    CASE 
		WHEN county='Bexar' THEN 1
		ELSE 0 END
FROM executions
```

| first_name          | last_name | ex_number | ex_age | ex_date    | county  | last_statement                                                                                                                                                                                                     | CASE WHEN county='Harris' THEN 1 ELSE 0 END | CASE WHEN county='Bexar' THEN 1 ELSE 0 END |
| ------------------- | --------- | --------- | ------ | ---------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------- | ------------------------------------------ |
| Christopher Anthony | Young     | 553       | 34     | 2018-07-17 | Bexar   | l want to make sure the Patel family knows I love them like they love me. Make sure the kids in the world know I'm being executed and those kids I've been mentoring keep this fight going. I'm good Warden.       | 0                                           | 1                                          |
| Danny Paul          | Bible     | 552       | 66     | 2018-06-27 | Harris  | null                                                                                                                                                                                                               | 1                                           | 0                                          |
| Juan Edward         | Castillo  | 551       | 37     | 2018-05-16 | Bexar   | To everyone that has been there for me you know who you are. Love y'all. See y'all on the other side.That's it.                                                                                                    | 0                                           | 1                                          |
| Erick Daniel        | Davila    | 550       | 31     | 2018-04-25 | Tarrant | Yes, I would like to say nephew it burns huh. You know I might have lost the fight but I'm still a soldier. I still love you all. To my supporters and family y'all hold it down. Ten Toes down right. That's all. | 0                                           | 0                                          |

## Exercises

1. Find how many inmates were over the age of 50 at execution time.

```sql
SELECT COUNT(*) FROM executions
WHERE ex_age > 50
```

|COUNT(*)|
|---|
|68|

2. Find the number of inmates who have declined to give a last statement.
	For bonus points, try to do it in 3 ways:  
	1) With a `WHERE` block,  
	2) With a `COUNT` and `CASE WHEN` block,  
	3) With two `COUNT` functions.

```sql
SELECT COUNT(*) -- best one, straightforward
FROM executions
WHERE last_statement IS NULL

SELECT -- tirée par les cheveux, c'est juste pour la technique 
	COUNT(
		CASE 
			WHEN last_statement IS  NULL THEN 1
		  	ELSE NULL 
		END
	) 
FROM executions

SELECT -- tirée par les cheveux, c'est juste pour la technique 
	COUNT(
		CASE 
			WHEN last_statement IS  NULL THEN 1
		  	ELSE 0 -- count even 0, so we prefer NULL
	  	END 
	) 
FROM executions


SELECT -- tirée par les cheveux, c'est juste pour la technique 
	SUM(
		CASE 
			WHEN last_statement IS NULL THEN 1
		  	ELSE 0 
	  	END
	) 
FROM executions
```

|COUNT(*)|
|---|
|110|

|COUNT( CASE WHEN last_statement IS NULL THEN 1 ELSE NULL END )|
|---|
|110|

| COUNT( CASE WHEN last_statement IS NULL THEN 1 ELSE 0 END ) |
| ----------------------------------------------------------- |
| 553                                                         |

| SUM( CASE WHEN last_statement IS NULL THEN 1 ELSE 0 END ) |
| --------------------------------------------------------- |
| 100                                                       |

Find the proportion of inmates with claims of innocence in their last statements.
To do decimal division, ensure that one of the numbers is a decimal by multiplying it by 1.0. Use `LIKE '%innocent%'` to find claims of innocence.

We split it step by step 

```sql
-- First
SELECT *,
	CASE
		WHEN last_statement LIKE '%innocent%'
		THEN 1
		ELSE NULL
	END
FROM executions

--THEN 
SELECT
	COUNT(
	  CASE
		  WHEN last_statement LIKE '%innocent%'
		  THEN 1
		  ELSE NULL
	  END
	)
FROM executions

-- Finally
SELECT
	1.0 * COUNT(
	  CASE
		  WHEN last_statement LIKE '%innocent%'
		  THEN 1
		  ELSE NULL
	  END
	) / COUNT(*)
FROM executions

-- WARNING if we compute without 1.0 --> 0
SELECT
	COUNT(
	  CASE
		  WHEN last_statement LIKE '%innocent%'
		  THEN 1
		  ELSE NULL
	  END
	) / COUNT(*)
FROM executions
```

| first_name          | last_name | ex_number | ex_age | ex_date    | county | last_statement                                                                                                  | CASE WHEN last_statement LIKE '%innocent%' THEN 1 ELSE NULL END |
| ------------------- | --------- | --------- | ------ | ---------- | ------ | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| Christopher Anthony | Young     | 553       | 34     | 2018-07-17 | Bexar  | l want to make sure the Patel family knows I love them like they love me. ...                                   | null                                                            |
| Danny Paul          | Bible     | 552       | 66     | 2018-06-27 | Harris | null                                                                                                            | null                                                            |
| Juan Edward         | Castillo  | 551       | 37     | 2018-05-16 | Bexar  | To everyone that has been there for me you know who you are. Love y'all. See y'all on the other side.That's it. | null                                                            |

|COUNT( CASE WHEN last_statement LIKE '%innocent%' THEN 1 ELSE NULL END )|
|---|
|31|

| COUNT( CASE WHEN last_statement LIKE '%innocent%' THEN 1 ELSE NULL END ) / COUNT(*) |
| ----------------------------------------------------------------------------------- |
| 0                                                                                   |

| 1.0 * COUNT( CASE WHEN last_statement LIKE '%innocent%' THEN 1 ELSE NULL END ) / COUNT(*) |
| ----------------------------------------------------------------------------------------- |
| 0.05605786618444846                                                                       |

## A Strange Query

Before we wrap up, let’s take a look at this query:  

`SELECT first_name, COUNT(*) FROM executions`.

Doesn’t it look strange? If you have a good mental model of aggregations, it should! `COUNT(*)` is trying to return a single entry consisting the length of the execution table. `first_name` is trying to return one entry for each row. Should the computer return one or multiple rows? If it returns one, which `first_name` should it pick? If it returns multiple, is it supposed to replicate the `COUNT(*)` result across all the rows? The shapes of the output just don’t match!

Let's try it anyway and see what happens.

```sql
SELECT first_name, COUNT(*) FROM executions
```

|first_name|COUNT(*)|
|---|---|
|Charlie|553|

In practice, databases try to return something sensible even though you pass in nonsense. In this case, our database picks the first name from the last entry in our table. Since our table is in reverse chronological order, the last entry is Charlie Brooks Jr., the first person executed since the Supreme Court lifted the ban on the death penalty. Different databases will handle this case differently so it’s best not to count on their default behavior. If you know you want the last entry, you should explicitly find it. Many SQL dialects have a `LAST` aggregate function which makes this trivial. Unfortunately SQLite doesn’t, so a workaround is necessary.



```sql
FilmLocations(
Title:              titles of the films, 
ReleaseYear:        time of public release of the films, 
Locations:          locations of San Francisco where the films were shot, 
FunFacts:           funny facts about the filming locations, 
ProductionCompany:  companies who produced the films, 
Distributor:        companies who distributed the films, 
Director:           people who directed the films, 
Writer:             people who wrote the films, 
Actor1:             person 1 who acted in the films, 
Actor2:             person 2 who acted in the films,
Actor3:             person 3 who acted in the films
)
```

2. We want to count the number of locations of the films. But we also want to restrict the output result set so that we only retrieve the number of locations of the films written by a certain writer. The query for this can be written as:

```sql
SELECT COUNT(Locations) 
FROM FilmLocations 
WHERE Writer="James Cameron";
```

3. Retrieve the number of locations of the films which are directed by Woody Allen.

```sql
SELECT COUNT(Locations) 
FROM FilmLocations 
WHERE Director="Woody Allen";
```

4. Retrieve the number of films shot at Russian Hill.

```sql
SELECT Count(*) 
FROM FilmLocations 
WHERE ReleaseYear<1950;
```


