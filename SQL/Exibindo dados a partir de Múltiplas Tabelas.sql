
-- UTILIZANDO PREXIXOS COLUNA COM NOMES DE TABELA

SELECT employees.employee_id, employees.last_name, 
       employees.department_id, departments.department_name
FROM   employees JOIN departments 
       ON (employees.department_id = departments.department_id);

-- UTILIZANDO ALIAS DE TABELA

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id);

-- UTILIZANDO NATURAL JOINS

SELECT  department_id, department_name, location_id, city
FROM    departments
NATURAL JOIN locations;

-- JOIN COM A CLAUSULA USING

SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name
FROM employees e
  JOIN departments d USING (department_id);

-- JOIN COM A CLAUSULA ON

SELECT e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

-- JOINS UTILIZANDO VARIAS TABELAS COM A CLUADULA ON

SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e
  JOIN jobs        j ON (e.job_id = j.job_id)
  JOIN departments d ON (e.department_id = d.department_id)
  JOIN locations   l ON (d.location_id = l.location_id)
ORDER BY e.employee_id;
  
-- INCLUINDO CONDIÇÕES ADICIONAIS A CONDIÇÃO DE JOIN NA CLAUSULA WHERE

SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON  (e.department_id = d.department_id)
WHERE (e.salary BETWEEN 10000 AND 15000);


-- INCLUINDO CONDIÇOES ADICIONAIS A CONDIÇÃO DE JOIN UTILIZANDO AND

SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id) AND
   (e.salary BETWEEN 10000 AND 15000);
   
-- SELF JOIN UTILIZANDO A CLAUSULA ON

SELECT empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregado",
       gerente.employee_id "Id gerente", gerente.last_name "Sobrenome gerente"
FROM employees empregado JOIN employees gerente
ON (empregado.manager_id = gerente.employee_id)
ORDER BY empregado.employee_id;
