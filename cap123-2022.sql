/* 
Crie um relat�rio para o departamento de recursos humanos que 
exiba o sobrenome e o sal�rio de todos os funcion�rios 
subordinados a Steven King.
*/
select last_name, salary
from employees
where manager_id = (select employee_id
                    from employees
                    where last_name = 'King'
                    and first_name = 'Steven')
                    
/*
Produza uma lista de cargos dos departamentos 10, 50 e 20, 
nessa ordem. Exiba o ID de cargo e o ID de departamento usando 3
operadores de conjunto.
*/
select job_id, department_id, 'A' dummy
from employees
where department_id = 10
union
select job_id, department_id, 'C' dummy
from employees
where department_id = 20
union
select job_id, department_id, 'B' dummy
from employees
where department_id = 50
order by dummy;

/*
O departamento 50 precisa de acesso aos dados de seus funcion�rios. 
Crie uma view denominada DEPT50 que contenha os n�meros e os 
sobrenomes, bem como os n�meros de departamento de todos os 
funcion�rios do departamento 50. 
Foi solicitada a atribui��o dos labels EMPNO , EMPLOYEE e DEPTNO 
�s colunas da view. 
Para fins de seguran�a, n�o permita que um funcion�rio seja 
redesignado a outro departamento por meio da view.
*/
create or replace view DEPT50 
as
select employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO 
from employees
where department_id = 50
with check option constraint emp50_co;

/*
Voc� precisa de uma sequ�ncia que possa ser usada com a coluna 
de chave prim�ria da tabela DEPTO. 
A sequ�ncia deve come�ar:
    com o valor 200 e ter 
    o valor m�ximo 1.000. 
    Incremente a sequ�ncia em 10. 
    Nomeie-a como DEPT_ID_SEQ.
*/
create table depto
(dept_id int,
dept_name varchar(100));

create sequence dept_id_seq
start with 200
maxvalue 1000
increment by 10;

/*
Para testar a sequ�ncia, crie um script para inserir duas 
linhas na tabela DEPTO. 
Certifique-se de utilizar a sequ�ncia criada para a coluna ID. 
Adicione dois departamentos: Education e Administration. 
Confirme as adi��es. Execute os comandos no script.
*/
insert into depto 
values (dept_id_seq.nextval, 'Education');

insert into depto 
values (dept_id_seq.nextval, 'Administration');

select * from depto;

/*
Crie um �ndice n�o exclusivo na coluna DEPT_NAME da tabela DEPTO.
*/
create index dept_id_idx
on depto(dept_name)

/*
Crie um sin�nimo para a tabela EMPLOYEES. 
Nomeie o sin�nimo como EMP
*/

create or replace synonym emp
for employees;
