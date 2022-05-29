--VIEWS
---------------
-- Exemplo 1 --
---------------
drop view empvu80;
CREATE VIEW 	empvu80
 AS 
 SELECT  employee_id, last_name, salary
    FROM    employees
    WHERE   department_id = 80;
	
DESCRIBE empvu80;

select * from empvu80;

update empvu80
set salary = 20000
where employee_id = 145;

delete empvu80
where employee_id = 145;

rollback;

insert into empvu80
values (1000,'Xiuderico',10000);


---------------
-- Exemplo 2 --
---------------
drop view salvu50;
CREATE VIEW salvu50
 AS 
    SELECT  employee_id ID_NUMBER, 
            last_name   NAME,
            salary*12 ANN_SALARY
    FROM    employees
    WHERE   department_id = 50;
    
SELECT *
FROM   salvu50;

update salvu50
set name='Paul'
where id_number=120;

update salvu50
set ann_salary = 960000
where id_number=120;

delete from salvu50
where id_number=120;

---------------
-- Exemplo 3 --
---------------
drop view empvu80;
CREATE or REPLACE VIEW empvu80
       (id_number, name, sal, department_id,commission_pct,manager_id)
AS SELECT  employee_id , 
           first_name || ' ' || last_name, 
           salary, 
           department_id,
           commission_pct,
           manager_id
   FROM    employees
   WHERE   department_id in (80,90,100,10);
   
---------------
-- Exemplo 4 --
---------------
drop view dept_sum_vu;
CREATE VIEW	dept_sum_vu
  (name, minsal, maxsal, avgsal)
AS SELECT	 d.department_name, 
             MIN(e.salary), 
             MAX(e.salary),
             AVG(e.salary)
   FROM      employees e, departments d
   WHERE     e.department_id = d.department_id 
   GROUP BY  d.department_name;

 SELECT * 
 FROM dept_sum_vu;

---------------
-- Exemplo 5 --
---------------
CREATE OR REPLACE VIEW empvu20
AS SELECT	*
   FROM     employees
   WHERE    department_id = 20
   WITH CHECK OPTION CONSTRAINT empvu20_ck ;

---------------
-- Exemplo 6 --
---------------
CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT	employee_id, last_name, job_id
   FROM     employees
   WHERE    department_id = 10
   WITH READ ONLY CONSTRAINT EMPVU10_RO ;

---------------
-- Exemplo 7 --
---------------
DROP VIEW empvu80;
