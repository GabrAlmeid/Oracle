
-- CRIANDO GRUPOS UTILIZANDO A CLAUSULA GROUP BY

SELECT department_id, AVG(salary)
FROM   employees
GROUP BY department_id
ORDER BY department_id;


-- UTILIZANDO A CLAUSULA GROUP BY COM MAIS DE UMA COLUNA OU EXPRESS�O

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- CONSULTAS INCORRETAS UTILIZANDO FUN��ES DE GRUPO

SELECT department_id, AVG(salary)
FROM   employees;

SELECT department_id, MAX(salary)
FROM   employees
WHERE  MAX(salary) > 10000
GROUP BY department_id;

-- CORRIGINDO CONSULTAS INCORRETAS UTILIZANDO FUN��ES DE GRUPO

SELECT department_id,  AVG(salary)
FROM employees
GROUP BY department_id;

-- RESTRINGINDO GRUPOS UTILIZANDO A CLAUSULA HAVING

SELECT department_id, MAX(salary)
FROM   employees
GROUP BY department_id
HAVING MAX(salary)>10000;

SELECT job_id, SUM(salary) TOTAL
FROM   employees
WHERE  job_id <> 'SA_REP'
GROUP BY job_id
HAVING   SUM(salary) > 10000
ORDER BY SUM(salary);

-- ANINHANDO FUN��ES DE GRUPO

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

