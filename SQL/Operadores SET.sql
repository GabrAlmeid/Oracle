
-- UTILIZANDO OPERADOR UNION 

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- UTILIZANDO O OPERADOR UNION ALL

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
UNION ALL
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id = 60
ORDER BY employee_id;

-- UTILIZANDO OPERADOR INTERSECT

SELECT employee_id, job_id
FROM   employees
WHERE  job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id
FROM   employees
WHERE  department_id IN (60, 90, 100)
ORDER BY employee_id;

-- UTILIZANDO OPERADOR MINUS

SELECT employee_id, job_id
FROM   employees
WHERE  department_id IN (60, 90, 100)
MINUS
SELECT employee_id, job_id
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- CUIDADOS COM OS TIPOS DE DADOS NA LISTA DE COLUNAS OU EXPRESSÕES DO SELECT

SELECT employee_id, job_id, hire_date
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- CORRIGINDO O ERRO

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- UTILIZANDO MAID DE UM OPERADOR SET

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
(SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  salary > 10000)
ORDER BY employee_id;