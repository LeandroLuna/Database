SELECT *
FROM   departments;


SELECT department_id, location_id
FROM   departments;


------

SELECT last_name, salary, salary + 300
FROM   employees;

SELECT last_name, salary, 12*salary+100
FROM   employees;

SELECT last_name, salary, 12*(salary+100)
FROM   employees;

-------
SELECT last_name, job_id, salary, commission_pct
FROM   employees;

SELECT last_name, 12*salary*commission_pct
FROM   employees;

-------

SELECT last_name AS name, commission_pct comm
FROM   employees;

SELECT last_name "Name" , salary*12 "Annual Salary"
FROM employees;

-------

SELECT	last_name||job_id AS "Employees"
FROM 	employees;

-------

SELECT department_id
FROM   employees;

SELECT DISTINCT department_id
FROM   employees;

-------


