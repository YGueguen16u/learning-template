/*
SELECT * 
FROM employees 
LIMIT 5 OFFSET 2;

-- Only SQLite, MySQL, PostgreSQL
SELECT * 
FROM employees 
LIMIT 2, 5;

SELECT employee_id, last_name, first_name, department, salary 
FROM employees
WHERE salary > 70000 AND (department = 'IT' OR department = 'Sales')
LIMIT 4 OFFSET 5;

SELECT employee_id, last_name, first_name, department, city, salary 
FROM employees
WHERE age > 30 
    AND (department = 'IT' OR department = 'Sales') 
    AND bonus_percentage > 15 
    AND salary > (SELECT COUNT(DISTINCT city) * 8000 FROM employees)
LIMIT 3 OFFSET 2;

SELECT COUNT(DISTINCT city) * 8000 
FROM employees;

SELECT employee_id, last_name, first_name, department, city, salary 
FROM employees
WHERE age > 30 
    AND (department = 'IT' OR department = 'Sales') 
    AND bonus_percentage > 15;

SELECT TOP 5 * 
FROM employees;
*/
SELECT employee_id, last_name, first_name, department, city, salary 
FROM employees
WHERE age > 30 
    AND (department = 'IT' OR department = 'Sales') 
    AND bonus_percentage > 15 
    AND salary > (SELECT COUNT(DISTINCT city) * 8000 FROM employees)
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;