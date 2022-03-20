
-- CRIANDO UMA VISÃO

CREATE OR REPLACE VIEW vemployeesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary, commission_pct
FROM employees
WHERE department_id = 60;

DESC vemployeesdept60

-- RECUPERANDO DADOS UTILIZANDO UMA VISÃO

SELECT *
FROM   vemployeesdept60;
 
-- CRIANDO UMA VISÃO COMPLEXA

CREATE OR REPLACE VIEW vdepartments_total
(department_id, department_name, minsal, maxsal, avgsal)
AS SELECT e.department_id, d.department_name, MIN(e.salary), MAX(e.salary),AVG(e.salary)
FROM employees e 
JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY e.department_id, department_name;

SELECT * 
FROM   vdepartments_total;

-- UTILIZANDO A CLAUSULA CHECK OPTION

CREATE OR REPLACE VIEW vemployeesdept100
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeesdept100_ck;

-- UTILIZANDO A CLAUSULA READ ONLY

CREATE OR REPLACE VIEW vemployeesdept20
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 20
WITH READ ONLY;

-- REMOVENDO UMA VISÃO

DROP VIEW vemployeesdept20;
