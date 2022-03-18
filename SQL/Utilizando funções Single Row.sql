

-- FUNÇÃO DE CONVERSÃO MAIUSCULO E MINUSCULO

SELECT employee_id, last_name, department_id
FROM employees
WHERE UPPER(last_name) = 'KING';

-- FUNÇÕES DE MANIPULAÇÃO DE CARACTERES

SELECT CONCAT(' Curso: ','Introdução ORACLE 19c'), 
       SUBSTR('Introdução ORACLE 19c',1,11),
       LENGTH('Introdução ORACLE 19c'),    
       INSTR('Introdução ORACLE 19c','ORACLE')
FROM dual;


SELECT first_name "Nome", LPAD(first_name, 20, ' ') "Nome alinhado a direita", RPAD(first_name, 20, ' ') "Nome alinhado a esquerda"
FROM   employees;


SELECT job_title, REPLACE(job_title, 'President', 'Presidente') CARGO
FROM jobs
WHERE  job_title = 'President';

-- FUNÇÕES TIPO NUMBER

SELECT ROUND(45.923,2), ROUND(45.923,0)
FROM dual;

SELECT TRUNC(45.923,2), TRUNC(45.923,0)
FROM dual;

SELECT MOD(1300,600) RESTO
FROM dual;

SELECT ABS(-9), SQRT(9)
FROM dual;

-- FUNÇÕES TIPO DATE 

SELECT sysdate
FROM dual;

SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date),2) "MESES DE TRABALHO"
FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), NEXT_DAY(SYSDATE,'SEXTA FEIRA'), LAST_DAY(SYSDATE)
FROM   dual;

SELECT sysdate, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR'), 
       TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR')
FROM   dual;
       
SELECT SYSDATE, TO_CHAR(TRUNC(SYSDATE),'DD/MM/YYYY HH24:MI:SS')
FROM  dual;

-- CALCULOS COM DATAS


SELECT sysdate, sysdate + 30, sysdate + 60, sysdate - 30
FROM dual;

SELECT last_name, ROUND((SYSDATE-hire_date)/7,2) "SEMANAS DE TRABALHO'"
FROM employees;

