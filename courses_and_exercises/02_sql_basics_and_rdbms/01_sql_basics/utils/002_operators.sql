.mode column
.headers on

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_001.db

/*
SELECT * 
FROM employees 
WHERE department = 'IT';    

SELECT last_name
FROM employees 
WHERE department != 'IT';

SELECT last_name, age
FROM employees 
WHERE age < 28;

SELECT last_name, first_name, age
FROM employees 
WHERE age > 40;

SELECT last_name, age
FROM employees 
WHERE age >= 35;

SELECT last_name, first_name, age
FROM employees 
WHERE age <= 28;

SELECT last_name, department
FROM employees 
WHERE department <> 'IT';
*/

SELECT last_name, department
FROM employees 
WHERE department = 'IT' AND age > 30;

SELECT last_name, department
FROM employees 
WHERE department = 'IT' OR age > 30;

SELECT last_name, department
FROM employees 
WHERE department = 'IT' AND NOT age > 30;

SELECT last_name, department
FROM employees 
WHERE (department = 'IT' AND NOT age > 30) OR (NOT department = 'IT' AND age > 30);

SELECT * 
FROM employees 
WHERE department IN ('IT', 'HR');


SELECT 0 AND 0 OR 1; -- AND First 0 and O = 0 then 0 or 1 = 1
SELECT 0 AND (0 OR 1); -- 0 or 1 = 1 then O And 1 = 0