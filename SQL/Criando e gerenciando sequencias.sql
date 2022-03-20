
-- CRIANDO UMA SEQUENCIA

SELECT MAX(employee_id)
FROM   employees;

DROP SEQUENCE employees_seq;

CREATE SEQUENCE employees_seq
START WITH 208
INCREMENT BY 1
NOMAXVALUE 
NOCACHE
NOCYCLE;

-- CONSULTANDO SEQUENCIAS PELO DICIONARIO DE DADOS

SELECT  *
FROM    user_sequences;

-- RECUPERANDO PROXIMO VALOR DA SEQUENCIA

SELECT employees_seq.NEXTVAL
FROM   dual;

-- RECUPERANDO O VALOR CORRENTE DA SEQUENCIA

SELECT employees_seq.CURRVAL
FROM   dual;

-- REMOVENDO UMA SEQUENCIA 

DROP SEQUENCE employees_seq;

-- RECRIANDO UMA SEQUENCIA

CREATE SEQUENCE employees_seq
START WITH 210
INCREMENT BY 1
NOMAXVALUE 
NOCACHE
NOCYCLE;

-- UTILIZANDO UMA SEQUENCIA

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (employees_seq.nextval, 'Paul', 'Simon', 'PSIMO', 
               '525.342.237', TO_DATE('12/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 15000,
               NULL, 103, 60);

SELECT *
FROM employees
ORDER BY employee_id DESC;

COMMIT;

-- MODIFICANDO UMA SEQUENCIA

ALTER SEQUENCE employees_seq
MAXVALUE 999999
CACHE 20;