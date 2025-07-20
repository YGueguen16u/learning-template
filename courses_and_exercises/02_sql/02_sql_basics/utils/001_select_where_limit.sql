
--- Remove the comments to run the query

/*
SELECT * 
FROM employees;
*/

/*
SELECT first_name, last_name
FROM employees;
*/

/*
SELECT 50 + 2, 51 * 2, 51 / 2
*/

/*
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date <= '2019-01-01'
*/

/*
SELECT first_name, last_name, hire_date
FROM employees
LIMIT 5
*/

/*
SELECT first_name, last_name, salary 
FROM employees 
WHERE department = 'HR' ;
*/

/*
SELECT first_name, last_name, city 
FROM employees 
WHERE hire_date >= '2022-01-01'
LIMIT 6;
*/

/*
SELECT first_name, last_name, city 
FROM employees 
WHERE city != 'New York'
LIMIT 7;
*/
