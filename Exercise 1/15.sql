SELECT DISTINCT(JOB_ID),
	(SELECT MAX(SALARY) FROM EMPLOYEES BOT WHERE SUP.JOB_ID = BOT.JOB_ID) Máximo,
    (SELECT MIN(SALARY) FROM EMPLOYEES BOT WHERE SUP.JOB_ID = BOT.JOB_ID) Mínimo,
    (SELECT SUM(SALARY) FROM EMPLOYEES BOT WHERE SUP.JOB_ID = BOT.JOB_ID) Total,
    (SELECT AVG(SALARY) FROM EMPLOYEES BOT WHERE SUP.JOB_ID = BOT.JOB_ID) Média
FROM EMPLOYEES SUP