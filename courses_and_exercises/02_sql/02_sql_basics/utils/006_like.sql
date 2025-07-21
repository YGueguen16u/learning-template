/*
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date <= '2021-01-01' AND last_name LIKE 'S%';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date::text LIKE '201%' AND first_name LIKE '%e%' AND last_name LIKE '%e%';

SELECT first_name, last_name, hire_date, department
FROM employees
WHERE 
    (hire_date::text LIKE '202%' AND (first_name LIKE '%e%' AND last_name LIKE '%l%')) 
    OR (hire_date::text LIKE '202%' AND department LIKE '%a%');

SELECT first_name, last_name, hire_date, department
FROM employees
WHERE 
    (hire_date::text LIKE '202%' AND (first_name LIKE '%e%' AND last_name LIKE '%l%')) 
    OR (department LIKE '%a%');

SELECT DISTINCT department
FROM employees
WHERE department LIKE '%a%';
*/

