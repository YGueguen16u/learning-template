.mode column
.headers on

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db

SELECT DISTINCT city 
FROM employees;

SELECT city 
FROM employees;

SELECT COUNT(DISTINCT city) 
FROM employees;

SELECT COUNT(city) 
FROM employees;

SELECT COUNT(DISTINCT last_name) 
FROM employees;

SELECT COUNT(DISTINCT last_name) 
FROM employees
WHERE age > 30 AND salary > 70000 AND department = 'IT';

SELECT DISTINCT last_name 
FROM employees
WHERE age > 30 AND salary > 70000 AND department = 'IT';

SELECT DISTINCT first_name, department, salary, city 
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales');

SELECT DISTINCT *
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales');

SELECT COUNT(DISTINCT *) 
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales');

SELECT COUNT(*) 
FROM (SELECT DISTINCT city, first_name, department, salary 
      FROM employees
      WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales'));