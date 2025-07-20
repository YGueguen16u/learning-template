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
*/

/*
SELECT * 
FROM employees 
WHERE department IN ('IT', 'HR');
*/

/*
--- On Postgres, OR and AND only work with boolean values
SELECT true AND false;  -- returns false
SELECT true OR false;   -- returns true
SELECT NOT true;        -- returns false

SELECT false AND false OR true;  -- returns true 
SELECT false AND (false OR true);  -- returns false
SELECT (true AND false) OR true;  -- returns true
*/

/*
--- On Sqlite
SELECT 0 AND 0 OR 1; -- AND First 0 and O = 0 then 0 or 1 = 1
SELECT 0 AND (0 OR 1); -- 0 or 1 = 1 then O And 1 = 0
*/

SELECT last_name, department
FROM employees 
WHERE department <> 'IT';