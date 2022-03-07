--Query B1: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table
SELECT * FROM EMPLOYEES WHERE DEP_ID IN ( SELECT DEPT_ID_DEP FROM DEPARTMENTS );

--Query B2: Retrieve only the list of employees from location L0002
SELECT * FROM EMPLOYEES WHERE DEP_ID IN ( SELECT DEPT_ID_DEP FROM DEPARTMENTS WHERE LOC_ID = 'L0002' );

--Query B3: Retrieve the department ID and name for employees who earn more than $70,000
SELECT DEPT_ID_DEP, DEP_NAME FROM DEPARTMENTS WHERE DEPT_ID_DEP IN ( SELECT DEP_ID FROM EMPLOYEES WHERE SALARY > 70000 ) ;

--Query B4: Specify 2 tables in the FROM clause
SELECT * FROM EMPLOYEES, DEPARTMENTS;
