.mode column 
.headers on 

.open courses_and_exercises/02_sql_basics_and_rdbms/01_sql_basics/datasets/db/lib_002.db

SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date <= '2021-01-01' AND last_name LIKE 'S%';


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '201%' AND first_name LIKE '%e%' AND last_name LIKE '%e%';

SELECT first_name, last_name, hire_date, department
FROM employees
WHERE 
    (hire_date LIKE '202%' AND (first_name LIKE '%e%' AND last_name LIKE '%l%')) 
    OR (hire_date LIKE '202%' AND department LIKE '%a%');

SELECT first_name, last_name, hire_date, department
FROM employees
WHERE 
    (hire_date LIKE '202%' AND (first_name LIKE '%e%' AND last_name LIKE '%l%')) 
    OR (department LIKE '%a%');

SELECT DISTINCT department
FROM employees
WHERE department LIKE '%a%';


