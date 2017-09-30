SELECT LAST_NAME as Sobrenome,
	(SELECT DEPARTMENT_NAME FROM DEPARTMENTS BOT WHERE SUP.DEPARTMENT_ID = BOT.DEPARTMENT_ID) as Departamento,
    (SELECT LOCATION_ID FROM DEPARTMENTS BOT WHERE SUP.DEPARTMENT_ID = BOT.DEPARTMENT_ID) as ID_Local,
    (SELECT CITY FROM LOCATIONS WHERE ID_LOCAL = LOCATION_ID) as Cidade
FROM EMPLOYEES SUP
WHERE COMMISSION_PCT IS NOT NULL