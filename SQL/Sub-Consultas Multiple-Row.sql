
-- SUB-CONSULTAS MULTIPLE-ROW

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary IN (SELECT AVG(NVL(salary,0)) FROM employees GROUP BY department_id);

-- UTILIZANDO OPERADOR NOT IN EM SUB-CONSULTAS MULTIPLE-ROW

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary NOT IN (SELECT AVG(NVL(salary,0))FROM employees GROUP BY department_id);
                 
-- UTILIZANDO OPERADOR ANY EM SUB-CONSULTAS MULTIPLE-ROW

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG');

-- UTILIZANDO OPERADOR ALL EM SUB-CONSULTAS MULTIPLE-ROW

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG');
                    
-- CUIDADOS COM VALORES NULOS EM UMA SUB-CONSULTA COM OPERADOR IN

SELECT emp.employee_id, emp.last_name
FROM   employees emp
WHERE  emp.employee_id IN (SELECT mgr.manager_id FROM employees mgr);

-- CUIDADOS COM VALORES NULOS EM UMA SUB-CONSULTA COM OPERADOR NOT IN

SELECT emp.employee_id, emp.last_name
FROM   employees emp
WHERE  emp.employee_id NOT IN (SELECT mgr.manager_id FROM employees mgr);
