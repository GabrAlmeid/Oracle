
-- SUB-CONSULTAS SINGLE-ROW

SELECT first_name, last_name, job_id, salary
FROM   employees
WHERE  salary > (SELECT AVG(NVL(salary,0))FROM employees);     

-- UTILIZANDO SUB-CONSULTAS NA CLAUSULA HAVING

SELECT e1.department_id, MAX(e1.salary)
FROM   employees e1
GROUP BY e1.department_id
HAVING MAX(salary) <  (SELECT AVG(e2.salary)FROM   employees e2);
                                                  
-- ERROS UTILIZANDO SUB-CONSULTAS SINGLE-ROW

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  salary =(SELECT    AVG(NVL(salary,0))FROM  employees GROUP BY  department_id);

-- O QUE OCORRE QUANDO A SUB-CONSULTA RETORNA NENHUMA LINHA?

SELECT employee_id, first_name, last_name
FROM   employees
WHERE  last_name =  (SELECT last_name FROM   employees WHERE  last_name = 'Almeida');
                     
