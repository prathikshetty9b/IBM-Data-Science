# Sub Queries and Multiple Tables


📢 Note : Use the EMPLOYEES and DEPARTMENTS tables created previously in  [Exercise 02](https://github.com/prathikshetty9b/IBM-Data-Science/tree/main/06.Databases-and-SQL-for-Data-Science-with-Python/01.Exercises/Exercise-02-String-Patterns-Sorting-and-Grouping)


## Sub Queries and Nested Selects : [`Sub-Queries.sql`](Exerciese-04-Sub-Queries.sql)

```sql
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
```

## Accessing Multiple Tables with Sub-Queries : [`Multiple-Tables.sql`](Exercise-04-Multiple-Tables.sql)

```sql
--Query B1: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table
SELECT * FROM EMPLOYEES WHERE DEP_ID IN ( SELECT DEPT_ID_DEP FROM DEPARTMENTS );

--Query B2: Retrieve only the list of employees from location L0002
SELECT * FROM EMPLOYEES WHERE DEP_ID IN ( SELECT DEPT_ID_DEP FROM DEPARTMENTS WHERE LOC_ID = 'L0002' );

--Query B3: Retrieve the department ID and name for employees who earn more than $70,000
SELECT DEPT_ID_DEP, DEP_NAME FROM DEPARTMENTS WHERE DEPT_ID_DEP IN ( SELECT DEP_ID FROM EMPLOYEES WHERE SALARY > 70000 ) ;

--Query B4: Specify 2 tables in the FROM clause
SELECT * FROM EMPLOYEES, DEPARTMENTS;
```

## Accessing Multiple Tables with Implicit Joins : [`Implicit-Join.sql`](Exercise-04-Implicit-Join.sql)

```sql
--Query B5: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table
SELECT * FROM EMPLOYEES, DEPARTMENTS WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;

--Query B6: Use shorter aliases for table names
SELECT * FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEP_ID = D.DEPT_ID_DEP;

--Query B7: Retrieve only the Employee ID and Department name in the above query
SELECT EMP_ID, DEP_NAME FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEP_ID = D.DEPT_ID_DEP;

--Query B8: In the above query specify the fully qualified column names with aliases in the SELECT clause
SELECT E.EMP_ID, D.DEP_NAME FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEP_ID = D.DEPT_ID_DEP
```
