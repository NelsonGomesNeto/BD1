SELECT LAST_NAME as Empregado, SALARY as 'Salário Mensal'
FROM EMPLOYEES
WHERE (SALARY BETWEEN 5000 AND 12000) AND (DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 50)