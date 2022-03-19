
-- UTILIZANDO SUB-CONSULTAS MULTIPLE-COLUMN

SELECT e1.employee_id, e1.first_name, e1.job_id, e1.salary
FROM   employees e1
WHERE (e1.job_id, e1.salary) IN (SELECT e2.job_id, MAX(e2.salary) FROM employees e2 GROUP BY e2.job_id);
								 
