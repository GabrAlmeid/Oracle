
-- Definindo Constraint NOT NULL

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- DEFININDO CONSTRAINT PRIMARY KEY A NIVEL DE COLUNA

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- DEFININDO CONSTRAINT PRIMARY KEY A NIVEL DE TABELA

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id));
 
 -- DEFININDO CONSTRAINT UNIQUE A NIVEL DE COLUNA

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- DEFININDO CONSTRAINT UNIQUE A NIVEL DE TABELA

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code));

  -- DEFININDO CONSTRAINT FOREIGN KEY A NIVEL DE COLUNA

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments (department_id),
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- DEFININDO CONSTRAINT FOREIGN KEY A NIVEL DE TABELA

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
 REFERENCES departments(department_id));
 
 -- FOREIGN KEY -  REGRAS DE DELEÇÃO -  DEFAULT NO ACTION
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id),
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 
 -- FOREIGN KEY -  REGRAS DE DELEÇÃO -  ON DELETE CASCADE
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE CASCADE,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 
 -- FOREIGN KEY -  REGRAS DE DELEÇÃO - ON DELETE SET NULL
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6),
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE SET NULL,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));

 -- ORACLE FUNCTIONS, NÃO PODEM SER REFERENCIADAS NA CONSTRAINT CHECK
 
 SELECT uid, userenv('language'), user, sysdate
 from   dual;
 
 SELECT employee_id, first_name, rownum
 FROM   employees;
 
-- DEFININDO CONSTRAINT CHECK A NIVEL DE COLUNA

DROP TABLE projects cascade constraints;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL 
 CONSTRAINT projects_budget_ck CHECK (budget > 0),
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- DEFININDO CONSTRAINT CHECK A NIVEL DE TABELA

DROP TABLE projects cascade constraints;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
 REFERENCES departments(department_id),
 CONSTRAINT projects_budget_ck CHECK (budget > 0));
 
 -- VIOLANDO CONSTRAINTS - ERRO
 
 INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 77,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');
    
-- VIOLANDO CONSTRAINTS - CORRIGINDO

INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 60,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');

COMMIT;

----------------- GERENCIANDO


-- CONSULTANDO CONSTRAINTS PELO DICIONARIO DE DADOS

DESC user_constraints

DESC user_cons_columns

SELECT co.constraint_name,
       co.constraint_type,
       co.search_condition,
       co.r_constraint_name,
       co.delete_rule,
       cc.column_name,
       cc.position,
       co.status
 FROM   user_constraints co
   JOIN user_cons_columns cc ON (co.constraint_name = cc.constraint_name) AND 
                                (co.table_name = cc.table_name)
 WHERE  co.table_name = 'PROJECTS'
 ORDER BY co.constraint_name,
          cc.position;
          
-- REMOVENDO UMA CONSTRAINT A UMA TABELA

ALTER TABLE projects
DROP CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DROP CONSTRAINT projects_project_id_pk CASCADE;

-- ADICIONANDO UMA CONSTRAINT A UMA TABELA

ALTER TABLE projects
ADD CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE projects
ADD CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id);

-- DESABILITANDO UMA CONSTRAINT

ALTER TABLE projects
DISABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DISABLE CONSTRAINT projects_project_id_pk CASCADE;

-- HABILITANDO UMA CONSTRAINT

ALTER TABLE projects
ENABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
ENABLE CONSTRAINT projects_project_id_pk;          