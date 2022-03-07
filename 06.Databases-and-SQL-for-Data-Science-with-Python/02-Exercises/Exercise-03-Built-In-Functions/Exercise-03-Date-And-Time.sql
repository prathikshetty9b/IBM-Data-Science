--Query C1: Enter a function that displays the day of the month when cats have been rescued.
SELECT DAY(RESCUEDATE) AS DAY 
FROM PETRESCUE
WHERE UPPER(ANIMAL) = 'CAT';

--Query C2: Enter a function that displays the number of rescues on the 5th month.
SELECT SUM(QUANTITY) AS NUM_OF_RESCUES
FROM PETRESCUE
WHERE MONTH(RESCUEDATE) = '05';

--Query C3: Enter a function that displays the number of rescues on the 14th day of the month.
SELECT SUM(QUANTITY) AS NUM_OF_RESCUES
FROM PETRESCUE
WHERE DAY(RESCUEDATE) = '14';

--Query C4: Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.
SELECT (RESCUEDATE + 3) AS CHECKUP_DATE FROM PETRESCUE;

--Query C5: Enter a function that displays the length of time the animals have been rescued; the difference between today’s date and the rescue date.
SELECT (CURRENT_DATE - RESCUEDATE) FROM PETRESCUE;