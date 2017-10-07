SELECT
	DISTINCT(SELECT JOB_TITLE FROM JOBS BOT WHERE SUP.JOB_ID = BOT.JOB_ID) as 'Cargos Existentes',
    (SELECT STREET_ADDRESS FROM LOCATIONS WHERE
		(SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 80) = LOCATION_ID) as 'Endereço do Departamento'
FROM EMPLOYEES SUP
WHERE DEPARTMENT_ID = 80