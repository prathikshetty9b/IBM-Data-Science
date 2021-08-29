--Query A1: Enter a failing (i.e. which gives an error) to retrieve all employees whose salary is greater than the average salary
select * from employees where salary > AVG(salary)
;
--Query A2: Enter a working query using a sub-select to retrieve all employees whose salary is greater than the average salary
select * from EMPLOYEES 
where SALARY>(select AVG(SALARY) from EMPLOYEES)
;
--Query A3: Enter a failing query (i.e. that gives an error) that retrieves all employees records and average salary in every row
select EMP_ID, SALARY, AVG(SALARY) AS AVG_SALARY from employees 
;
--Query A4: Enter a Column Expression that retrieves all employees records and average salary in every row
select EMP_ID, SALARY, ( select AVG(SALARY) from employees ) AS AVG_SALARY from employees 
;
--Query A5: Enter a Table Expression that retrieves only the columns with non-sensitive employee data
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL 
;
--Query B1: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table
select * from EMPLOYEES
where DEP_ID in (select DEPT_ID_DEP from DEPARTMENTS)
;
--Query B2: Retrieve only the list of employees from location L0002
select * from EMPLOYEES
where DEP_ID in (select DEPT_ID_DEP from DEPARTMENTS where LOC_ID='L0002')
;
--Query B3: Retrieve the department ID and name for employees who earn more than $70,000
select DEPT_ID_DEP, DEP_NAME from departments where DEPT_ID_DEP IN ( select DEP_ID from employees where SALARY > 70000 ) 
;
--Query B4: Specify 2 tables in the FROM clause
select * from employees, departments
;
--Query B5: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table
select * from employees, departments where employees.DEP_ID = departments.DEPT_ID_DEP
;
--Query B6: Use shorter aliases for table names
select * from employees E, departments D where E.DEP_ID = D.DEPT_ID_DEP
;
--Query B7: Retrieve only the Employee ID and Department name in the above query
select EMP_ID, DEP_NAME from employees E, departments D where E.DEP_ID = D.DEPT_ID_DEP
;
--Query B8: In the above query specify the fully qualified column names with aliases in the SELECT clause
select E.EMP_ID, D.DEP_NAME from employees E, departments D where E.DEP_ID = D.DEPT_ID_DEP
;