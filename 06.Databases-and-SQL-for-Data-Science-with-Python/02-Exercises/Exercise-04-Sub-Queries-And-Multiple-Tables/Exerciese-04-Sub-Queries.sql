--Query A1: Enter a failing (i.e. which gives an error) to retrieve all employees whose salary is greater than the average salary

SELECT * FROM EMPLOYEES WHERE SALARY > AVG(SALARY);

--Query A2: Enter a working query using a sub-select to retrieve all employees whose salary is greater than the average salary

SELECT EMP_ID, F_NAME, L_NAME, SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

--Query A3: Enter a failing query (i.e. that gives an error) that retrieves all employees records and average salary in every row

SELECT EMP_ID, SALARY, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES ;

--Query A4: Enter a Column Expression that retrieves all employees records and average salary in every row

SELECT EMP_ID, SALARY, ( SELECT AVG(SALARY) FROM EMPLOYEES ) AS AVG_SALARY FROM EMPLOYEES ;

--Query A5: Enter a Table Expression that retrieves only the columns with non-sensitive employee data

SELECT * FROM ( SELECT EMP_ID, F_NAME, L_NAME, DEP_ID FROM EMPLOYEES) AS EMP4ALL ;
