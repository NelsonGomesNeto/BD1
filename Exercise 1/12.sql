SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE (JOB_ID = "ST_CLERK" OR JOB_ID = "SA_REP") AND (SALARY = 2500 OR SALARY = 3500 OR SALARY = 7000)