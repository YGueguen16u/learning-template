.mode column
.headers on

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db

SELECT COUNT(*)
FROM employees
WHERE city = 'New York' AND department IS NOT NULL;


SELECT COUNT(*) 
FROM employees
WHERE age > 30;

SELECT first_name, COUNT(*) 
FROM employees;

SELECT COUNT(city) 
FROM employees 
WHERE last_name = 'Smith';

SELECT COUNT(city) 
FROM employees 
WHERE department = 'IT';

SELECT COUNT(DISTINCT city) 
FROM employees 
WHERE department = 'IT';

SELECT Count(*) 
FROM employees 
WHERE performance_score > 8.5;