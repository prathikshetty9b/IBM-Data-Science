--Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
SELECT SUM(COST) FROM PETRESCUE;

--Query A2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.
SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;

--Query A3: Enter a function that displays the maximum quantity of animals rescued.
SELECT MAX(QUANTITY) AS MAX_QUANTITY FROM PETRESCUE;

--Query A4: Enter a function that displays the average cost of animals rescued.
SELECT AVG(COST) AS AVG_COST FROM PETRESCUE;

--Query A5: Enter a function that displays the average cost of rescuing a dog.
SELECT AVG(COST/QUANTITY) AS AVG_COST FROM PETRESCUE
WHERE ANIMAL = 'Dog';