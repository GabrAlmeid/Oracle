
-- UTILIZANDO O COMANDO INSERT

INSERT INTO departments(department_id,
department_name, manager_id, location_id)
VALUES (280, 'Project Management', 103, 1400);

-- INSERINDO LINHAS COM VALORES NULOS DE METODO EXPLICITO

INSERT INTO departments
VALUES (290, 'Data Science', NULL, NULL);

-- INSERINDO LINHAS COM VALORES NULOS DE METODO IMPLICITO

INSERT INTO departments(department_id,
department_name)
VALUES (300, 'Business Intelligence');

COMMIT;

-- INSERINDO LINHAS COM VALORES NULOS DE METODO EXPLICITO

INSERT INTO departments
VALUES (301, 'Inovation', NULL, NULL);


-- INSERINDO LINHAS COM VALORES NULOS DE METODO IMPLICITO

INSERT INTO departments(department_id,
department_name)
VALUES (302, 'IOT');

COMMIT;

-- INSERINDO VALORES ESPECIAIS RETORNADOS DE FUNÇÕES

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);

-- INSERT UTILIZANDO DATA E HORA ESPECIFICAS

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL', 
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);
               
SELECT *
FROM   employees
ORDER BY employee_id DESC;

COMMIT;

-- UTILIZANDO VARIAVEIS DE SUBSTITUIÇÃO

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name',&location);

SELECT *
FROM departments
ORDER BY department_id DESC;

COMMIT;

-- INSERINDO LINHAS A PARTIR DE UMA SUB-CONSULTA

DROP TABLE sales_reps;

CREATE TABLE sales_reps
(id NUMBER(6,0),
 name VARCHAR2(20),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2));

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';

COMMIT;

SELECT *
FROM sales_reps;

-- UTILIZANDO O COMANDO UPDATE

UPDATE employees
SET salary = salary * 1.2;

ROLLBACK;

UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';

COMMIT;

SELECT *
FROM employees
WHERE last_name = 'King';

-- UTILIZANDO O COMANDO UPDATE COM SUB-CONSULTAS

UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 141),
    salary = (SELECT salary
              FROM employees
              WHERE employee_id = 141)
WHERE employee_id = 140;

COMMIT;

-- UTILIZANDO O COMANDO DELETE E ROLL BACK

DELETE FROM countries
WHERE  country_name = 'Nigeria';

ROLLBACK;

DELETE FROM employees
WHERE employee_id = 208;

-- UTILIZANDO O COMANDO COMMIT

COMMIT;

-- UTILIZANDO SAVEPOINT

DELETE FROM employees
WHERE employee_id IN (207,208);

COMMIT;

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);

SAVEPOINT A;

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL', 
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);
               
ROLlBACK TO SAVEPOINT  A;

COMMIT; 

SELECT *
FROM employees
ORDER BY employee_id DESC;

-- CLAUSULA FOR UPDATE NO COMANDO SELECT

SELECT employee_id, salary, commission_pct, job_id
FROM   employees
WHERE  job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;

COMMIT;

SELECT e.employee_id, e.salary, e.commission_pct
FROM employees e JOIN departments d
USING (department_id)
WHERE job_id = 'ST_CLERK'
AND location_id = 1500
FOR UPDATE of e.salary
ORDER BY e.employee_id;

COMMIT;