SELECT LAST_NAME as Sobrenome,
	(SELECT DEPARTMENT_NAME FROM DEPARTMENTS BOT WHERE SUP.DEPARTMENT_ID = BOT.DEPARTMENT_ID) as Departamento
FROM EMPLOYEES SUP
WHERE LAST_NAME LIKE "%a%"