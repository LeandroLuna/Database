/* 
Crie um relatório para o departamento de recursos humanos que 
exiba o sobrenome e o salário de todos os funcionários 
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
O departamento 50 precisa de acesso aos dados de seus funcionários. 
Crie uma view denominada DEPT50 que contenha os números e os 
sobrenomes, bem como os números de departamento de todos os 
funcionários do departamento 50. 
Foi solicitada a atribuição dos labels EMPNO , EMPLOYEE e DEPTNO 
às colunas da view. 
Para fins de segurança, não permita que um funcionário seja 
redesignado a outro departamento por meio da view.
*/
create or replace view DEPT50 
as
select employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO 
from employees
where department_id = 50
with check option constraint emp50_co;

/*
Você precisa de uma sequência que possa ser usada com a coluna 
de chave primária da tabela DEPTO. 
A sequência deve começar:
    com o valor 200 e ter 
    o valor máximo 1.000. 
    Incremente a sequência em 10. 
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
Para testar a sequência, crie um script para inserir duas 
linhas na tabela DEPTO. 
Certifique-se de utilizar a sequência criada para a coluna ID. 
Adicione dois departamentos: Education e Administration. 
Confirme as adições. Execute os comandos no script.
*/
insert into depto 
values (dept_id_seq.nextval, 'Education');

insert into depto 
values (dept_id_seq.nextval, 'Administration');

select * from depto;

/*
Crie um índice não exclusivo na coluna DEPT_NAME da tabela DEPTO.
*/
create index dept_id_idx
on depto(dept_name)

/*
Crie um sinônimo para a tabela EMPLOYEES. 
Nomeie o sinônimo como EMP
*/

create or replace synonym emp
for employees;
