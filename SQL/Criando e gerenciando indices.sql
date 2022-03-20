
-- ANALIZE O CUSTO DO COMANDO NO PLANO DE EXECUÇÃO

DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- CRIANDO UM INDICE SIMPLES

CREATE INDEX employees_last_name_idx
ON employees(last_name);

-- ANALIZE O CUSTO DO COMANDO NO PLANO DE EXECUÇÃO

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- CRIANDO UM INDICE COMPOSTO

CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

-- ANALIZE O CUSTO DO COMANDO NO PLANO DE EXECUÇÃO

SELECT *
FROM  employees
WHERE last_name = 'Himuro' AND 
      first_name = 'Guy';

-- RECONSTRUINDO E REORGANIZANDO UM INDICE

ALTER INDEX employees_last_name_first_name_idx REBUILD;

-- REMOVENDO UM INDICE

DROP INDEX employees_last_name_idx;

-- CONSULTANDO INDICES

SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

-- REMOVENDO UM INDICE

DROP INDEX employees_last_name_idx;

DROP INDEX employees_last_name_first_name_idx;