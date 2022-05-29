--Usando as Functions AVG e SUM
SELECT AVG(salary), MAX(salary),
       MIN(salary), SUM(salary)
FROM   employees
WHERE  job_id LIKE '%REP%';

--Usando as Functions MIN e MAX
SELECT MIN(hire_date), MAX(hire_date)
FROM	  employees;

--Usando a Function COUNT
SELECT COUNT(*)
FROM   employees
WHERE  department_id = 50;

SELECT COUNT(commission_pct)
FROM   employees
WHERE  department_id = 80;

--Usando a Palavra-Chave DISTINCT
SELECT COUNT(DISTINCT department_id)
FROM   employees;

--Functions de Grupo e Valores Nulos
SELECT AVG(commission_pct)
FROM   employees;

SELECT AVG(NVL(commission_pct, 0))
FROM   employees;

--Usando a Cláusula GROUP BY 
SELECT   department_id, AVG(salary)
FROM     employees
GROUP BY department_id ;

SELECT   AVG(salary)
FROM     employees
GROUP BY department_id ;

--Usando a Cláusula GROUP BY em Várias Colunas
SELECT   department_id dept_id, job_id, SUM(salary)
FROM     employees
GROUP BY department_id, job_id ;

--Consultas Inválidas Usando Functions de Grupo
SELECT department_id, COUNT(last_name)
FROM   employees;

SELECT   department_id, AVG(salary)
FROM     employees
WHERE    AVG(salary) > 8000
GROUP BY department_id;

--Usando a Cláusula HAVING
SELECT   department_id, MAX(salary)
FROM     employees
GROUP BY department_id
HAVING   MAX(salary)>10000 ;

SELECT   job_id, SUM(salary) PAYROLL
FROM employees
WHERE    job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING   SUM(salary) > 13000
ORDER BY SUM(salary);

--Aninhando Functions de Grupo
SELECT   MAX(AVG(salary))
FROM     employees
GROUP BY department_id;