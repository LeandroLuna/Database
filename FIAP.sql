CREATE TABLE EMPLOYEES
(employee_id number(5) constraint employees_pk primary key,
last_name varchar(100) not null,
commission_pct number(2),
email varchar(500) not null constraint email_uq unique,
department_id number(5) not null
);

CREATE TABLE departments
(department_id NUMBER(5) CONSTRAINT departments_pk PRIMARY KEY,
department_name VARCHAR(100) CONSTRAINT dept_name NOT NULL
);

ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_DEPT_FK FOREIGN KEY (department_id) REFERENCES DEPARTMENTS (DEPARTMENT_ID);

ALTER TABLE employees ADD jobs varchar(50) not null;

ALTER TABLE departments RENAME COLUMN department_name to department_names;

desc departments;

