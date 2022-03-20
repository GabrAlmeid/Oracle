
-- CONSULTANDO OS OBJETOS DO SCHEMA DO USUARIO HR

SELECT *
FROM   user_objects
ORDER BY Object_type;

-- CRIANDO TABELAS

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 DESC projects
 
 SELECT *
 FROM projects;
 
DROP TABLE TEAMS;

CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL);

-- CONSULTANDO A ESTRUTURA DA TABELA

DESC projects

DESC teams;

-- TIPO ROWID

DESC employees

SELECT employee_id, first_name, rowid, LENGTH(rowid)
from   employees
WHERE rowid = 'AAASfNAAMAAAADLAAA';

-- CONSULTANDO AS TABELAS EXISTENTES PELO DICIONARIO DE DADOS

DESC user_tables

SELECT table_name
FROM   user_tables;

-- CONSULTANDO OS OBJETOS DO TIPO TABLE DO USUARIO

DESC user_objects

SELECT object_name, object_type
FROM   user_objects
WHERE  object_type = 'TABLE';

-- CRIANDO UMA TABELA UTILIZANDO UMA SUB-CONSULTA

DROP TABLE employees_department60;

CREATE TABLE employees_department60
AS
SELECT employee_id, last_name,salary*12 ANNSAL, hire_date
FROM employees
WHERE department_id = 60;

DESC employees_department60

SELECT *
FROM   employees_department60;

-- TRUNCATE TABLE

TRUNCATE TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- DROP TABLE

DROP TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- CONSULTANDO A LIXEIRA

SELECT *
FROM user_recyclebin;