CREATE TABLE departments
(  department_id      NUMBER(4)    CONSTRAINT  dept_deptid_pk PRIMARY KEY
 , department_name    VARCHAR2(30) CONSTRAINT  dept_name_nn   NOT NULL
 , manager_id         NUMBER(6)
 , location_id        NUMBER(4)
) ;

CREATE TABLE employees
    ( employee_id    NUMBER(6)    CONSTRAINT  emp_emp_id_pk  PRIMARY KEY
    , first_name     VARCHAR2(20)
    , last_name      VARCHAR2(25) CONSTRAINT  emp_last_name_nn  NOT NULL
    , email          VARCHAR2(25) CONSTRAINT  emp_email_nn  NOT NULL
                                  CONSTRAINT  emp_email_uk  UNIQUE
    , phone_number   VARCHAR2(20)
    , hire_date      DATE         CONSTRAINT  emp_hire_date_nn  NOT NULL
    , job_id         VARCHAR2(10) CONSTRAINT  emp_job_nn  NOT NULL
    , salary         NUMBER(8,2)  CONSTRAINT  emp_salary_min CHECK (salary > 0)
    , commission_pct NUMBER(2,2)
    , manager_id     NUMBER(6)
    , department_id  NUMBER(4) 
    ) ;

ALTER TABLE    employees
ADD CONSTRAINT emp_dept_fk
FOREIGN KEY    (department_id)
REFERENCES     departments(department_id);
