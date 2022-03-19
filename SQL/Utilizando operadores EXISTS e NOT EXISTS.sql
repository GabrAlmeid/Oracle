
-- UTILIZANDO OPERADOR EXISTS

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  EXISTS (SELECT e.department_id FROM employees e WHERE d.department_id = e.department_id);
							 
-- UTILIZANDO OPERADOR NOT EXISTS

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  NOT EXISTS (SELECT e.department_id FROM employees e WHERE d.department_id = e.department_id);
    
