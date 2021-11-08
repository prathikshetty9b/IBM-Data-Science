--Query B1: Enter a function that displays the rounded cost of each rescue.
SELECT ROUND(COST) FROM PETRESCUE;

--Query B2: Enter a function that displays the length of each animal name.
SELECT LENGTH(ANIMAL) AS LENGTH FROM PETRESCUE;

--Query B3: Enter a function that displays the animal name in each rescue in uppercase.
SELECT UPPER(ANIMAL) FROM PETRESCUE;

--Query B4: Enter a function that displays the animal name in each rescue in uppercase without duplications.
SELECT DISTINCT UPPER(ANIMAL) FROM PETRESCUE;

--Query B5: Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query.
SELECT * FROM PETRESCUE
WHERE LOWER(ANIMAL) = 'cat';