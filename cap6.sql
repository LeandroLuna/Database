---- 2º Sem-Capítulo 6 - Exibindo Dados de Várias Tabelas
--Usando Apelidos de Tabelas
SELECT e.employee_id, e.last_name, 
       location_id, d.department_id
FROM   employees e JOIN departments d
ON     (d.department_id=e.department_id) ;

--Recuperando Registros com a Cláusula ON
SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id);

--Auto-Joins Usando a Cláusula ON
SELECT e.last_name emp, m.last_name mgr
FROM   employees e JOIN employees m
ON    (e.manager_id = m.employee_id);

SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id );

--Aplicando Outras Condições a uma Join
SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id)
AND    e.manager_id = 149 ;

--Criando Joins Tridimensionais com a Cláusula ON
SELECT employee_id, city, department_name
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id;

--LEFT OUTER JOIN
SELECT e.last_name, e.department_id, d.department_name
FROM   employees e LEFT OUTER JOIN departments d
ON   (e.department_id = d.department_id) ;

--RIGHT OUTER JOIN
SELECT e.last_name, e.department_id, d.department_name
FROM   employees e RIGHT OUTER JOIN departments d
ON   (e.department_id = d.department_id) ;


--FULL OUTER JOIN
SELECT e.last_name, e.department_id, d.department_name
FROM   employees e FULL OUTER JOIN departments d
ON   (e.department_id = d.department_id) ;






















