--Query B5: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table
SELECT * FROM EMPLOYEES, DEPARTMENTS WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;

--Query B6: Use shorter aliases for table names
SELECT * FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEP_ID = D.DEPT_ID_DEP;

--Query B7: Retrieve only the Employee ID and Department name in the above query
SELECT EMP_ID, DEP_NAME FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEP_ID = D.DEPT_ID_DEP;

--Query B8: In the above query specify the fully qualified column names with aliases in the SELECT clause
SELECT E.EMP_ID, D.DEP_NAME FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEP_ID = D.DEPT_ID_DEP
