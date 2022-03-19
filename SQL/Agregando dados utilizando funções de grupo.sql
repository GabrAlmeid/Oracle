
-- UTILIZANDO FUN합ES AVG e SUM

SELECT AVG(salary), SUM(salary)
FROM   employees;

-- UTILIZANDO AS FUN합ES MIN e MAX

SELECT MIN(hire_date), MAX(hire_date)
FROM   employees;

SELECT MIN(salary), MAX(salary)
FROM   employees;

-- UTILIZANDO A FUN플O COUNT

SELECT COUNT(*)
FROM   employees;

SELECT COUNT(commission_pct)
FROM   employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0))
FROM employees;

-- UTILIZANDO A FUN플O COUNT com DISTINCT

SELECT COUNT(DISTINCT department_id)
FROM   employees;

SELECT COUNT(department_id)
FROM   employees;

-- FUN합ES DE GRUPO E VALORES NULOS

SELECT AVG(commission_pct)
FROM   employees;

-- TRATAMENTO DE NULOS EM FUN합ES DE GRUPO

SELECT AVG(NVL(commission_pct, 0))
FROM   employees;
